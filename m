Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299ECC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:36:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.14211.1750664170711572851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=wy2W9GJn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20250623073607b017d210a9cdc6f804-fhsjtr@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250623073607b017d210a9cdc6f804
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Jun 2025 09:36:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=d3jdaEI/02MdkhlqjPu69fUuxzf3AaZPdvwYd/sRb3M=;
 b=wy2W9GJnbHxETxJIwd43/5/jXPg3h4FpAsfq9+Q98nsm7mwIcAlnRnHIezeszplMt2ABqZ
 bydnSF5OK2glxSZUFap+AnzjrBl4RNOuSU85zmhGGMWxA+NlbjHLpkIF+HgCf442TqkWpDRO
 4rKz/06LDmpUN5FmdyAFrP4fKb9yPSBmUYUYbh1myf0R48ehWlph7yktD+lG69TxN4w4Yz5o
 pwoCWJpYuoPeb+LXbkmLoav2PnlmQp5AIEBqqsq2IIPacUlSR9kcqW81/q0r1gm9NrSQjSfN
 EcxP7zPfcMZkxpz4q6SgXjI1Hdv0/FTXmRbzX7pg6AR2FkLvx5aYasow==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.babic@swupdate.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] libubootenv: add rrecommends from libubootenv to u-boot-env
Date: Mon, 23 Jun 2025 09:35:06 +0200
Message-ID: <20250623073553.844037-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250623073553.844037-1-adrian.freihofer@siemens.com>
References: <20250623073553.844037-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 07:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219198

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Without /etc/fw_env.config, the fw_printenv and fw_setenv utilities fail
with an error, as they cannot locate the U-Boot environment.
This limitation also affects any application linking against
libubootenv. To address this, add an RRECOMMENDS from libubootenv to the
u-boot-env package, which provides the necessary configuration files.

While this could be an RDEPENDS, using RRECOMMENDS allows users with
custom implementations to more easily override the dependency if needed.

Some examples suggest bbappending fw_env.config directly to the
libubootenv recipe. However, /etc/fw_env.config is machine-specific,
whereas libubootenv is not. Additionally, the default U-Boot
environment, which can be used by libubootenv, is also provided by the
machine-specific u-boot-env package. Therefore, it is preferable to
provide fw_env.config via the machine-specific u-boot recipe.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
index 35678e2361f..a193872b83b 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
@@ -21,4 +21,8 @@ DEPENDS = "zlib libyaml"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES:${PN}-bin += "u-boot-fw-utils"
 
+# libubootenv needs /etc/fw_env.config and /etc/u-boot-initial-env configuration
+# files which are usually provided by the MACHINE specific u-boot-env package
+RRECOMMENDS:${PN} += "u-boot-env"
+
 BBCLASSEXTEND = "native"
-- 
2.49.0


