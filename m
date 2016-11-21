Return-Path: <diego.ml@zoho.com>
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id 701446FEF3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 16:15:09 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=HQHD0Uej+RkV2bQx1rpg0OpaQhsXZzV5SMLUoLir3oK4nfubTewedyqiwiKXm9wEL+AX3rVno3qC
	xu/BoFtQ05Q4GmwDKCky6DD4qfIO2XHY+1xsS494nJbM8+RN6ZX8  
Received: from ip-172-31-0-222.eu-west-1.compute.internal
	(ec2-52-48-117-71.eu-west-1.compute.amazonaws.com
	[52.48.117.71]) by mx.zohomail.com
	with SMTPS id 147974490851188.43121335723697;
	Mon, 21 Nov 2016 08:15:08 -0800 (PST)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 16:22:18 +0000
Message-Id: <1479745338-9397-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.9.1
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [PATCH v3] xinput-calibrator: use up-to-date git version
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
X-List-Received-Date: Mon, 21 Nov 2016 16:15:10 -0000

Use up-to-date version from git. While currently there aren't official releases
newer than 0.7.5, quite some new features have been added in git, for example
the ability to disable the calibration screen timeout.
Additionally depend on libxrandr, so that xinput_calibrator can use the library
directly to obtain the geometry, instead of parsing the output of the xrandr
binary (parsing of the output can easily break, for example when the output
name is made up of two words instead of one).

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 .../add-geometry-input-when-calibrating.patch      | 34 ----------------------
 .../xinput-calibrator/xinput-calibrator_git.bb     |  9 +++---
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
deleted file mode 100644
index 9dc94ae..0000000
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1cb83759632bb218559c4d0d65ff79f868c03dc5 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 9 Aug 2016 17:03:31 +0300
-Subject: [PATCH] add geometry input when calibrating
-
-Send monitor geometry to xinput_calibrator when running the script
-Update:
-        Remove bashism
-
-Upstream-Status: Inappropriate [no longer maintained]
-
-Signed-off-by: Jonathan David <jonathan.david@ni.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- scripts/xinput_calibrator_pointercal.sh | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
-index fccb197..fea7c2f 100755
---- a/scripts/xinput_calibrator_pointercal.sh
-+++ b/scripts/xinput_calibrator_pointercal.sh
-@@ -24,7 +24,8 @@ if [ -e $CALFILE ] ; then
-   fi
- fi
- 
--CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
-+RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }')
-+CALDATA=`$BINARY --geometry $RESOLUTION --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
- if [ ! -z "$CALDATA" ] ; then
-   echo $CALDATA > $CALFILE
-   echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
--- 
-2.4.0
-
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 57c3a7a..68e62ea 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Touchscreen calibration program for X11"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
-DEPENDS = "virtual/libx11 libxi"
+DEPENDS = "virtual/libx11 libxi libxrandr"
 
 PV = "0.7.5+git${SRCPV}"
 PR = "r6"
@@ -11,11 +11,10 @@ inherit autotools pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRCREV = "03dadf55109bd43d3380f040debe9f82f66f2f35"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
-           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
-           file://add-geometry-input-when-calibrating.patch"
+           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch"
 
 S = "${WORKDIR}/git"
 
@@ -34,5 +33,5 @@ do_install_append() {
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput formfactor xrandr"
+RDEPENDS_${PN} = "xinput formfactor"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.9.1



