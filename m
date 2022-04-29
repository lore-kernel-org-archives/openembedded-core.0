Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBF5C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 08:17:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.7775.1651220267099832210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 01:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=IAqqcqy/;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-084-057-071-010.084.057.pools.vodafone-ip.de
 [84.57.71.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 07A3B839CC;
	Fri, 29 Apr 2022 10:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1651220264;
	bh=63x6J3VgjWzRgEFXCMGENZBCaDQpq7NWS2i+GfftzXE=;
	h=From:To:Cc:Subject:Date:From;
	b=IAqqcqy/i5HUXEcIjB517mWLCBdDLJun+Hv0+EDly91RFQWmhlsV+bLYFlb1xe0YS
	 /TfwjfoG9StNVZT/933t1lS8S6k+qCAWo0yjoCR4G6YE0V4GdDZELA/SpzCjzki7gv
	 S0w6aLLM26lnj6gqHA3g2AdB+8UG6kQECkGrK0JmnQ3SP/g4ySdPh4vOvoQ8A22htc
	 xenOoRBfFbH5H4IJuAfrIobVFlgSMb9drJM+7ws2Cd5TfdZWyGKENDof3vXm9v82UC
	 TRkxI0kc2OmGlRDS8kU4JmcUD9RM0NcOX/YOtbZFZCzu29BQ2JLYhQr6RPUW4+zzDg
	 tSB2Mmj+bXbyw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v2] classes: rootfs-postcommands: add skip option to
 overlayfs_qa_check
Date: Fri, 29 Apr 2022 10:17:33 +0200
Message-Id: <20220429081733.225481-1-ch@denx.de>
X-Mailer: git-send-email 2.33.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 08:17:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165001

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

Signed-off-by: Claudius Heine <ch@denx.de>
---

Sorry, I was a bit to quick when sending the last patch and forgot to
amend a typo fix before sending.

Difference between v2:
 - `getVarFag` -> `getVarFlag`

---
 meta/classes/rootfs-postcommands.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

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
--=20
2.33.3


