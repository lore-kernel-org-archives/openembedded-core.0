Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43734E9A747
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 09:22:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15585.1774344115160716081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 02:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TxE59dQq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04E2F4E427C5
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 09:21:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE8CB6011D;
	Tue, 24 Mar 2026 09:21:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA4AE10451116;
	Tue, 24 Mar 2026 10:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774344112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EZ9TZzcedmbrW51fskTuOC9zFXCP7eVRMLRQHgQ8Pog=;
	b=TxE59dQqO7zVI5E1Qrk8T9ZPNXAarxIOYtKquERxsbYPWnRnPaOQXDbXicNN0qmXvxiOdz
	jK41WiUUKQEllLeYNfcJnZcuMgpboFiD4NSkxtHrd/Ocsing3wKeFYAt/xgmAIbqdULhhl
	BFxJN9yxYPumB9FeZDJyEuc3iMuE0bLaGS/JHu854l/bBAKlguM0Ro/yDi3FJNne9xc4LS
	e1aBFzSULnH3Ec9ftzs0+LCrjy9iSlAAiTEQ3/01bg3qPxA4pe8cvMNycOGVq5sXVyA9O+
	+8xvBZ68deTh4b5vAEuRGgVR+abC5paoeNvbsL0xR6Rd+rk2jGSBCDiEMqo/9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 10:21:49 +0100
Message-Id: <DHAWHQYPBPQA.6MRY3SGOMM9Z@bootlin.com>
Cc: <richard.purdie@linuxfoundation.org>, <rybczynska@gmail.com>,
 <ross.burton@arm.com>, <peter.marko@siemens.com>, <jpewhacker@gmail.com>,
 <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 1/2] sbom-cve-check: Add class for post-build CVE
 analysis
References: <20260323-add-sbom-cve-check-v7-0-870eb8e145ad@bootlin.com>
 <20260323-add-sbom-cve-check-v7-1-870eb8e145ad@bootlin.com>
In-Reply-To: <20260323-add-sbom-cve-check-v7-1-870eb8e145ad@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 09:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233780

Hi,

Thanks for the new version. I'll suggest a simplification to how the databa=
ses
are unpacked, since I understand this is a costly operation.

This gets rid of the do_install() task, and rsync-native dependency. What t=
his
does is let the BitBake fetcher handle the unpacking/checkout of the databa=
ses
directly in the DEPLOYDIR. This simplifies the recipe and removes one copy
operation, I think.

I've successfully generated the two json output files with this (with the c=
lass
added for the core-image-minimal build).

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-reci=
pe/sbom-cve-check.bbclass
index c51ea45759..a5c23142b7 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -116,8 +116,8 @@ do_sbom_cve_check[sstate-outputdirs] =3D "${DEPLOY_DIR_=
IMAGE}"
 do_sbom_cve_check[depends] +=3D " \
     python3-sbom-cve-check-native:do_populate_sysroot \
     ${@oe.utils.conditional('SBOM_CVE_CHECK_INTERNAL_FETCHER','0',' \
-        sbom-cve-check-update-cvelist-native:do_install \
-        sbom-cve-check-update-nvd-native:do_install \
+        sbom-cve-check-update-cvelist-native:do_unpack \
+        sbom-cve-check-update-nvd-native:do_unpack \
     ','',d)} \
 "

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.=
inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db
.inc
index 5d7a07001c..6a968e941c 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -9,13 +9,12 @@ require sbom-cve-check-config.inc
 SBOM_CVE_CHECK_DB_NAME[doc] =3D "Database name, which is the Git repositor=
y directory name. \
     The git repository will be stored in ${SBOM_CVE_CHECK_DEPLOY_DB_DIR)/"

-DEPENDS +=3D "rsync-native"
-ALLOW_EMPTY:${PN} =3D "1"
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot

-# In the install task, also deploy directly to ${DEPLOY_DIR} using rsync.
-# This is an hack, we are not using do_deploy to prevent multiple unnecess=
ary copy of the CVE database.
-do_install() {
-    dst=3D"${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
-    mkdir -p "$dst"
-    rsync -aH --delete --link-dest=3D"${S}/" "${S}/" "${dst}/"
-}
+UNPACKDIR =3D "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}"
+S =3D "${UNPACKDIR}"
+BB_GIT_DEFAULT_DESTSUFFIX =3D "${SBOM_CVE_CHECK_DB_NAME}"
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd=
-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-up
date-nvd-native.bb
index 46c86952a1..30c7868b2a 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native=
.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native=
.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Updates the NVD CVE database"
 LICENSE =3D "cve-tou"
-LIC_FILES_CHKSUM =3D "file://LICENSES/cve-tou.md;md5=3Dbc5bbf146f01e20ece6=
3d83c8916d8fb"
+LIC_FILES_CHKSUM =3D "file://${SBOM_CVE_CHECK_DB_NAME}/LICENSES/cve-tou.md=
;md5=3Dbc5bbf146f01e20ece63d83c8916d8fb"

 HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=3Dma=
in;protocol=3Dhttps"


Antonin

