Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C372C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 07:49:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6931.1652168954880719927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 00:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=l0gPMo96;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-092-072-083-181.092.072.pools.vodafone-ip.de
 [92.72.83.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 13697841A5;
	Tue, 10 May 2022 09:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1652168952;
	bh=7V0ypDf+nRReMlUxP/K0a9Git6FllsC3IDHLGhbBcQE=;
	h=From:To:Cc:Subject:Date:From;
	b=l0gPMo96iue14C8ylGZW1raXyOwxFaufohBuxh3YYVnulTdMs3RtYThnFj+JMIpoT
	 TAIOC2ldCwegtvgUDR1ib3gmrq5YFJ4I0G6z7vpDuguQaYCF8ZzAFVgUbx/lZI4mo1
	 zQZX28DfBj6S/LHlNnMaj+XTE2M54R1YhZ4KrMg6tK/Vpql3lhsl8TxTIaFRkJs7oS
	 ioCmK8tNIxWdcAiXbwYAz7jtENfUJJ34Z+oWwfs3rvx5kLlIqG99EVNDn8SDN9+HxQ
	 nuoAFg8gjteu/TQTBylXip5zOS51z3sQ4JpKJq4U1F+cgBCCP8MBZuOhDh5ILtqDWy
	 Is/nDk/rnVebQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH] overlayfs: add docs about skipping QA check & service
 dependencies
Date: Tue, 10 May 2022 09:48:51 +0200
Message-Id: <20220510074851.7725-1-ch@denx.de>
X-Mailer: git-send-email 2.33.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 07:49:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165411

Add some documentation about skipping the QA check related to missing
fstab entries or mount units for base mount points where the overlayfs
is mounted from.

Also add a short paragraph about adding a systemd unit dependency to
services in recipes, so that they are started only after the overlayfs
is mounted and ready.

No functional change.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/classes/overlayfs.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbcl=
ass
index 29fced2ca7..f7069edd41 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -16,10 +16,18 @@
 #
 #   OVERLAYFS_MOUNT_POINT[data] ?=3D "/data"
 #
-# The class assumes you have a data.mount systemd unit defined in your
-# systemd-machine-units recipe and installed to the image.
+# Per default the class assumes you have a corresponding fstab entry or =
systemd
+# mount unit (data.mount in this case) for this mount point installed on=
 the
+# image, for instance via a wks script or the systemd-machine-units reci=
pe.
 #
-# Then you can specify writable directories on a recipe base
+# If the mount point is handled somewhere else, e.g. custom boot or prei=
nit
+# scripts or in a initramfs, then this QA check can be skipped by adding
+# mount-configured to the related OVERLAYFS_QA_SKIP flag:
+#
+#   OVERLAYFS_QA_SKIP[data] =3D "mount-configured"
+#
+# To use the overlayfs, you just have to specify writable directories in=
side
+# their recipe:
 #
 #   OVERLAYFS_WRITABLE_PATHS[data] =3D "/usr/share/my-custom-application=
"
 #
@@ -30,6 +38,10 @@
 #   OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D "/mnt/overlay"
 #   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] =3D "/usr/share/another-applic=
ation"
 #
+# If your recipe deploys a systemd service, then it should require and b=
e
+# started after the ${PN}-overlays.service to make sure that all overlay=
s are
+# mounted beforehand.
+#
 # Note: the class does not support /etc directory itself, because system=
d depends on it
 # For /etc directory use overlayfs-etc class
=20
--=20
2.33.3


