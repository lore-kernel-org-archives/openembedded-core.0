Return-Path: <maanyagoenka@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A532CC47DB3
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 02:58:18 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7106.1706756290895023428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 18:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=AmnDim2b;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: maanyagoenka@linux.microsoft.com)
Received: from maanya-vm-20.i32zew0cey2u1cyshmh12embkc.xx.internal.cloudapp.net (unknown [20.115.210.253])
	by linux.microsoft.com (Postfix) with ESMTPSA id 67BEC20B2000;
	Wed, 31 Jan 2024 18:58:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 67BEC20B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1706756290;
	bh=ec7J+gS+o0iPI7M323Il4Ubn9H2vmPrQj5zzgVyyQ6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AmnDim2bbLkyLPCDfUjSNVpksot0DgDvLkbe+EvkwuFALpZUJ7RLH/NT2Loj2dViZ
	 iI2O01SsjnlXVabkt9TvxmRlv6d+rOXmqHNMCHDTE8A/Vi9ZWOpKa7Pn8ywaWNE6SC
	 o9hd4HQuDwhmLJNhQodllotvnv13Qi6iKgWalEtA=
From: Maanya Goenka <maanyagoenka@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: alhe@linux.microsoft.com,
	Maanya Goenka <maanyagoenka@microsoft.com>
Subject: [PATCH] usrmerge: add the distro feature to nativesdk builds when added to target and enable symlink creation for both
Date: Thu,  1 Feb 2024 02:56:22 +0000
Message-Id: <20240201025621.1632547-2-maanyagoenka@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
References: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 02:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194548

From: Maanya Goenka <maanyagoenka@microsoft.com>

Add usrmerge to DISTRO_FEATURES_FILTER_NATIVESDK (and DISTRO_FEATURES_FIL=
TER_NATIVE for consistency),
since we have come across cases where the distro feature would be require=
d by both contexts.
As a supplement to this change, when creating the merged usr symlinks at =
the do_populate_sdk stage,
these need to be created for both the target and native sysroots within t=
he SDK.

Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
Signed-off-by : Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/classes-recipe/image.bbclass | 2 ++
 meta/conf/bitbake.conf            | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
index 7231fad940..df59133f77 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -653,8 +653,10 @@ create_merged_usr_symlinks_rootfs() {
     create_merged_usr_symlinks ${IMAGE_ROOTFS}
 }
=20
+# Create the usrmerge symlink for the host in addition to the target bui=
ld
 create_merged_usr_symlinks_sdk() {
     create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
+    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKPATHNATIVE}
 }
=20
 ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f180d18b0..ff9f7ab407 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -920,8 +920,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl =
wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod open=
gl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl =
usrmerge wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod open=
gl usrmerge wayland"
=20
 DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-=
data ldconfig"
 MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
--=20
2.25.1


