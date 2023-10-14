Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6571C41513
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 00:28:44 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.123])
 by mx.groups.io with SMTP id smtpd.web10.54245.1697243322914579180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 17:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=kaLmrCku;
 spf=pass (domain: ni.com, ip: 40.107.92.123, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtfMCGGXcwmyl7YOjd5IBDTMpGa4UuES17mHk4zDd9Yif0bLM8H18Dd9aC8nc55O3LacvIFgSIH1cWnG9qPdHRpSE1eSH28WlJ9SsvufHRkd1FFOGH3hMkqveVnmclycQNcW3DMlW+OWRw0AO6M+onx416ZkZGVqdTsRbGFjPrKkU0y46LvUaf77u0jVLJ9ofRHFBu1tcDNgXbzMCqtvHEtca+oeNmbV4j/OncnZbSupCQc0ERIgojgz2IJtkKusq2Ri36LqUKnNM4RnYnH0A6MooW4EjWd/aX8VdkQF0Gq5shTT5j0v3n1tnKv1avEBitVqLFm3eZtyeL1EO/D99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J537On8dKRBEMbeG8qExsAGJb4F+a+LKXB219Zv7Jj4=;
 b=mLXToNL3a6DWcCFWV2a9PDbnNlXx0tBumOMmKJnggz9VLFeev06dlp+v8PTtlo1zZ3nLReitqUj7VM8yPlwEImWMhe4h7NF9qoItnmXl4/jGrfMxHy4O+nywpv4bhg5o/WFnplrM7tItCcGvggYemMQBfo3uQ2LREfz0mMie+UNPYAZoqF/9v6ZTfnuYrUzTlP0VEHl+lKM+Buuk66MoVTldYGf1XEf6nOk9PAK0wT8xMNGzxIBALr3ONU4Tx8yycvawsz3zNOtWmESt+li8pbSpHbeLP7u9F1cXFsp3h0d+dCxWgatJNblk5AKylIQdDSZXsX7UNAaJ35LPk30fnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J537On8dKRBEMbeG8qExsAGJb4F+a+LKXB219Zv7Jj4=;
 b=kaLmrCkuo0rmH3bbOkxH9uf2djqdnb/3NYCdV5IjxPNV0dxlLLNrHFr7cJJpEnS0pZn/tqPF8dGSHjFV84PrJ9Nc4FjjPuqALvx1Mf6Hh9BUpMAMRlm9Y1ZI1bj18yXSui+v7NimC0MiLf0Hl++ZWq+2Y2WuRafNBJiS2MrmzzY=
Received: from MN2PR10CA0031.namprd10.prod.outlook.com (2603:10b6:208:120::44)
 by SJ2PR04MB8846.namprd04.prod.outlook.com (2603:10b6:a03:544::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.17; Sat, 14 Oct
 2023 00:28:38 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:120:cafe::cb) by MN2PR10CA0031.outlook.office365.com
 (2603:10b6:208:120::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Sat, 14 Oct 2023 00:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 00:28:36 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 13 Oct 2023 19:28:31 -0500
Received: from cvadrevu-p620.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 13 Oct 2023 19:28:31
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH 4/5] binutils: Mark CVE-2022-47673 as patched
Date: Fri, 13 Oct 2023 19:27:19 -0500
Message-ID: <20231014002720.491416-4-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
References: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SJ2PR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0154a9-3c83-4abd-9be2-08dbcc4c8179
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HwIzI7ZRVKqxyubZaho83SZC4UmSNclREemKdj8erGOwRPMsjZ4bOVuoQRCL2MLLRFaNZPCbgQi5IIaJcSA7/MtuKLRaTIzmKin7ogOylFkJ4fbRYzwsowhckFyal+C3rIocMNLarFi51BFaI8tVoebY9icbxgijXygyC2MtMB/dV9t1jAXJJLd2xmURB/Z24K72SPLpEVT+aBmOxRo5JjhAAOz9weN/JKU84FC/HPLeHhCy2ukgwi1RuRA+Rg9TrO9agbk3UQDroEFA1mSagdpmqmDbR6yxzqaAe8QUHeRZ8x+Io/kxMVJMcD3lD/zjMNUN2Kyj+70lQlTdnNT19ar3s6yJ6BGRUSpRbQp22V51al1D452AXX2yLW1i9Ak3LUsjZ8zetg8P8HZmla/LH4/tLCQa9IyAxpCTlLivjbfhpJHj40C2fGqcldkSRrh2lbkJqRKLZoXaWjJ/aC4k9CeXEQno+xEODXqPrn6c63jmVNz8HF1VbCx1AKeoKoq3nDB9OP8eEgcfgyM3OfLwqGwMWzwDf7AyQOUfsHi5V6IuFSKv6PleRxi0oFcUjcvy38bYGaPeB7WXoIKXD/6YHrhF9Z3ZfXExoN5zQZIgRfCfi1xCwYLhJuPFrgI9qsFqX3pF+gCYhO1hVfoV5jxE/wcZmFLPwCFOI2PFQhjJwJayFSrzupFAgegCGAJxGLN+COZGnZYHxoP6r10OIeaaLcs6vy9/GBt1iMyMkS/LS9rcxysYJDrt672xWkvWiJXb
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(44832011)(47076005)(86362001)(81166007)(478600001)(2906002)(8936002)(8676002)(5660300002)(4326008)(4744005)(356005)(36756003)(26005)(41300700001)(336012)(6916009)(70206006)(40460700003)(2616005)(70586007)(40480700001)(316002)(36860700001)(1076003)(6666004)(82740400003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:28:36.3774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0154a9-3c83-4abd-9be2-08dbcc4c8179
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8846
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 00:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189108

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../binutils/binutils/0022-CVE-2023-25584-3.patch               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.=
patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
index abe501e5709..47cc3f310b3 100644
--- a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
@@ -35,8 +35,10 @@ Lack of bounds checking in vms-alpha.c parse_module
 Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff_plain;h=3D77c225bdeb410cf60da804879ad41622f5f1aa44]
=20
 CVE: CVE-2023-25584
+CVE: CVE-2022-47673
=20
 Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
=20
 ---
=20
--=20
2.34.1


