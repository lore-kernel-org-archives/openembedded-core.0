Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF277864B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 23:05:39 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id m5so18993481wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PdiMSMLyHF6crCl7UW3WQB6yPEqITYRUh4OLpintZ+0=;
	b=1vyVYRVnFpHAR/8Gm8t2g+cFmTEJcDevo8fwcYtmG6HUcDVNUjOeiZ89vUyyfUrRw9
	vNhFBt4oebSbJngl1RYmejoQZoFQo6C1MmAfO/+wLv0Qyc5eDxL9NeJykmAKMUujjpsD
	vxUyrNkqjnx/jD2bgwIHIXXHFiTV579ml8xz35PH3VoWnGmaDJwOEnFDbLMLiNhriFQT
	OmFvV41Gm/HGqeQm2Tf3tk9hET/TxWM6chdbNssqq550RRU15LJEInedrJ/9954dsM6a
	AGnjZFxyjxS+XUyKu5itZvzt87Nb82XkhmG0EO7bML7w34S0U0gS39M8fr2OqmXbBDee
	XCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PdiMSMLyHF6crCl7UW3WQB6yPEqITYRUh4OLpintZ+0=;
	b=LTLUu2ANjYT3qdmAakuggqn7ypO0VGCeBvmkhRcu/MBaS5M8yORqODx0D5y+CjnD3t
	MFiUPem3JPqf8NKgiEV36hQMybBdUgTEYAva9Jdw7z6pPyKuaGe/bXfWmVfD/4HpKXgw
	A1DTKCbPZRAiqq62iCWch7AqzUBcBmy2x6g8d4yMmIWzyiiH+MgXAEnyIxvfMfICQyVs
	AzE2RKjk9zBvV4fIWWFuitUYFT+tSbM4GhKKRn51MrYWD9iFlJWB6FpbKakK9HBhvfLj
	YoXeGfrAzmEUvFJCezv90z2AJe5EPJ1xpWzzH8KNMI65NDcwN+AQkTvQot/v6AofhjoA
	irZA==
X-Gm-Message-State: APf1xPBxLWdHyEfPVm/wPwzplboUhpGOuUhVv3gL00CW0wiVV5y4WLH1
	xhM3l3xy1/jHoHTNJzg6qGy0fLp+
X-Google-Smtp-Source: AH8x2249jlfqolvli3dO9woYvxLLOAb3A9LNaDHFuspEnd0QSu9txqIh656HuCLjuyPkA2l1qZB4Tw==
X-Received: by 10.28.37.5 with SMTP id l5mr409979wml.127.1519167940608;
	Tue, 20 Feb 2018 15:05:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k130sm15026465wmg.9.2018.02.20.15.05.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 15:05:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 23:05:37 +0000
Message-Id: <20180220230537.22539-1-ross.burton@intel.com>
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
X-List-Received-Date: Tue, 20 Feb 2018 23:05:40 -0000

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


