Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD16C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:54:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1229.1787290362044558965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 22:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=btBhYtmE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2693bf50f9=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L4tQr13193874
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 21:58:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1QlCwD6gypyHFLa/lCF5
	KzdxEchj8AhjP0mMXuQbKeA=; b=btBhYtmErzD37owMssdvPOfSLBuL7c5yvDRh
	gwvT9RaqSqPCZ8jyA+ayXZGMRjYhXeTUSBzvdNNPUtcG+6C7B/lgMXmKeV2taKWW
	ctlJtrC3sY8/5fWcpq1fmzhQQGiD6WfTL1VnGUfK/S/3NFA9tZH9Nj4Ej44WTBHq
	TPpw0ewERUiLTHezF1v9G7VnUXFuuOxrsD6eWEI9sZMifXo+zYh79XKy+zsTQbVP
	qpd+zbDa10qDVTPHigZ37pMvDIrA+ybDZEYjulm/L+sZgnfqyPlV5DCxHDEdvSfY
	VrYi3WYc3T0zBh+C9EEfd+d2YS9XJPELmBBFLMygfUPwdi1auQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023122.outbound.protection.outlook.com [40.107.201.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g6cmer5wy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 21:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwItMV0hcCUM+LJLAdMe+Kmg9wCXm9XYYsFD8oqNy7Ktt7ipFTETJuc+EYb54txrbsmkjjKWJr2zTGXY2uxciOCJ2FzozjBkmkMOHya3kwBCFotDing0/Z296c/3UzTwLoO89AEdv5yIOF3ppgjJqduEOfxRTeI2mI1YIZxVgO77SFTp4m6fQH99GQxODo0vZ+hEhvbJpSYkTAM+C1HHln2WbZGRNhrYuE2KB4GL9zbFUpyj29BnGDsU9+eSAEOA7hrE/v9m/RoRO9W7f8zDpX89df8S4Ukx61u6ffViY5AgPRrWCFdaLLkvOa9992/xDvyJLgAZnXO7DWEwKQOZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QlCwD6gypyHFLa/lCF5KzdxEchj8AhjP0mMXuQbKeA=;
 b=ubAtakPeys8fkGWwqHj2oXh5pYl43lyTktTuojlzMgOxiY/nqX22ICgdO7xcsg4VMxQLrGkCowt+MLnuzC2RX/GRZQYsby6UP+Ae9JdqWz8r5iy0sTrdWjCCO8WfnHaoSlrWdaVjEuiGKaU/hKENqI6p5I9Z7YvS1bqPNokGL9lM1FfICl4dGMvMJD3UgJfp4SvtP5Zypu6bBLTqfIwmZ86GNtKkWFOsXHdhA0DKwxO2oPJx7QKC1OnGzmWaotaBK4D60brehP/V0D7wRIe02rphl6MPCOaQQBqC0TGzekNF49zuUtzcFwOilIXrXO82vQiU4teFRVoFrdFlTEiSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by DM3PPF1A34EE115.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f0e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 04:58:13 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 04:58:12 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] wget: fix CVE-2026-58471
