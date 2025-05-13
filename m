Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416CBC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:35 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.88511.1747172432227552076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=WlcWXxvR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250513214033561542edf3b03e6fb6-fduajj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250513214033561542edf3b03e6fb6
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Rzni6iaY70dKUayc/tWEL2wUKwWH+EMxTBbyTrVmDTA=;
 b=WlcWXxvRRY3RyUqkjRkXRtViOLqGVb0yjYCCzALhLYrQwu3xKEcjLTYjdEmELQfcQwz4RO
 GDOu+AWfLnfJsZgNZMNpShCbjXjGeehFtC2mKyzkcCiAdRciKVP5wGoec3DNSxAQdc5+WBeU
 Ciq+hNcx1HcUcX1opdZl4esLxqpMFwPIocatIvDxYaRXVBen+gOFeC1Dw3FFNRv7QH0a+Myw
 h6yF11UgxbCBpL6UBqc9WuuVUfL7aPH0TqGNxFWyz6V1L339xAKNmguvtF8ipbm7t7gfPEuR
 zLQ7zrJXwS851vXvJQb17lhju4RAAFoXpfG+YkomKWMnx1Js9/V/xCOQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 06/22] kernel-devicetree: export dtbs to sysroot
Date: Tue, 13 May 2025 23:36:48 +0200
Message-ID: <20250513213834.87830-7-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216454

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


