Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98C6671C4F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 19:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8J3Sit017814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2016 11:03:28 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Dec 2016 11:03:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 13:03:27 -0600
Message-ID: <20161208190327.221469-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.11.0.rc1
MIME-Version: 1.0
Subject: [PATCH] glibc: Enable backtrace from abort on ARM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2016 19:03:28 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

ARM stack frames for abort and raise were limited to the the actual
abort and raise call, such as:

Obtained 4 stack frames.
./test-app(print_trace+0x1c) [0x10a08]
./test-app() [0x10b3c]
/lib/libc.so.6(__default_sa_restorer+0) [0x4adae1e0]
/lib/libc.so.6(gsignal+0xa0) [0x4adacf74]

This is not terribly useful when trying to figure out what function
may have called called the abort, especially when using pthreads.

After the change the trace would now look like:

Obtained 8 stack frames.
./test-app(print_trace+0x1c) [0x10a08]
./test-app() [0x10b3c]
/lib/libc.so.6(__default_sa_restorer+0) [0x4befe1e0]
/lib/libc.so.6(gsignal+0xa0) [0x4befcf74]
/lib/libc.so.6(abort+0x134) [0x4befe358]
./test-app(dummy_function+0x50) [0x10adc]
./test-app(main+0xd4) [0x10c24]
/lib/libc.so.6(__libc_start_main+0x114) [0x4bee7a58]

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index e85c7044a0..358e69be67 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -78,3 +78,9 @@ do_configure_prepend() {
 }
 
 GLIBC_ADDONS ?= "nptl,libidn"
+
+# Enable backtrace from abort()
+do_configure_append_arm () {
+	echo "CFLAGS-abort.c = -funwind-tables" >> ${B}/configparms
+	echo "CFLAGS-raise.c = -funwind-tables" >> ${B}/configparms
+}
-- 
2.11.0.rc1


