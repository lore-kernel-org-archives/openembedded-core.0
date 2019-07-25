Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 09EEB7EED3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:20:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so45130353wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9y9A99m1k916WNV3VOVfeJXtHS2TBYmiTZJA0D8G/0E=;
	b=aRbJVLw5XG+nJM+sw2Cam4VTetwM2o55Y8Fo2FSP2Y3YgTpMfQ0DRl/QS/0voZx3dr
	Chdf36Vu86ZgmLjUX1lWPW+XTTLlEY2PDhCkSYtUXLiEvgtncMupe8N4QE9ROWoz+D3N
	0d58T5NU3QahR+MsmuQ7sMrRBqKAJ9wpM9dBtCAyen9V+Fnlfaa/uAIrS2wI7JtabC5i
	TjjA6AVFsUuIMuabGRJkeaxc3I5IR1uwUsYkR2WxscOxCS2sEy8JIae8vrYIU89CAOoz
	7WBXMppT3IrYPqzJszE+8jGlxdQrcyV/Mge9sROJMo48Kz0PHPZ5zBs4BQQGcziG6FT5
	lQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9y9A99m1k916WNV3VOVfeJXtHS2TBYmiTZJA0D8G/0E=;
	b=Xews94wcMmGOCrNGuag0ly22GczvnSzvMXwW6j5pP8IBJdT/xqNc0V4MCdlALQCg90
	bKun+4NWX8EE3iMaaFPR43yEV3Jm6sl1kAhVOoZ2J0S4pUX1gZq7GPjjFKC+ACBt2PqU
	8tpCXXSOX3KBvjNrOgP+SWWwjTJoxumpBNIhkhGAXPw1CguVWWbtyI5u7LX3GELhy8fe
	ZrcvGYIXtZELxy1T7pM4X1k1l6Dw1D7qQMlDG3iA0cSr4LpoRhX31P66VZrv4gidhjpG
	ofLiv917bQSSQA0i8FXS9o19SwFKbQCZ73Y8sP6puN9hNG2r5ByN7bVXnsVWVVkIpkai
	qZJg==
X-Gm-Message-State: APjAAAXUIBsqWCGulTpaO9iCGc5/vP44K4JU47bYQfEd7yvGxCxgFdsy
	jcUenhf8cv6jWR41fKVlkTgK5eJuLPQ=
X-Google-Smtp-Source: APXvYqw8n0JkX/a21wTWt06dxUtplsuKULnCbp/pOk+JTVEuZprohrI1XozEHb+qKef06a61AxIM3w==
X-Received: by 2002:a1c:c188:: with SMTP id r130mr76183642wmf.73.1564068028629;
	Thu, 25 Jul 2019 08:20:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z7sm47532602wrh.67.2019.07.25.08.20.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 08:20:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 16:20:23 +0100
Message-Id: <20190725152023.30135-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725152023.30135-1-ross.burton@intel.com>
References: <20190725152023.30135-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnutls: don't use HOSTTOOLS_DIR/bash as a shell on target
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
X-List-Received-Date: Thu, 25 Jul 2019 15:20:28 -0000
Content-Transfer-Encoding: 8bit

The libopts configure script looks for a shell on the build host and assumes
it's good for the target. However in our builds it find $HOSTTOOLS_DIR/bash
which isn't useful, so patch out the detection and force $base_bindir/sh.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnutls/gnutls/posix-shell.patch           | 39 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.8.bb   |  4 ++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/posix-shell.patch

diff --git a/meta/recipes-support/gnutls/gnutls/posix-shell.patch b/meta/recipes-support/gnutls/gnutls/posix-shell.patch
new file mode 100644
index 00000000000..938e2d1e18f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/posix-shell.patch
@@ -0,0 +1,39 @@
+Don't embed the path to the build-time POSIX shell as this will be
+$TMPDIR/hosttools/bash, which is no good on the target.
+
+Instead default to /bin/sh but allow it to be set in the environment.
+
+This isn't really upstreamable but I filed a bug at
+https://gitlab.com/gnutls/gnutls/issues/807 and hope a proper fix will be
+integrated.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/libopts/m4/libopts.m4 b/src/libopts/m4/libopts.m4
+index c6ad738..a62faca 100644
+--- a/src/libopts/m4/libopts.m4
++++ b/src/libopts/m4/libopts.m4
+@@ -112,21 +112,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
+   AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
+                  strrchr strsignal fchmod fstat chmod])
+   AC_PROG_SED
+-  [while :
+-  do
+-      POSIX_SHELL=`which bash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`which dash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=/usr/xpg4/bin/sh
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`/bin/sh -c '
+-          exec 2>/dev/null
+-          if ! true ; then exit 1 ; fi
+-          echo /bin/sh'`
+-      test -x "$POSIX_SHELL" && break
+-      ]AC_MSG_ERROR([cannot locate a working POSIX shell])[
+-  done]
++  POSIX_SHELL="${POSIX_SHELL:-/bin/sh}"
+   AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${POSIX_SHELL}"],
+            [define to a working POSIX compliant shell])
+   AC_SUBST([POSIX_SHELL])
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.8.bb b/meta/recipes-support/gnutls/gnutls_3.6.8.bb
index 6c6c520e8ce..c927063f0a3 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.8.bb
@@ -19,6 +19,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://posix-shell.patch \
 "
 
 SRC_URI[md5sum] = "9dcf0aa45d1a42e1b3ca5d39ec7c61a8"
@@ -47,6 +48,9 @@ EXTRA_OECONF = " \
     --with-default-trust-store-file=${sysconfdir}/ssl/certs/ca-certificates.crt \
 "
 
+# Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
+export POSIX_SHELL="${base_bindir}/sh"
+
 LDFLAGS_append_libc-musl = " -largp"
 
 do_configure_prepend() {
-- 
2.20.1


