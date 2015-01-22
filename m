Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E81827251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:41:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56453390"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 14:38:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M6fIck015068
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:41:18 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 22 Jan 2015 14:41:55 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 14:41:20 +0800
Message-ID: <1421908880-1732-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] elfutils_0.148.bb: CVE-2014-9447 fix
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
X-List-Received-Date: Thu, 22 Jan 2015 06:42:00 -0000
Content-Type: text/plain

Reference: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9447

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../elf_begin.c-CVE-2014-9447-fix.patch            | 36 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   | 23 +++++++-------
 2 files changed, 48 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch
new file mode 100644
index 0000000..84e8ddc
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch
@@ -0,0 +1,36 @@
+From 323ca04a0c9189544075c19b49da67f6443a8950 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Wed, 21 Jan 2015 09:33:38 +0900
+Subject: [PATCH] elf_begin.c: CVE-2014-9447 fix
+
+this patch is from:
+ https://git.fedorahosted.org/cgit/elfutils.git/commit/?id=147018e729e7c22eeabf15b82d26e4bf68a0d18e
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ libelf/elf_begin.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/libelf/elf_begin.c b/libelf/elf_begin.c
+index e46add3..e83ba35 100644
+--- a/libelf/elf_begin.c
++++ b/libelf/elf_begin.c
+@@ -736,11 +736,8 @@ read_long_names (Elf *elf)
+ 	    break;
+ 
+ 	  /* NUL-terminate the string.  */
+-	  *runp = '\0';
+-
+-	  /* Skip the NUL byte and the \012.  */
+-	  runp += 2;
+-
++	  *runp++ = '\0';
++ 
+ 	  /* A sanity check.  Somebody might have generated invalid
+ 	     archive.  */
+ 	  if (runp >= newp + len)
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index ab95639..5e75f12 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 PR = "r11"
 
-SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
+SRC_URI = "https://fedorahosted.org/releases/e/l/${PN}/${BP}.tar.bz2"
 
 SRC_URI[md5sum] = "a0bed1130135f17ad27533b0034dba8d"
 SRC_URI[sha256sum] = "8aebfa4a745db21cf5429c9541fe482729b62efc7e53e9110151b4169fe887da"
@@ -25,14 +25,15 @@ SRC_URI += "\
         file://m68k_backend.diff \
         file://testsuite-ignore-elflint.diff \
         file://elf_additions.diff \
-	file://elfutils-fsize.patch \
-	file://remove-unused.patch \
-	file://mempcpy.patch \
-	file://fix_for_gcc-4.7.patch \
-	file://dso-link-change.patch \
-	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
-	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
-	file://Fix_elf_cvt_gunhash.patch \
+        file://elfutils-fsize.patch \
+        file://remove-unused.patch \
+        file://mempcpy.patch \
+        file://fix_for_gcc-4.7.patch \
+        file://dso-link-change.patch \
+        file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
+        file://elfutils-ar-c-fix-num-passed-to-memset.patch \
+        file://Fix_elf_cvt_gunhash.patch \
+        file://elf_begin.c-CVE-2014-9447-fix.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
@@ -52,9 +53,9 @@ EXTRA_OECONF_append_class-native = " --without-bzlib"
 EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
 do_configure_prepend() {
-	sed -i '/^i386_dis.h:/,+4 {/.*/d}' ${S}/libcpu/Makefile.am
+    sed -i '/^i386_dis.h:/,+4 {/.*/d}' ${S}/libcpu/Makefile.am
 
-	cp ${WORKDIR}/*dis.h ${S}/libcpu
+    cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
 
 # we can not build complete elfutils when using uclibc
-- 
1.8.4.2


