Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36F3CDB47E
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 00:28:54 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.115])
 by mx.groups.io with SMTP id smtpd.web11.54075.1697243325509499056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 17:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=da+0VmH/;
 spf=pass (domain: ni.com, ip: 40.107.223.115, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0S8qrsx6XAv4J0aYHB8gT0kYlf6eoiEHrV5EpcYl6Snqrw+AKD85ktybOYmQ85WA0FaogBKNE6zKDYoxUSq/tQepD+XGv/rJfaRldTCWjBdB1IsPJRsb6bf4o47myCDv372aMMF/SJHGrnNkMFpCwY7tnoS5mrHPYJ5RrK5q3c4k4U22dXojhPPLriDYPCWEcQdw3FHu4BO3gZ+GMvfKNZuAxq5uyLZG7GPlLikiB+oXoASk/XzuITZeiCMw7mwG1scbZAwgtw6RtVzFBp8Ir8wSQy1zXZHL6YJwK/HaiRMo3eX3vDIGUao5dGr70+y4ejszd3+bEZtsJWQU8391g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umakq4HOtVD7FbmOAe+MDeJTIa5rlmDrLnDnsY7OSJ4=;
 b=nGdUHMXG0tGbKb7OFR7IQenkyQaSw8nFOE+ErqDs3vtL+UW4oEMNu1qvFLUJjrpupP7MBOQPCBgfjyIv8KKOHbGlULZ1v+mmqy8lY344mrw6b3WELGpVhphivppUPfq9cMsfTSPWGlqEOYavY+vdxHxmJV798RCUVHmlAvPDS5UvwQr/42K6jsOcrhB7770y2so/LOBjkIn1b6wlW7pgPvcJ5BDF0HtfnQyJR7D3P3ZkaXokbqvByVT+P365MfouXQMBZmAdeOOykrz5UTFCCBTvIaIy5X9JsmCv0ZRXSar50kiamzVcIPVpI6U1idkLROJY37bE8dBE0c1hjL+R6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umakq4HOtVD7FbmOAe+MDeJTIa5rlmDrLnDnsY7OSJ4=;
 b=da+0VmH/u9PMUFaid0Dx0MwatujZ7P1Bcl01fRShPLLAJxxP796YcIR1XLWuLPaY92HPFNjEAU+GTi8TEafoVqmWzxAOYFwxXPKCWg0c/VoXLsmk8mOkEu29X3kSFqdyEmr4EEDrBoWnwcmiHlu5cy5JgBNNszxk/WugcrrNu8Q=
Received: from MN2PR10CA0001.namprd10.prod.outlook.com (2603:10b6:208:120::14)
 by SJ2PR04MB9010.namprd04.prod.outlook.com (2603:10b6:a03:561::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sat, 14 Oct
 2023 00:28:41 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:120:cafe::ce) by MN2PR10CA0001.outlook.office365.com
 (2603:10b6:208:120::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Sat, 14 Oct 2023 00:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 00:28:38 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 13 Oct 2023 19:28:34 -0500
Received: from cvadrevu-p620.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 13 Oct 2023 19:28:34
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH 5/5] binutils: Mark CVE-2022-47696 as patched
Date: Fri, 13 Oct 2023 19:27:20 -0500
Message-ID: <20231014002720.491416-5-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
References: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SJ2PR04MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f7f450-5561-43ae-7634-08dbcc4c82f9
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LhZ51OyaMW8NERcoSEeVd4Dr1wnvXVuyIMoDt8gohKPpO09q+KSSlAt+2aF8dvbQN9hHGIrY1kYQHBc+5PC/6NRO3IO/bcWoGzrUPP0yVW/i/VhSZAuebWgb9PqES9xfakv9CyZ4ZR6MDV3gArZto1/NUWbWftKsN2hZtLd5lHGPw6KxqJe+B2bLAQGDMtdoau/oY5qGrWAQfym9YSHuYrSnBZKQ+usO8Ofw8kJybxKCZG9NAJxmA70vTLi0pyq5P+cysrPZlnpQ3HVSOxCtoPgvugwDLtlSqxIxYM3nA2GqCCQLaCGnc6IYUA49YjUVjZM22uyMkj/Yk2dmOifqLfzlYPtHV8LHXQp660OWqM9l0u0MLV2Y0U+MrMo/9PY6fSQ7H4Hih1KMY6QXarxZi35z7o0vBPR78p/nVvTWMrVlHTSH3iw83aobxcGQ0WxzZ9u+l2kC9UL3aLmptxsGPuU7/cdBDh+EE+DHaEhQwGWdRWFjLcEjro2YWHPjPYZlzOAL2O0L1/6HMI8Nsb10uKgjjLjm1rVkbQgAqet4Fsd2Jw8J9RFydcetsp0hOTxdXuTnHow2pM6asI6yQFG7QIz/fYGu7OrtYFazc8Ce1ikvR8wdkp0R3dBInoAx9IPfxi6T4qlT7WWG4kSKnTDV1nK/gLNKQ9t7I08WU/sOXXx6DQZjI3uZvdemUnEkBiKA4Nq/GwdW85NQtUc7Y6TIccHC7+LQX5iub1R5lB/2zS4M2uxJXCP0JrOqaytx6oCJ
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(86362001)(36756003)(356005)(81166007)(47076005)(2616005)(1076003)(336012)(26005)(6666004)(478600001)(70586007)(70206006)(6916009)(41300700001)(316002)(82740400003)(5660300002)(44832011)(8936002)(8676002)(4744005)(2906002)(4326008)(36860700001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:28:38.8931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f7f450-5561-43ae-7634-08dbcc4c82f9
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 00:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189109

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../binutils/binutils/0025-CVE-2023-25588.patch                 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.pa=
tch b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
index 142d201c401..9b5825037fb 100644
--- a/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
+++ b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
@@ -17,8 +17,10 @@ anyway, so get rid of them.  Also, simplify and correct =
sanity checks.
 Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff_plain;h=3Dd12f8998d2d086f0a6606589e5aedb7147e6f2f1]
=20
 CVE: CVE-2023-25588
+CVE: CVE-2022-47696
=20
 Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
=20
 ---
=20
--=20
2.34.1