Date: Fri, 21 Aug 2026 10:27:51 +0530
Message-Id: <20260821045751.2046733-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|DM3PPF1A34EE115:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe3ea0e-2a73-49d0-ef53-08deff40cd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|13003099007|38350700014|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	P+rwUh7BCidVuccnd1V5wdUhZr4Bq/DzNYoPzpKMEjD1lVPVEejfR5Cz5DHYYcXkyRQAFNMNgXI/cwf3Kb6TrTKJwOp/Sqf3WPZSwdBhpBfZ8KDEpdJCW3y+QI4W22HIXtupw/CF7cQJ6FwPGmfRMac/9C1ca7bwz2AjLNjA6ia0dIBmI1sAVeQb4dwLBmjCE7BWXZuZ2YY5FxpEj/GGneL7r+WfHFNB/fZUndPRxhhOJBiBTA2l5/Hm5f/5UmMDwrHd6aEn42b+Bbj3yIZ2BKOK3fN65X9ya9/ggIs/XwLNGc15E82m7fGk33EkjKoyeycRFVupsOSyTuwB7V9KBzuteGV3ttbrGCatGK5DvxOW7Zyur/6b42tEdQyV9+kHHgiUJzve/W/I1E4DO7+7Ip9B6fWeHb5E4llBIGDorZzB8Vp/2KK/4aCs11PBRUd9lLT3EeReWPIewtG1z7oJvEqziVypp0j3z0QOTWaHmLrQ3mEfwWKLWxoARZQ1LbXKTHfH63shbc/bcLRU/p8dQRZozhYaT+A+mIC8hvlUdVxS9zMHeKuge4Uhy/evVF/g3cjAon4CoZfiXx69bD4ouzaG6CzsN1CEFLqpGuEaVRJPqZc5jWwPjCFWIoVDZUHcoOEyfHO8uXdMomY07RBNHJeRIYfSmU8R5k4c6lLalnHyJ9y7mqGu8ssaRWWzFDj1xeGrYtbbSptfozM+2L52m8bsh+e39O7Pp+f8LIDODik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(13003099007)(38350700014)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8GKQLk2FJO4sFlS58ioszSXCiaKe57s0Jkm/cHiL6WR8HrhiUTPL4OlXzVu?=
 =?us-ascii?Q?oKUQhdCCrggF8E4jEIxPiif6fvGx6qLtNBAtf15L9G0Nm2yeJ1khb3in/fDs?=
 =?us-ascii?Q?frrKKAp49ldHL0Ba6zGGCcb+IDJeiTgIeDGFuADxCk4nEuS2IMHOYV2+EtG8?=
 =?us-ascii?Q?hpsKG8Yrt9CrG4X1AxdKOO0at7Ukt+s54SE02gWQiieRCpsSpz7Ht3HCDFs7?=
 =?us-ascii?Q?zd/Gq2ZsiJlvT0D5pEyR7+R6FbiZrS2dzgpXpnO1dBwximQ6uJep8uqX3Sms?=
 =?us-ascii?Q?mmhv+ig76mZaCkhaUu386ph0zbd425IcMigDWGQBAgCphmcrmHnTIawuPuof?=
 =?us-ascii?Q?aZBvvDzTYpVQigixZqmvQAJJ33gA14AWbdga3Mi/38Plx9sZZc/AKi3RGc2k?=
 =?us-ascii?Q?EOtrwt+1PVJByjsdhKgzBVIuAFjcWnea3LoaBwcFgm0eteDgXNJom6/uPnUu?=
 =?us-ascii?Q?okakmhlGGsXTKxZP38ZZkPMgYtWPEe6Hdkeg04lHrCz62bG+vnp2On/l7btq?=
 =?us-ascii?Q?HIjagpi6kRUbfrz0Em62Bge4hXuuT+7yw/0NkKZTkahN7IMIoA59wTZWNbAR?=
 =?us-ascii?Q?e19dSDODDoG2zCcIoAc2X3npb4ttGLsg9vTFZcB29D/1BYi0R8BZAe0wtKrC?=
 =?us-ascii?Q?rTqQ300aOBIijI0zJMDpcOpuBvr7CLe73JG3yIs8O1DY3A2NjyR+TQV5M0NU?=
 =?us-ascii?Q?MAOmO84kKLat9ZG+Wm/kwqvcMbB6PHQEayQ5qSEzwArqUV/GS1DeR2ScqHlk?=
 =?us-ascii?Q?cXr6M4p/UqNwtBAIGI/OBRD2SpR5cQj+1Xd46C5uLLVRnqCiipWWgpJMAVSP?=
 =?us-ascii?Q?jy8ZC2DjUkC3aiCGwDJSHiDxfV48DCRLpJk4iIHG8iew+eBbZMzSTxD1CA0R?=
 =?us-ascii?Q?TvXsd/4kSc2EknPFugH0J9Dy+kmfGUMfk+gpK8Y+h4TrDqBdLXIB15eG5p2N?=
 =?us-ascii?Q?2EHUEP7V2dfU508+YgGMU812nDYxcauIbYJYJcgWWSsDLQdpRHzNxlmvQFLD?=
 =?us-ascii?Q?WDMPKMG4aCwTnACkyT2geHPABzcuT/ZXdGS+RqqnQh3CdJ0gupPX+kCbxXez?=
 =?us-ascii?Q?uTwwRNdl+gWnSUdoTDEHO8HBJH6F0fsRFtSfabctgM89cDuLHHSM6N/SRyTP?=
 =?us-ascii?Q?Mc7/ZuwO6mfQm2oUVgouwuubjd/yrqLHWk908dj2ReJzx1nd0xIk1oDQ6545?=
 =?us-ascii?Q?ZbzJsvINAJTac/x/yHHvO+7gBvhlefz6hwCfw8szaLRRAUZUuwUT0Z9WM7N4?=
 =?us-ascii?Q?tlf0bUKv6k3ioBTrXSQQJrrPl6+wi1JAo19gAc7hUzcsxMwKZcEIKyZ7D/rt?=
 =?us-ascii?Q?5CBdWC/Lyx798TqECO7PcEtriMuwDwdUHUlg3yrPifoMpUYi/MlBuTV/7zLz?=
 =?us-ascii?Q?O1W7l9W39Gapi9F8uDGOfeV4AQGy3pxHYyo8hDjIwzjUFDNjlEw55VRlfhIt?=
 =?us-ascii?Q?xGRZjJAfvyOAnKw01ZPVlmL+IVbeo1Q5a/ZcMtnPDKtiHUyRV+/sOdPEH8Xz?=
 =?us-ascii?Q?3T9KWcc1q8HR5RlpLaKTll2IS9gGksSq+EYBjrvMBiV3SjXPQGYWBGeKq4oQ?=
 =?us-ascii?Q?EG+vz92dc5j6SHnuTHMr25NR8qcNVmJABu82YfyM1BveEl0B2Mg4yEv3Wb1y?=
 =?us-ascii?Q?A12Mo4EaaeT6fBiMMw345JNy/cBJ4P0LfaRmY+Jo2pFE4qH+5P5SJaRTsTr1?=
 =?us-ascii?Q?rsZ3lVkuiyRlx5yTYIeypuO7VsGJTaw7OQ1a9P71m7SPcSucDtmh1+2+Lf0p?=
 =?us-ascii?Q?z+U/TbgMt6il032ZK8biE9/BJ6Q5H23ugbtCjOVxRYffRqk4+2eR?=
