Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.2401.1609832404399040292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 23:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193265"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:40:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A2C754CE1505
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Jan 2021 15:39:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:39:59 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gdbm: upgrade 1.18.1 -> 1.19
Date: Tue, 5 Jan 2021 15:38:42 +0800
Message-ID: <1609832322-108198-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A2C754CE1505.A7228
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

gdbm-fix-link-failure-against-gcc-10.patch
Removed since this is included in 1.19

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...gdbm-fix-link-failure-against-gcc-10.patch | 47 -------------------
 .../gdbm/{gdbm_1.18.1.bb => gdbm_1.19.bb}     |  5 +-
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
 rename meta/recipes-support/gdbm/{gdbm_1.18.1.bb => gdbm_1.19.bb} (85%)

diff --git a/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
deleted file mode 100644
index c1580418dc..0000000000
--- a/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f993697af81c37df9c55e0ebedeb1b8b880506ae Mon Sep 17 00:00:00 2001
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Tue, 5 May 2020 11:59:42 +0200
-Subject: [PATCH] gdbm: fix link failure against gcc-10
-
-Copied from gentoo's solution at https://bugs.gentoo.org/show_bug.cgi?id=705898
-Original patch by Sergei Trofimovich <slyfox@gentoo.org>
-
-Original description:
-
-Before the change on gcc-10 link failed as:
-```
-  CCLD     gdbmtool
-ld: ./libgdbmapp.a(parseopt.o):(.bss+0x8): multiple definition of `parseopt_program_args';
-  gdbmtool.o:(.data.rel.local+0x260): first defined here
-ld: ./libgdbmapp.a(parseopt.o):(.bss+0x10): multiple definition of `parseopt_program_doc';
-  gdbmtool.o:(.data.rel.local+0x268): first defined here
-```
-
-gcc-10 will change the default from -fcommon to fno-common:
-    https://gcc.gnu.org/PR85678.
-
-The fix is to avoid multiple definition and rely on
-declarations only.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
----
- src/parseopt.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/parseopt.c b/src/parseopt.c
-index 268e080..a4c8576 100644
---- a/src/parseopt.c
-+++ b/src/parseopt.c
-@@ -255,8 +255,6 @@ print_option_descr (const char *descr, size_t lmargin, size_t rmargin)
- }
- 
- char *parseopt_program_name;
--char *parseopt_program_doc;
--char *parseopt_program_args;
- const char *program_bug_address = "<" PACKAGE_BUGREPORT ">";
- void (*parseopt_help_hook) (FILE *stream);
- 
--- 
-2.26.2
-
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.19.bb
similarity index 85%
rename from meta/recipes-support/gdbm/gdbm_1.18.1.bb
rename to meta/recipes-support/gdbm/gdbm_1.19.bb
index fbb1fe72d7..1f390a4aa2 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.19.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://run-ptest \
            file://ptest.patch \
-           file://gdbm-fix-link-failure-against-gcc-10.patch \
           "
 
-SRC_URI[md5sum] = "988dc82182121c7570e0cb8b4fcd5415"
-SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc"
+SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
+SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.25.1



