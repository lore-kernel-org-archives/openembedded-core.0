Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4086D73A05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:47:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 11 Mar 2015 11:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,383,1422950400"; d="scan'208";a="697347374"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2015 11:47:19 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 10:40:46 +0000
Message-Id: <1426070446-15934-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] oe-setup-builddir: output message cleanup
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
X-List-Received-Date: Wed, 11 Mar 2015 18:47:21 -0000

Moved a Yoctoproject documentation banner to the end of the first-time
run messages section

[YOCTO #7368]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 scripts/oe-setup-builddir | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index c91e079..f73aa34 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -66,6 +66,7 @@ if [ -n "$TEMPLATECONF" ]; then
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
+unset SHOWYPDOC
 if [ -z "$OECORELOCALCONF" ]; then
     OECORELOCALCONF="$OEROOT/meta/conf/local.conf.sample"
 fi
@@ -77,15 +78,9 @@ different MACHINE (target hardware) or enable parallel build options to take
 advantage of multiple cores for example. See the file for more information as 
 common configuration options are commented.
 
-The Yocto Project has extensive documentation about OE including a reference manual
-which can be found at:
-    http://yoctoproject.org/documentation
-
-For more information about OpenEmbedded see their website:
-    http://www.openembedded.org/
-
 EOM
     cp -f $OECORELOCALCONF $BUILDDIR/conf/local.conf
+    SHOWYPDOC=yes
 fi
 
 if [ -z "$OECORELAYERCONF" ]; then
@@ -97,14 +92,6 @@ You had no conf/bblayers.conf file. The configuration file has been created for
 you with some default values. To add additional metadata layers into your
 configuration please add entries to this file.
 
-The Yocto Project has extensive documentation about OE including a reference manual
-which can be found at:
-    http://yoctoproject.org/documentation
-
-For more information about OpenEmbedded see their website:
-    http://www.openembedded.org/
-
-
 EOM
 
     # Put the abosolute path to the layers in bblayers.conf so we can run
@@ -114,12 +101,27 @@ EOM
     sed -e "s|##OEROOT##|$OEROOT|g" \
         -e "s|##COREBASE##|$OEROOT|g" \
         $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    SHOWYPDOC=yes
 fi
 
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
 
+# Ending the first-time run message. Show the YP Documentation banner.
+if [ ! -z "$SHOWYPDOC" ]; then
+    cat <<EOM
+The Yocto Project has extensive documentation about OE including a reference
+manual which can be found at:
+    http://yoctoproject.org/documentation
+
+For more information about OpenEmbedded see their website:
+    http://www.openembedded.org/
+
+EOM
+#    unset SHOWYPDOC
+fi
+
 cat <<EOM
 
 ### Shell environment set up for builds. ###
-- 
1.8.4.5


