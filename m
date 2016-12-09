Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 252E671D42
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 17:49:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB9Hna03019150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 9 Dec 2016 09:49:36 -0800
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Dec 2016 09:49:35 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2016 11:49:34 -0600
Message-ID: <20161209174934.77726-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.11.0.rc1
MIME-Version: 1.0
Subject: [master][morty][PATCH v2] glibc: Enable backtrace from abort on ARM
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
X-List-Received-Date: Fri, 09 Dec 2016 17:49:36 -0000
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
index e85c7044a0..7bae0e9554 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -78,3 +78,9 @@ do_configure_prepend() {
 }
 
 GLIBC_ADDONS ?= "nptl,libidn"
+
+# Enable backtrace from abort()
+do_configure_append_arm () {
+	echo "CFLAGS-abort.c = -fasynchronous-unwind-tables" >> ${B}/configparms
+	echo "CFLAGS-raise.c = -fasynchronous-unwind-tables" >> ${B}/configparms
+}
-- 
2.11.0.rc1


