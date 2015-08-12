Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob12.myregisteredsite.com
	(atl4mhob12.myregisteredsite.com [209.17.115.50])
	by mail.openembedded.org (Postfix) with ESMTP id 24CCD7673F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:00:48 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t7C70lFr012269 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 03:00:47 -0400
Received: (qmail 10996 invoked by uid 0); 12 Aug 2015 07:00:47 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 12 Aug 2015 07:00:47 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 09:00:43 +0200
Message-Id: <1439362843-27419-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] image.bbclass: Always try to run populate-volatile.sh at rootfs time
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
X-List-Received-Date: Wed, 12 Aug 2015 07:00:49 -0000

Currently populate-volatile.sh will only run when "readonly-rootfs" is
selected.

Running this script is very useful even on read/write root filesystems,
because it reduces the number of "fixup" actions at first boot of the
device. That not only reduces boot time, it also reduces the flash space
usage. Also, when the system happens to have a read-only filesystem
because for example the "read-only" switch of the SD card was set, or
because the filesystem had errors on it, it will still be able to boot.

I've been manually adding these lines to each and every image recipe I've
used, so I guess it's time to move this into core.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/image.bbclass | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ff2ed0d..68deb84 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -185,6 +185,9 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
+# Create the volatile cache. Required for read-only rootfs, useful for all sysvinit systems to reduce writes to the system
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "rootfs_populate_volatile_cache;", "", d)}'
+
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
@@ -216,6 +219,16 @@ do_rootfs[cleandirs] += "${S}"
 # task, so that we have a single fakeroot context for the whole process.
 do_rootfs[umask] = "022"
 
+
+# Run populate-volatile.sh at rootfs time to set up basic files and
+# directories to reduce writes at first boot and to support read-only
+# rootfs.
+rootfs_populate_volatile_cache() {
+		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+		fi
+}
+
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 read_only_rootfs_hook () {
 	# Tweak the mount option and fs_passno for rootfs in fstab
@@ -226,11 +239,6 @@ read_only_rootfs_hook () {
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
 			sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
 		fi
-		# Run populate-volatile.sh at rootfs time to set up basic files
-		# and directories to support read-only rootfs.
-		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
-			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
-		fi
 		# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
 		# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
 		# and the keys under /var/run/ssh.
-- 
1.9.1


