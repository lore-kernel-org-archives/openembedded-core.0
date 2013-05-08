Received: from mail-we0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ua3b4-0004wf-CD
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 14:35:54 +0200
Received: by mail-we0-f179.google.com with SMTP id t59so1730930wes.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 05:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Mgg902JVlza51D8bUGXY/47aElgTNEIENOk1GFBE7VA=;
	b=Kn6VaBc/MlqDdx5oNAxhg0lU0XzjmoVPRzmklKXWC2FsPPWw7EYwqmxO/r+zWHG1yS
	0Oh471O3YGcu8EHpKYC2EybGmeZyF6+VHtXUIh8YzJNv+ivMXXT1EmK2r8BzcsyixORF
	YJXJ12giMxfzfEZ0vfla2y5umCnA7Iw/81ccH7mW1V61kOoMlQxpsFwYNFxVb/H0zkXo
	9L7FwlwIGdjf13YcnoTbEuRkVFghzK1ViR41kdHprecvparQ3cH34+hGY0jHsd75Ma1g
	0/ZN0AcOpfHdXriDlMZ2R85TnLDseqjfLbOdzQnj1MFLUpNF7VsBNBzl1N64z3oD4uHD
	ipLw==
X-Received: by 10.181.13.74 with SMTP id ew10mr10141818wid.9.1368015468008;
	Wed, 08 May 2013 05:17:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ek7sm8877293wic.4.2013.05.08.05.17.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 05:17:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:14:45 +0100
Message-Id: <1368015285-5543-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmOWe+xZsx5nlsB0qRaLKMR4l8xT0pWLqZ72wxF9Vqw8INQESI2RrsUmzATskNQiItd0WUu
Subject: [PATCH] gnutls: upgrade to 2.12.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 12:36:05 -0000

Importantly, this fixes CVE-2013-1619.

Upstream doesn't use GNU as a host, so update the SRC_URI.

remove-gets.patch isn't required anymore, obsolete_automake_macros.patch is
merged upstream, and gnutls_fix_for_automake_1.12.1.patch doesn't seem to be
needed.  It was merged and reverted upstream, and my build without it succeeded.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |    4 +-
 .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |   43 --------------------
 .../gnutls/gnutls/obsolete_automake_macros.patch   |   39 ------------------
 .../gnutls/gnutls/remove-gets.patch                |   41 -------------------
 meta/recipes-support/gnutls/gnutls_2.12.21.bb      |   15 -------
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   13 ++++++
 6 files changed, 16 insertions(+), 139 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.21.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.23.bb

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index d6c187f..12cc4f1 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -15,7 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libextra/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/gnutls/gnutls-${PV}.tar.bz2"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+
+SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.bz2"
 
 inherit autotools binconfig pkgconfig gettext lib_package
 
