Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684EDC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 07:12:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3190.1783494713185760434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 00:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RJ/emnfJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 790F6C8F445;
	Wed,  8 Jul 2026 07:12:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8267C60337;
	Wed,  8 Jul 2026 07:11:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D72511BC31C9;
	Wed,  8 Jul 2026 09:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783494709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RyeR8CnyivoYTMnWR/qveIBWrWOFiY8tbzoP38EiKO0=;
	b=RJ/emnfJtZTnovvq8zS0JdtU5+huHz4lC2T2kYf8ETVONe1Z8ETlgWhMUoMIoc+B3O9RjO
	4YWpGG9IgqL0ennn2OvOjtEtbk81a3WbfG1RdQBKig3SCxS/eb56oCI6AgGgreZdonNojt
	z7rwBJ+eLnDIfJsmHJKa5Ak62KErJmYd+uwH4RxQSeM/d6rMKc6GMx1Bd3YNlZV+8vkVLU
	twijMTEaEp7ceKtS5AFAoL3BgxM8+WJyYEEOB4BD0Kqgba6Htr6L0nMNVbgdaKPDLrSoMF
	bAYY05BTEFJK48i3XOKhrF8SriZuveDFP10UqVgaDD9vCd1iYKhtv/p8oPhagQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 08 Jul 2026 09:11:45 +0200
Subject: [scarthgap][PATCH] create-spdx-image-3.0: correct
 SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-fix-sstate-create-spdx-image-scarthgap-v1-1-8f605c913801@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NwQqDMBBEf0X23IVUSmL7K+JhjRvdQm3IpkUQ/
 71RoafhwbyZFZSTsMKjWiHxV1Tec4HrpQI/0TwyylAYalNb40yDQRZUzZQZfeI9NA4LyotKVz2
 lPI0U0d5dsCbcqG8clLGYuJjHUdudrJ/+yT7v6+1f7GDbflSGbk+VAAAA
X-Change-ID: 20260708-fix-sstate-create-spdx-image-scarthgap-697f60f4ab87
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, thomas.petazzoni@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, pascal.eberhard@se.com, 
 wahid.essid@se.com, Eric Meyers <eric.meyers@arthrex.com>, 
 Joshua Watt <JPEWhacker@gmail.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Eric Meyers <eric.meyers15310@gmail.com>, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240440

From: Eric Meyers <eric.meyers15310@gmail.com>

The override was "task-create-image-sbom" but BitBake derives it as
"task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
SBOM in sstate, letting a stale spdx.json be restored via setscene. A
later do_sbom_cve_check would compute the current IMAGE_NAME and fail with
"No such file or directory" on the missing timestamped SBOM. Correct the
key so the image SBOM is always regenerated, never restored from sstate.

(cherry picked from commit 45302ff5cfaf91ece74d4065acf710507f27da15)

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Backport this fix to scarthgap.
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/nospdx.bbclass                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index e0f1766bb766..c516e9545653 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
 }
 addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
-SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
+SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index b20e28218be9..913b213a6543 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
-deltask do_create_image_sbom
+deltask do_create_image_sbom_spdx

---
base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
change-id: 20260708-fix-sstate-create-spdx-image-scarthgap-697f60f4ab87

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


