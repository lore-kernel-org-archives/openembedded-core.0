Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC046CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:40:38 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156147.1781620835592526761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 07:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=kZphybbi;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=kZphybbi;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781620826;
	bh=CtXyxuxhYiAE3FwXSbDxn4ixyORaUkVLk0oOfl5ycYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZphybbijVf+O7Y0d6ItlDK90WDeHI5r4+Qm8eu231UUzxdSDOVQ0obsM7F9mgq7s
	 MsdG1jhYE2y6mNoLnnCuAPE3v8fQu7BukuaxjKK0KiYiyQ1AGMJpPonOp8/3v/gqwc
	 X5wA3AqcB76OzvrPFCEzhSe9doPoTW1Y7sQDB7V0zYXmMPOLhV1Wph3yDzz7UwGvYn
	 /mj3PsNGZb9Yp1BV4Oi8UcxoDQ1LI7E121BdrfU7yM2rFVQdsicDUmY4T4E7Kybk5m
	 J9wWfNBYWc3A6840H8+9ab6ZI9NqD5pj5lfAWDG+900ATzSXyzcrH5POIp6951J0aO
	 c0FH0VfD75IJg==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 5ABC45FA60
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781620826;
	bh=CtXyxuxhYiAE3FwXSbDxn4ixyORaUkVLk0oOfl5ycYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZphybbijVf+O7Y0d6ItlDK90WDeHI5r4+Qm8eu231UUzxdSDOVQ0obsM7F9mgq7s
	 MsdG1jhYE2y6mNoLnnCuAPE3v8fQu7BukuaxjKK0KiYiyQ1AGMJpPonOp8/3v/gqwc
	 X5wA3AqcB76OzvrPFCEzhSe9doPoTW1Y7sQDB7V0zYXmMPOLhV1Wph3yDzz7UwGvYn
	 /mj3PsNGZb9Yp1BV4Oi8UcxoDQ1LI7E121BdrfU7yM2rFVQdsicDUmY4T4E7Kybk5m
	 J9wWfNBYWc3A6840H8+9ab6ZI9NqD5pj5lfAWDG+900ATzSXyzcrH5POIp6951J0aO
	 c0FH0VfD75IJg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 455E55F9B8
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:40:26 +0200 (CEST)
From: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
Subject: [PATCH 2/3] overlayfs: optionally inherit ownership of lower layer
Date: Tue, 16 Jun 2026 16:40:18 +0200
Message-ID: <20260616144043.3303124-2-andreas.muetzel@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
References: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 14:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238906

When the upperdir of an overlayfs does not exist at mount time, systemd
since v256 automatically creates it with default permissions and
ownership (0755, root:root).

This ownership is often sufficient, so the overhead of using a helper
unit to create the upper layer and apply the permissions of the lower
layer before starting the overlayfs mount unit is not always necessary.

Introduce the variable OVERLAYFS_INHERIT_LOWER_PERMISSIONS that can be
used to control the creation of the helper unit. If set to "1", it will
get created. Otherwise, systemd will create the directories and apply
its defaults.

Signed-off-by: Andreas M=C3=BCtzel <andreas.muetzel@emlix.com>
---
 meta/classes-recipe/overlayfs.bbclass         | 42 +++++++++++++++----
 .../files/overlayfs-unit-create-dirs.mount.in | 13 ++++++
 meta/files/overlayfs-unit.mount.in            |  3 +-
 meta/lib/oe/overlayfs.py                      |  3 +-
 4 files changed, 49 insertions(+), 12 deletions(-)
 create mode 100644 meta/files/overlayfs-unit-create-dirs.mount.in

diff --git a/meta/classes-recipe/overlayfs.bbclass b/meta/classes-recipe/=
overlayfs.bbclass
index a82763ec10..8a87624be3 100644
--- a/meta/classes-recipe/overlayfs.bbclass
+++ b/meta/classes-recipe/overlayfs.bbclass
@@ -48,6 +48,21 @@
 # started after the ${PN}-overlays.service to make sure that all overlay=
s are
 # mounted beforehand.
 #
+# If the storage directories (upperdir and workdir) of the overlayfs do =
not
+# exist when systemd mounts the overlayfs, systemd will create them with
+# default permissions (mode 0755, owned by root:root).
+# These permissions may be different from the actual permissions of the =
lower layer;
+# in some cases, it is desirable to create the upper layer with the same=
 owner and mode
+# of the lower layer.
+# To make the directory permissions of the upper directory match those o=
f the lower
+# directory, set OVERLAYFS_INHERIT_LOWER_PERMISSIONS to 1 for the respec=
tive overlay:
+#
+#   OVERLAYFS_WRITABLE_PATHS[data] =3D "/usr/share/my-custom-application=
"
+#   OVERLAYFS_INHERIT_LOWER_PERMISSIONS[data] =3D 1
+#
+# This will result in an additional helper unit that creates the upper a=
nd work
+# directories and applies the correct permissions before the overlayfs i=
s mounted.
+#
 # Note: the class does not support /etc directory itself, because system=
d depends on it
 # For /etc directory use overlayfs-etc class
=20
@@ -57,6 +72,7 @@ inherit systemd features_check
=20
 OVERLAYFS_CREATE_DIRS_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-c=
reate-dirs.service.in"
 OVERLAYFS_MOUNT_UNIT_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-un=
