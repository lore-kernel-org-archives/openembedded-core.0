Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0166B3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:10:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2013 10:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="336772923"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.176])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2013 10:09:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 18:09:05 +0100
Message-Id: <462445728b7057ef4f9b88b34ac52b6139b41e44.1374772012.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/rootfs_rpm: implement BAD_RECOMMENDATIONS for RPM
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
X-List-Received-Date: Thu, 25 Jul 2013 17:10:06 -0000

Add support for the BAD_RECOMMENDATIONS variable that can be used to
prevent specific packages from being installed via an RRECOMMENDS
relationship when using the RPM backend. (Previously this
functionality was only available when using ipk packaging.)

In the process this moves the defaulting of BAD_RECOMMENDATIONS (as
empty) to bitbake.conf since it is no longer specific to the ipk
backend, as well as unifying some of the code that creates the
configuration for smart for use on the host and target.

Fixes [YOCTO #3916].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 11 +++++++++--
 meta/classes/rootfs_ipk.bbclass  |  2 --
 meta/classes/rootfs_rpm.bbclass  |  3 +--
 meta/conf/bitbake.conf           |  2 ++
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1537079..324d83f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -224,6 +224,14 @@ translate_oe_to_smart() {
 	export pkgs_to_install
 }
 
+package_write_smart_config() {
+	# Write common configuration for host and target usage
+	smart --data-dir=$1/var/lib/smart config --set rpm-nolinktos=1
+	smart --data-dir=$1/var/lib/smart config --set rpm-noparentdirs=1
+	for i in ${BAD_RECOMMENDATIONS}; do
+		smart --data-dir=$1/var/lib/smart flag --set ignore-recommends $i
+	done
+}
 
 #
 # Install a bunch of packages using rpm.
@@ -345,10 +353,9 @@ EOF
 		rm -rf ${target_rootfs}/var/lib/smart
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-root=${target_rootfs}
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-dbpath=${rpmlibdir}
-		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-nolinktos=1
-		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-noparentdirs=1
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._var=${localstatedir}
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._tmppath=/install/tmp
+		package_write_smart_config ${target_rootfs}
 		# Optional debugging
 		#smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-log-level=debug
 		#smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-log-file=/tmp/smart-debug-logfile
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 1403422..c9650cb 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -21,8 +21,6 @@ OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; "
 
 OPKGLIBDIR = "${localstatedir}/lib"
 
-# Which packages to not install on the basis of a recommendation
-BAD_RECOMMENDATIONS ?= ""
 MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg"
 
 fakeroot rootfs_ipk_do_rootfs () {
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 1b09c8d..30b52d4 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -163,8 +163,7 @@ rpm_setup_smart_target_config() {
 	# Set up smart configuration for the target
 	rm -rf ${IMAGE_ROOTFS}/var/lib/smart
 	smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart channel --add rpmsys type=rpm-sys -y
-	smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart config --set rpm-nolinktos=1
-	smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart config --set rpm-noparentdirs=1
+	package_write_smart_config ${IMAGE_ROOTFS}
 	rm -f ${IMAGE_ROOTFS}/var/lib/smart/config.old
 }
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62a3936..07eb473 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -753,6 +753,8 @@ COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 SERIAL_CONSOLE ??= ""
 SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
 
+BAD_RECOMMENDATIONS ?= ""
+
 # Make sure MACHINE isn't exported
 # (breaks binutils at least)
 MACHINE[unexport] = "1"
-- 
1.8.1.2


