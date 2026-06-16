Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AF2CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:40:29 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155917.1781620827459130090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=YHqqhpOO;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=AprIvLdn;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781620825;
	bh=sTIxVnBBG717MadZbbDsyvf+z9r0Hmfd9rUgU0DdTdo=;
	h=From:To:Cc:Subject:Date:From;
	b=YHqqhpOO5tOPZWcdVlFdpAc1v1sZGhe2zoYLuF4RYB9q2v1HmQLQcDD/hL23A6KeJ
	 wCIyVLdkV6iEDMd4zYD9S5eGB4oYIvjokcw5GYxf+Uph7CZii2deX46SZXeGEYc/JU
	 9PI+G0dybFKpyeG0u8rJCk0M9e5qFc3VSSKw+eHGqkVySabryjatA6jW2jDAQBbOkq
	 dLl1piBy83Nx62wDqzhADBMd8As7HyKmMt8l00v45wPtMCClUEib5fMaqxdWx6AsYj
	 coXM5KmGv0nOQ3W4LaXDsWkJH0uHUs22yMr7aWkijjENqRdrG0/05D8PLeAxb4ucJo
	 ykKv0CCHHnnjg==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 07CAE5F9D3
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781620824;
	bh=sTIxVnBBG717MadZbbDsyvf+z9r0Hmfd9rUgU0DdTdo=;
	h=From:To:Cc:Subject:Date:From;
	b=AprIvLdnlN16rUyFUlV2ZcXnueGo+pchTSmkN/y6NLgb2h7DXoaMM3XS+8qRtf/yR
	 /mfnF99daTAYM1MLiYwA86khjZ7IxCJXdnxmTt5tkHbEuIRNi1Dq1JipclmLyPenhO
	 t3444Je5mHaoEu3pa1qC1CUBmHE1DFuk6u4I+a3zt86qyxZQwE27gY0GQfKUGeru2z
	 JdR6lX9MDmYuOxAS8M+RCWmpvaEWOdtsn3jlJMYDdebA5hZkSsFCIODlX1wMgRus93
	 TB6XXcbUdzW1DRYukIhm73b3cGqTsLLU+mEkQ/BFwe9F4kfhvkX5Dm96Vn/FIeTaVp
	 skjStQxf7BiHw==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id DEEB45F9B8
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:40:24 +0200 (CEST)
From: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
Subject: [PATCH 1/3] overlayfs: re-introduce helper unit
Date: Tue, 16 Jun 2026 16:40:17 +0200
Message-ID: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 14:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238905

systemd v256+ automatically creates the upperdir and workdir when
starting an overlayfs mount unit. The directories created this way are
owned by root:root; this behaviour differs from the previously used
helper unit, which explicitly applied the ownership of the lowerdir to
the upperdir.

Revert commit 623c20ff1e989730138c3fbe6e8247eaada20707 to restore the
previous behaviour.

Signed-off-by: Andreas M=C3=BCtzel <andreas.muetzel@emlix.com>
---
 meta/classes-recipe/overlayfs.bbclass           | 10 ++++++++++
 meta/classes-recipe/rootfs-postcommands.bbclass | 13 ++++++++++++-
 meta/files/overlayfs-create-dirs.service.in     | 13 +++++++++++++
 meta/files/overlayfs-create-dirs.sh             | 11 +++++++++++
 meta/files/overlayfs-unit.mount.in              |  3 ++-
 meta/lib/oe/overlayfs.py                        |  4 ++++
 6 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/files/overlayfs-create-dirs.service.in
 create mode 100644 meta/files/overlayfs-create-dirs.sh

diff --git a/meta/classes-recipe/overlayfs.bbclass b/meta/classes-recipe/=
overlayfs.bbclass
index 07cc68ad7b..a82763ec10 100644
--- a/meta/classes-recipe/overlayfs.bbclass
+++ b/meta/classes-recipe/overlayfs.bbclass
@@ -55,21 +55,27 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd overlayfs"
=20
 inherit systemd features_check
=20
+OVERLAYFS_CREATE_DIRS_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-c=
reate-dirs.service.in"
 OVERLAYFS_MOUNT_UNIT_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-un=
it.mount.in"
 OVERLAYFS_ALL_OVERLAYS_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-=
