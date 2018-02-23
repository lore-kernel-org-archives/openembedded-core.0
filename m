Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5007A77F90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 15:35:36 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v65so14487331wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PdiMSMLyHF6crCl7UW3WQB6yPEqITYRUh4OLpintZ+0=;
	b=UwHEOWT+nolNvnzfNt9bVMYCCoR5a08irEyxePLWSAcqh2sh2fI3fX7VVnKhjSgUkV
	dpRtxEP1pj0jxmKpzSGMIa64SluM6wQYfx+07DayCF6A0B5FASZd62EKTjz7S0YlMZjy
	nV/QsafMp61rD7yITOlHcs3zmLq3qWCjpGk9oDBU8/XNZZ5YcAeg+oK5oakzo24BxsdX
	GF/18W+td196Z1p3eBfYlGJ2o82Pki0jw9hk/mn2AWkVPo4cdNvYr4gbrA2kHPO2YyR0
	iRnA5Q4Pd8oBmSSxt6M3QdFGsrJv4Il4hKi9De73GC/cJ/qpPinsaD396X/0rPBoMtMo
	E08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PdiMSMLyHF6crCl7UW3WQB6yPEqITYRUh4OLpintZ+0=;
	b=q8NN4UefBFkCiIoLx85c8osi+l0v7cJ6c9240YICZRSnWP3+O0jZbEvof2/UxPxjh0
	PxveqWy0Ofm33huFzHMg5hlJoYdCy4SkbYmgt8m04wob73LkhN2LrexridI0qbv1hr86
	ZqOqBfv027xTL2zKfliMNZ9NtxucnhohhXnNTxUZNG3GwRbV6fYsrITC7SdGsEFgw3w0
	Tp0T+cw1QK8vlNnOBXMhzqd6SFcKXPFYprxhNAdP66TrXLbcur/qPXZAsz2kj/+EYdjh
	4x4OR2mDXAhQDcjpQhVlSjCq1Kw/3mR18P2ryVGiIH63TUG6wHsYJaS59uTpyPksrs70
	ABwQ==
X-Gm-Message-State: APf1xPA+VU/RyvbZVfp/CBDV++CaQXZGkgPduJUKhWwRdU0RT0wWT0yn
	2Qap41osMXdsHnnJM7KG0UQBRQjf
X-Google-Smtp-Source: AH8x225GOoSNIFr87ULkitB3fuGWNdcPULdwewNn+dCq1Eq43mZzT5b6/BPc6QAQqW/qAc4Zrt4m7A==
X-Received: by 10.223.190.141 with SMTP id i13mr1956578wrh.235.1519400137672; 
	Fri, 23 Feb 2018 07:35:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l22sm3291929wre.52.2018.02.23.07.35.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 07:35:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 15:35:35 +0000
Message-Id: <20180223153535.11063-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xcb-proto: don't compile for Python 2
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
X-List-Received-Date: Fri, 23 Feb 2018 15:35:37 -0000

Remove the do_install_append to create the Python 2 pyc files, as nothing in the
build is using Python 2 anymore (libxcb is the only user, and that uses Python
3).

Also use variables instead of a patch to control what Python binary and path the
modules are installed to.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/xcb-proto/no-python-native.patch    | 27 ----------------------
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 14 ++++-------
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
deleted file mode 100644
index 09b6088db0a..00000000000
--- a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream uses AM_PATH_PYTHON to find a python binary and ask it where to install
-libraries.  This means we either need to depend on python-native (large build
-dependency, early in the build) or use the host python (pythondir reflects the
-host and not the target, breaks builds).
-
-The third option is to just hardcode the path where the module goes, as most
-callers of the code use pkg-config to find where it was installed anyway.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index d140bfe..c7b68da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,7 +14,10 @@ if test "$XMLLINT" = "no"; then
-    AC_MSG_WARN([xmllint not found; unable to validate against schema.])
- fi
-
--AM_PATH_PYTHON([2.5])
-+pythondir="${libdir}/xcb-proto"
-+AC_SUBST(pythondir)
-+PYTHON="python3"
-+AC_SUBST(PYTHON)
-
- xcbincludedir='${datadir}/xcb'
- AC_SUBST(xcbincludedir)
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index be6b1a0200e..712ab6c59ab 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -11,8 +11,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
-           file://no-python-native.patch \
+SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
            file://0001-Make-whitespace-use-consistent.patch \
            file://0002-print-is-a-function-and-needs-parentheses.patch \
            "
@@ -21,6 +20,10 @@ SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c48
 
 inherit autotools pkgconfig
 
+# Force the use of Python 3 and a specific library path so we don't need to
+# depend on python3-native
+CACHED_CONFIGUREVARS += "PYTHON=python3 am_cv_python_pythondir=${libdir}/xcb-proto"
+
 PACKAGES += "python-xcbgen"
 
 FILES_${PN} = ""
@@ -31,10 +34,3 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
-
-do_install_append() {
-    # Makefile's do_install creates .pyc files for python3, now also create
-    # them for python2 so that they will be recorded by manifest, and can be
-    # cleaned correctly.
-    (cd ${D}; python -m py_compile ./${libdir}/xcb-proto/xcbgen/*.py)
-}
-- 
2.11.0