it.mount.in"
+OVERLAYFS_MOUNT_UNIT_TEMPLATE_WITH_CREATE_DIRS ??=3D "${COREBASE}/meta/f=
iles/overlayfs-unit-create-dirs.mount.in"
 OVERLAYFS_ALL_OVERLAYS_TEMPLATE ??=3D "${COREBASE}/meta/files/overlayfs-=
all-overlays.service.in"
=20
 python do_create_overlayfs_units() {
@@ -66,10 +82,12 @@ python do_create_overlayfs_units() {
         CreateDirsUnitTemplate =3D f.read()
     with open(d.getVar("OVERLAYFS_MOUNT_UNIT_TEMPLATE"), "r") as f:
         MountUnitTemplate =3D f.read()
+    with open(d.getVar("OVERLAYFS_MOUNT_UNIT_TEMPLATE_WITH_CREATE_DIRS")=
, "r") as f:
+        MountUnitWithHelperTemplate =3D f.read()
     with open(d.getVar("OVERLAYFS_ALL_OVERLAYS_TEMPLATE"), "r") as f:
         AllOverlaysTemplate =3D f.read()
=20
-    def prepareUnits(data, lower):
+    def prepareUnits(data, lower, use_helper):
         from oe.overlayfs import helperUnitName
=20
         args =3D {
@@ -79,13 +97,18 @@ python do_create_overlayfs_units() {
             'LOWERDIR': lower,
         }
=20
-        bb.debug(1, "Generate systemd unit %s" % mountUnitName(lower))
-        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)=
), 'w') as f:
-            f.write(MountUnitTemplate.format(**args))
+        if use_helper:
+            bb.debug(1, "Generate systemd unit %s" % mountUnitName(lower=
))
+            with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lo=
wer)), 'w') as f:
+                f.write(MountUnitWithHelperTemplate.format(**args))
=20
-        bb.debug(1, "Generate helper systemd unit %s" % helperUnitName(l=
ower))
-        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower=
)), 'w') as f:
-            f.write(CreateDirsUnitTemplate.format(**args))
+            bb.debug(1, "Generate helper systemd unit %s" % helperUnitNa=
me(lower))
+            with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(l=
ower)), 'w') as f:
+                f.write(CreateDirsUnitTemplate.format(**args))
+        else:
+            bb.debug(1, "Generate basic systemd unit %s" % mountUnitName=
(lower))
+            with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lo=
wer)), 'w') as f:
+                f.write(MountUnitTemplate.format(**args))
=20
     def prepareGlobalUnit(dependentUnits):
         from oe.overlayfs import allOverlaysUnitName
@@ -109,7 +132,8 @@ python do_create_overlayfs_units() {
         for lower in lowerList.split():
             bb.debug(1, "Prepare mount unit for %s with data mount point=
 %s" %
                      (lower, d.getVarFlag('OVERLAYFS_MOUNT_POINT', mount=
Point)))
-            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoin=
t), lower)
+            use_helper =3D d.getVarFlag('OVERLAYFS_INHERIT_LOWER_PERMISS=
IONS', mountPoint) =3D=3D '1'
+            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoin=
t), lower, use_helper)
             mountUnitList.append(mountUnitName(lower))
=20
     # set up one unit, which depends on all mount units, so users can se=
t
@@ -138,5 +162,5 @@ do_install:append() {
     done
 }
=20
-do_create_overlayfs_units[vardeps] +=3D "OVERLAYFS_WRITABLE_PATHS"
+do_create_overlayfs_units[vardeps] +=3D "OVERLAYFS_WRITABLE_PATHS OVERLA=
YFS_INHERIT_LOWER_PERMISSIONS"
 addtask create_overlayfs_units before do_install
diff --git a/meta/files/overlayfs-unit-create-dirs.mount.in b/meta/files/=
overlayfs-unit-create-dirs.mount.in
new file mode 100644
index 0000000000..9c117f2c52
--- /dev/null
+++ b/meta/files/overlayfs-unit-create-dirs.mount.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DOverlayfs mount unit {LOWERDIR}
+Requires=3D{CREATE_DIRS_SERVICE}
+After=3D{CREATE_DIRS_SERVICE}
+
+[Mount]
+What=3Doverlay
+Where=3D{LOWERDIR}
+Type=3Doverlay
+Options=3Dlowerdir=3D{LOWERDIR},upperdir=3D{DATA_MOUNT_POINT}/upper{LOWE=
RDIR},workdir=3D{DATA_MOUNT_POINT}/workdir{LOWERDIR}
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-un=
it.mount.in
index 9c117f2c52..eb78d2cb4f 100644
--- a/meta/files/overlayfs-unit.mount.in
+++ b/meta/files/overlayfs-unit.mount.in
@@ -1,7 +1,6 @@
 [Unit]
 Description=3DOverlayfs mount unit {LOWERDIR}
-Requires=3D{CREATE_DIRS_SERVICE}
-After=3D{CREATE_DIRS_SERVICE}
+RequiresMountsFor=3D{DATA_MOUNT_POINT}
=20
 [Mount]
 What=3Doverlay
diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index 8b88900f71..c26fae07bd 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -46,7 +46,8 @@ def unitFileList(d):
             continue
         for path in mountPointList.split():
             fileList.append(mountUnitName(path))
-            fileList.append(helperUnitName(path))
+            if d.getVarFlag('OVERLAYFS_INHERIT_LOWER_PERMISSIONS', mount=
Point) =3D=3D '1':
+                fileList.append(helperUnitName(path))
=20
     fileList.append(allOverlaysUnitName(d))
=20
--=20
2.54.0


