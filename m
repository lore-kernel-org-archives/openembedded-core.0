Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222C5C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:36:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.14212.1750664170921003534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=SBl55y8c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20250623073608e623f4d465327eab81-zxzeru@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250623073608e623f4d465327eab81
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Jun 2025 09:36:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hdP7cr0q+Lfq29XP8RawuNHqDtAGvFol/TaqUg7apXk=;
 b=SBl55y8ckaoOWC9fNO71XzLfdp6COm01sWyc2VrvJboTm2qygv1EtCmOuneki2YQpnKcl7
 Kp5M1aApgTdirfiyxgJW4Rp73Rrp7AW8Ti4QwaLTNA/DKrw0cSwt2YitGxgqldB88/LO2Gil
 Y0Zg9ii/mPd6RHQZWdjwiYqlVdqyoGVEYz1HG625OR6XuGzJ7o23IIC83xflTYW96bBSia2U
 aZrI3kP26M1zeQxzG1FjDcbMsMmormCxHlgu11BgA2PenXB+rkgvaTYCJHDXSOxXM+MnkfTX
 SjOudNjBpZTFblUe+dqbfTjTs7VajIg3xZ73iVpGiYCDWEPtgkDNCKLQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.babic@swupdate.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] libubootenv: do not drop debug symbols
Date: Mon, 23 Jun 2025 09:35:07 +0200
Message-ID: <20250623073553.844037-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219199

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Usually the debug symbols are split into a libubootenv-dbg package.
Dropping them already at compile time is not needed and causes problems
when debugging libubootenv.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
index a193872b83b..4da9c44c921 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
@@ -15,8 +15,6 @@ SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"
 
 inherit cmake lib_package
 
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
-
 DEPENDS = "zlib libyaml"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES:${PN}-bin += "u-boot-fw-utils"
-- 
2.49.0


