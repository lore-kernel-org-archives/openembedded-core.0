Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A9FC54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 15:40:58 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.41305.1711554050386894741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 08:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=U4C+R+1h;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=UcoSo1QT;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42R9tviW021836
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 10:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pps1; bh=pa7t7KD6L//H
	IXtJF0XKnEoV6lFCiBDVIVxiQ1pD92M=; b=U4C+R+1hilpld3WHjg64faAVKuy/
	2K3w7bSAykJg8RmSipAYEULSF4qPjBngTK9cuRL6hxcOCzaA7scUhTDLSjaiOvw0
	4yuSsdwJxgX6WsMc9e7BX+rt3OtmPswYp9u5tyQ7g/7XqMXYntRLKGMXd57Vr+SI
	9+UixsqAivPAv8mmZE79OHeXV3zkuVE8GKOC4cDJMN2BkmoNgAJRwAhgsMoxYYHQ
	GIHViYWrhRo2ghrwdvCsAgqq7yKOghI6Fo/NKOGPjmrL9C8Nvjj6PCwFzcqyvy9D
	M0ohSOhnkJxx10amS/zWkXrHbeA0wjyGsdYPFNwwZRIyXGnPE0IRV0GE7g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3x4h8rrp4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 10:40:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goYv4+JT72ifd9Sl3gln1/Vxy9K3TWQlBUOXzLUqkAhN7I/4CquqgcBwPit5woWTXEiDCJNCCzKsBnW1MFecF8issr6nisKD/x+FKUSikeC+MZR3Rlhq31By/Ia1Mprv/S6qb4i4hVkDfgIHG/LDL5bVKaGyffFVFaCDCtgXtd1PV/VR3p+pFsUbFM+7EEqy/Rq8aX9hKstdR88CUerDpylScQympyHdVUY9VFBWZqlT9/CGfXz3CUbxYlj8X83ugqu/cVLBRjPAj/C/2d7Hz+ptchve0gwp4rTNd124sa9MVIboFnRU8zz+vAgzs935MPjt7joK0qU+66mDXAzuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa7t7KD6L//HIXtJF0XKnEoV6lFCiBDVIVxiQ1pD92M=;
 b=iDYdF0y0XTFV6AxaLZN6DeGwQW2pXWd1KQfR3hOdqBMrDY/fPcRFZstRpos8mdtSYpoI/1reTALwcsbHj01SwjWEez5+9RS3OTADwSk+RFhxNyJx1+rzd7mHvocTFIrVxGhv3oBOvUuunySN+2M7TbaUztIb8WnIzZ41PHsUSSu0qGqF74KmwHuIrzrM+7mkInG3xmbcBa64G4cVzCsmCZ0bIwoh8EHzglwb81aagAHSJlOkpyUR7xOopww3uLZlWPDuuUxezWiCcbM7EGYH95NvWFJEGgrGOcOTxKIHyieGKIpjhX9j544AHU1VUYYGHzA3F9h4MGqkefPIcz1VAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa7t7KD6L//HIXtJF0XKnEoV6lFCiBDVIVxiQ1pD92M=;
 b=UcoSo1QT9fJ5aYOi8hDfxKgKETGejvUHr7Fg39MhNKQwkHoSGHFZpduJIWmmu7IiyrvpXopoEULlUFiWJn+WONTvG8bTxB0rWFnehCgAgFTjW+g8G/WQkvTUYglo1d37NThapq6naAUdF29LWECtb6n1M62yTZ3/TrR+lqT+lY0kxzeFj2doqMKa977oGVNszqgNjjxMRDiNl50kZIp+7d59dLiwn2nPwNK4UP6ECl2SdOdOflUBTNhqnkq3kZwX2HXNAK3aTOQ2iEwwaQ3nMb4a2UF2M97Fc+/fvfh8ca8bZ7/mKDiLWOgweG8cHNcCLA/O9M0BuR0rXQcsS5UM4A==
