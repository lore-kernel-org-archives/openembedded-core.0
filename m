Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8cXC-0004u7-8N
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140089229"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.171])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2012 12:01:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:00:58 +0000
Message-Id: <5fc6879a23564094e1ede78650017cd5921b1202.1331924409.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] buildhistory: allow disabling image and/or package history
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 19:09:54 -0000

Add a BUILDHISTORY_FEATURES variable which can be set to "" to disable
buildhistory with the class still inherited.

BUILDHISTORY_FEATURES by default contains two items - image and package.
You can use these to disable the image and package history functions
individually - this is particularly useful if you want to get the image
contents and dependency graphs but don't need the package history.

Additionally, ensure we quit shell procedures gracefully by using return
instead of exit.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6c2d4e9..3a68d8d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -7,6 +7,7 @@
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
+BUILDHISTORY_FEATURES ?= "image package"
 BUILDHISTORY_DIR ?= "${TMPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
@@ -25,6 +26,9 @@ PACKAGEFUNCS += "buildhistory_emit_pkghistory"
 python buildhistory_emit_pkghistory() {
 	import re
 
+	if not "package" in (d.getVar('BUILDHISTORY_FEATURES', True) or "").split():
+		return 0
+
 	pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
 	class RecipeInfo:
@@ -269,6 +273,10 @@ buildhistory_get_image_installed() {
 	# Anything requiring the use of the packaging system should be done in here
 	# in case the packaging files are going to be removed for this image
 
+	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
 	mkdir -p ${BUILDHISTORY_DIR_IMAGE}
 
 	# Get list of installed packages
@@ -317,6 +325,10 @@ buildhistory_get_image_installed() {
 }
 
 buildhistory_get_imageinfo() {
+	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
 	# List the files in the image, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
 	( cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
@@ -371,7 +383,7 @@ def buildhistory_get_imagevars(d):
 buildhistory_commit() {
 	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
 		# Code above that creates this dir never executed, so there can't be anything to commit
-		exit
+		return
 	fi
 
 	( cd ${BUILDHISTORY_DIR}/
@@ -396,8 +408,9 @@ python buildhistory_eventhandler() {
 	import bb.event
 
 	if isinstance(e, bb.event.BuildCompleted):
-		if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
-			bb.build.exec_func("buildhistory_commit", e.data)
+		if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
+			if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
+				bb.build.exec_func("buildhistory_commit", e.data)
 }
 
 addhandler buildhistory_eventhandler
-- 
1.7.5.4



