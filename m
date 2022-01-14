Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6087C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 05:15:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3526.1642137331376666305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 21:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GyFiQA3Q;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8013777a27=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E58NsX001089
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 05:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hKcK7aeEWsmNNHD3XbDRqnLmxnkSWMwmH8zdbzwuXeA=;
 b=GyFiQA3QOf00LSOFrekYkClm5DBuoXlohewbqT1XfMojnfHujSgJdcR63yj16D6XsRG0
 byuoMlJkAzEI7B659LskA6ZhT8KyXp5B9FzO8JWd5hz/IcVjfsZ/pm1FG8/48n8Yf+RK
 j2VzOaED+KrMM5YMBJVqMjSBtwtNyCvyECYy2OOdJv1OrJvDNnaIi1GBMVn4plMYg5x5
 T0C6u74aIcQm0FZZs15A4cu8RrMzoyuF4Ji7yPVzjnkTqqkkYmbu36wfOFrwrVtRr32l
 1y8kpa0nkeKV3CZCGJ93MN85orWxjafNi2Py20+6E9/G+NyjeUZHPkNObXcLeF8wTsj4 MA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf01jc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:15:29 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20E5FTP2015170
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 05:15:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf01jby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jan 2022 05:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkxdA6BgpgMl5HXiViF+ml0brSqhbcp+cFR1n44jq8U8+GLGTmoaia93iD9k2hwNlzMRLBHthfArcra7ocYiNQirrreJUjvoFaLSdlkZ36PVA/QTRlOLZxU/7dbOSdQaeorK/exy1gqT4MBunL+WkMAmGHY7y0iRLsWhKMAK13wLte2T4gETsuyad1BBo0inhPge7fpfpuo/UMX8ELUaKFoIYkdGnNeI3NMp4CTSPm2WYCFjKwKGXcEbJSme3wDAr6RjcjU4IClaXp6O2ziNHN1HJC4bVrRzeield5gyV2Kaocs/UMmXAEsYhIfPq2VOeUGxSGBvS4dsOxlxP0KKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKcK7aeEWsmNNHD3XbDRqnLmxnkSWMwmH8zdbzwuXeA=;
 b=cwqXIcu46kafZRzkWt5DLaDENboNWyFhL/RrM6rloBYeGGPlSh3DsBrn3Wj/1WuHyxLJJilK8ABg4YsaADV3ivj1sSTGaBIeT97zbY5XmtUuH/1g1/XkCGu2kVtdW+rp9aU27LeWL0D0errPIkq9jmnULUQYG60VXd/hooPyKbRQBYq0R6QZtRCc+TEefT/vHcoG9BLv1F5koYwTUSLrdEXDmmpu4rDbF3FZdROWmrBe2VqJTlMgQ58VjnfuHhhnnrPxBr33e/GjKwmvJoWCrNTdrT16o2wV+b0oajFjTDxD7Px+1Wo5iyV6axTx9IpymjE93rM/wZsiWmv4vqZfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by DM6PR11MB2668.namprd11.prod.outlook.com (2603:10b6:5:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 05:15:26 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Fri, 14 Jan 2022
 05:15:26 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] tune-cortexa73: Introduce cortexa73-crypto tune
Date: Fri, 14 Jan 2022 13:11:40 +0800
Message-Id: <20220114051140.472854-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0210.apcprd02.prod.outlook.com
 (2603:1096:201:20::22) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c3fb36-be50-4408-278a-08d9d71cdfc7