X-Exchange-RoutingPolicyChecked: 
	omy99eJ/ff+ThZjXe//68/UG2oszWplS2fh02eDuXf8aa+7UPDztK88glXeoEwgLIuVxZPFF92AP++6DH3JrvFaHGHy3rYldkEorMO7MIpZWd56qke+SP5oj3MkBWiltYi545oWapL5Of262I262O9nF7/UNLJluskGUDInnKNVqybchBqkGICblnxjva/EjUfSZoiD/t7f4GCS+ekejOvR1LWAGxlTbHv5St4T3Ie5jDf14lKeIFvz3i+Caou5KE68DgrLaH3ZXuHiuf2Qr6gnHOn0RS9qxBhCtKAlo/r37nqXTonI4QlUFd/+KcfrbFYyp/6WuuvJOsFCzD5VnlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe3ea0e-2a73-49d0-ef53-08deff40cd8f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 04:58:12.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbNKwcp2moYF3wvHiSkRX04pBd4l77YQNDA9crOGiqhdRSPJ17+oi0KWLZwR87QJIJs/Xp8iV1tRh0lg6EuhF4UDjThSQcuZYyfPgZ8whAU5C1jQcOhU6nbOGTIxsRUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1A34EE115
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMiBTYWx0ZWRfX0jviyeUNKZiA
 3bSQyXEYUoeA53ZQIUsyElw6sGh59sFjv7MmKJkgyxiRUL3eRMAq17BFRSm0c00UxeDyPMxkAzF
 usRSJfKr9zU85y/GlHJWP0vSa/HJ9X1A0jXuJegCeqLNDsKWZWLQ
