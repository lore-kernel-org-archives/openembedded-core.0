Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 560 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 12:41:38 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8441460144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267818"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:32:03 +0100
Message-Id: <5246b97de9bdb0d0850a1787373823c00c16156d.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/8] scripts/contrib/dialog-power-control: add a trivial power prompt script
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:40 -0000

If you want to do automated hardware testing but don't have a
controllable power strip this script can be useful so that you know when
you need to cycle the power.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/dialog-power-control | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100755 scripts/contrib/dialog-power-control

diff --git a/scripts/contrib/dialog-power-control b/scripts/contrib/dialog-power-control
new file mode 100755
index 0000000..7550ea5
--- /dev/null
+++ b/scripts/contrib/dialog-power-control
@@ -0,0 +1,53 @@
+#!/bin/sh
+#
+# Simple script to show a manual power prompt for when you want to use
+# automated hardware testing with testimage.bbclass but you don't have a
+# web-enabled power strip or similar to do the power on/off/cycle.
+#
+# You can enable it by enabling testimage (see the Yocto Project
+# Development manual "Performing Automated Runtime Testing" section)
+# and setting the following in your local.conf:
+#
+# TEST_POWERCONTROL_CMD = "${COREBASE}/scripts/contrib/dialog-power-control"
+#
+
+PROMPT=""
+while true; do
+    case $1 in
+        on)
+            PROMPT="Please turn device power on";;
+        off)
+            PROMPT="Please turn device power off";;
+        cycle)
+            PROMPT="Please click Done, then turn the device power off then on";;
+        "")
+            break;;
+    esac
+    shift
+done
+
+if [ "$PROMPT" = "" ] ; then
+    echo "ERROR: no power action specified on command line"
+    exit 2
+fi
+
+if [ "`which kdialog 2>/dev/null`" != "" ] ; then
+    DIALOGUTIL="kdialog"
+elif [ "`which zenity 2>/dev/null`" != "" ] ; then
+    DIALOGUTIL="zenity"
+else
+    echo "ERROR: couldn't find program to display a message, install kdialog or zenity"
+    exit 3
+fi
+
+if [ "$DIALOGUTIL" = "kdialog" ] ; then
+    kdialog --yesno "$PROMPT" --title "TestImage Power Control" --yes-label "Done" --no-label "Cancel test"
+elif [ "$DIALOGUTIL" = "zenity" ] ; then
+    zenity --question --text="$PROMPT" --title="TestImage Power Control" --ok-label="Done" --cancel-label="Cancel test"
+fi
+
+if [ "$?" != "0" ] ; then
+    echo "User cancelled test at power prompt"
+    exit 1
+fi
+
-- 
1.9.0


