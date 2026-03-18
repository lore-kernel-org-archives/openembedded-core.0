Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6241088E44
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 21:59:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26618.1773871184336196778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 14:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LrOK82Y9;
 spf=pass (domain: axis.com, ip: 52.101.83.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhnReHMdPbPky186PaUcpFqoW+lQrROaykYygv3poKe7NO9oCNYXUHR2RaBCPX85DrmlohHeehjOlRsyLuQKJb1r+vCqT+C47sdllanCIZFRyhSfJl1SvV4/Q9lZFuR71EbplBdoH+4sDPHNmGxafdvmQyBfhNga3UcmdggMarsHcDcjsrgsoxWfzl5Mt2iiIXQnIv4XkX+b5CVU5KcTPik+F0i9arCIyMlxgeaKVHCj4Q6iNxgCPdCNSHjMpazjNyreEg1pWnDZRdP94BtH1hj61rRNJ5od2rEj9mP2PFQGLPYYOz1/zYHqMSOI25mDsZafeacz99hVzlbirUaRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS5/5mFG6zFlj+xXLwqwi4m0aCa493BqeIiBLCi4jRM=;
 b=aKjgr9+xHwOcTSxjCos54A/cImfOKc7l7jZANehPb7HQGQKuwO9IAOrc7ASXA5uzS9EmTRuOlAqV6gdg9mNHvEP1CeOCiVRVWnzEMuu4Azi+F1PUdcfxgj72NCexG381AG/6e/OlkvHWqMF1wlCBE0R1yXeal8HGp15Rz+2qvMaJ+yvVBALjdZNQBSJhevJvYt6CIUyYKHrvfdbKT4O3UdPq3+Mb2Rw2ZdgNFa6zK2YXPNn9qL9Fwcp/yaSmq8OF/cSgvMxHUmVRglWny0/6KzapbRn2SZFgk1eEDGoBEoAeB16ZwLyOmUvQKBuzjvNRm5C3iDnzMX1RPSKhSflUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS5/5mFG6zFlj+xXLwqwi4m0aCa493BqeIiBLCi4jRM=;
 b=LrOK82Y9c9gEQbyvZlh8G5tbJ9fMwdwkWPoT0xYM5XrEE5yiLKs2IPOPHMguprd8bY7Uxcx68l1CqteTUtMM9mi48MC3bS9Gbk/4SRyQlH/1fDjBJniYzJ/wNPkh5QGvNBnD0OmAIGG392+S8jYK3VWdYWL8OKCI/FOV/XRHtyw=
Received: from DB8PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:10:110::20)
 by GVXPR02MB12045.eurprd02.prod.outlook.com (2603:10a6:150:30f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 21:59:37 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::d8) by DB8PR04CA0010.outlook.office365.com
 (2603:10a6:10:110::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 21:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 21:59:37 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 18 Mar
 2026 22:59:36 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 18 Mar 2026 22:59:36 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id D3F5F25DB
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:59:36 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id CB5B012034E; Wed, 18 Mar 2026 22:59:36 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] packagegroup.bbclass: Reinstate the configure task
Date: Wed, 18 Mar 2026 22:59:33 +0100
Message-ID: <20260318215934.1949404-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|GVXPR02MB12045:EE_
X-MS-Office365-Filtering-Correlation-Id: c525f519-d197-4e98-5732-08de8539a5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NTJQ9pN6QKMENOrxhCbzsDIVELnOkNhqId5S12EFWYNdcZbDthzC0F3el/Rab5375xIR9vuxX0FoVX0qVgYOOH+ZMGCE67nugtFfXl+V/L6sLeYGmTwJfjIc3O01oslNrmdK2mvRYu4Efc3ezkwoPWMCOFbDLje0yFU5wUZv781o505ivMNjwseUKantV94FLN6oIIcoQ7Ja2bvASvxpf9+tQl00Jr3unSm2UI0H1LkGVDe5b32alGeftV8K1eHBD73FOAfAQLO8c4owbfNDblGpB3IYFKEHONJ30g8KDtYp701SI4eoZK2SClmz/EB+BsC9bvR5bwPtOmSFybdbmtvV8GKxL8Z4wJG3uNq1D4GF+7hyaRADbWJyrneUYrzCQg2SWVI8pQ5xqSXdldqNzyBRSa7W0hGgfC8D0XYUshjVxVD/0CZDUUMbYp+hmdQmIqcWI2V0WqGXxSUSp6tb3Xh93EEsxYPd0QIfeNvmFl7d+KNufnzdXbsb8BccfiXNpgaK/fnUPR5aXLZTUMLiGWpEZhPb0HsH4Hv8xi5fTB2JTWAkezZBs68ZWR4hGpIbbk2DI2w8zkXAyvZ1Xt/aXP7YG5HIfPP6m9aPaLeIR9wOW+speXx3L6j7a6Gz430T2mnGBXSV/cNUcocynVp6W7hZck1F3JXZ31dNa+49LpESNDLdd8GWDgFFoQuoR48ev15E7O3kWZMQrbWbMIHK6D6xdm9tiG9RJUXe08wQCbl3QseREWgPAvrXE8XsfmzeVZg8nEwQ+Mf9aMj9Ox94mQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LTHBBlyv87o1Uw7KFGTSIl20qzYecJ955zYkDuZ80VpwN07bxeuwtsCYn/H9npeNI/bka/uXLlmPx9apGTHWBCbhnP1uPICHQ1BEDjASrNGKpudivVhc1NTKGmyzu1MYVZA1dsnZXkGpBaCVDj9HabicFrx7zVCNlCiwcnE5MhZsht6S8h7/nxNJKLeMGRappFwPOAYq745n/hZPBLE9II7doIwmujKriMH1n2YJZqOV0OpKcc2aXWSXg8Y/h/WOY3X0i9Fr9+qy1s2OFeG3gd+8O3tjBxFToGmhu6kU07YURbWwko3U8ZusldN5rVPI7EwUjYO6T6GTVcO56k/Cm3VuCsIZb5OHWvkdqfuXK8nnOFZddyXtu+D7JAXSDUzWpzqjeTPV8e8eDW1aVo8Xup7JRJPkbT+20zivEAEyTIwtsk5Dx7+FY380HMCz5zbL
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:59:37.2749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c525f519-d197-4e98-5732-08de8539a5ba
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB12045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 21:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233436

We need the qa_configure postfunc to run so that it will detect any
invalid PACKAGCONFIGs being used. Thus, the configure task needs to
exists (but it can be empty).

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---
 meta/classes-recipe/packagegroup.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/packagegroup.bbclass b/meta/classes-recipe=
/packagegroup.bbclass
index cf6fc354a8..fe959a4284 100644
--- a/meta/classes-recipe/packagegroup.bbclass
+++ b/meta/classes-recipe/packagegroup.bbclass
@@ -49,11 +49,16 @@ DEPCHAIN_DBGDEFAULTDEPS =3D "1"
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
-deltask do_configure
 deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
=20
+# We need the qa_configure postfunc to run so that it will detect any inva=
lid
+# PACKAGCONFIGs being used. Thus, the configure task needs to remain.
+addtask configure before do_package
+do_configure() {
+}
+
 do_create_runtime_spdx[deptask] =3D "do_create_spdx"
 do_create_runtime_spdx[rdeptask] =3D ""
=20