X-Proofpoint-GUID: A53i7LyoujoBp8pDhuGyDjemVE2bZ1FC
X-Proofpoint-ORIG-GUID: A53i7LyoujoBp8pDhuGyDjemVE2bZ1FC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMiBTYWx0ZWRfX0b2cNERiRa7W
 QP+87kGmc6gsxXh7tlmpu8FrsZhFiIEwMytNyG+NIbTMdfBJPf5lxKXe47p1MVnZXYH/Gk2zW8l
 O/s3N313Kbm4kVx7rwEsgXdF1ogzBsqrdSfQUU21YjPWbKngsBkbEQ7m0gvyYFUMaez0Tu1uTxA
 c82SO6ucAOIfjsqBn2mEXaWdjsBth4JJ9Nzo+6EcJRZjjlv5lOTxJ5/xHPZmo9wa3AHsrSQKv3y
 QkYu4ICCLE6jFhYljres6TctFAO3X4loU/L8+ec1js3mEkVli5LbvA5wdmvD9QGssvU4cOblnQV
 BTdQzwZ3OFFUuOx3J09iiXZsM6u5AEMfu0E6laIY+nsos0m52W2hMSzizf2Ndju+rHb5JW4eai9
 DJyCgk0o2opcXr9aT4L39Mru4/4XfvV2k1qiIrIpDxLEhTxPP76w4r6Ne+DPa0zriDZAMe9AUmL
 qgWG0csRKsvecTry3/w==
X-Authority-Analysis: v=2.4 cv=Gt1yPE1C c=1 sm=1 tr=0 ts=6a87dae8 cx=c_pps
 a=1IaZlVIhgsmdv03QAtF1KQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QhM6qkWOIZOezFH_UlMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210032
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243933

Backport patch to fix CVE-2026-58471.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Upstream fix:
https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-58471.patch            | 74 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..2477505ff3
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,74 @@
+From c2640fe5171c59f87c58dc9fcb195b2d18b010ee Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58471
+
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee]
+
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 7540e90f..f334456c 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1614,7 +1614,7 @@ convert_fname (char *fname)
+   const char *from_encoding = opt.encoding_remote;
+   const char *to_encoding = opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+ 
+@@ -1636,7 +1636,6 @@ convert_fname (char *fname)
+   inlen = strlen (fname);
+   len = outlen = inlen * 2;
+   converted_fname = s = xmalloc (outlen + 1);
+-  done = 0;
+ 
+   for (;;)
+     {
+@@ -1644,7 +1643,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) == 0
+           && iconv (cd, NULL, NULL, &s, &outlen) == 0)
+         {
+-          *(converted_fname + len - outlen - done) = '\0';
++          *s = '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encoding));
+@@ -1667,10 +1666,17 @@ convert_fname (char *fname)
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
+-          done = len;
+-          len = outlen = done + inlen * 2;
+-          converted_fname = xrealloc (converted_fname, outlen + 1);
+-          s = converted_fname + done;
++          size_t used = s - converted_fname;
++          size_t newlen = used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <= len)
++            newlen = len * 2;
++
++          converted_fname = xrealloc (converted_fname, newlen + 1);
++          len = newlen;
++          s = converted_fname + used;
++          outlen = len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index d1dd6a1598..00667a1e24 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
+           file://CVE-2026-58471.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.40.0


