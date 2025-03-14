Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D51C35FF3
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:30:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2834.1741912215341740037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 17:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tUhc08oG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0TuRs1990307
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 19:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741912196;
	bh=H2JeIVLLzqm3n6ryDJ7W5+ZdhSSUMq0opXlRXeJTtew=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tUhc08oGcudLUPyrsIe6nUrtmLrTkRFv+la2mjo2MunaLhH/txe4DKWNIcPS9j91O
	 4wMxdo7oBoXYheAj549gFUaVFoUPBWpWValMapvnthE40rBBDO9ZRYTWbI6JQGCWF3
	 tz1ortfYyonA9NW/x8j/32UNmVN95NhBY1q7IRBg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0TuIx108699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 19:29:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:29:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:29:56 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0TtB2061940;
	Thu, 13 Mar 2025 19:29:56 -0500
From: <rs@ti.com>
To: <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][RFC 3/3] default-providers: set virtual-emptty-conf
Date: Thu, 13 Mar 2025 19:29:37 -0500
Message-ID: <20250314002937.672768-6-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314002937.672768-1-rs@ti.com>
References: <20250314002937.672768-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212812

From: Randolph Sapp <rs@ti.com>

Set a soft default for virtual-emptty-conf to weston-init when
IMAGE_FEATURES contains weston, since weston RRECOMMENDS weston-init and
most builds pull it in by default. Silences warning about multiple
providers for virtual-emptty-conf.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d3eefb754b..925e03f13c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -63,3 +63,4 @@ PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
 
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
+PREFERRED_RPROVIDER_virtual-emptty-conf ?= "${@bb.utils.contains('IMAGE_FEATURES','weston','weston-init','emptty-conf',d)}"
-- 
2.48.1


