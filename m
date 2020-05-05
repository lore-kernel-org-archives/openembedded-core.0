Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3193.1588661906694787605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ekCxWYdX6NWK0N8iOAm+qBPofKcSdALe1Jeni2erTijvPVQO0Q0uniCkBmmmmNvPIl/IRyVLNt
 M7AFE5E4/DDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:37 -0700
IronPort-SDR: IhZde9LSBfxBKGSPaT0fM9FN2zQQfbmR76KyyMt5Eid3YME4e8DfTev42/ZfhMo2J4rDq1nC/3
 meQIAWyo4f7w==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144834"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 14/18] gnutls: upgrade 3.6.8 -> 3.6.11.1
Date: Tue,  5 May 2020 14:56:49 +0800
Message-Id: <f4f933297a77f99783f9a5fb571503e1f45ad259.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Kiernan <alex.kiernan@gmail.com>

Drop patch from 81485be19b18 ("gnutls: don't use HOSTTOOLS_DIR/bash as a
shell on target") as upstream now honours POSIX_SHELL when set as the
primary target shell.

(From OE-Core rev: bc487ced3be40569157fb40c99bfa68871f74744)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gnutls/gnutls/posix-shell.patch           | 39 -------------------
 .../{gnutls_3.6.8.bb => gnutls_3.6.11.1.bb}   |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/posix-shell.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.8.bb => gnutls_3.6.11.1.bb} (92%)

diff --git a/meta/recipes-support/gnutls/gnutls/posix-shell.patch b/meta/recipes-support/gnutls/gnutls/posix-shell.patch
deleted file mode 100644
index 938e2d1e18..0000000000
--- a/meta/recipes-support/gnutls/gnutls/posix-shell.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Don't embed the path to the build-time POSIX shell as this will be
-$TMPDIR/hosttools/bash, which is no good on the target.
-
-Instead default to /bin/sh but allow it to be set in the environment.
-
-This isn't really upstreamable but I filed a bug at
-https://gitlab.com/gnutls/gnutls/issues/807 and hope a proper fix will be
-integrated.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/src/libopts/m4/libopts.m4 b/src/libopts/m4/libopts.m4
-index c6ad738..a62faca 100644
---- a/src/libopts/m4/libopts.m4
-+++ b/src/libopts/m4/libopts.m4
-@@ -112,21 +112,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
-   AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
-                  strrchr strsignal fchmod fstat chmod])
-   AC_PROG_SED
--  [while :
--  do
--      POSIX_SHELL=`which bash`
--      test -x "$POSIX_SHELL" && break
--      POSIX_SHELL=`which dash`
--      test -x "$POSIX_SHELL" && break
--      POSIX_SHELL=/usr/xpg4/bin/sh
--      test -x "$POSIX_SHELL" && break
--      POSIX_SHELL=`/bin/sh -c '
--          exec 2>/dev/null
--          if ! true ; then exit 1 ; fi
--          echo /bin/sh'`
--      test -x "$POSIX_SHELL" && break
--      ]AC_MSG_ERROR([cannot locate a working POSIX shell])[
--  done]
-+  POSIX_SHELL="${POSIX_SHELL:-/bin/sh}"
-   AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${POSIX_SHELL}"],
-            [define to a working POSIX compliant shell])
-   AC_SUBST([POSIX_SHELL])
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.8.bb b/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
similarity index 92%
rename from meta/recipes-support/gnutls/gnutls_3.6.8.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
index c927063f0a..5b05364c25 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.11.1.bb
@@ -19,11 +19,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
-           file://posix-shell.patch \
 "
 
-SRC_URI[md5sum] = "9dcf0aa45d1a42e1b3ca5d39ec7c61a8"
-SRC_URI[sha256sum] = "aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83"
+SRC_URI[md5sum] = "3670ee0b0d95b3dee185eff2dc910ee7"
+SRC_URI[sha256sum] = "fbba12f3db9a55dbf027e14111755817ec44b57eabec3e8089aac8ac6f533cf8"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.4

