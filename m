Return-Path: <jonathan.david@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8957A60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 21:59:49 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAULxnC1024364 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 15:59:49 -0600
Received: from jodavid.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015113015594899-588465 ;
	Mon, 30 Nov 2015 15:59:48 -0600 
From: Jonathan David <jonathan.david@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 15:59:50 -0600
Message-Id: <1448920790-20843-1-git-send-email-jonathan.david@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/30/2015 03:59:48 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/30/2015 03:59:49 PM,
	Serialize complete at 11/30/2015 03:59:49 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-30_08:, , signatures=0
Subject: [PATCH] xinput-calibrator: get screen geometry when calibrating
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
X-List-Received-Date: Mon, 30 Nov 2015 21:59:50 -0000

Calibration acquires a default resolution of 1280x1024 when running
xinput_calibrator_pointercal.sh, obtain correct screen resolution by
using xrandr to grab user-specified geometry and pass to script

Signed-off-by: Jonathan David <jonathan.david@ni.com>
---
 .../add-geometry-input-when-calibrating.patch      | 33 ++++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
new file mode 100644
index 0000000..9351331
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [no longer maintained]
+
+From 93abf28d602da637376b78de8c88b7ab5cf13b4f Mon Sep 17 00:00:00 2001
+From: Jonathan David <jonathan.david@ni.com>
+Date: Mon, 30 Nov 2015 12:12:20 -0600
+Subject: [PATCH] add geometry input when calibrating
+
+Send monitor geometry to xinput_calibrator when running the script
+
+Signed-off-by: Jonathan David <jonathan.david@ni.com>
+---
+ scripts/xinput_calibrator_pointercal.sh | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
+index 0ada7da..6a3aded 100755
+--- a/scripts/xinput_calibrator_pointercal.sh
++++ b/scripts/xinput_calibrator_pointercal.sh
+@@ -37,7 +37,10 @@ done
+ 
+ [ "$USER" != "root" ] && CALFILE=$USER_CALFILE
+ 
+-CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
++read RESOLUTION <<< $(xrandr | awk -F '[[:space:]+]' '/ connected/ \
++  { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }')
++
++CALDATA=`$BINARY --geometry $RESOLUTION --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
+ if [ ! -z "$CALDATA" ] ; then
+   echo $CALDATA > $CALFILE
+   echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index a9de3d7..ac5b70c 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -14,7 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
-           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch"
+           file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
+           file://add-geometry-input-when-calibrating.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


