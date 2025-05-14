Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0739FC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.110589.1747248811553974163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=J7ZJ0ApO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025051418532908eb881c27d8ffa9c2-wkbkai@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025051418532908eb881c27d8ffa9c2
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Rzni6iaY70dKUayc/tWEL2wUKwWH+EMxTBbyTrVmDTA=;
 b=J7ZJ0ApO2peMs+bFTQJVYwviEG9vAb5upOqryoh8eI0241uuYeFz/IU/F2m1Q8joMx0Lha
 6xXYGPsNLCDRj8He4duxTXeTRgTUhSS/WBl50y4yjwgYjR/zspxaHKws94/iiLfSuJHeFk7n
 tZsls8itNCByjAUvGl9iusRgzl8UEVmUIlXO/fYGfiS00wFacj7qTZz30GbsDv0IgtQpHjfd
 lfvlFe4kMbzyxCST03w45kc62lQgWzsBdnKWJDoB0s/Xhj2atiUSyuqmAq5Oi8xIK2cxk3DI
 7BeGoPPzaS3KBIVkbIRU+58RiXEDJf3rr7CSu4IZGdqqQw9jD5XYwSQQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 04/22] kernel-devicetree: export dtbs to sysroot
Date: Wed, 14 May 2025 20:50:48 +0200
Message-ID: <20250514185225.162998-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216528

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


