Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD55EB64DD
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:16:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web10.11554.1687270578253864040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 07:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=j18kOIwW;
 spf=pass (domain: siemens.com, ip: 40.107.21.63, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcAnFGEfYvJ2Ot7YoGo9bnvAtiZEaVLUU6fuFHFSJVhUjytJqD+jxM4a/Debz9ZhF16tQe4iGO1nG0K7PMCb0YP0HDd5LVZZirJxzc6ABf9DTjTzij5ioswI1zdVqBwFIXiA3rZH9L0UHz6cLmtgfe1oTn/E5RDDBlKbkAijsZ6cGcH7cItz4Z3tetHbZHAZLQwBpNBalZvUw3j5e/9jX5OXvT2zSHdVCTIP5Jb+XG8/zRYjjO97f5rlkM/bH5zRGX2OncxqAgsY1rrdOu5Sf/CwUn0NtgQyqN7DpXpAI2BlfrmZeQynVLPbSFmL+8dHaKekX1mV2F2ZLd3853LOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LknUy6qO+BefjRBll3p1hBCmSto72g74hAzdabjjgnI=;
 b=XAc81uvUfhmrhFvaOhcZHfexkfIlJGyAy6Oku+8F4zzkLd3xafl/7ECB1OBe+SmRxklMT1tawBaQ0wF7vSKefURrLFmljC8eT7qk8asqtv7ubMjvhLMqtwsizBMLFXdYElBktkT02I1o8PC8HnnPez48brscQQuYDyV46zfiJixMHrU+j7dbfj3NL123ktC9jvbchX/tR+B5KVz6fAl495/Jf3a5LMdGRK3UlDzu9KKB2/cZEeUOxX+IaBFOVdiU5xxfHsDe+WzbklaWJhYZ9bjMB3CbbkRvgYP3A6LxaUUSjuSK7DTCYGEVvoluyiWwenTREavefH/PH00GfctOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LknUy6qO+BefjRBll3p1hBCmSto72g74hAzdabjjgnI=;
 b=j18kOIwW7h9AfV0czoq8OlHj4/Gtv2iQuSDV51XlXFgDNVFqz5CsmIXMHmZ8r4XSgD+zBa6qBikI7AyNAlhWS/0iP4uOAW1D0ADwNDMKbg2kW9c9F8SD9kOzdNbcveqm8zHJ1PMO5dCFcndU9poDIAJasBQyOC5Q71F3ACIsFktww2d1us5hn+Ke2x0HOB2xZhbHnpVlB/yg/PKyIuHLTaJdNyYjz/DxGERaXiPIT1AL1qbABpt1XR0hqIN8rveY7rJQbQRYwWqeQZcikqbNX/SyysR1zIvw4B7Zh6oLJY02oTpIEcZPxvBM5XKt0vUCigdt4SWyK9yKVlzIG3GLvw==
Received: from GV3P280CA0016.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::26) by
 PAWPR10MB6808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:338::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 14:16:14 +0000
Received: from HE1EUR01FT097.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:b:cafe::14) by GV3P280CA0016.outlook.office365.com
 (2603:10a6:150:b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 14:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT097.mail.protection.outlook.com (10.152.1.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 14:16:14 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 20 Jun 2023 16:16:13 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 20 Jun 2023 16:16:13 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v6 0/2] RFC: CVE-check handling
Date: Tue, 20 Jun 2023 16:15:55 +0200
Message-ID: <20230620141557.54562-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT097:EE_|PAWPR10MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: d973533a-86a7-4692-6619-08db7198e849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9SAwV6UkqJVMEEYIKd32WgOFYgA1ngS/nhhfmqZdaEXWXx06MhmBl/KgkDWE6/D9sxxQqnlGU8SY1MlGheMWZCwx9kMK3DWyB6W6miCivJ7alJ7npCuuQG+M1RrTzIJuDoiQPATw/US8Dx2oVLvGCvlRVDIbPYzAKn5DgyqKwZ5M0nblGBedCy19m0tG8YVPL544YRjPqd4wjI0kOQK8xEgw/NC79R0Wx5JNMEZXos6ceyPB5e+zk/WRqValKhSNFpH1fcKz12J7APvrq2tMyYL85C/17wePZBgBUX72ALV5jfrAxYseZSM56t2ADaUqc9hSgu4kDVNj8KMzafBwmQWiZGj6/SfJhAGAKvoELOBtWke8p4bOvbrIdU/5VmNPPWxCYImfYEKKnLmX0hcFuffUKHgYGlWjX96YaC0wM+3gWUZMmFbhuPxdBuIBVocd0Ims/gAKj1j7dEdAOLKsYwhSigTpuXcgiOB8lfRI4ytVvIOUqngah2OJpI8bt6JtcXNedv8Rq+kHSC4xwVvGrLFMIpwn+cg0NzGei24lzu5dmOeZbmY43B4QwmLN0y29mTQ/Rv10jNemXdRWyncz3qLtPyAcNJ/l93mtR3akZ6lxipJ5Dx2xLXFX0u9GB5po6m9ibSIJvuMRjnjPOEP7QILKqCvXSFmnQAs3Rago5SoUDw5yMfHGpQPQtYcqeBux32BnSjavSO0rMyf/q/GTC7oH4acnKX+j7NZ1jpP/v84Aq2lMqcOAgWJa3Bm8CAYX
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(8936002)(40460700003)(41300700001)(8676002)(82310400005)(478600001)(16526019)(82740400003)(356005)(82960400001)(7636003)(7596003)(956004)(83380400001)(336012)(2616005)(6666004)(26005)(107886003)(186003)(36860700001)(47076005)(40480700001)(86362001)(36756003)(316002)(4326008)(1076003)(70206006)(70586007)(6916009)(4744005)(44832011)(2906002)(5660300002)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:16:14.8116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d973533a-86a7-4692-6619-08db7198e849
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT097.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 14:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183139

After discussion in all parallel threads we proposed following variant whic=
h
covers both expressed requirements to have very small number of different c=
ve
statuses and also very large number of them at the same time.
This is a compromise version which maybe is not ideal but deals with
conflicting responses we got.

This patches version is missing commit for CVE_CHECK_IGNORE to CVE_STATUS
conversion as it is large effort and current implementation is still in
discussion. Once the concept is agreed, that commit will be added in next
patchset version.

Documentation is not updated too while current implementation is still in
discussion.

 meta/classes/cve-check.bbclass                | 86 ++++++++++++++++---
 meta/lib/oe/cve_check.py                      | 25 ++++++
 meta/lib/oeqa/selftest/cases/cve_check.py     | 26 ++++--
 .../logrotate/logrotate_3.21.0.bb             |  5 +-
 4 files changed, 122 insertions(+), 20 deletions(-)

--=20
2.41.0