X-MS-TrafficTypeDiagnostic: DM6PR11MB2668:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB26687C2CFDAA6526DEA7CCE3E2549@DM6PR11MB2668.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+KuY2zH7JtZ3o7e4zFBsdUNG3wN4735fdooXlGRFW/FoypBsFFgegcz8a+ZtA5BaJ1qs3We1lgAa/2druyQxDEXkcnjad2pVRM1EKa968LgfjDFEaVgl1Li9MhOqyuVBe8O0+6ZjArJD/j/XsM18MEnQcpU27RmocvHPW0L1Hr0j3HP3HzC9Uyyg2GDgwZ9zrB0UBCt1UHs8bYggSrIjNFblKvN/e4OX/BWxJopl74NwRnVkDJVv1Cfsmioo9X7kFgj0908u5bzIu4/xNr3yghN98dCLOxsngBm2vo4V5d5+g0n20rsi+LzMUTCCBc3lYwRcrv1c/BJy7xza8iaYQUait2wsywXhIYLeYDGwnBIdU/2DlHPEoliNKE5na6yhUh3aUqI/FwsQqufe16cptfoxwTJml8tk9Upl9ZPEXfrSRCs1OXgS1ics1ZB4aRoT750c9pnXx4gNtvCfUfsF7MJFb7zoIF/AAtPMFJghiFjVa4btlVi6auRyQ1Xd6TbjN0TfPvAzoVlU5RNcJzJHjWBBdqRsh8LFGmC5eqSR1M8/DpMmyJxM3HXbT4Ab4igX7RDr/lciwcm7exjZ3HpzkCsejG2BcjPhVPa6bL9EBJdVw516OzdfUQVaIfoqnY3I4cjnO3pLXqCVTuMfYO2TWlpdiZWU3fcVguOUW7rVGFxaFCz1xfIm55GNe+EsYP5ZOgbHaS4PXp1sp062FjrLnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8676002)(8936002)(26005)(1076003)(4326008)(38100700002)(38350700002)(6916009)(83380400001)(6486002)(86362001)(36756003)(508600001)(316002)(52116002)(6666004)(66556008)(66476007)(66946007)(6506007)(5660300002)(6512007)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zWkyt7JkKUlTem6VbehO43BUCT5ufqI+Ak5c2dirN5Hx2f15MhpwYqaakfuI?=
 =?us-ascii?Q?8cTm8p6+BwjpYTgjz/oUZaKcbWn8CPG3yriGrzQ2FHHIVKeKraMhCRlki8o3?=
 =?us-ascii?Q?EJ+Cbajg915noCKXDPe34tzSaabMchrj1XT1+no61KEsUU6b0Za46yIy+X8Q?=
 =?us-ascii?Q?iB4fhN3J0npaQPBSWnYFbHzCUX7lZboRFP+D2s8tY7C3rJ3KULGB+XyA/rka?=
 =?us-ascii?Q?PIih+ZmQ3u23YniO4IoCVnBuL83YOHLkvqhDKXSTR8dFT0G97EZyimtH3W9A?=
 =?us-ascii?Q?8RoqBezyRojRjowaXzVYM5VWtbmCacqDhaHmvvX+mRDFfbNiaALYDJK805zR?=
 =?us-ascii?Q?KJO6LyniL8X94g7MLRD4Z3WFTDAzucjElI/Yhobq9CsY2fbl7fO04JGQTbg3?=
 =?us-ascii?Q?ldeWQqe7UKlbRpcNvub/pHgScA97vIXDwQT0qpyXuJwmxPPwdPeCSvn0gdhT?=
 =?us-ascii?Q?wtUg7dmTwVjzkOT5YIQ96n+/Q+wiw4MpKJtQLrj1itCY7EPWP9KIjsXd3VVJ?=
 =?us-ascii?Q?KDtLQQBEt1+/BFQu3tOOyQFQNNHqaKyI+fpx/ZNG6FRpRtFk19vi5DTN+1fv?=
 =?us-ascii?Q?sx3DIYctHho1VykTRgp56LbvUHBUTL1ejGVcrFNk5QWWQPxa6EuS4DeDyRx3?=
 =?us-ascii?Q?OkGNnMa17qTnPeVvmpDWl5blajklZLaJ2D2igd/F3pxTp+Isw9gVvpvxJdam?=
 =?us-ascii?Q?QTkPdiyaqTwLIoq5hQ6vFAd3ARdz2KrKoAVeGB+jrTxlpBKZVxWG9ssGiqHO?=
 =?us-ascii?Q?X720+0hhfsMMRHBxpTBueZ+/Heq81AtLahP+lr97mwJqUkibN01ZTntVMhuI?=
 =?us-ascii?Q?TRa6CuzsjZ60vkHNjInqbdIzKPBfFSDK0elKFik2Yv8RXiLBay+rg+yEfFiH?=
 =?us-ascii?Q?LaUcA48EodBLwaUkkXlfTRPr91aD6CIukIP6/ZXsOFHKBns9j7RRMH3hY8SR?=
 =?us-ascii?Q?7u/JSh4d7l2Qps4HXY8N+aelODXgvvQ2yn6aIWjEJtaBBLj6AbYUM9shEddU?=
 =?us-ascii?Q?0HsiEr44aYfxD7JSXsAxxUBan4/qUc2GINnhUMHlM3U0hTG6YkCukoy5P6YZ?=
 =?us-ascii?Q?iQXDg8CXstnv2/whRx18kRVRKz4eCStctLRelfaE8/5cvGvVkmP23iWg7olP?=
 =?us-ascii?Q?ob67a4bMV6ec4mL+fAqkGA0YnoOs6YpsefNXiIs4u/hmJEQHdHBZS3iZ3SsS?=
 =?us-ascii?Q?u2Bs9XzO81qmFVfsFNivQ1WL+LNVZqfYofwymkoCD2vWLFjqJpn71LxvC3wq?=
 =?us-ascii?Q?O7zR+w7NR+JxKXwGss3JCBLa2c6YjeY2dgrD+0YNmPEwo5BIuqsq8O0c0loO?=
 =?us-ascii?Q?+IlWHOWoBkgZTZ3f0f+bPbBriiOWfCAUicxHGXC9UPU9HH/NW49khuH7d3EI?=
 =?us-ascii?Q?czTcCxMS+FzH92X7jkjRbTcTykU8eqQ4X5BMlku5Zrft6caDrLIkiOTaeLKG?=
 =?us-ascii?Q?mwbD2Ue74TMdJ4ql4857dGk/xkyxoZShBGTZo/5DmB2p9FCTVBocNYPwM2AG?=
 =?us-ascii?Q?IqoLcGeeaBVK26fQMiGrtl+AEoZDVTZXfWQzb1z0GyFuV1MVspKiMboeBMUM?=
 =?us-ascii?Q?K4KvlpMoBoizM5kzMpetBCwJOCv8CMofEBILAIoS3gv9bigaIlciU7BajBF7?=
 =?us-ascii?Q?2XtQ+v7JRpQtsHgAc9A5tJs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14c3fb36-be50-4408-278a-08d9d71cdfc7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 05:15:26.5406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v+7BNvOMNwfdaQt8/6fwyVlRibRJywmcguFDqIYFGvrnEW/E/8DO8/tJMuyenaCLeAQDuRGWxalf382p62Wa3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2668
