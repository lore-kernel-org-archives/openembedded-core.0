Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 23F3272DE9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:04 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8547172pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6UO/nD50VUeePaZH7iUGEfXge/Yg2F6JoTwXmY9R4/g=;
	b=nhezhkmOW1bjPycgy/4rLDGiJL/b8dLMprFH47I0w007W+ngS3nRqOrTHbq5nHlVog
	31MweEMDIcXDMnSRYZb4iWSIjgSNjXL0vywxf6I9lcyHJ6NuKrfVHxhIAC+dwWPOgedi
	EVG29dGoW8AMUVmFdfMEoLVf0zir1DrZheQB5bsxCtpljwLc2YBLNeQoQtSLvYvnmkvS
	JXqos0V0OurpBvOC8kvAkAVbTKgFVD2db1CszOEt3Hib41dJk0yM0Ek3cAUT+xHKpXRD
	UUl/m7Vfvne6ly6lzoDsWkXAcRY33fLiFfIuGg1mnMfktgyO4m0zRf1zQ00UZhs1tp7i
	9oKQ==
X-Received: by 10.68.143.193 with SMTP id sg1mr6723431pbb.63.1423152365717;
	Thu, 05 Feb 2015 08:06:05 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.06.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:04 -0800
Message-Id: <1c96c8c66a6540e77774dc213c976fbeec644909.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 56/61] elfutils_0.148.bb: CVE-2014-9447 fix
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:04 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

Reference: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9447

(From OE-Core rev: c992868a989926eac6c4b78a6bb9729bce54f2ed)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