Received: from MW4PR03CA0264.namprd03.prod.outlook.com (2603:10b6:303:b4::29)
 by BN0PR04MB8029.namprd04.prod.outlook.com (2603:10b6:408:158::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 15:40:46 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::9b) by MW4PR03CA0264.outlook.office365.com
 (2603:10b6:303:b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 15:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 15:40:46 +0000
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Mar 2024 10:40:39 -0500
Received: from KC3WPA-EXMB5.ad.garmin.com (10.65.32.85) by
 CV1WPA-EXMB2.ad.garmin.com (10.5.144.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 10:40:44 -0500
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by
 KC3WPA-EXMB5.ad.garmin.com (10.65.32.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.32; Wed, 27 Mar 2024 10:40:44 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by mail.garmin.com
 (10.5.144.76) with Microsoft SMTP Server id 15.2.1258.32 via Frontend
 Transport; Wed, 27 Mar 2024 10:40:44 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [OE-core][dunfell][PATCH 0/2] License backports
Date: Wed, 27 Mar 2024 10:40:01 -0500
Message-ID: <20240327154026.811420-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|BN0PR04MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: a01a1ffc-0732-4fd7-edc2-08dc4e744523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oZ2VwxBysmijcLTqrcJdH0Lb0yJtKu85l7iIuUZDUM3bdurXlIPDIBJKUNUqh5Guxg/jvAQEnCf/dwVqPmYCaaUK8z3PgYzTIyKi5gtBkyUwxlfklYk1dn6ncyU/4bZnnH2wg0+aYGEKdFaRZsCTcw6XgxdjOW4T/AXbvbOlXYJ8XXqrpG5H2KIUUUEaL6cTo5vPR7P8cUbAi2w2sCFRe9eofolVk3SjWyoYpF3CdXDzGC8OyMlfamknaSdsP+kDPmBK1i4bIxExcgHf7zRb0jG5s0aj81c2bxZqF8ujUMCrbWWCqVGf4URlYsYIj86ecvyDmiYGAC808hZI0V8+tLoYHcInR8oV3oAc3k3+vebdTZ4z6aDOEP/zMHg9+bMO3GuI/QrHE17wVMFacbfOJ58ElPIGGyfGUOHbkg02Fl1drmONXqzaM6nui+qu85eNXra0XgiWHLPsxa18Rq6dtWETxgAIcLwShvKbMguOZMc27bYd568dGUg+sqSWCFCB/b1hEq/x8qFuJBH3DkdFenZb54DhXwRwuG3NxDFXAYESKw4Q8TIMiB9rv/TSFm8sj9I/+yrRjEIGIc/dTeC46WuPg2NbV3gZ4BH+yuQDkh5sVpOqQtD6wytkzMticqPSUpEdoznaBSLV+70ZRlCZV+pl2ubTZBT90Xc+U1TZk1VefKuA2qwVjPksstYy5u89aqBFTIHefOvhQyBMAHpku01SvKf684D+FLVbMYO3sovzU7ecN0bFQZX8o0NhVJlT
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 15:40:46.1517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a01a1ffc-0732-4fd7-edc2-08dc4e744523
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8029
X-Proofpoint-GUID: xEYIlYfxQGIFE2w4XJg6XgHXYmGziH_p
X-Proofpoint-ORIG-GUID: xEYIlYfxQGIFE2w4XJg6XgHXYmGziH_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 15:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197559

The following two changes backport common-licenes added after
Dunfell. This fixes spdx generation issues for some recipes on
Dunfell that use licenses that are not supported in licenses.conf.

Colin McAllister (2):
  common-licenses: Backport missing licenses
  licenses.conf: Backport missing licenses

 meta/conf/licenses.conf                       | 114 +--
 meta/files/common-licenses/0BSD               |   5 +
 meta/files/common-licenses/ADSL               |   1 +
 meta/files/common-licenses/AFL-1.1            |  27 +
 meta/files/common-licenses/AGPL-1.0-only      |  86 +++
 meta/files/common-licenses/AGPL-1.0-or-later  |  86 +++
 meta/files/common-licenses/AGPL-3.0-only      | 661 ++++++++++++++++++
 meta/files/common-licenses/AGPL-3.0-or-later  | 613 ++++++++++++++++
 meta/files/common-licenses/AMDPLPA            |  20 +
 meta/files/common-licenses/AML                |   9 +
 meta/files/common-licenses/AMPAS              |  13 +
 meta/files/common-licenses/ANTLR-PD-fallback  |   7 +
 meta/files/common-licenses/APAFML             |   3 +
 meta/files/common-licenses/Abstyles           |  11 +
 meta/files/common-licenses/Adobe-2006         |  12 +
 meta/files/common-licenses/Adobe-Glyph        |  10 +
 meta/files/common-licenses/Afmparse           |  10 +
 meta/files/common-licenses/Aladdin            |  62 ++
 meta/files/common-licenses/Artistic-1.0-Perl  |  51 ++
 meta/files/common-licenses/Artistic-1.0-cl8   |  51 ++
 meta/files/common-licenses/BSD-2-Clause-Views |  11 +
 .../common-licenses/BSD-3-Clause-Attribution  |  11 +
 meta/files/common-licenses/BSD-3-Clause-Clear |  32 +
 meta/files/common-licenses/BSD-3-Clause-LBNL  |  12 +
 .../common-licenses/BSD-3-Clause-Modification |  35 +
 .../BSD-3-Clause-No-Military-License          |  16 +
 .../BSD-3-Clause-No-Nuclear-License           |  14 +
 .../BSD-3-Clause-No-Nuclear-License-2014      |  16 +
 .../BSD-3-Clause-No-Nuclear-Warranty          |  14 +
 .../common-licenses/BSD-3-Clause-Open-MPI     |  34 +
 .../common-licenses/BSD-4-Clause-Shortened    |  13 +
 meta/files/common-licenses/BSD-4-Clause-UC    |  15 +
 meta/files/common-licenses/BSD-Protection     |  53 ++
 meta/files/common-licenses/BSD-Source-Code    |  10 +
 meta/files/common-licenses/BUSL-1.1           |  72 ++
 meta/files/common-licenses/Bahyph             |  11 +
 meta/files/common-licenses/Barr               |   1 +
 meta/files/common-licenses/Beerware           |   1 +
 meta/files/common-licenses/BitTorrent-1.0     | 330 +++++++++
 meta/files/common-licenses/BitTorrent-1.1     | 137 ++++
 meta/files/common-licenses/BlueOak-1.0.0      |  55 ++
 meta/files/common-licenses/Borceux            |  19 +
 meta/files/common-licenses/C-UDA-1.0          |  47 ++
 meta/files/common-licenses/CAL-1.0            | 354 ++++++++++
 .../CAL-1.0-Combined-Work-Exception           | 354 ++++++++++
 meta/files/common-licenses/CC-BY-2.5-AU       | 112 +++
 meta/files/common-licenses/CC-BY-3.0-AT       | 111 +++
 meta/files/common-licenses/CC-BY-3.0-DE       | 109 +++
 meta/files/common-licenses/CC-BY-3.0-NL       |  97 +++
 meta/files/common-licenses/CC-BY-3.0-US       |  83 +++
 meta/files/common-licenses/CC-BY-4.0          | 156 +++++
 meta/files/common-licenses/CC-BY-NC-3.0-DE    | 110 +++
 meta/files/common-licenses/CC-BY-NC-4.0       | 158 +++++
 meta/files/common-licenses/CC-BY-NC-ND-3.0-DE | 101 +++
 .../files/common-licenses/CC-BY-NC-ND-3.0-IGO |  99 +++
 meta/files/common-licenses/CC-BY-NC-ND-4.0    | 155 ++++
 meta/files/common-licenses/CC-BY-NC-SA-2.0-FR |  93 +++
 meta/files/common-licenses/CC-BY-NC-SA-2.0-UK | 149 ++++
 meta/files/common-licenses/CC-BY-NC-SA-3.0-DE | 126 ++++
 .../files/common-licenses/CC-BY-NC-SA-3.0-IGO | 105 +++
 meta/files/common-licenses/CC-BY-NC-SA-4.0    | 170 +++++
 meta/files/common-licenses/CC-BY-ND-3.0-DE    | 101 +++
 meta/files/common-licenses/CC-BY-ND-4.0       | 154 ++++
 meta/files/common-licenses/CC-BY-SA-2.0-UK    | 147 ++++
 meta/files/common-licenses/CC-BY-SA-2.1-JP    |  83 +++
 meta/files/common-licenses/CC-BY-SA-3.0-AT    | 139 ++++
 meta/files/common-licenses/CC-BY-SA-3.0-DE    | 136 ++++
 meta/files/common-licenses/CC-PDDC            |   8 +
 meta/files/common-licenses/CDDL-1.1           | 123 ++++
 meta/files/common-licenses/CDL-1.0            |  53 ++
 .../files/common-licenses/CDLA-Permissive-1.0 |  85 +++
 .../files/common-licenses/CDLA-Permissive-2.0 |  35 +
 meta/files/common-licenses/CDLA-Sharing-1.0   |  89 +++
 meta/files/common-licenses/CECILL-1.1         | 229 ++++++
 meta/files/common-licenses/CECILL-2.1         | 518 ++++++++++++++
 meta/files/common-licenses/CERN-OHL-1.1       |  47 ++
 meta/files/common-licenses/CERN-OHL-1.2       |  49 ++
 meta/files/common-licenses/CERN-OHL-P-2.0     | 199 ++++++
 meta/files/common-licenses/CERN-OHL-S-2.0     | 289 ++++++++
 meta/files/common-licenses/CERN-OHL-W-2.0     | 310 ++++++++
 meta/files/common-licenses/CNRI-Jython        |  12 +
 meta/files/common-licenses/CNRI-Python        |  25 +
 .../CNRI-Python-GPL-Compatible                |  23 +
 meta/files/common-licenses/CPOL-1.02          |  98 +++
 meta/files/common-licenses/Caldera            |  25 +
 meta/files/common-licenses/Condor-1.1         |  40 ++
 meta/files/common-licenses/Crossword          |   5 +
 meta/files/common-licenses/CrystalStacker     |   7 +
 meta/files/common-licenses/Cube               |  17 +
 meta/files/common-licenses/D-FSL-1.0          | 147 ++++
 meta/files/common-licenses/DOC                |  15 +
 meta/files/common-licenses/DRL-1.0            |  12 +
 meta/files/common-licenses/DSDP               |  18 +
 meta/files/common-licenses/Dotseqn            |   5 +
 meta/files/common-licenses/EPICS              |  32 +
 meta/files/common-licenses/EUPL-1.2           | 190 +++++
 meta/files/common-licenses/Eurosym            |  18 +
 meta/files/common-licenses/FSFAP              |   1 +
 meta/files/common-licenses/FSFUL              |   3 +
 meta/files/common-licenses/FSFULLR            |   3 +
 meta/files/common-licenses/FTL                |  79 +++
 meta/files/common-licenses/FreeBSD-DOC        |  23 +
 meta/files/common-licenses/FreeImage          | 117 ++++
 meta/files/common-licenses/GD                 |  24 +
 .../common-licenses/GFDL-1.1-invariants-only  | 119 ++++
 .../GFDL-1.1-invariants-or-later              | 119 ++++
 .../GFDL-1.1-no-invariants-only               | 119 ++++
 .../GFDL-1.1-no-invariants-or-later           | 119 ++++
 meta/files/common-licenses/GFDL-1.1-only      | 119 ++++
 meta/files/common-licenses/GFDL-1.1-or-later  | 119 ++++
 .../common-licenses/GFDL-1.2-invariants-only  | 130 ++++
 .../GFDL-1.2-invariants-or-later              | 130 ++++
 .../GFDL-1.2-no-invariants-only               | 130 ++++
 .../GFDL-1.2-no-invariants-or-later           | 130 ++++
 meta/files/common-licenses/GFDL-1.2-only      | 130 ++++
 meta/files/common-licenses/GFDL-1.2-or-later  | 130 ++++
 .../common-licenses/GFDL-1.3-invariants-only  | 149 ++++
 .../GFDL-1.3-invariants-or-later              | 149 ++++
 .../GFDL-1.3-no-invariants-only               | 149 ++++
 .../GFDL-1.3-no-invariants-or-later           | 149 ++++
 meta/files/common-licenses/GFDL-1.3-only      | 149 ++++
 meta/files/common-licenses/GFDL-1.3-or-later  | 149 ++++
 meta/files/common-licenses/GL2PS              |  13 +
 meta/files/common-licenses/GLWTPL             |  25 +
 meta/files/common-licenses/GPL-1.0-only       | 252 +++++++
 meta/files/common-licenses/GPL-1.0-or-later   | 232 ++++++
 meta/files/common-licenses/GPL-2.0-only       | 132 ++++
 meta/files/common-licenses/GPL-2.0-or-later   | 319 +++++++++
 .../GPL-3-with-bison-exception                |   7 +
 meta/files/common-licenses/GPL-3.0-only       | 225 ++++++
 meta/files/common-licenses/GPL-3.0-or-later   | 625 +++++++++++++++++
 meta/files/common-licenses/Giftware           |   9 +
 meta/files/common-licenses/Glide              |  95 +++
 meta/files/common-licenses/Glulxe             |   3 +
 meta/files/common-licenses/HPND-sell-variant  |  19 +
 meta/files/common-licenses/HTMLTIDY           |  13 +
 meta/files/common-licenses/HaskellReport      |   6 +
 meta/files/common-licenses/Hippocratic-2.1    |  33 +
 meta/files/common-licenses/IBM-pibs           |   8 +
 meta/files/common-licenses/IJG                |  38 +
 meta/files/common-licenses/ImageMagick        |  98 +++
 meta/files/common-licenses/Imlib2             |   9 +
 meta/files/common-licenses/Info-ZIP           |  16 +
 meta/files/common-licenses/Intel-ACPI         |  34 +
 meta/files/common-licenses/Interbase-1.0      | 199 ++++++
 meta/files/common-licenses/JPNIC              |  40 ++
 meta/files/common-licenses/JSON               |  11 +
 meta/files/common-licenses/JasPer-2.0         |  17 +
 meta/files/common-licenses/LAL-1.2            |  67 ++
 meta/files/common-licenses/LAL-1.3            |  88 +++
 meta/files/common-licenses/LGPL-2.0-only      | 342 +++++++++
 meta/files/common-licenses/LGPL-2.0-or-later  | 446 ++++++++++++
 meta/files/common-licenses/LGPL-2.1-only      | 176 +++++
 meta/files/common-licenses/LGPL-2.1-or-later  | 468 +++++++++++++
 meta/files/common-licenses/LGPL-3.0-only      |  65 ++
 meta/files/common-licenses/LGPL-3.0-or-later  | 163 +++++
 .../LGPL-3.0-with-zeromq-exception            | 181 +++++
 meta/files/common-licenses/LGPLLR             |  89 +++
 meta/files/common-licenses/LPL-1.0            |  81 +++
 meta/files/common-licenses/LPPL-1.3a          | 175 +++++
 meta/files/common-licenses/Latex2e            |   9 +
 meta/files/common-licenses/Leptonica          |   9 +
 meta/files/common-licenses/LiLiQ-P-1.1        |  70 ++
 meta/files/common-licenses/LiLiQ-R-1.1        |  94 +++
 meta/files/common-licenses/LiLiQ-Rplus-1.1    |  88 +++
 meta/files/common-licenses/Linux-OpenIB       |  18 +
 meta/files/common-licenses/MIT-0              |  16 +
 meta/files/common-licenses/MIT-CMU            |   7 +
 meta/files/common-licenses/MIT-Modern-Variant |  17 +
 meta/files/common-licenses/MIT-advertising    |   7 +
 meta/files/common-licenses/MIT-enna           |   9 +
 meta/files/common-licenses/MIT-feh            |   5 +
 meta/files/common-licenses/MIT-open-group     |  23 +
 meta/files/common-licenses/MITNFA             |   7 +
 .../MPL-2.0-no-copyleft-exception             | 144 ++++
 meta/files/common-licenses/MTLL               |  24 +
 meta/files/common-licenses/MakeIndex          |  19 +
 meta/files/common-licenses/MulanPSL-1.0       | 116 +++
 meta/files/common-licenses/MulanPSL-2.0       | 131 ++++
 meta/files/common-licenses/Mup                |  13 +
 meta/files/common-licenses/NAIST-2003         |  70 ++
 meta/files/common-licenses/NBPL-1.0           |  59 ++
 meta/files/common-licenses/NCGL-UK-2.0        |  67 ++
 meta/files/common-licenses/NIST-PD            |  15 +
 meta/files/common-licenses/NIST-PD-fallback   |   5 +
 meta/files/common-licenses/NLOD-1.0           |  79 +++
 meta/files/common-licenses/NLOD-2.0           |  80 +++
 meta/files/common-licenses/NLPL               |  14 +
 meta/files/common-licenses/NOSL               | 150 ++++
 meta/files/common-licenses/NPL-1.0            | 102 +++
 meta/files/common-licenses/NPL-1.1            | 186 +++++
 meta/files/common-licenses/NRL                |  28 +
 meta/files/common-licenses/NTP-0              |   5 +
 meta/files/common-licenses/Naumen             |  21 +
 meta/files/common-licenses/Net-SNMP           | 107 +++
 meta/files/common-licenses/NetCDF             |   7 +
 meta/files/common-licenses/Newsletr           |   7 +
 meta/files/common-licenses/Noweb              |   9 +
 meta/files/common-licenses/O-UDA-1.0          |  47 ++
 meta/files/common-licenses/OCCT-PL            | 112 +++
 meta/files/common-licenses/ODC-By-1.0         | 195 ++++++
 meta/files/common-licenses/OFL-1.0            |  49 ++
 meta/files/common-licenses/OFL-1.0-RFN        |  49 ++
 meta/files/common-licenses/OFL-1.0-no-RFN     |  49 ++
 meta/files/common-licenses/OFL-1.1-RFN        |  43 ++
 meta/files/common-licenses/OFL-1.1-no-RFN     |  43 ++
 meta/files/common-licenses/OGC-1.0            |  17 +
 meta/files/common-licenses/OGDL-Taiwan-1.0    | 141 ++++
 meta/files/common-licenses/OGL-Canada-2.0     |  51 ++
 meta/files/common-licenses/OGL-UK-1.0         |  69 ++
 meta/files/common-licenses/OGL-UK-2.0         |  72 ++
 meta/files/common-licenses/OGL-UK-3.0         |  69 ++
 meta/files/common-licenses/OLDAP-1.1          |  60 ++
 meta/files/common-licenses/OLDAP-1.2          |  60 ++
 meta/files/common-licenses/OLDAP-1.3          |  62 ++
 meta/files/common-licenses/OLDAP-1.4          |  62 ++
 meta/files/common-licenses/OLDAP-2.0          |  18 +
 meta/files/common-licenses/OLDAP-2.0.1        |  18 +
 meta/files/common-licenses/OLDAP-2.1          |  20 +
 meta/files/common-licenses/OLDAP-2.2          |  22 +
 meta/files/common-licenses/OLDAP-2.2.1        |  22 +
 meta/files/common-licenses/OLDAP-2.2.2        |  24 +
 meta/files/common-licenses/OLDAP-2.3          |  24 +
 meta/files/common-licenses/OLDAP-2.4          |  22 +
 meta/files/common-licenses/OLDAP-2.5          |  22 +
 meta/files/common-licenses/OLDAP-2.6          |  20 +
 meta/files/common-licenses/OLDAP-2.7          |  20 +
 meta/files/common-licenses/OML                |   5 +
 meta/files/common-licenses/OPL-1.0            | 136 ++++
 meta/files/common-licenses/OPUBL-1.0          |  78 +++
 meta/files/common-licenses/OSET-PL-2.1        | 161 +++++
 meta/files/common-licenses/OSL-1.1            |  47 ++
 meta/files/common-licenses/OSL-2.1            |  47 ++
 meta/files/common-licenses/PDDL-1.0           | 136 ++++
 meta/files/common-licenses/PHP-3.01           |  27 +
 meta/files/common-licenses/Parity-6.0.0       |  44 ++
 meta/files/common-licenses/Parity-7.0.0       |  71 ++
 meta/files/common-licenses/Plexus             |  15 +
 .../PolyForm-Noncommercial-1.0.0              | 131 ++++
 .../PolyForm-Small-Business-1.0.0             | 121 ++++
 meta/files/common-licenses/Qhull              |  17 +
 meta/files/common-licenses/RPL-1.1            | 177 +++++
 meta/files/common-licenses/RSA-MD             |   9 +
 meta/files/common-licenses/Rdisc              |  13 +
 meta/files/common-licenses/SCEA               |  60 ++
 meta/files/common-licenses/SGI-B-1.0          |  82 +++
 meta/files/common-licenses/SGI-B-1.1          |  84 +++
 meta/files/common-licenses/SGI-B-2.0          |  12 +
 meta/files/common-licenses/SHL-0.5            |  64 ++
 meta/files/common-licenses/SHL-0.51           |  65 ++
 meta/files/common-licenses/SISSL              | 116 +++
 meta/files/common-licenses/SISSL-1.2          | 114 +++
 meta/files/common-licenses/SMLNJ              |   7 +
 meta/files/common-licenses/SMPPL              |  29 +
 meta/files/common-licenses/SNIA               | 122 ++++
 meta/files/common-licenses/SSH-OpenSSH        |  67 ++
 meta/files/common-licenses/SSH-short          |   5 +
 meta/files/common-licenses/SSPL-1.0           | 557 +++++++++++++++
 meta/files/common-licenses/SWL                |   7 +
 meta/files/common-licenses/Saxpath            |  19 +
 meta/files/common-licenses/Sendmail           |  36 +
 meta/files/common-licenses/Sendmail-8.23      |  36 +
 meta/files/common-licenses/SimPL-2.0          |  37 +
 meta/files/common-licenses/Spencer-86         |  11 +
 meta/files/common-licenses/Spencer-99         |   9 +
 meta/files/common-licenses/TAPR-OHL-1.0       | 266 +++++++
 meta/files/common-licenses/TCL                |   9 +
 meta/files/common-licenses/TCP-wrappers       |   7 +
 meta/files/common-licenses/TMate              |  21 +
 meta/files/common-licenses/TORQUE-1.1         |  25 +
 meta/files/common-licenses/TOSL               |   9 +
 meta/files/common-licenses/TU-Berlin-1.0      |  10 +
 meta/files/common-licenses/TU-Berlin-2.0      |  20 +
 meta/files/common-licenses/UCL-1.0            |  48 ++
 meta/files/common-licenses/UPL-1.0            |  17 +
 meta/files/common-licenses/Unicode-DFS-2015   |  19 +
 meta/files/common-licenses/Unicode-DFS-2016   |  22 +
 meta/files/common-licenses/Unicode-TOU        |  51 ++
 meta/files/common-licenses/VOSTROM            |  27 +
 meta/files/common-licenses/Vim                |  30 +
 meta/files/common-licenses/W3C-19980720       |  23 +
 meta/files/common-licenses/W3C-20150513       |  17 +
 meta/files/common-licenses/WTFPL              |  11 +
 meta/files/common-licenses/Wsuipa             |   5 +
 meta/files/common-licenses/X11                |  13 +
 meta/files/common-licenses/XSkat              |  10 +
 meta/files/common-licenses/Xerox              |   5 +
 meta/files/common-licenses/YPL-1.0            |  47 ++
 meta/files/common-licenses/Zed                |   3 +
 meta/files/common-licenses/Zend-2.0           |  18 +
 meta/files/common-licenses/Zimbra-1.4         |  47 ++
 meta/files/common-licenses/blessing           |   5 +
 meta/files/common-licenses/bzip2-1.0.5        |  18 +
 .../files/common-licenses/copyleft-next-0.3.0 | 219 ++++++
 .../files/common-licenses/copyleft-next-0.3.1 | 220 ++++++
 meta/files/common-licenses/curl               |  10 +
 meta/files/common-licenses/diffmark           |   2 +
 meta/files/common-licenses/dvipdfm            |   1 +
 meta/files/common-licenses/eGenix             |  40 ++
 meta/files/common-licenses/etalab-2.0         | 179 +++++
 meta/files/common-licenses/gnuplot            |  14 +
 meta/files/common-licenses/iMatix             |  39 ++
 meta/files/common-licenses/libpng-2.0         |  33 +
 meta/files/common-licenses/libselinux-1.0     |  21 +
 meta/files/common-licenses/libtiff            |   8 +
 meta/files/common-licenses/mpich2             |  18 +
 meta/files/common-licenses/psfrag             |   5 +
 meta/files/common-licenses/psutils            |  29 +
 meta/files/common-licenses/xinetd             |  25 +
 meta/files/common-licenses/xpp                |  21 +
 .../common-licenses/zlib-acknowledgement      |  15 +
 311 files changed, 24143 insertions(+), 45 deletions(-)
 create mode 100644 meta/files/common-licenses/0BSD
 create mode 100644 meta/files/common-licenses/ADSL
 create mode 100644 meta/files/common-licenses/AFL-1.1
 create mode 100644 meta/files/common-licenses/AGPL-1.0-only
 create mode 100644 meta/files/common-licenses/AGPL-1.0-or-later
 create mode 100644 meta/files/common-licenses/AGPL-3.0-only
 create mode 100644 meta/files/common-licenses/AGPL-3.0-or-later
 create mode 100644 meta/files/common-licenses/AMDPLPA
 create mode 100644 meta/files/common-licenses/AML
 create mode 100644 meta/files/common-licenses/AMPAS
 create mode 100644 meta/files/common-licenses/ANTLR-PD-fallback
 create mode 100644 meta/files/common-licenses/APAFML
 create mode 100644 meta/files/common-licenses/Abstyles
 create mode 100644 meta/files/common-licenses/Adobe-2006
 create mode 100644 meta/files/common-licenses/Adobe-Glyph
 create mode 100644 meta/files/common-licenses/Afmparse
 create mode 100644 meta/files/common-licenses/Aladdin
 create mode 100644 meta/files/common-licenses/Artistic-1.0-Perl
 create mode 100644 meta/files/common-licenses/Artistic-1.0-cl8
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-Views
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Attribution
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Clear
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-LBNL
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Modification
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Military-License
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-License
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-License-2014
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-Warranty
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Open-MPI
 create mode 100644 meta/files/common-licenses/BSD-4-Clause-Shortened
 create mode 100644 meta/files/common-licenses/BSD-4-Clause-UC
 create mode 100644 meta/files/common-licenses/BSD-Protection
 create mode 100644 meta/files/common-licenses/BSD-Source-Code
 create mode 100644 meta/files/common-licenses/BUSL-1.1
 create mode 100644 meta/files/common-licenses/Bahyph
 create mode 100644 meta/files/common-licenses/Barr
 create mode 100644 meta/files/common-licenses/Beerware
 create mode 100644 meta/files/common-licenses/BitTorrent-1.0
 create mode 100644 meta/files/common-licenses/BitTorrent-1.1
 create mode 100644 meta/files/common-licenses/BlueOak-1.0.0
 create mode 100644 meta/files/common-licenses/Borceux
 create mode 100644 meta/files/common-licenses/C-UDA-1.0
 create mode 100644 meta/files/common-licenses/CAL-1.0
 create mode 100644 meta/files/common-licenses/CAL-1.0-Combined-Work-Exception
 create mode 100644 meta/files/common-licenses/CC-BY-2.5-AU
 create mode 100644 meta/files/common-licenses/CC-BY-3.0-AT
 create mode 100644 meta/files/common-licenses/CC-BY-3.0-DE
 create mode 100644 meta/files/common-licenses/CC-BY-3.0-NL
 create mode 100644 meta/files/common-licenses/CC-BY-3.0-US
 create mode 100644 meta/files/common-licenses/CC-BY-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-3.0-DE
 create mode 100644 meta/files/common-licenses/CC-BY-NC-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3.0-DE
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3.0-IGO
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.0-FR
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.0-UK
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3.0-DE
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3.0-IGO
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-ND-3.0-DE
 create mode 100644 meta/files/common-licenses/CC-BY-ND-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-SA-2.0-UK
 create mode 100644 meta/files/common-licenses/CC-BY-SA-2.1-JP
 create mode 100644 meta/files/common-licenses/CC-BY-SA-3.0-AT
 create mode 100644 meta/files/common-licenses/CC-BY-SA-3.0-DE
 create mode 100644 meta/files/common-licenses/CC-PDDC
 create mode 100644 meta/files/common-licenses/CDDL-1.1
 create mode 100644 meta/files/common-licenses/CDL-1.0
 create mode 100644 meta/files/common-licenses/CDLA-Permissive-1.0
 create mode 100644 meta/files/common-licenses/CDLA-Permissive-2.0
 create mode 100644 meta/files/common-licenses/CDLA-Sharing-1.0
 create mode 100644 meta/files/common-licenses/CECILL-1.1
 create mode 100644 meta/files/common-licenses/CECILL-2.1
 create mode 100644 meta/files/common-licenses/CERN-OHL-1.1
 create mode 100644 meta/files/common-licenses/CERN-OHL-1.2
 create mode 100644 meta/files/common-licenses/CERN-OHL-P-2.0
 create mode 100644 meta/files/common-licenses/CERN-OHL-S-2.0
 create mode 100644 meta/files/common-licenses/CERN-OHL-W-2.0
 create mode 100644 meta/files/common-licenses/CNRI-Jython
 create mode 100644 meta/files/common-licenses/CNRI-Python
 create mode 100644 meta/files/common-licenses/CNRI-Python-GPL-Compatible
 create mode 100644 meta/files/common-licenses/CPOL-1.02
 create mode 100644 meta/files/common-licenses/Caldera
 create mode 100644 meta/files/common-licenses/Condor-1.1
 create mode 100644 meta/files/common-licenses/Crossword
 create mode 100644 meta/files/common-licenses/CrystalStacker
 create mode 100644 meta/files/common-licenses/Cube
 create mode 100644 meta/files/common-licenses/D-FSL-1.0
 create mode 100644 meta/files/common-licenses/DOC
 create mode 100644 meta/files/common-licenses/DRL-1.0
 create mode 100644 meta/files/common-licenses/DSDP
 create mode 100644 meta/files/common-licenses/Dotseqn
 create mode 100644 meta/files/common-licenses/EPICS
 create mode 100644 meta/files/common-licenses/EUPL-1.2
 create mode 100644 meta/files/common-licenses/Eurosym
 create mode 100644 meta/files/common-licenses/FSFAP
 create mode 100644 meta/files/common-licenses/FSFUL
 create mode 100644 meta/files/common-licenses/FSFULLR
 create mode 100644 meta/files/common-licenses/FTL
 create mode 100644 meta/files/common-licenses/FreeBSD-DOC
 create mode 100644 meta/files/common-licenses/FreeImage
 create mode 100644 meta/files/common-licenses/GD
 create mode 100644 meta/files/common-licenses/GFDL-1.1-invariants-only
 create mode 100644 meta/files/common-licenses/GFDL-1.1-invariants-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.1-no-invariants-only
 create mode 100644 meta/files/common-licenses/GFDL-1.1-no-invariants-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.1-only
 create mode 100644 meta/files/common-licenses/GFDL-1.1-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.2-invariants-only
 create mode 100644 meta/files/common-licenses/GFDL-1.2-invariants-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.2-no-invariants-only
 create mode 100644 meta/files/common-licenses/GFDL-1.2-no-invariants-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.2-only
 create mode 100644 meta/files/common-licenses/GFDL-1.2-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.3-invariants-only
 create mode 100644 meta/files/common-licenses/GFDL-1.3-invariants-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.3-no-invariants-only
 create mode 100644 meta/files/common-licenses/GFDL-1.3-no-invariants-or-later
 create mode 100644 meta/files/common-licenses/GFDL-1.3-only
 create mode 100644 meta/files/common-licenses/GFDL-1.3-or-later
 create mode 100644 meta/files/common-licenses/GL2PS
 create mode 100644 meta/files/common-licenses/GLWTPL
 create mode 100644 meta/files/common-licenses/GPL-1.0-only
 create mode 100644 meta/files/common-licenses/GPL-1.0-or-later
 create mode 100644 meta/files/common-licenses/GPL-2.0-only
 create mode 100644 meta/files/common-licenses/GPL-2.0-or-later
 create mode 100644 meta/files/common-licenses/GPL-3-with-bison-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-only
 create mode 100644 meta/files/common-licenses/GPL-3.0-or-later
 create mode 100644 meta/files/common-licenses/Giftware
 create mode 100644 meta/files/common-licenses/Glide
 create mode 100644 meta/files/common-licenses/Glulxe
 create mode 100644 meta/files/common-licenses/HPND-sell-variant
 create mode 100644 meta/files/common-licenses/HTMLTIDY
 create mode 100644 meta/files/common-licenses/HaskellReport
 create mode 100644 meta/files/common-licenses/Hippocratic-2.1
 create mode 100644 meta/files/common-licenses/IBM-pibs
 create mode 100644 meta/files/common-licenses/IJG
 create mode 100644 meta/files/common-licenses/ImageMagick
 create mode 100644 meta/files/common-licenses/Imlib2
 create mode 100644 meta/files/common-licenses/Info-ZIP
 create mode 100644 meta/files/common-licenses/Intel-ACPI
 create mode 100644 meta/files/common-licenses/Interbase-1.0
 create mode 100644 meta/files/common-licenses/JPNIC
 create mode 100644 meta/files/common-licenses/JSON
 create mode 100644 meta/files/common-licenses/JasPer-2.0
 create mode 100644 meta/files/common-licenses/LAL-1.2
 create mode 100644 meta/files/common-licenses/LAL-1.3
 create mode 100644 meta/files/common-licenses/LGPL-2.0-only
 create mode 100644 meta/files/common-licenses/LGPL-2.0-or-later
 create mode 100644 meta/files/common-licenses/LGPL-2.1-only
 create mode 100644 meta/files/common-licenses/LGPL-2.1-or-later
 create mode 100644 meta/files/common-licenses/LGPL-3.0-only
 create mode 100644 meta/files/common-licenses/LGPL-3.0-or-later
 create mode 100644 meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
 create mode 100644 meta/files/common-licenses/LGPLLR
 create mode 100644 meta/files/common-licenses/LPL-1.0
 create mode 100644 meta/files/common-licenses/LPPL-1.3a
 create mode 100644 meta/files/common-licenses/Latex2e
 create mode 100644 meta/files/common-licenses/Leptonica
 create mode 100644 meta/files/common-licenses/LiLiQ-P-1.1
 create mode 100644 meta/files/common-licenses/LiLiQ-R-1.1
 create mode 100644 meta/files/common-licenses/LiLiQ-Rplus-1.1
 create mode 100644 meta/files/common-licenses/Linux-OpenIB
 create mode 100644 meta/files/common-licenses/MIT-0
 create mode 100644 meta/files/common-licenses/MIT-CMU
 create mode 100644 meta/files/common-licenses/MIT-Modern-Variant
 create mode 100644 meta/files/common-licenses/MIT-advertising
 create mode 100644 meta/files/common-licenses/MIT-enna
 create mode 100644 meta/files/common-licenses/MIT-feh
 create mode 100644 meta/files/common-licenses/MIT-open-group
 create mode 100644 meta/files/common-licenses/MITNFA
 create mode 100644 meta/files/common-licenses/MPL-2.0-no-copyleft-exception
 create mode 100644 meta/files/common-licenses/MTLL
 create mode 100644 meta/files/common-licenses/MakeIndex
 create mode 100644 meta/files/common-licenses/MulanPSL-1.0
 create mode 100644 meta/files/common-licenses/MulanPSL-2.0
 create mode 100644 meta/files/common-licenses/Mup
 create mode 100644 meta/files/common-licenses/NAIST-2003
 create mode 100644 meta/files/common-licenses/NBPL-1.0
 create mode 100644 meta/files/common-licenses/NCGL-UK-2.0
 create mode 100644 meta/files/common-licenses/NIST-PD
 create mode 100644 meta/files/common-licenses/NIST-PD-fallback
 create mode 100644 meta/files/common-licenses/NLOD-1.0
 create mode 100644 meta/files/common-licenses/NLOD-2.0
 create mode 100644 meta/files/common-licenses/NLPL
 create mode 100644 meta/files/common-licenses/NOSL
 create mode 100644 meta/files/common-licenses/NPL-1.0
 create mode 100644 meta/files/common-licenses/NPL-1.1
 create mode 100644 meta/files/common-licenses/NRL
 create mode 100644 meta/files/common-licenses/NTP-0
 create mode 100644 meta/files/common-licenses/Naumen
 create mode 100644 meta/files/common-licenses/Net-SNMP
 create mode 100644 meta/files/common-licenses/NetCDF
 create mode 100644 meta/files/common-licenses/Newsletr
 create mode 100644 meta/files/common-licenses/Noweb
 create mode 100644 meta/files/common-licenses/O-UDA-1.0
 create mode 100644 meta/files/common-licenses/OCCT-PL
 create mode 100644 meta/files/common-licenses/ODC-By-1.0
 create mode 100644 meta/files/common-licenses/OFL-1.0
 create mode 100644 meta/files/common-licenses/OFL-1.0-RFN
 create mode 100644 meta/files/common-licenses/OFL-1.0-no-RFN
 create mode 100644 meta/files/common-licenses/OFL-1.1-RFN
 create mode 100644 meta/files/common-licenses/OFL-1.1-no-RFN
 create mode 100644 meta/files/common-licenses/OGC-1.0
 create mode 100644 meta/files/common-licenses/OGDL-Taiwan-1.0
 create mode 100644 meta/files/common-licenses/OGL-Canada-2.0
 create mode 100644 meta/files/common-licenses/OGL-UK-1.0
 create mode 100644 meta/files/common-licenses/OGL-UK-2.0
 create mode 100644 meta/files/common-licenses/OGL-UK-3.0
 create mode 100644 meta/files/common-licenses/OLDAP-1.1
 create mode 100644 meta/files/common-licenses/OLDAP-1.2
 create mode 100644 meta/files/common-licenses/OLDAP-1.3
 create mode 100644 meta/files/common-licenses/OLDAP-1.4
 create mode 100644 meta/files/common-licenses/OLDAP-2.0
 create mode 100644 meta/files/common-licenses/OLDAP-2.0.1
 create mode 100644 meta/files/common-licenses/OLDAP-2.1
 create mode 100644 meta/files/common-licenses/OLDAP-2.2
 create mode 100644 meta/files/common-licenses/OLDAP-2.2.1
 create mode 100644 meta/files/common-licenses/OLDAP-2.2.2
 create mode 100644 meta/files/common-licenses/OLDAP-2.3
 create mode 100644 meta/files/common-licenses/OLDAP-2.4
 create mode 100644 meta/files/common-licenses/OLDAP-2.5
 create mode 100644 meta/files/common-licenses/OLDAP-2.6
 create mode 100644 meta/files/common-licenses/OLDAP-2.7
 create mode 100644 meta/files/common-licenses/OML
 create mode 100644 meta/files/common-licenses/OPL-1.0
 create mode 100644 meta/files/common-licenses/OPUBL-1.0
 create mode 100644 meta/files/common-licenses/OSET-PL-2.1
 create mode 100644 meta/files/common-licenses/OSL-1.1
 create mode 100644 meta/files/common-licenses/OSL-2.1
 create mode 100644 meta/files/common-licenses/PDDL-1.0
 create mode 100644 meta/files/common-licenses/PHP-3.01
 create mode 100644 meta/files/common-licenses/Parity-6.0.0
 create mode 100644 meta/files/common-licenses/Parity-7.0.0
 create mode 100644 meta/files/common-licenses/Plexus
 create mode 100644 meta/files/common-licenses/PolyForm-Noncommercial-1.0.0
 create mode 100644 meta/files/common-licenses/PolyForm-Small-Business-1.0.0
 create mode 100644 meta/files/common-licenses/Qhull
 create mode 100644 meta/files/common-licenses/RPL-1.1
 create mode 100644 meta/files/common-licenses/RSA-MD
 create mode 100644 meta/files/common-licenses/Rdisc
 create mode 100644 meta/files/common-licenses/SCEA
 create mode 100644 meta/files/common-licenses/SGI-B-1.0
 create mode 100644 meta/files/common-licenses/SGI-B-1.1
 create mode 100644 meta/files/common-licenses/SGI-B-2.0
 create mode 100644 meta/files/common-licenses/SHL-0.5
 create mode 100644 meta/files/common-licenses/SHL-0.51
 create mode 100644 meta/files/common-licenses/SISSL
 create mode 100644 meta/files/common-licenses/SISSL-1.2
 create mode 100644 meta/files/common-licenses/SMLNJ
 create mode 100644 meta/files/common-licenses/SMPPL
 create mode 100644 meta/files/common-licenses/SNIA
 create mode 100644 meta/files/common-licenses/SSH-OpenSSH
 create mode 100644 meta/files/common-licenses/SSH-short
 create mode 100644 meta/files/common-licenses/SSPL-1.0
 create mode 100644 meta/files/common-licenses/SWL
 create mode 100644 meta/files/common-licenses/Saxpath
 create mode 100644 meta/files/common-licenses/Sendmail
 create mode 100644 meta/files/common-licenses/Sendmail-8.23
 create mode 100644 meta/files/common-licenses/SimPL-2.0
 create mode 100644 meta/files/common-licenses/Spencer-86
 create mode 100644 meta/files/common-licenses/Spencer-99
 create mode 100644 meta/files/common-licenses/TAPR-OHL-1.0
 create mode 100644 meta/files/common-licenses/TCL
 create mode 100644 meta/files/common-licenses/TCP-wrappers
 create mode 100644 meta/files/common-licenses/TMate
 create mode 100644 meta/files/common-licenses/TORQUE-1.1
 create mode 100644 meta/files/common-licenses/TOSL
 create mode 100644 meta/files/common-licenses/TU-Berlin-1.0
 create mode 100644 meta/files/common-licenses/TU-Berlin-2.0
 create mode 100644 meta/files/common-licenses/UCL-1.0
 create mode 100644 meta/files/common-licenses/UPL-1.0
 create mode 100644 meta/files/common-licenses/Unicode-DFS-2015
 create mode 100644 meta/files/common-licenses/Unicode-DFS-2016
 create mode 100644 meta/files/common-licenses/Unicode-TOU
 create mode 100644 meta/files/common-licenses/VOSTROM
 create mode 100644 meta/files/common-licenses/Vim
 create mode 100644 meta/files/common-licenses/W3C-19980720
 create mode 100644 meta/files/common-licenses/W3C-20150513
 create mode 100644 meta/files/common-licenses/WTFPL
 create mode 100644 meta/files/common-licenses/Wsuipa
 create mode 100644 meta/files/common-licenses/X11
 create mode 100644 meta/files/common-licenses/XSkat
 create mode 100644 meta/files/common-licenses/Xerox
 create mode 100644 meta/files/common-licenses/YPL-1.0
 create mode 100644 meta/files/common-licenses/Zed
 create mode 100644 meta/files/common-licenses/Zend-2.0
 create mode 100644 meta/files/common-licenses/Zimbra-1.4
 create mode 100644 meta/files/common-licenses/blessing
 create mode 100644 meta/files/common-licenses/bzip2-1.0.5
 create mode 100644 meta/files/common-licenses/copyleft-next-0.3.0
 create mode 100644 meta/files/common-licenses/copyleft-next-0.3.1
 create mode 100644 meta/files/common-licenses/curl
 create mode 100644 meta/files/common-licenses/diffmark
 create mode 100644 meta/files/common-licenses/dvipdfm
 create mode 100644 meta/files/common-licenses/eGenix
 create mode 100644 meta/files/common-licenses/etalab-2.0
 create mode 100644 meta/files/common-licenses/gnuplot
 create mode 100644 meta/files/common-licenses/iMatix
 create mode 100644 meta/files/common-licenses/libpng-2.0
 create mode 100644 meta/files/common-licenses/libselinux-1.0
 create mode 100644 meta/files/common-licenses/libtiff
 create mode 100644 meta/files/common-licenses/mpich2
 create mode 100644 meta/files/common-licenses/psfrag
 create mode 100644 meta/files/common-licenses/psutils
 create mode 100644 meta/files/common-licenses/xinetd
 create mode 100644 meta/files/common-licenses/xpp
 create mode 100644 meta/files/common-licenses/zlib-acknowledgement

-- 
2.43.2