diff --git a/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch b/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
deleted file mode 100644
index c742e6c..0000000
--- a/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Pending
-
-Avoids these kind of warnings:
-Warning: 'libgnutls.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2012/07/09
-Index: gnutls-2.12.19/configure.ac
-===================================================================
---- gnutls-2.12.19.orig/configure.ac
-+++ gnutls-2.12.19/configure.ac
-@@ -28,6 +28,7 @@ AC_CONFIG_MACRO_DIR([m4])
- 
- AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
- AM_CONFIG_HEADER(config.h)
- 
- AC_MSG_RESULT([***
-Index: gnutls-2.12.19/lib/configure.ac
-===================================================================
---- gnutls-2.12.19.orig/lib/configure.ac
-+++ gnutls-2.12.19/lib/configure.ac
-@@ -28,6 +28,7 @@ AC_CONFIG_MACRO_DIR([m4])
- 
- AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
- AM_CONFIG_HEADER(config.h)
- 
- AC_PROG_CC
-Index: gnutls-2.12.19/libextra/configure.ac
-===================================================================
---- gnutls-2.12.19.orig/libextra/configure.ac
-+++ gnutls-2.12.19/libextra/configure.ac
-@@ -28,6 +28,7 @@ AC_CONFIG_MACRO_DIR([m4])
- 
- AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
- AM_CONFIG_HEADER(config.h)
- 
- AC_PROG_CC
diff --git a/meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch b/meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
deleted file mode 100644
index 5640178..0000000
--- a/meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Submitted [https://savannah.gnu.org/support/index.php?108219]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd gnutls-2.12.21/configure.ac gnutls-2.12.21/configure.ac
---- gnutls-2.12.21/configure.ac	2013-01-03 07:52:42.182740682 +0200
-+++ gnutls-2.12.21/configure.ac	2013-01-03 07:53:41.662739378 +0200
-@@ -29,7 +29,7 @@
- AM_INIT_AUTOMAKE([1.10 no-dist-gzip dist-bzip2 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_MSG_RESULT([***
- *** Checking for compilation programs...
-diff -Nurd gnutls-2.12.21/lib/configure.ac gnutls-2.12.21/lib/configure.ac
---- gnutls-2.12.21/lib/configure.ac	2013-01-03 07:52:42.182740682 +0200
-+++ gnutls-2.12.21/lib/configure.ac	2013-01-03 08:07:38.150721027 +0200
-@@ -29,7 +29,7 @@
- AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_PROG_CC
- lgl_EARLY
-diff -Nurd gnutls-2.12.21/libextra/configure.ac gnutls-2.12.21/libextra/configure.ac
---- gnutls-2.12.21/libextra/configure.ac	2013-01-03 07:52:42.182740682 +0200
-+++ gnutls-2.12.21/libextra/configure.ac	2013-01-03 08:10:56.654716669 +0200
-@@ -29,7 +29,7 @@
- AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_PROG_CC
- xgl_EARLY
diff --git a/meta/recipes-support/gnutls/gnutls/remove-gets.patch b/meta/recipes-support/gnutls/gnutls/remove-gets.patch
deleted file mode 100644
index 8b7df62..0000000
--- a/meta/recipes-support/gnutls/gnutls/remove-gets.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-eglibc 2.16 has removed gets completely
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: gnutls-2.12.20/gl/stdio.in.h
-===================================================================
---- gnutls-2.12.20.orig/gl/stdio.in.h	2012-03-01 07:47:48.000000000 -0800
-+++ gnutls-2.12.20/gl/stdio.in.h	2012-07-03 18:17:57.191637189 -0700
-@@ -710,11 +710,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
-Index: gnutls-2.12.20/lib/gl/stdio.in.h
-===================================================================
---- gnutls-2.12.20.orig/lib/gl/stdio.in.h	2012-03-01 07:53:13.000000000 -0800
-+++ gnutls-2.12.20/lib/gl/stdio.in.h	2012-07-03 18:18:56.351639640 -0700
-@@ -710,11 +710,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.21.bb b/meta/recipes-support/gnutls/gnutls_2.12.21.bb
deleted file mode 100644
index 7b4426b..0000000
--- a/meta/recipes-support/gnutls/gnutls_2.12.21.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gnutls.inc
-
-PR = "${INC_PR}.4"
-
-SRC_URI += "file://gnutls-openssl.patch \
-            file://correct_rpl_gettimeofday_signature.patch \
-            file://configure-fix.patch \
-            file://gnutls_fix_for_automake_1.12.1.patch \
-            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
-            file://obsolete_automake_macros.patch \
-            ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
-            file://remove-gets.patch \
-           "
-SRC_URI[md5sum] = "93ffac7507dd39a4c6a672ca6976d397"
-SRC_URI[sha256sum] = "2bd020665951f38a230d6b6d98630f8c47ca6977d7d86977d356ccf17756fbf3"
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.23.bb b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
new file mode 100644
index 0000000..1575d2c
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
@@ -0,0 +1,13 @@
+require gnutls.inc
+
+PR = "${INC_PR}.4"
+
+SRC_URI += "file://gnutls-openssl.patch \
+            file://correct_rpl_gettimeofday_signature.patch \
+            file://configure-fix.patch \
+            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
+            ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
+           "
+
+SRC_URI[md5sum] = "f3c1d34bd5f113395c4be0d5dfc2b7fe"
+SRC_URI[sha256sum] = "dfa67a7e40727eb0913e75f3c44911d5d8cd58d1ead5acfe73dd933fc0d17ed2"
-- 
1.7.10.4



