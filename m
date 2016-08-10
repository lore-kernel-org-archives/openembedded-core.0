Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CB13377212
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:39 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 02:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="153537084"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2016 02:29:40 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AD6E86A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:24 +0300
Message-Id: <1470821429-6094-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/10] xinput-calibrator: remove bash dependency
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:40 -0000

Refresh add-geometry-input-when-calibrating.patch to remove
bashism from it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../add-geometry-input-when-calibrating.patch      | 31 +++++++++++-----------
 .../xinput-calibrator/xinput-calibrator_git.bb     |  2 +-
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
index 9351331..9dc94ae 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
@@ -1,33 +1,34 @@
-Upstream-Status: Inappropriate [no longer maintained]
-
-From 93abf28d602da637376b78de8c88b7ab5cf13b4f Mon Sep 17 00:00:00 2001
-From: Jonathan David <jonathan.david@ni.com>
-Date: Mon, 30 Nov 2015 12:12:20 -0600
+From 1cb83759632bb218559c4d0d65ff79f868c03dc5 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 9 Aug 2016 17:03:31 +0300
 Subject: [PATCH] add geometry input when calibrating
 
 Send monitor geometry to xinput_calibrator when running the script
+Update:
+        Remove bashism
+
+Upstream-Status: Inappropriate [no longer maintained]
 
 Signed-off-by: Jonathan David <jonathan.david@ni.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- scripts/xinput_calibrator_pointercal.sh | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
+ scripts/xinput_calibrator_pointercal.sh | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
-index 0ada7da..6a3aded 100755
+index fccb197..fea7c2f 100755
 --- a/scripts/xinput_calibrator_pointercal.sh
 +++ b/scripts/xinput_calibrator_pointercal.sh
-@@ -37,7 +37,10 @@ done
- 
- [ "$USER" != "root" ] && CALFILE=$USER_CALFILE
+@@ -24,7 +24,8 @@ if [ -e $CALFILE ] ; then
+   fi
+ fi
  
 -CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
-+read RESOLUTION <<< $(xrandr | awk -F '[[:space:]+]' '/ connected/ \
-+  { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }')
-+
++RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }')
 +CALDATA=`$BINARY --geometry $RESOLUTION --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
  if [ ! -z "$CALDATA" ] ; then
    echo $CALDATA > $CALFILE
    echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
 -- 
-1.9.1
+2.4.0
 
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 98ce7ee..57c3a7a 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -34,5 +34,5 @@ do_install_append() {
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput formfactor xrandr bash"
+RDEPENDS_${PN} = "xinput formfactor xrandr"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
2.4.0


