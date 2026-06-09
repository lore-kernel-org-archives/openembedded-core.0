Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71355CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 11:48:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77970.1781005719255156893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 04:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JfLpBBvN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026060911483597104adab00002072d-luomlp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026060911483597104adab00002072d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 09 Jun 2026 13:48:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OpQDWDCY3aI94QmnYayo9224ZnHDU4gJbpRZtXMXWwk=;
 b=JfLpBBvNHxDw+q+dDQnphS1xPn+EqXuc27j9OEUHA/tO88vJn6eWKa0Yp4JHxiEFtPbqNP
 v6Izq/y1dM8SgzhT1Bve6TiEAZq5jp390lLXmzCFdpkYZjAP8/yLbUz3DGtgf9GMvBoqnJsr
 e5OrPP+9wBE6nkFu1PHR9JBzwpPNUQElJ98TlDa4TVkUzO8ge/bsicK56OooFishC+7NjOpm
 8g4ZidUpLptw4uHXbiu8tZ8RlrIwYP8Flq8P1hvqvuUBx2v8N5AbcMrGOXg4XC0Q4zjn4Dhp
 QSe6LPvg3tpkTB6PlSdH1XE9ycChNRqWY1DbvE6co6Cea7JocDAuJ1jw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [RFC PATCH] create-spdx-image-3.0: create image sbom recursively
Date: Tue,  9 Jun 2026 13:48:14 +0200
Message-ID: <20260609114814.197318-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 11:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238291

From: Peter Marko <peter.marko@siemens.com>

Including image in another image is being done by depending on
do_image_complete. This however does not include SPDX SBOM.
We should not need second bitbake execution to create it.

Recursively add do_create_image_sbom_spdx to do_build to resolve it.

Use-case are e.g. fitimage or multiconfig containers.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e2..4d6a6424fe 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -78,6 +78,7 @@ do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
 do_create_image_sbom_spdx[cleandirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[recrdeptask] += "do_create_recipe_spdx do_create_spdx do_create_package_spdx"
 do_create_image_sbom_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
+do_build[recrdeptask] += "do_create_image_sbom_spdx"
 
 python do_create_image_sbom_spdx_setscene() {
     sstate_setscene(d)

