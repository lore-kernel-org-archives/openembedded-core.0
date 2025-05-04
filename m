Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EC6C3ABB9
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:06:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.28199.1746364017323825654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=G/+ImoYg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202505041306541a327009ff3ce773a6-rxqvfn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202505041306541a327009ff3ce773a6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Rzni6iaY70dKUayc/tWEL2wUKwWH+EMxTBbyTrVmDTA=;
 b=G/+ImoYgdAvev/cYNQms+UvOSEI/i8scp1WIjGC+e2Fj0miA0zpOcPGl+iSOAmi/Hdac/v
 no4jiG75eNG3je/woCw0E2CQRpEWCdkt8OQwGOEtYp7P2uDny86Cs/80FBuX6imMgP6XykW6
 2sAkBOf2UA6O6PQDKLZ0gFVWkfBumeCKftbCqsca06lrN9OxIoyHXKC4pD0oJVR5oy5dNdmd
 9Aawvt9J6wYZ+ZLgJnwW/KPRrlxVezinGwbm8fg7zbisz3Xi6H0yETGk3gr7VK5B9tEUZQ2o
 EeSoJKBoNxv3YJA5icPrDCbgousitBJTMET/W6sTkG3mP80ZqQN2FwRg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/20] kernel-devicetree: export dtbs to sysroot
Date: Sun,  4 May 2025 15:04:51 +0200
Message-ID: <20250504130507.717954-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215946

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Forward the devicetree blobs via sstate-cached sysroot directory to
other recipes. The intention is to create FIT images independently from
the kernel build folder structure later on.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index eff052b4029..75e394c5826 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -88,6 +88,10 @@ do_install:append() {
 			dtb=$dtb_base_name.$dtb_ext
 		fi
 		install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
+
+		# Provide the DTBs also to other recipes
+		install -d ${D}/sysroot-only
+		install -Dm 0644 $dtb_path ${D}/sysroot-only/$dtb
 	done
 }
 
-- 
2.49.0


