Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.24535.1628523412626860501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 372E9D6E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 08:36:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D71373F718
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 08:36:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] wic: don't forcibly pass -T default
Date: Mon,  9 Aug 2021 16:36:49 +0100
Message-Id: <20210809153649.3335478-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809153649.3335478-1-ross.burton@arm.com>
References: <20210809153649.3335478-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This reverts part of oe-core eecbe62555, which was a previous attempt
to solve the Y2038 problem.  This is now solved centrally in e2fsprogs,
so doesn't need to be dealt with in wic.

We don't revert the commit entirely, to retain the warning if a
filesystem has small inodes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc     | 2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks | 2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/=
canned-wks/common.wks.inc
index 4fd29fa8c11..89880b417b6 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --=
align 1024
-part / --source rootfs --use-uuid --fstype=3Dext4 --mkfs-extraopts "-T d=
efault" --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=3Dext4 --label platform --ali=
gn 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/scripts/lib/=
wic/canned-wks/directdisk-gpt.wks
index cf16c0c30bb..8d7d8de6ea7 100644
--- a/scripts/lib/wic/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
=20
=20
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --=
align 1024
-part / --source rootfs --ondisk sda --fstype=3Dext4 --mkfs-extraopts "-T=
 default" --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --a=
lign 1024 --use-uuid
=20
 bootloader  --ptable gpt --timeout=3D0  --append=3D"rootwait rootfstype=3D=
ext4 video=3Dvesafb vga=3D0x318 console=3Dtty0 console=3DttyS0,115200n8"
=20
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/c=
anned-wks/mkefidisk.wks
index d1878e23e5a..9f534fe1847 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
=20
 part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --o=
ndisk sda --label msdos --active --align 1024
=20
-part / --source rootfs --ondisk sda --fstype=3Dext4 --mkfs-extraopts "-T=
 default"  --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --a=
lign 1024 --use-uuid
=20
 part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
=20
--=20
2.25.1

