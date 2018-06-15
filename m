Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2D874EB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:01:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5F91VBh027707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jun 2018 02:01:31 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 15 Jun 2018 02:01:30 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>,
	<armccurdy@gmail.com>
Date: Fri, 15 Jun 2018 17:01:29 +0800
Message-ID: <1529053289-2632-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] ltp: set -fomit-frame-pointer explicitly for x86-64
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
X-List-Received-Date: Fri, 15 Jun 2018 09:01:31 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

When build ltp with -fno-omit-frame-pointer on
x86-64, it will trigger below error:
| cve-2015-3290.c: In function 'child_thread':
| cve-2015-3290.c:416:1: error: bp cannot be used in asm here

And there is also some comment as below in the source
file ltp/20180515-r0/git/testcases/cve/cve-2015-3290.c
* Build with -O2.  Don't use -fno-omit-frame-pointer.

So explicitly set -fomit-frame-pointer on x86-64 for
compiler to fix the above build error.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20180515.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index b07c1b9..7fd8565 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -19,6 +19,11 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "attr libaio libcap acl openssl zip-native"
 DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
+
+# set -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
+# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
+CFLAGS_append_x86-64 = " -fomit-frame-pointer"
+
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
-- 
2.7.4


