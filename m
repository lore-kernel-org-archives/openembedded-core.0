Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F854C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 23:03:28 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.64])
 by mx.groups.io with SMTP id smtpd.web11.31808.1670281404590969448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 15:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=mHnwAaTF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.64, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHH853kUTLrWYv8nJPVQgeAwVnEwzdqQ3Ap5zgDNWzW3rV+WioAmMISCQMdIBR+gO4q6EK3XBXrYruV62m/eIqbdxM9Vbi3zkkkdZGQ+SP5iM5uPndi2kg4eYePnB0hl4ivTftQ2vQM8eWZVq7uGuIdAcJA7A6/mX3/UxFROuukzYr7s4vHkcMRIFakF80LZr4oFWvcnGNg5fBecien+5AiT29HxNtT1Tj4TlIAeWbmJIy2x5UthpaulEsiCK73Jh2jFjMe4NNuAQ2MGpSzyJIuJv6yynrNoOHKF8mrjyCj5wdgzlb+3Uszpu5lx7/f6P9Vux7Ful3zxIONtpBCRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zPloJ7VIUbV+f8MLBVUNbJMqUNFJ9qLkJhWpWiG8E8=;
 b=it8sxbft6gGhLNnFsUPfJlWkQKvdf8YjumURBDeRNxR6MiZFiXECJWEsJcCO+L0pZDNV609otWs6kkN9f4+Xjky388N7T9QDiPWVLU+WoRiHkfbMnfOQOkhnKqEG6P3KYe2VpEUAtQ+2jALgmu9KMnhbdbACf8EGf6sdc3k7nuhGK8l57TWUuE+Zr7jHim3tB8N9TL4rWHP/pn9/Nt5D+jb1pJmbFgGLtH7pctu7udCYoYXbyiQ7j4oFETx/LtlwRuywuIZuYq20Kyc5MIU33KgAmxfNJ81oBQ3SF2I4yxrFqO44BzG12+0UnCcHC1I8yDCOeuVjAPDz/mxy+HH6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zPloJ7VIUbV+f8MLBVUNbJMqUNFJ9qLkJhWpWiG8E8=;
 b=mHnwAaTFOFMpIXspYhbvv2yryctbkoWQWsF0eNtpvI74o4fsgExxAewJTeNMh8tTXMHpnYXlCj6ngrZkLokPr0XvaQNUAj2HwY/FTyMTHQAAJpPv0nil3hGEnZB4c2BQ64P8al3TFIBsLgOB7DkTnTVjsXqfEwKVT78LfKkNWZQ=
Received: from BN0PR04CA0142.namprd04.prod.outlook.com (2603:10b6:408:ed::27)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 23:03:22 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::e5) by BN0PR04CA0142.outlook.office365.com
 (2603:10b6:408:ed::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 23:03:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 23:03:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 17:03:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 15:03:21 -0800
Received: from xcoapps66.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Dec 2022 17:03:20 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mark.hatle@kernel.crashing.org>, <sandeepg.gundlupet-raju@amd.com>,
	Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Subject: [OE-core][langdale][master][PATCH] libdrm: Remove libdrm-kms package
Date: Mon, 5 Dec 2022 16:03:18 -0700
Message-ID: <20221205230318.30633-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT070:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f839b8-ce01-462d-0ca1-08dad714e80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Skhwnkb4ZWf9nmfWlap6vFOxq3W4TsEo7ubPhYh9ZeRVEsYhf4RipQtM7D4ZOKnIQuxGeY6KUISDthyxPN+yvVXWwYX5yDknh+ruWHbSU16c64Nqi3p+N+Ctup1+Himm6wBeK7RBbVyiQZG36Y9yRswAm0hRqgBdOhl7SKOQG0LKzKYoN8FB+irYQmlFsq+kAw5T4AyP+B0/WVnARhK/zFlxR8A1mEKYKJr9s9Gy4ge6kXb0gzLXCHtiPjQUGWXGEyLWbNj7ab6qjMZHLEaMDrSOffOO4KuYmGRdjwojB4SvpVDa/G2ms63aTScyDCDojRoHsUzxP4DUyH423gDvgLuVib8W49Q5Lgsief/srqvO36eLZGe3rdvoEsgL/iplPL+UWVzFwHyKur6Ifr4am5EZ2ZcqG73TJm3Xu3CNU1IVNifOvGPqZQAlSxpP9cA30rI2pYOyCKJIzwVizLsExE+dWgmmAyifUjQzWAUwt28rV6+rL5kUo4cnA8qxMWPTOZMOVHqyT9BPVgL27C8WW0Bb14/JdJZQx24QUt32cUNZYQ/pnWBE7F9Pr7DB4W9xvCQzO5tB1AzR9f/qOQgD4r9sVwSJV9t1bJJlaX77Dqyqb4mNk2vUsTkj985qiAOl5AkmbJUKbXelxEVqvFdkwXktXttq76hq9cUxYCDvzKASarpvLWBM7ZHmIEpXbfRJbsEBccQayM5/cjwoP+SRJKt70Khm38IjHBfjblSlSg=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(26005)(81166007)(316002)(478600001)(6916009)(54906003)(70206006)(8676002)(4326008)(70586007)(5660300002)(8936002)(36860700001)(336012)(83380400001)(186003)(2906002)(1076003)(47076005)(426003)(41300700001)(40460700003)(2616005)(356005)(36756003)(82740400003)(82310400005)(40480700001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 23:03:21.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f839b8-ce01-462d-0ca1-08dad714e80e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 23:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174310

libkms library is deprecated in 2.4.111 version. Hence remove
libdrm-kms package.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.113.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.113.bb b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
index 959ef68032..613d3430ce 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.113.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG[manpages] = "-Dman-pages=enabled,-Dman-pages=disabled,libxslt-nati
 
 ALLOW_EMPTY:${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}-amdgpu \
+             ${PN}-intel ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu \
              ${PN}-etnaviv"
 
 RRECOMMENDS:${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
@@ -52,7 +52,6 @@ FILES:${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
 FILES:${PN}-omap = "${libdir}/libdrm_omap.so.*"
 FILES:${PN}-intel = "${libdir}/libdrm_intel.so.*"
 FILES:${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
-FILES:${PN}-kms = "${libdir}/libkms*.so.*"
 FILES:${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
 FILES:${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.* ${datadir}/${PN}/amdgpu.ids"
 FILES:${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
-- 
2.17.1


