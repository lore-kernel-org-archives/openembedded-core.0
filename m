Return-Path: <rosbrookn@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 77F5E7D00A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 16:43:54 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k2so15405195qtm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8t9FJoijAK6OyUVDfM7h9lH3vDARsuACirty9M1HJLg=;
	b=D0u2P8Jv9jLiquhtDx5qliH/uOedWFxLY5wj0sBprdVtWGS0O3y1zSbtD/Xj+P0Uav
	P8CKEcCa6yLcOlpwKdXGcIRlwbtft6RQQXvcRF7p1jzTYP92e0vJk2+i7gf1e/C3uAXy
	1Ld0DFneWv+Sjp7MLJ4stQ8VvyNVv49B0+DGaPopzU12LVZD+UytOXPl2anV5hYQ/37S
	opu0R7xEnEm3HINSYdeLQai4uOJr7A9XZxZhSub2loAFuxp5u4lTO64InQ+enZFr13lj
	vTWkY6LJGePMwwQYvMJRgC2oHdPRqWw2cwMNSRjymgeNPSuTWWQfW6HsLCThEUqO7Qxv
	Urvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8t9FJoijAK6OyUVDfM7h9lH3vDARsuACirty9M1HJLg=;
	b=AOvtp9V60jwPzfebGOlWBEwy+KSgWm9FfjQVPbf7aOksOo1eS7w8CTv2kvZZYywh3z
	J+ijG+ShojQoD2xHU7WRnCkN+usG5PWXcBlDkQ4E71dlJcmwUMfFSQjkw61nGRRAkqgI
	yWurl1+Cw6XfsN9zrhqEq8h4StgM4OmJQnDvm7pMEyOW+SWuv0HBgqFr7ljO5RHY8Yl2
	YiCSMvJe7uWmEvtZrvM1brtsxUhr06X3lgLLA2tVcNEXPGAWQehkW+S+5vg6FEAUWhOT
	Y2Nbdw6EmYSRO3YIv0vIuihWWph1bGOJ77i9L6bEb4Ioymeb6D5759XyPAdY79/7AMt5
	dkHA==
X-Gm-Message-State: APjAAAVwRQd157DX7xfTDVxi5U81/ihcDIEGEYmF/XAglcGHWgP62sJp
	jLEzWuY8AE2ZTYrVmhgLshH9LuQf
X-Google-Smtp-Source: APXvYqxppxR6XXjRvArDA43wG6Ty9C4O6NxnljKcG6+bttiXSP/TGIReCZOlIwAs5hAspE6epfqTmw==
X-Received: by 2002:ac8:404b:: with SMTP id j11mr25950316qtl.155.1553618634550;
	Tue, 26 Mar 2019 09:43:54 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	o71sm11342442qka.18.2019.03.26.09.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 09:43:53 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 12:43:41 -0400
Message-Id: <20190326164341.5086-1-rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rootfs-postcommands.bbclass: break up read_only_rootfs_hook
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
X-List-Received-Date: Tue, 26 Mar 2019 16:43:54 -0000

The function read_only_rootfs_hook makes changes to ssh, dropbear,
fstab, and sysvinit configurations. Replace this function with
four new functions for each component so that they can be removed
from postprocess independently of each other.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 meta/classes/rootfs-postcommands.bbclass | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index bde58ad6cd..110f67e40d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -15,7 +15,16 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_fstab; ", "",d)}'
+
+# Change the default sshd_config if read-only-rootfs is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_sshd; ", "",d)}'
+
+# Change the default key locations for dropbear if read-only-rootfs is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_dropbear; ", "",d)}'
+
+# Tweaks for sysvinit if read-only-rootfs is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_sysvinit; ", "",d)}'
 
 # We also need to do the same for the kernel boot parameters,
 # otherwise kernel or initramfs end up mounting the rootfs read/write
@@ -86,15 +95,14 @@ systemd_create_users () {
 	done
 }
 
-#
-# A hook function to support read-only-rootfs IMAGE_FEATURES
-#
-read_only_rootfs_hook () {
+read_only_fstab () {
 	# Tweak the mount option and fs_passno for rootfs in fstab
 	if [ -f ${IMAGE_ROOTFS}/etc/fstab ]; then
 		sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 	fi
+}
 
+read_only_sshd () {
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
 	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
 	# and the keys under /var/run/ssh.
@@ -107,14 +115,18 @@ read_only_rootfs_hook () {
 			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
 		fi
 	fi
+}
 
+read_only_dropbear () {
 	# Also tweak the key location for dropbear in the same way.
 	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
 		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
 			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
 		fi
 	fi
+}
 
+read_only_sysvinit () {
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 		# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
-- 
2.17.1


