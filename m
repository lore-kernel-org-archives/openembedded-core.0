Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A91D36FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:47:44 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p66so73776166wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 09:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pp78TQtkhhG7f6dOu+RDBvgLoIaED+WW68W2AiAU5Z8=;
	b=JVXWduRjXTC94LbtdhwjXdjk6iIBDrEG4HKWy2LMukR/239gktmdsMK0EwnePom/4+
	87lDPasfuBkiVJiRaELKovaQSiGeU2w6rWx7YArpOv7FoPejr/sISByAQH36TlOQp/4s
	PSZNuaoMMhwF04n202THMDd7ZGUVxIVapJxJ3xv8jo55ptYZ54nrF/5ln1Gb1D5tQ0ZL
	HH9vuMcIstv+r9Uz8BTfM4+3WcmGGhVQqBk4djEDL7A4cPblxx9eKbOuWmPDWa+gX71c
	y473DxGn/HpDXlQYAM7snyhEMBiMH+LcM4W38zz7kvJjWrDE4oUZTJQuXk1H0+rddBAy
	tiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pp78TQtkhhG7f6dOu+RDBvgLoIaED+WW68W2AiAU5Z8=;
	b=XxNGU7EU98XSpPzICQOIpnXsEk/QN/I2oCHgXv3tSSrYkSdaZTNptgNixd0Idu3qZT
	RpjjSsR4ZnLjRFSliwQf1YkPtdrs5GmrAdnQnJu7SPi7uK6DN/5rsQKrWArY2yJOOnzx
	dk7AZCQHjpKUOdMaLpAxsaNG9Wg24tSl8MrPsGYL+Zeqp/6dzNioXz7M1oEFla7G6Aiy
	x1as7R6JqGo8wZeL7uv8AyS+6+Nu/YxOh9p1jvyfPj+YHda7kXl4rHRRuAkK3LzWxVFb
	mpBaEOlOx4ZBzMZWmdZLBMwwBz7H7e44xn5P75bInda+Ra33HfsmtbMHw3UiVYmmH5Y8
	VEeA==
X-Gm-Message-State: ALoCoQkym2SplU/RHCoXZJpM0//t+0Uhk+wNt0Y3BcgRvODYgtiJ15EBWGRu2VFTJm9uJaAyxbqDm/DP7ku8VdtkhV1OlwvHeg==
X-Received: by 10.194.115.67 with SMTP id jm3mr39223464wjb.9.1450115263806;
	Mon, 14 Dec 2015 09:47:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 67sm17318024wmm.6.2015.12.14.09.47.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Dec 2015 09:47:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:47:39 +0000
Message-Id: <1450115259-23559-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xcb: don't build-depend on python
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
X-List-Received-Date: Mon, 14 Dec 2015 17:47:47 -0000

xcb-proto had a dependency on python-native as it builds and installs a Python
module, but xcb-proto is very low in the build to force a dependency on
python-native.

As it turns out libxcb simply asks pkg-config for the full path to the module
xcb-proto installed and uses it directly so there is no need to build
python-native.

Also remove the dependency on xcb-proto-native as libxcb uses the data files and
tooling from the target sysroot, and patching it to use the native sysroot adds
complication for no good reason.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb | 4 ++--
 meta/recipes-graphics/xorg-proto/xcb-proto.inc  | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

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
index 2e1b57b..aa08807 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto.inc
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto.inc
@@ -11,7 +11,7 @@ LICENSE = "MIT-X"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig
 
 PACKAGES += "python-xcbgen"
 
@@ -21,5 +21,4 @@ FILES_python-xcbgen = "${libdir}/python*"
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
-DEPENDS_append_class-native = " python-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