X-Proofpoint-ORIG-GUID: z_6XnIC-rlD69NHhkRkXpuo84nHZGEGT
X-Proofpoint-GUID: LuzRaD40I5UFqZGYwf59Z_yf8zvgw8Z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_02,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=317 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 05:15:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160556

The crypto extension is optional for the Cortex-A73 processor, so we
shouldn't enable the crypto by default for the cortexa73 tune.
Introduce the cortexa73-crypto for the processors which do have
the cryptography unit.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../conf/machine/include/arm/armv8a/tune-cortexa73.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
index fc91dafb1d85..13876e72459e 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
@@ -9,8 +9,12 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES                                += "cortexa73"
+AVAILTUNES                                += "cortexa73 cortexa73-crypto"
 ARMPKGARCH:tune-cortexa73                  = "cortexa73"
-TUNE_FEATURES:tune-cortexa73               = "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa73"
-PACKAGE_EXTRA_ARCHS:tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73"
+ARMPKGARCH:tune-cortexa73-crypto           = "cortexa73"
+TUNE_FEATURES:tune-cortexa73               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73"
+TUNE_FEATURES:tune-cortexa73-crypto        = "${TUNE_FEATURES:tune-cortexa73} crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa73"
+PACKAGE_EXTRA_ARCHS:tune-cortexa73-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73 cortexa73-crypto"
 BASE_LIB:tune-cortexa73                    = "lib64"
+BASE_LIB:tune-cortexa73-crypto             = "lib64"
-- 
2.31.1


