Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352E9C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 08:23:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.8530.1651566228400819948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 01:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=G0jz/7cN;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-084-057-071-010.084.057.pools.vodafone-ip.de
 [84.57.71.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 08A3780600;
	Tue,  3 May 2022 10:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1651566226;
	bh=0ZkU7PyNStR6xt6yLgvBIVVZ0IC6Y1Dq7pnSQ3tQJa4=;
	h=From:To:Cc:Subject:Date:From;
	b=G0jz/7cN+o4erc+k5BAEuUv2Nrg5i70N8LNBXcMIf3GoZJ0e64VYpGtAyCmn9Wm0h
	 ZjVkpoTX08oqReA4ZEZKS2YbRgaLz7VG+7QREROhgX6w9w9L3FeAc4G+Atbh1wd2hY
	 PlsjhH5YhUKIgoaiRrlp88y4uFfjHXmbxkZY8iDD1qT6Sj6QOd6so2TVqho+FO2DnR
	 /o/6NpP8kiIPrYzptNHQQQ/ohmlRL7HXWJqwJZNZYI6pYiMJKrUI51sIxBN/CCkRtU
	 VtN9J/9U4AK6myomESbTRFs12OO/ckYQCdlRA11xk6tnk0p+yAcsvAzaRldePdxvDh
	 NFQJthpv6+uPg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v3] classes: rootfs-postcommands: add skip option to
 overlayfs_qa_check
Date: Tue,  3 May 2022 10:22:33 +0200
Message-Id: <20220503082231.1971123-1-ch@denx.de>
X-Mailer: git-send-email 2.33.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 08:23:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165196

The overlayfs_qa_check checks if the current root file system has a
mount configured for each overlayfs, when the overlayfs class is used.

However there are certain instances where this mount point is created at
runtime and not static in a fstab entry or systemd mount unit.

One such case would be if overlayfs-etc is used, where the device is
mounted in the preinit script and not via a mount unit or fstab entry.

However there are other possibilities for this as well, like startup
scripts that support a dynamic partition layout. For instance when
systemd-repart is used.

This adds the `OVERLAYFS_QA_SKIP` variable, which allows to define QA
skips via its flags. In principle it supports multiple QA skip flags
separated by whitespace, but only one (`mount-configured`) is
implemented here. To skip this QA check simply add `mount-configured` to
the flag of `OVERLAYFS_QA_SKIP` with the same name. For instance if a
overlayfs is configured as:

	OVERLAYFS_MOUNT_POINT[data] =3D "/data"

Skipping this QA check can be done by setting:

	OVERLAYFS_QA_SKIP[data] =3D "mount-configured"

Also add a testcase and fix a typo (fstat -> fstab).

Signed-off-by: Claudius Heine <ch@denx.de>
---

Changes from v2:
- Fix typo 'fstat' -> 'fstab' in testcase
- Add testcase for successful build when QA check is skipped.

Changes from v1:
- `getVarFag` -> `getVarFlag`

---
 meta/classes/rootfs-postcommands.bbclass  | 10 ++++++++--
 meta/lib/oeqa/selftest/cases/overlayfs.py | 20 +++++++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
index 7b92df69c5..9b6824043c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -398,6 +398,10 @@ python overlayfs_qa_check() {
=20
     allUnitExist =3D True;
     for mountPoint in overlayMountPoints:
+        qaSkip =3D (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "")=
.split()
+        if "mount-configured" in qaSkip:
+            continue
+
         mountPath =3D d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
         if mountPath in fstabDevices:
             continue
@@ -407,8 +411,10 @@ python overlayfs_qa_check() {
                for dirpath in searchpaths):
             continue
=20
-        bb.warn('Mount path %s not found in fstat and unit %s not found =
'
-                'in systemd unit directories' % (mountPath, mountUnit))
+        bb.warn(f'Mount path {mountPath} not found in fstab and unit '
+                f'{mountUnit} not found in systemd unit directories.')
+        bb.warn(f'Skip this check by setting OVERLAYFS_QA_SKIP[{mountPoi=
nt}] =3D '
+                '"mount-configured"')
         allUnitExist =3D False;
=20
     if not allUnitExist:
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
index 472746a64f..ce1d2f1ec3 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -62,11 +62,29 @@ DISTRO_FEATURES +=3D "systemd overlayfs"
         self.add_overlay_conf_to_machine()
=20
         res =3D bitbake('core-image-minimal', ignore_status=3DTrue)
-        line =3D getline(res, " Mount path /mnt/overlay not found in fst=
at and unit mnt-overlay.mount not found in systemd unit directories")
+        line =3D getline(res, " Mount path /mnt/overlay not found in fst=
ab and unit mnt-overlay.mount not found in systemd unit directories")
         self.assertTrue(line and line.startswith("WARNING:"), msg=3Dres.=
output)
         line =3D getline(res, "Not all mount paths and units are install=
ed in the image")
         self.assertTrue(line and line.startswith("ERROR:"), msg=3Dres.ou=
tput)
=20
+    def test_not_all_units_installed_but_qa_skipped(self):
+        """
+        Summary:   Test skipping the QA check
+        Expected:  Image is created successfully
+        Author:    Claudius Heine <ch@denx.de>
+        """
+
+        config =3D """
+IMAGE_INSTALL:append =3D " overlayfs-user"
+DISTRO_FEATURES +=3D "systemd overlayfs"
+OVERLAYFS_QA_SKIP[mnt-overlay] =3D "mount-configured"
+"""
+
+        self.write_config(config)
+        self.add_overlay_conf_to_machine()
+
+        bitbake('core-image-minimal')
+
     def test_mount_unit_not_set(self):
         """
         Summary:   Test whether mount unit was set properly
--=20
2.33.3


