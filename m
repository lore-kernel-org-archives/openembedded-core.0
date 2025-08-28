Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75560CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 09:16:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16642.1756372593845628235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 02:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1651C1688
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:16:25 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFDC33F694
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:16:32 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: "meta-arm@openembedded-core"@lists.openembedded.org
Subject: [PATCH 2/2] runqemu: resize rootfs image to power of 2 for SD or pflash
Date: Thu, 28 Aug 2025 11:16:30 +0200
Message-Id: <20250828091630.82819-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250828091630.82819-1-jon.mason@arm.com>
References: <20250828091630.82819-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 09:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222549

QEMU requires that SD and pflash images are sized to be a power of 2
(e.g., 32M, 64M, etc).  So, if the image being used is not a power of 2
and it's being used for SD or pflash, increase it to the next power of 2
size via the truncate command.

This might not be an actual spec requirement, and is being investigated
in https://gitlab.com/qemu-project/qemu/-/issues/1754

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runqemu | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 16982bbc6b73..2853370fbf64 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -420,7 +420,27 @@ class BaseConfig(object):
         else:
             raise RunQemuError("Unknown path arg %s" % p)
=20
-    def uncompress_rootfs(self):
+    def rootfs_fixups(self):
+
+        """Resize rootfs image if needed"""
+        qb_rootfs_opt =3D self.get('QB_ROOTFS_OPT')
+
+        # Check if sdcard size is a power of 2, as that is currently a r=
equirement for qemu
+        # See https://gitlab.com/qemu-project/qemu/-/issues/1754
+        rootfs_size =3D os.path.getsize(self.rootfs)
+        rootfs_size_pwr2 =3D 1 << (rootfs_size - 1).bit_length()
+        if ("if=3Dsd" in qb_rootfs_opt or "if=3Dpflash" in qb_rootfs_opt=
) and rootfs_size !=3D rootfs_size_pwr2:
+            logger.info("Using sd-card or pflash and is not power of 2. =
File size %d, power of 2 size %d" %(rootfs_size, rootfs_size_pwr2))
+            logger.info("Attempting to use truncate to correct this.")
+
+            # Ensure the 'truncate' tool is installed before attempting =
to make a power of 2.
+            if not shutil.which('truncate'):
+                raise RunQemuError(f"'truncate' is required to make {sel=
f.rootfs} a power of 2 in size but was not found in PATH")
+            try:
+                subprocess.check_call(['truncate', '-s', str(rootfs_size=
_pwr2), self.rootfs])
+            except subprocess.CalledProcessError as e:
+                raise RunQemuError(f"Failed to make {self.rootfs} power =
of 2 in size: {e}")
+
         """Decompress ZST rootfs image if needed"""
         if not self.rootfs or not self.fstype.endswith('.zst'):
             return
@@ -1807,7 +1827,7 @@ def main():
         config.check_args()
         config.read_qemuboot()
         config.check_and_set()
-        config.uncompress_rootfs()
+        config.rootfs_fixups()
         # Check whether the combos is valid or not
         config.validate_combos()
         config.print_config()
--=20
2.39.5 (Apple Git-154)


