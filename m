Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D090A73186
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 16:00:20 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p187so7402628wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/3fqb2sDTQ+OENum6m3QCrbVcQi/vUuF6N2+zs8W7pg=;
	b=pFch3vUDSzcfcsz94F8of5U5rW/PEQKYzP1IJ34gkw225HGi8cl1OP13vc79KfYCki
	MnME4PPcmAe8getnqZAshjpPMJL9XCMisxYvCIQyepH18FXd/StPIqm0u8NOfGveoJQn
	Z6rohq0/5MLjuHjnVbgnRYLk5bH2a9L/arOEWcbWENZsO/q+EdQoehZ3IC7Xocf6czob
	9zrQKnZbznE7gtLJa5iMpVRp48YIpxLMyglkHnfZv5CxUCSYWy11/K6/3IcawhMwDv1G
	wECNewSwxtlPbP2S7aC5IYXHZafWav7JmW7be+boxXTmXk622HBVK/tx6CUohAkcTxVq
	213g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/3fqb2sDTQ+OENum6m3QCrbVcQi/vUuF6N2+zs8W7pg=;
	b=RAEcdPF5lmArF/DF0gAwBLptN7KgNxIc8h3G6rmRGw3Rj9pTYatZDvLomGKhVDaVZZ
	ajvYB3b+DxsTx36Hl0qizyO/+UdaoXdNy5/URQYkVGVyuvwbTJV4XiMqKAonhnGQYHWN
	yrHusTJS0kuFA9QDHl3eQ2CNCA3SXGPH8YFH4bDJfRnDaVrGiB6/VxDpvwVCihNw/541
	EgptMt5J1NJSzhXB9rmJYUxCOTz4gA9yFTcc+4jAdc6ddLGr5KqJ5dSMuKCxFOnEqiur
	ezOGSnlF6xS2ZJnmdw1v1St5F5M8dUQI7Rcx4+EYE21wKz3NWYHOfMG07ApXI4EQDGLp
	NNtw==
X-Gm-Message-State: ALoCoQmGqiiXjM4gbbANOtz1dvEeWmovfopM2yX9tB2+WAVymLIfzcTQYNL+1UhJNSnm+0ysDWvpliGUYcDqiU+Srwy7BOKpNA==
X-Received: by 10.28.178.138 with SMTP id b132mr11734260wmf.25.1450281619041; 
	Wed, 16 Dec 2015 08:00:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	200sm7985599wmn.11.2015.12.16.08.00.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 08:00:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 16:00:16 +0000
Message-Id: <1450281616-22929-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xcb: don't build-depend on python-native
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
X-List-Received-Date: Wed, 16 Dec 2015 16:00:21 -0000

xcb-proto had a dependency on python-native as it builds and installs a Python
module, but xcb-proto is very low in the build to force a dependency on
python-native.

As it turns out libxcb simply asks pkg-config for the full path to the module
xcb-proto installed and uses it directly so there is no need to build
python-native.  Instead replace AM_PATH_PYTHON with two explicit variable
definitions (need to set PYTHON for automake's install logic).

Also remove the dependency on xcb-proto-native as libxcb uses the data files and
tooling from the target sysroot, and patching it to use the native sysroot adds
complication for no good reason.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb    |  4 ++--
 meta/recipes-graphics/xorg-proto/xcb-proto.inc     |  9 ++++----
 .../xorg-proto/xcb-proto/no-python-native.patch    | 27 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
index 1f4852d..13da088 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
@@ -17,13 +17,13 @@ SRC_URI[sha256sum] = "b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedb
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "xcb-proto xproto libxau xcb-proto-native libpthread-stubs libxdmcp"
+DEPENDS = "xcb-proto xproto libxau libpthread-stubs libxdmcp"
 
 PACKAGES_DYNAMIC = "^libxcb-.*"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
 
-inherit autotools pkgconfig pythonnative distro_features_check
+inherit autotools pkgconfig distro_features_check
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto.inc b/meta/recipes-graphics/xorg-proto/xcb-proto.inc
index 2e1b57b..8703d63 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto.inc
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto.inc
@@ -9,17 +9,18 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2"
+SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
+           file://no-python-native.patch"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig
 
 PACKAGES += "python-xcbgen"
 
+FILES_${PN} = ""
 FILES_${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
-FILES_python-xcbgen = "${libdir}/python*"
+FILES_python-xcbgen = "${libdir}/xcb-proto"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
-DEPENDS_append_class-native = " python-native"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
new file mode 100644
index 0000000..f808e19
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
@@ -0,0 +1,27 @@
+Upstream uses AM_PATH_PYTHON to find a python binary and ask it where to install
+libraries.  This means we either need to depend on python-native (large build
+dependency, early in the build) or use the host python (pythondir reflects the
+host and not the target, breaks builds).
+
+The third option is to just hardcode the path where the module goes, as most
+callers of the code use pkg-config to find where it was installed anyway.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index d140bfe..c7b68da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,7 +14,10 @@ if test "$XMLLINT" = "no"; then
+    AC_MSG_WARN([xmllint not found; unable to validate against schema.])
+ fi
+
+-AM_PATH_PYTHON([2.5])
++pythondir="${libdir}/xcb-proto"
++AC_SUBST(pythondir)
++PYTHON="python"
++AC_SUBST(PYTHON)
+
+ xcbincludedir='${datadir}/xcb'
+ AC_SUBST(xcbincludedir)
-- 
2.1.4


