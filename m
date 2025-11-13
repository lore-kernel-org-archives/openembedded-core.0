Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A3CD8C87
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 15:18:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26452.1763047084817723480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 07:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EB6A1477
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 07:17:56 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2543D3F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 07:18:04 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 2/2] runqemu: resize rootfs image to power of 2 for SD or pflash
Date: Thu, 13 Nov 2025 10:18:02 -0500
Message-ID: <20251113151802.366-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151802.366-1-jon.mason@arm.com>
References: <20251113151802.366-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 15:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226251

QEMU requires that SD and pflash images are sized to be a power of 2
(e.g., 32M, 64M, etc).  So, if the image being used is not a power of 2
and it's being used for SD or pflash, increase it to the next power of 2
size via the truncate command.

This might not be an actual spec requirement, and is being investigated
in https://gitlab.com/qemu-project/qemu/-/issues/1754

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runqemu | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 370b45578137..5bce021d8167 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -421,6 +421,26 @@ class BaseConfig(object):
         else:
             raise RunQemuError("Unknown path arg %s" % p)
=20
+    def rootfs_fixups(self):
+        """Address or workaround any rootfs issues.  Currently, only res=
ize the rootfs image (if needed)"""
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
     def uncompress_rootfs(self):
         """Decompress ZST rootfs image if needed"""
         if not self.rootfs or not self.fstype.endswith('.zst'):
@@ -1784,6 +1804,7 @@ def main():
         config.read_qemuboot()
         config.check_and_set()
         config.uncompress_rootfs()
+        config.rootfs_fixups()
         # Check whether the combos is valid or not
         config.validate_combos()
         config.print_config()
--=20
2.50.1 (Apple Git-155)