all-overlays.service.in"
=20
 python do_create_overlayfs_units() {
     from oe.overlayfs import mountUnitName
=20
+    with open(d.getVar("OVERLAYFS_CREATE_DIRS_TEMPLATE"), "r") as f:
+        CreateDirsUnitTemplate =3D f.read()
     with open(d.getVar("OVERLAYFS_MOUNT_UNIT_TEMPLATE"), "r") as f:
         MountUnitTemplate =3D f.read()
     with open(d.getVar("OVERLAYFS_ALL_OVERLAYS_TEMPLATE"), "r") as f:
         AllOverlaysTemplate =3D f.read()
=20
     def prepareUnits(data, lower):
+        from oe.overlayfs import helperUnitName
+
         args =3D {
             'DATA_MOUNT_POINT': data,
             'DATA_MOUNT_UNIT': mountUnitName(data),
+            'CREATE_DIRS_SERVICE': helperUnitName(lower),
             'LOWERDIR': lower,
         }
=20
@@ -77,6 +83,10 @@ python do_create_overlayfs_units() {
         with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)=
), 'w') as f:
             f.write(MountUnitTemplate.format(**args))
=20
+        bb.debug(1, "Generate helper systemd unit %s" % helperUnitName(l=
ower))
+        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower=
)), 'w') as f:
+            f.write(CreateDirsUnitTemplate.format(**args))
+
     def prepareGlobalUnit(dependentUnits):
         from oe.overlayfs import allOverlaysUnitName
         args =3D {
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
index f0c7ee658d..2a36840f29 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -47,7 +47,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("=
DISTRO_FEATURES", "systemd"
=20
 ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile'
=20
-ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES",=
 "overlayfs", "overlayfs_qa_check", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES",=
 "overlayfs", "overlayfs_qa_check overlayfs_postprocess", "", d)}'
=20
 inherit image-artifact-names
=20
@@ -570,3 +570,14 @@ python overlayfs_qa_check() {
     if not allUnitExist:
         bb.fatal('Not all mount paths and units are installed in the ima=
ge')
 }
+
+python overlayfs_postprocess() {
+    import shutil
+
+    # install helper script
+    helperScriptName =3D "overlayfs-create-dirs.sh"
+    helperScriptSource =3D oe.path.join(d.getVar("COREBASE"), "meta/file=
s", helperScriptName)
+    helperScriptDest =3D oe.path.join(d.getVar("IMAGE_ROOTFS"), "/usr/sb=
in/", helperScriptName)
+    shutil.copyfile(helperScriptSource, helperScriptDest)
+    os.chmod(helperScriptDest, 0o755)
+}
diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/ove=
rlayfs-create-dirs.service.in
new file mode 100644
index 0000000000..c8431548d7
--- /dev/null
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DOverlayfs directories setup {LOWERDIR}
+RequiresMountsFor=3D{DATA_MOUNT_POINT}
+DefaultDependencies=3Dno
+
+[Service]
+Type=3Doneshot
+ExecStart=3D/usr/sbin/overlayfs-create-dirs.sh {LOWERDIR} {DATA_MOUNT_PO=
INT}
+RemainAfterExit=3Dtrue
+StandardOutput=3Djournal
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta/files/overlayfs-create-dirs.sh b/meta/files/overlayfs-c=
reate-dirs.sh
new file mode 100644
index 0000000000..9f38ad7648
--- /dev/null
+++ b/meta/files/overlayfs-create-dirs.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# This script is intended to be used solely by overlayfs-create-dirs.ser=
vice
+# Usage: overlayfs-create-dirs.sh <LOWERDIR> <DATA_MOUNT_POINT>
+
+lowerdir=3D$1
+datamountpoint=3D$2
+mkdir -p ${datamountpoint}/upper${lowerdir}
+mkdir -p ${datamountpoint}/workdir${lowerdir}
+if [ -d "$lowerdir" ]; then
+    chown $(stat -c "%U:%G" ${lowerdir}) ${datamountpoint}/upper${lowerd=
ir}
+fi
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-un=
it.mount.in
index eb78d2cb4f..9c117f2c52 100644
--- a/meta/files/overlayfs-unit.mount.in
+++ b/meta/files/overlayfs-unit.mount.in
@@ -1,6 +1,7 @@
 [Unit]
 Description=3DOverlayfs mount unit {LOWERDIR}
-RequiresMountsFor=3D{DATA_MOUNT_POINT}
+Requires=3D{CREATE_DIRS_SERVICE}
+After=3D{CREATE_DIRS_SERVICE}
=20
 [Mount]
 What=3Doverlay
diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index 5a5ea03d45..8b88900f71 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -23,6 +23,9 @@ def allOverlaysUnitName(d):
 def mountUnitName(unit):
     return escapeSystemdUnitName(unit) + '.mount'
=20
+def helperUnitName(unit):
+    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
+
 def unitFileList(d):
     fileList =3D []
     overlayMountPoints =3D d.getVarFlags("OVERLAYFS_MOUNT_POINT")
@@ -43,6 +46,7 @@ def unitFileList(d):
             continue
         for path in mountPointList.split():
             fileList.append(mountUnitName(path))
+            fileList.append(helperUnitName(path))
=20
     fileList.append(allOverlaysUnitName(d))
=20
--=20
2.54.0


