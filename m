Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.5085.1588370191194287885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=U+KLorZL;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DR0Y2bksz4Q
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588370189;
	bh=4f8iipbgkK6Ty0oA3GvPYnzWND+RmBccpnFDo7O+ncc=;
	h=From:To:Subject:Date:From;
	b=U+KLorZL5I897xsqfBchkMIAPYUxP36+w4oov/4MlDL0zCSfG2L3BmOLqoI7iduiH
	 MQ+CoDX/N8Yvq7egNaG7Cax0nmxk+cYv52+McR36pGTjdK9Cu5uiTB2kN/K8JcioX8
	 TN7eWKAJ8R94FxovBFysr4skyXbIWgniir/v0kLXvACQEcdPNYw8Hb5DurL7YrGOaV
	 g0a2CXN3aG5UTrJK4ziIErJJKOCg0CZ5sKxdb/b/gVGVEs9TDaBuvvGE4aa1uTPBry
	 Q8oglOPMo2L8IPE7NmH29apAAGq/TEx2r8EEZE84LlGKkvQ/fmmYxa61s5JyJRDXkI
	 WB2wN7MJYVW8Pd2KouKGsgLzGILjtei8De3j4UC38DUAxUlmV3BpGZ/KelLbq1yOFJ
	 6R4CgxYG36Wmzrgo+epERR0zBjZ1659kumBzQwFuDVE+G8p0F1y9zfLru9JvJo3shX
	 Kp8EbFOfUxNA4vY9QL1MqSQ77/6vKDfgU8uOYYTMmH7fE5u4ZnjpOfvYAjrxt5XND5
	 GS1WcmDt0WVzbgn0SkxxMHEv/H9RSP147B1w3GPtQvEV5FDv5OWJpO5Rl0Iwon+U9r
	 GHGPTi/NlXS6Jwthkq0DFCa11UlXJQtmk6OUKYRjbou59u1DlyWmTN3DCmkn/BoWrp
	 Hg/fpvI26Kwbjyi5cOBHy+EA=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] gnutls: upgrade 3.6.8 -> 3.6.11.1
Date: Sat,  2 May 2020 00:56:26 +0300
Message-Id: <20200501215628.9472-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Alex Kiernan <alex.kiernan@gmail.com>

Drop patch from 81485be19b18 ("gnutls: don't use HOSTTOOLS_DIR/bash as a
shell on target") as upstream now honours POSIX_SHELL when set as the
primary target shell.

(From OE-Core rev: bc487ced3be40569157fb40c99bfa68871f74744)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
2.17.1

