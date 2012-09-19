Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEIyy-00015d-Um
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 14:02:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 04:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194489242"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 04:49:37 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 14:49:20 +0300
Message-Id: <949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
Subject: [RFC 2/7] image.bbclass: run postinst scripts once, at rootfs time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 12:02:21 -0000

This patch will allow the repeating postinst scriptlets to be run
only once, on host, at do_rootfs time. This will lower the time for
rootfs generation and, also, instead of running some time consuming
scriptlets at target's first boot, we will do on the host.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |   24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ab212b3..4889260 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -155,7 +155,7 @@ inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
-ROOTFS_POSTPROCESS_COMMAND ?= ""
+ROOTFS_POSTPROCESS_COMMAND ?= "run_intercept_scriptlets"
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -174,6 +174,21 @@ do_build[nostamp] = "1"
 # task, so that we have a single fakeroot context for the whole process.
 do_rootfs[umask] = "022"
 
+
+run_intercept_scriptlets () {
+	echo $D >> test.txt
+	if [ -d ${WORKDIR}/intercept_scripts ]; then
+		cd ${WORKDIR}/intercept_scripts
+		echo "Running intercept scripts:"
+		for script in *; do
+			if [ "$script" = "*" ]; then break; fi
+			echo "> Executing $script"
+			chmod +x $script
+			./$script
+		done
+	fi
+}
+
 fakeroot do_rootfs () {
 	#set -x
 	# When use the rpm incremental image generation, don't remove the rootfs
@@ -202,6 +217,13 @@ fakeroot do_rootfs () {
 		done
 	fi
 
+	if [ -d ${WORKDIR}/intercept_scripts ]; then
+		# clean-up old intercept scripts
+		rm -f ${WORKDIR}/intercept_scripts/*
+	else
+		mkdir ${WORKDIR}/intercept_scripts
+	fi
+
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
 	insert_feed_uris
-- 
1.7.9.5



