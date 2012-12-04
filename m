Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TftFx-0000Sj-9R
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:13:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 05:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226378555"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 05:59:28 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Tue,  4 Dec 2012 15:59:08 +0200
Message-Id: <1636e75017b72bc97347f4cca038a8bc1efdb4ff.1354626535.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/5] image.bbclass: run postinst scripts once, at rootfs time
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
X-List-Received-Date: Tue, 04 Dec 2012 14:13:53 -0000

This patch will allow the repeating postinst scriptlets to be run
only once, on host, at do_rootfs time. This will lower the time for
rootfs generation and, also, instead of running some time consuming
scriptlets at target's first boot, we will do on the host.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7b24e4e..719d871 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -156,7 +156,7 @@ inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
-ROOTFS_POSTPROCESS_COMMAND ?= ""
+ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -166,15 +166,29 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
 
 do_rootfs[nostamp] = "1"
-do_rootfs[dirs] = "${TOPDIR}"
+do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
-do_rootfs[cleandirs] += "${S}"
+do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
 do_build[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate
 # task, so that we have a single fakeroot context for the whole process.
 do_rootfs[umask] = "022"
 
+
+run_intercept_scriptlets () {
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
-- 
1.7.9.5



