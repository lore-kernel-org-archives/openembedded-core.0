Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DDBC2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 17:00:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18572.1700067624475571952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 09:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36E04DA7;
	Wed, 15 Nov 2023 09:01:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B9373F641;
	Wed, 15 Nov 2023 09:00:23 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] canned-wks/mkefidisk.wks: generalise wic image
Date: Wed, 15 Nov 2023 17:00:19 +0000
Message-Id: <20231115170019.486387-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190737

From: Ross Burton <ross.burton@arm.com>

Update this wic image to be more generalised:

- Use ${EFI_PROVIDER} instead of hard-coding grub-efi
- Don't set the console explicitly, the kernel can set that up
- Use generic partition names "boot" and "root" instead of "msdos" and
  "platform"
- Use UUIDs for more mounts

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/wic/canned-wks/mkefidisk.wks    | 11 -----------
 scripts/lib/wic/canned-wks/mkefidisk.wks.in | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 scripts/lib/wic/canned-wks/mkefidisk.wks
 create mode 100644 scripts/lib/wic/canned-wks/mkefidisk.wks.in

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/c=
anned-wks/mkefidisk.wks
deleted file mode 100644
index 9f534fe1847..00000000000
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ /dev/null
@@ -1,11 +0,0 @@
-# short-description: Create an EFI disk image
-# long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media.
-
-part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --o=
ndisk sda --label msdos --active --align 1024
-
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --a=
lign 1024 --use-uuid
-
-part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
-
-bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 cons=
ole=3DttyS0,115200 console=3Dtty0"
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks.in b/scripts/lib/wi=
c/canned-wks/mkefidisk.wks.in
new file mode 100644
index 00000000000..1f06830a5fc
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks.in
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid
+
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
+
+part swap --size 44 --label swap --fstype=3Dswap --use-uuid
+
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4"
--=20
2.34.1


