Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5D5FEEF50
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 14:08:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82107.1775570918660652624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 07:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=B1WHlHQ3;
 spf=pass (domain: ericsson.com, ip: 52.101.65.54, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR9JD4FgoLYW19E4nYW7IK1jcsrwhsM9Oz+E/puF39rE2EM9dTPp2G+maVeLX85RhND1JE+UFarYxmQwaQCs+dVIwbERJyJlszClcFca6udEKcnSIy54RJ+q9EuJwKL6xpRjTxzmBF0mmnPHb+s/HQyhWoaxDzoQ3GHz91F9oCh2AU2xYgTCG7SIw79cAo+eeDQFCRBYpGq/1edLSGDz2/0ctfFOyJgedUOAg8c5eLmKKdjTnnxc5s3OVOE/XlsGjfIIEcRRMjj9ry4ulh9pPbsY6y69JabfYQEZDN1zneIWFy5Yp6vptZRHRACV0AddAEDVb7DPeym9DZBtlxGRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li+jmHf21le8bStdfC24lLfl2eTJ17QqLkzY0OlhfYY=;
 b=givBLY+TWR4cwnrHUSo9KYz/Ky9OBnBgA1KKGs2XPRD9Oudi8ZUStBopAZS/48bpnoB27GBbrciR7e+QqzxRT1CuFWlKJJybEk9MzcX+e/X3XreibfOyK+dchc4qefmS40/C5GC4Ee4J7bkdQ54pqwgHD+grUB8/K7E2GjQcYhl3MoywbwpfVldN69WxJyc2X+si847W+TJpsMLEAYN5b8Qu0T9SmZMP967A/t7ezB1fibRXFElGjOnYyYsDvq/yIJfFmSgxYiVP6jfLxIkLdJS5Cx6en3T5SHis/QNJTDE2N0cd1/e7HODwxiaJh+y3/YpmQttKryrRmD1+1oUSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Li+jmHf21le8bStdfC24lLfl2eTJ17QqLkzY0OlhfYY=;
 b=B1WHlHQ33rpS1dskYfYh6f+DDat9q9ImbvUhI+0IU4QLRipp7FmDQHocDhXgQmgiw2A7G1oWhdh/hzLKvDLD+44WvQiaoJib76nSh9aH+SIkfLHlMa9pp8/EiO8YVVvLWbiyDRL0vEJgm5EndcHbWjmUP1RVDyPsX4pDZq0MgGZzSgbS8p/2bM/htWce44kV8/NabDfAu7bcWhrF0hW5LYtWZ2HQ+CDOjF8CRDZsed6OyBNMUg/DrRLDhpmyubXd3iGdD/JC31nU3Ax+ymiNJ5j+ulDSXqnzhZ8BgPo8tWHI34nCWimaXIuIvlg0NmephMfiBT8zMG9/+nyxEdzMBA==
Received: from DUZPR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::7) by AM8PR07MB7506.eurprd07.prod.outlook.com
 (2603:10a6:20b:243::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 14:08:34 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::6c) by DUZPR01CA0076.outlook.office365.com
 (2603:10a6:10:46a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 14:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 7 Apr 2026 14:08:34 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 7 Apr 2026 16:08:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DDDA14020B41;
	Tue,  7 Apr 2026 16:08:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C7FF9700CF09; Tue,  7 Apr 2026 16:08:33 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] python3-kirk: upgrade 4.0.0 -> 4.1.0
Date: Tue, 7 Apr 2026 16:08:24 +0200
Message-ID: <20260407140824.3805778-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|AM8PR07MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: a75c0b3d-2543-4fdb-3c34-08de94af27f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GFd2sg8bea8V7dhPsk8ajHaKSRSRv1W/FOHgHs2JNAfLp8oQrzN1N63+ZlfS1UMDOBSXS1YNHq/IfNuI1Gah3ahhAdhuAnw5jxNX8nLQUPA6boRI+vuyMJYFMC7i39nyYw9X1pfExD7Y0qw0xlPwWyfdi8qOl9n8oxm19bHqZKifCwWem9aSMSeA0og6MnKH+63TyFVOUaRSSwa0OuWeZdp968POCF9JZQZ+AzC1YkrBQydV0N1tnlK8t/szjk+DSNedNwf7+kkJLHKG+WLdR3m+2vOXsd/PD+Ael4Gx/KTOUOxfeVvVT5joh7CH4n7n/ifjpU4c7K4uKh0jtneEqk9MIzIjcxtshOBneOWxkAU74X61UnySu4ytDZEUx5EaVMbKyeb1H8DAzMCq1yPR4BaWHur2fsRLcKeMTSmWKoTA+FoW1/KSjhFNuOiMh0aoo2iFwrKHwplgMZb7tUc8JsP/vV/OnA5qwCrmEbOp3X5jYY6fMfhdr0LsevbWNC/qfRQRIrhMhNK+U0m0lPmtZ8DRza0EWiCNf6D6Jd/OziW/WnESqUaBMOMhwKMU9qKINXoKNGmn1fJSec5Qlpns2txb3ATaaML9yfIdrMtr+yVDyrywHw6aUk+TJLnUjuphinJjd3bf/jh58BSIFjLc1pFBl1eTe/szDvu5VYNrRT5N3xt90jJ41m1xLfWyFnzsR21ZQry48TbD7wmUh1tcSQanBzxoKX3mtehslfDOhPgupYjtB9rXZp9W/wBQvWqYV1a4d8Boi4xUiL9MmPPiSQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bZ0QsjpyvayIzOZrvoAnjIvrCS6wuNZckbeqDoI00r/lHje5V/QOPw4P/KYaKc3MLzJFjzSbljRTRKCSbt6h7qf3/ShCTRw4wnjLH+voJuDUWEn68H+gIn5dp7e3F0LJHeBbDGCm4Tp3P46D7EHXLPoVrd7FHHdp9DfcU62wV5HGOrI5fqQgy3TrkAwy+Jg2CHiSk5jHQhM83Hde3/elR84+bLrosR2WJyKexj0FEaKj3sGw9arACt4mn8e5H5Ycl52McSdmvpvZtnSb6mnw1+70McGKR0JhjVYUKnLoJVOJwevmU4P66jyVsELP6vRBFGfskvrkIcRMYyKjXrPktRVMniZPv0UidpTuELwWP99Jr3gUDco0CbIRwTLxHC2EiJm0E52oFqWmZrZ88mVK3yPKVZOI2x1+fYOXQDl2THbBp738KQLDjOqe389Q1aIu
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 14:08:34.2640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75c0b3d-2543-4fdb-3c34-08de94af27f0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7506
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 14:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234741

From: Daniel Turull <daniel.turull@ericsson.com>

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../{python3-kirk_4.0.0.bb =3D> python3-kirk_4.1.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/python3-kirk/{python3-kirk_4.0.0.bb =3D> pyth=
on3-kirk_4.1.0.bb} (85%)

diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb b/met=
a/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
similarity index 85%
rename from meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
rename to meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
index af53d2edf3..3027d98de0 100644
--- a/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
@@ -7,7 +7,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f=
0"
=20
-SRC_URI[sha256sum] =3D "4606f46dfdb7be1e1c2de8d8f040037459a9de8a07fa1123ce=
e4b68c7f7cb764"
+SRC_URI[sha256sum] =3D "dc4dc4fa8994b14565a3d4f31bb79d6d27102ecbbd4feaef4e=
bc1e10e9cbace3"
=20
 inherit pypi python_setuptools_build_meta
=20

