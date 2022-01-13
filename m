Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E1EC433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 13:49:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.9006.1642081747239524725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fxNjlNE2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80122df73f=kexin.hao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20DCK3mc000998
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:49:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=v1p13RpZJV+E6XzdRLOph6aBDLSt7Ki1ijwhJ9l0sGM=;
 b=fxNjlNE2rW3xeYrdvGtvhi7S3UQCMbAgIIYLbBF2pzpWZfYJ8GcsJUIrFTIIpwvo6Uks
 svcvF1X+5EJ8RKFtkqOu0UtNSzO85FLWac86VD0/NUlk5aaqFnFC5TVB2V/6JQIRnoJy
 wJTt/dzGpzG1e86lZI3HnMpfX931neUVNWWZlLegOCdTog/WZVX4DL1nwxzf5ZY5RKZ4
 bV2WqkgX9Yv2ojV26yDYKugmH+axssczYk8Cs3fgubkthXqZ9edNUuAWd9V4AAjAktIj
 AFg6MpvKoSFNebFLPRylW3VmN5sF11L0FKES+Yn7uU+vWlYlyI/lry9UOEEjlGvPAMN9 5Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhyvtgsxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:49:06 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20DDn5rG006502
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:49:06 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhyvtgsxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jan 2022 05:49:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ykvr5zRuxRXWcD5gpRA74whphZmIqioXaY1LIZdBcUPMlQgsLqXpnzVUwX15dtdtvofe8ei23JJLVVgSIe+NHyByNIOIohOJ3l8Nn3YtYkA2KplTC80lFEfpsSlkTPnColOp+xukmpjoUPoINo06AVz6j1iaURD2X8lOrDggth5E6Oyy2IKwqC8oCIIBTZSnHFIltImdTW14+s/YHEXpgovVjfVPxeka4O2eQG8FvNMuvH6Px3IQiG5uX01WjGgiDijmYu3cxiCgWRDpdnPIJNsbAt7ypK4k42d7faqk0wpbOCxUty43qfpP4MZoy1ZWy4rEp9wRCWq3sukZ/sNSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1p13RpZJV+E6XzdRLOph6aBDLSt7Ki1ijwhJ9l0sGM=;
 b=TVjMy+8+Z9bpBSsN43SPFDEVn7mZd3ZQfQW+BPt5AUGaHEcPGA0efmkU5YTa6z/FNp+JxSLVnDSjpiSlm+9p6cxErEqnSDutsXizu/yp0qf09+aoakkcQPXZPQwjHA8AbaNH9910kZC51JGSXlfVjSUJ4aJa0kt8/6pNGXoNHsCUzsnN+uECniIzCNLPyFyRdYKpEAlD5DcIo/xhOyMxfo9VW4dXsaqPCxreN9+p9AvBHpv/x0xO1PbVeW+z03+Rq8XC7aD0PFhptLUnm4FXDiAOCJdYeBBa0lPskC/P4ryxap8hPg2sfU9xVaw7RR7AVIihNJddfTR2o8gul367wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 13:49:02 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Thu, 13 Jan 2022
 13:49:02 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] tune-cortexa72: Drop the redundant cortexa72-crc tune
