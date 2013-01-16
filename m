Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvWaW-0008U0-EX
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 18:15:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2013 09:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="277677173"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.117])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2013 09:00:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 17:00:12 +0000
Message-Id: <81aaaa6acc35e5fddf945d2a694a9381fb071635.1358355580.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358355580.git.paul.eggleton@linux.intel.com>
References: <cover.1358355580.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358355580.git.paul.eggleton@linux.intel.com>
References: <cover.1358355580.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 2/2] classes/image: improve debug-tweaks ssh server configuration
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
X-List-Received-Date: Wed, 16 Jan 2013 17:15:50 -0000

Create a single postprocessing function that enables no-password logins
for both openssh and dropbear when debug-tweaks is in IMAGE_FEATURES,
changing its behaviour slightly:
* Run it regardless of whether ssh-server-* are in IMAGE_FEATURES so
  that it still takes effect if these are installed by adding
  dropbear/openssh to IMAGE_INSTALL.
* Enable it to be run from image.bbclass rather than core-image.bbclass
  so that it works for images that are using the former.

Second half of the fix for [YOCTO #2578].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass |    3 ---
 meta/classes/image.bbclass      |   16 ++++++++++++++--
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 2e67018..e0f6dbb 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -76,6 +76,3 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Zap the root password if debug-tweaks feature is not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
-# Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
-
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e494689..0293d2e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -167,6 +167,8 @@ inherit ${IMAGE_CLASSES}
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
 ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
+# Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -396,12 +398,22 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
-# allow openssh accept login with empty password string
-openssh_allow_empty_password () {
+# allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
+ssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
 		sed -i 's#.*PermitRootLogin.*#PermitRootLogin yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 		sed -i 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 	fi
+
+	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
+		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
+			if ! grep -q "DROPBEAR_EXTRA_ARGS=.*-B" ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear ; then
+				sed -i 's/^DROPBEAR_EXTRA_ARGS="*\([^"]*\)"*/DROPBEAR_EXTRA_ARGS="\1 -B"/' ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
+			fi
+		else
+			printf '\nDROPBEAR_EXTRA_ARGS="-B"\n' >> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
+		fi
+	fi
 }
 
 # Turn any symbolic /sbin/init link into a file
-- 
1.7.10.4