Date: Thu, 13 Jan 2022 21:45:23 +0800
Message-Id: <20220113134523.3997945-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3891c15-835f-4d06-db14-08d9d69b7518
X-MS-TrafficTypeDiagnostic: PH0PR11MB4855:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB4855766D20E1FE23B301D870E2539@PH0PR11MB4855.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZmcwpQt5byd+cgzan9wefu4qfgDrQJx3qE46Kcio8YpW/7HrlPH7uXVamogShClI/iCbx3Abegn4fNnPP8px43k//a8UCHQf9cUZjFDujCqJ/uIMRzjsXpP6kNq6m9regdlUeABxyEsK7XWU6pm0/0IVB8hqKxe0qedVLj/gKsRUuk5g2zX5kfCgYbAmf55j6mjf/agQjRnuW6xr8DgTY4/aXJKw+PcfiG9UGgLUp66gdrHSlqm36IQyzhcUQ0/3zxBWTbZ0dxPQmLMlClqVZ+exhuzGCvi6lWAGXUkSN07ECPyT+anetaY4CUw4a399CcZapqGeQiC8RDyQq3unTpN8ZpFF9ftLBDqlQ/DSQdF8MISmSS70u9899icj5GYrnCwJP2KXE5z6Q/jpVuy6OWJaPm9cZkMhiEAJa3fmMvMb4BKq6qnJdyBNK8y+S7ius+/RLacNEqxyFm0wmSEQE8p8Z16tK7Y/2/U0FoKdCp+mpkV2byHkhVJ0kqFtGX4R1Hyg0U+wr5G2feVcuSVxt1tSJJEAZooMK/GEQw0XWKo8DWDlV5sQDn/NAxMOWCC2Ax81/IKQm0BE1yrfyJu5wtoxvHH5v0qjQ38yCdYjupjKlSUMLexAWjhX67/oAQ67xJbHoZVqulga3wQQoQ9tYM/Dugw6LHG8mCs3xRWEOyv7jFCKaJ54tJe1XBKh3Mi+6dNKD0FQt7ii49xzrn3EQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(186003)(86362001)(2616005)(4326008)(36756003)(5660300002)(83380400001)(38350700002)(38100700002)(6916009)(6486002)(66556008)(66476007)(316002)(66946007)(6506007)(52116002)(1076003)(26005)(508600001)(2906002)(8676002)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SiMggRVkekgejAZOsW4ewnmxvFy2rFYDUfRfst5pQiAEKdzUgl/7BoOKrpAZ?=
 =?us-ascii?Q?27CsfDbYa3E1WcodIWt2hRjObmfOcNCA08wnotYs+9ekdG6ZaLMJrp+Kcv82?=
 =?us-ascii?Q?oZZ8G2uvb7HXqWpZuQvlM1gEqCvUE/GJrzKeLE9sNlVPOip4g4NUN2Rwt9M3?=
 =?us-ascii?Q?438oxN35BB92rlF569uYyke9c3pgIXzpBRGTNxlGgtiSm3opJvS9lzIVyIRq?=
 =?us-ascii?Q?SDwCsUy6ulWkRPSUPOFaS4cvnhNvssUfzpr1zFe1Tfeunb5NbhuEO+c+u4GQ?=
 =?us-ascii?Q?zM1JRpI6+5tM6jzkkSwA5zxTZPq6Pbqqp7cuNK2twiQOUcZRwudNB+5zlBiB?=
 =?us-ascii?Q?xMj7/tSdMljLZf6xaV5BQWi5caKZErzqfC+dzJxnmaEOK8aatjt9DDBJvLvh?=
 =?us-ascii?Q?IQRWbIb3kGjNIaQqVNLuOiOG1rZNGwqlUWYnWs29erhb9cZcH5H+91mk91U6?=
 =?us-ascii?Q?MR4P/1VcBkH+8wUcjzr320tLrMWal1LxT0b8ty83gQDLmdOhAY7dhuVNTk3y?=
 =?us-ascii?Q?Biob0lspnbfo+kEdyXP2q8Hxmv0Hx20gJWlTDPWVLblVaG15WfR1WMCuNlLT?=
 =?us-ascii?Q?Q7tLtaJ4IoPkgysmnr4UurvZpbQYQCohBPK6u/PCpfevnC3OrXSMB0k44MlE?=
 =?us-ascii?Q?sqNokenuYgd12hjSpUFhzjDVix9wKPQTTCYy2/4wAyfrVpK4B95mZ4B+K8hI?=
 =?us-ascii?Q?sZeLqPCpDpEAwAk/AyGnd1dQO3geGHcf9wFq9wkCfXsbbC7j5LrZyzak1EG9?=
 =?us-ascii?Q?DLxCMJUxDPFsXVAGmKMdkZ7XBDYGNpseEGJXzqWmb+Wor9bdCksAUOO9vdK7?=
 =?us-ascii?Q?d78ei23mVODztTkUjvLpKBZGP+x7IushdsGYnbD8WjAIgxrXwGvW8Mwv6mMT?=
 =?us-ascii?Q?s3Pf0pwfK4aWPHC/SeWUiLcPOygAkTxSauOM0ZQV3E5F3R6K4qn2T5teYDoR?=
 =?us-ascii?Q?DPJB6ha2cdnL5FoSva/zXBOgLhVih9QNCdlMbGLr7DFWy5qWfRuFTE4VGMfV?=
 =?us-ascii?Q?O0DHNmNCqAYT6FewgcyqR2VFikykBmnXo4ThlO9XehvtUIVWBiJ+ZlMhrtMi?=
 =?us-ascii?Q?2O2YIZgzDtvqHiRG3QZG65UQyvUoH/EXyUZ6G4u0mOMvBfuuDtSCd2GCTPLe?=
 =?us-ascii?Q?qzlLMxqTCzHWFsNtd2OwF0MgUIEhhdUGayFCPT9k0/i7lqRDM6TUvPLJc9Zw?=
 =?us-ascii?Q?yHpCu1bBMXrz8iJDKwxA8fldJiKVFOcq9QkKfvls/2ZDiDwUz0CYovqbD1ED?=
 =?us-ascii?Q?ixNmwwYBdAuA31Evpe5mWS/HUsmx6YztFwu53SO3a6tt0K8QJTU9JaY/akLB?=
 =?us-ascii?Q?nPMInWbjSOhKpRQFEge1v6LW6kyw8KdUFaHBvX9+7UgsEV/l7joJIyOiusbe?=
 =?us-ascii?Q?qDD+oqk19s8c4CjO2D9HpBb7v/DEsEdZi+EZBJ9FMEi1k7vdFIVqe13pyocE?=
 =?us-ascii?Q?X9eecunuoM7mK9rQUyqiwe76KLF7OXXhxaneueknfqelStC5uVs/zNk9nUka?=
 =?us-ascii?Q?1icZvovpyRyyKwytkavXgqC41f472PHB5ryV7cRfmYwPRm5H6FWGYv+c+8u8?=
 =?us-ascii?Q?ij+npG+f7ukMFDdkxG82+9L65hpeF4oNfsyI+RBlrLF8L8uwrD6gdiOSUe0w?=
 =?us-ascii?Q?oLXo49i+baX+mG2E96yatWI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3891c15-835f-4d06-db14-08d9d69b7518
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:49:02.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EEHhXHPhMVSQNi9T7zhgVHSRBqLywpwDM9m1XzEXhLGn1WyzLcKzBggPt2rW8G3JCacg4SMlw7b7VDALb4j6fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
X-Proofpoint-ORIG-GUID: gi0jnpD7mJ5Ft3W9BFw_AFj6kECMv54A
X-Proofpoint-GUID: WoPsHq4oFwguG6Sr0RjCdGkrUvvpp_6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_04,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=564 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201130084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 13:49:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160510

We have enabled the crc extension by default for cortexa72 in patch
("tune-cortexa72: Enable the crc extension by default for cortexa72"),
then the cortexa72-crc seems redundant. So drop it. We also rename the
cortexa72-crc-crypto to cortexa72-crypto. With these changes, it will
break the BSPs which used these two tunes, but it should be easy to fix.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../machine/include/arm/armv8a/tune-cortexa72.inc  | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 4c9add32f5f5..1a20b04483d9 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -6,16 +6,12 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
+AVAILTUNES += "cortexa72 cortexa72-crypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
-ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
-ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
+ARMPKGARCH:tune-cortexa72-crypto      = "cortexa72"
 TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
-TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72}"
-TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
+TUNE_FEATURES:tune-cortexa72-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc} cortexa72"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
 BASE_LIB:tune-cortexa72            = "lib64"
-BASE_LIB:tune-cortexa72-crc        = "lib64"
-BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
+BASE_LIB:tune-cortexa72-crypto     = "lib64"
-- 
2.31.1


