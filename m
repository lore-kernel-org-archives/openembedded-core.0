Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5FFC47DDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:18:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11922.1706015936572730647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mNILX4C6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NCmTGt012327
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=OLdP9IAacWpoOLY8aCWfzibkyIr8I34+mCvMuSg9+04=; b=
	mNILX4C6ecrTbOfvfgV9Vq5nsFlkUxK7ir0Lw3OYbQRNSkwLOZI4QcTpLjjZs28j
	hc4AJ3f+6RfME0GczGDjzoPcQ5hcE+wK807V101e7R+/92/1AQrH66Sj5OVlFrNJ
	H9JtmpRDtTcNXseRl1Gkt+/1LoJMnoYXgUQ2RA6w4kvxoX2u+OIsbXLAOSHwptpZ
	4uEVY4dHEV8gGk1iPVX2goqppfVlnEZRSC5gwYdxY8vidvWaeeQ7WrGEPr3GO71r
	a64whfCNzU1NK8GXJBVV7scKVsYKuhzDf+LWbf5Ydjmtw6GKxlelJegb8U7aSme0
	MRQvguIT51cER5bNi9ShUg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4u6dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezZB3o5ajqd1KRjdr6V/kzwGpia8ilzQTwfLxv3NVN9CtYQZEwB+juNCsbvj5BgJoczCVZ9Y/vgK0vShhNmDSBOlamTN7CldS2fE/+xuR5jX+uMrHgAnoAhnnwj6d1J0depvFz5U9wUIazMTnKFUzIa7pZEKsylRp1ix62anQohJQryCSE6HI25m6pGNCKDc3I/VPk6vV8/Ke0gozBm4tsjBb5Po6dk5FlZh9iXH2luAcYA8GAG0FqClsTSOtQHEBGU0Wf4j4eCih5S0X9m3ndfVw1p4+TnxDzraiWXuGU7oTV1kVgUGkGfhBgMnV0TY4XkhYbuNM3linlX99mZpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLdP9IAacWpoOLY8aCWfzibkyIr8I34+mCvMuSg9+04=;
 b=RW/SLqzAGcTkkYpoxRE5XSjhLpITpkSWlnPCGjAHSrmrznxYodKeeOB6xz9VXewRspWcBnIvESF0qtkGnjbwytvKg10U/6HH4ZVeTJvIl+PAzxZj1oKk6Nkw7L8VTiUx/urs8rlantn79l8TCftqw/cWN4CpttBepbqrnjkLrmpB8knM32T/+JKAcyPphGHDjeh2CuViZsdpOt/jk6PhnARSvmbvmSg3qfDuK6jWrOq5m+MM8p3A6JPrWzT9EbmP5hhG0SSDOG6t5PYL04WU/B4wpp62TmammAqSD6eFWg+xkqlhJgo9WFql6O6vRh2LqLofBBHJHUHj+NFiAFfBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:18:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:18:54 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 4/7] rust: Fix assertion failure error on oe-selftest
Date: Tue, 23 Jan 2024 05:16:30 -0800
Message-ID: <20240123131633.641012-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123131633.641012-1-Yash.Shinde@windriver.com>
References: <20240123131633.641012-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: b5847de8-2911-41f9-09a6-08dc1c15d933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0PCFQre/HxtSYrhyo3GgpK9ddNWM8KDU6zL5tolnrAXrfo0Qj2DK6bMP5AFQe6/fSKcAMonSb/T4ZsPNY3IspvTXhle56n64QTiUW/fokQuJdnNvT5SOvL7YrND79ABmDHXaE6GZ5V/AaF8D62qXX5qsHpzPzkbcDyW1NSoLZ4IEZM5jQidgeimSojquRoXvrJS5n+i75mbKgNRiPO4eU3ukCIiZTddgKV9BL+r2mLIhlhoXmlMabzGW1JqhY6VmzGrveVIbhngBlVI2OIxAhBTkW8pCn47j94vaTZM/Dk2ZYhW6ovDEQEfmnvWq2eIASjRVJbD2S+5m61IgsbnS4GMOTzzXjDraE3Ryzg/hU2Y3dmmJT1ioGPafOT15NdjKhWQqmSVZ1StlBhMzY+zt8fCI8mbeDwQ8KobV/vqtMrOwmlr2OdJd5b29SdmiQYQwmMw77SGOb4Fg9dUFfA/IALMk2/XNOhQCMqX3IDGH19QRpBampM58Wo8HgRpUF77jrxOl2BskffojkPeCzl3MtsDWWf0y4pxU3DckwNLGDFWjUvD7J8ra0eED+PRS7ftlXJdhj3lRzw0IbHVj6gPzjGzvLguFPHY450e3G1KabUg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vRS+eSZbmq6oBbvSchA8dAH+Qae0afFsDSwEiPpjBoOG+uHvNBN9e/icrHeJ?=
 =?us-ascii?Q?Vh9UXhzR/rAcexNzgBNqRsExgCThmLe8wVAKdvEbNmMF7USo9JIPSBey2pN1?=
 =?us-ascii?Q?F5zA8JNA077mAij4fxTPVjEV/R4DxPcxNycexEslwdDp1eTGxodrry28Tj0j?=
 =?us-ascii?Q?EdWtDiDZ04rG0LIHEL5eV23/q8/gRZQhr8jRyHKFZdOPAxel5RvyZWzof8+u?=
 =?us-ascii?Q?VJkv6n505qQtx00hUceCfV8BYIc+4Rkw85QkmJJ8sl/2kb07S429Xn9vlZpT?=
 =?us-ascii?Q?7KVai6HR8i7/IrLU/nTz2Y1cpww9Kr0rWOg31/H2RXFgcYydWtmY1j2m7EdH?=
 =?us-ascii?Q?0MJSbTMceWgP8C8RFXhxB/fRzlGZtxP0UHngJcdrxvg6nRS2q5+nbC6MQyKl?=
 =?us-ascii?Q?51/Wx7aIuI69XYgQsQkp7EaFPS6vO470XLUnS5jBifTGF6UWYCBC3mYbxpbt?=
 =?us-ascii?Q?rrRtpfvcYy5ZAMEzM8Shjphwcc+4Ie0T/kSrEhz3QJt7n2boOnpHttQwbVK8?=
 =?us-ascii?Q?N6+bA57rOgTv8HriVzcmGp/kOz5LWN7l/mAT6lyhvnff21Ssh7B8dX/O6UUs?=
 =?us-ascii?Q?+pwzQbB8WcgTk3pRR26rYl+VOdqB551Ei3J157Eni2/qRyoH4iT6Czsgs4PD?=
 =?us-ascii?Q?vamfk7uYXoDPOJRWrP+FguW5yIsFm5rRh7QItIddpz8hYrYdif8EIRLEK9VK?=
 =?us-ascii?Q?muyJ0TPR2TBVSuGFMZigoCjAbxFoTNy/TnL7oOPKYKumSgA4Xv9vTY1pL4+Y?=
 =?us-ascii?Q?Jw5hyJ1qWVxwQh1chNmoTwnNSyXR2mHX1v8E6vGq+vTDb4EBsps10cNSmIWI?=
 =?us-ascii?Q?WXThgYOUYmosvaIp9sRJEwB9Quwp7w94piC3trVfk/bGopZZMifH/A3roeau?=
 =?us-ascii?Q?Ziau9uDKy89IIbyxFJiwQsO7dQuUbwTzucCct9rJaAWdJtTINROAcCgXsgjR?=
 =?us-ascii?Q?3BUjQrDH9gcu1sUUzqN7n3+HpcO9pBMdmk0Fd/qaa0bauWJnWixB73sx5/Lq?=
 =?us-ascii?Q?8E5soC33yS0MK1EN1wT/nMRLzCwjn2AU94I4mPBXB4WTdF4pX0vR8hB+TwS+?=
 =?us-ascii?Q?nA5Z9Pdju90/A97W7SLH7NSV8E/lzPP5l3rPQadHGIHxE9ZGV3sHxNrr9TZz?=
 =?us-ascii?Q?cYUo6EmN/D7E5E1JKgEJK+U4oKVhYBCjKnvQAIb/5y7TkIW1+ab9i5ZYKFCM?=
 =?us-ascii?Q?gtn94a0+1LUdXmW9IVpqEfyzAN1uuIJr64Qfyk246FKW+f4hfSUC/yJyaKEn?=
 =?us-ascii?Q?YQLb5JDnAeuPP0jupVwvmJpDM81qgxI77mieZOHZxBB8xHzxic1w6zKqw5cR?=
 =?us-ascii?Q?jYKmbj3hHgX+Y9tE9JQYL+zoZszA3gzbKhHqbTWXZjacIqJF3izzxL7IUJ2I?=
 =?us-ascii?Q?xG3s9wFRQDaVRm2EjBeLA4r8T6Piwp9R0eB4JhWHm5jNibPXKOGSM5mI+2UJ?=
 =?us-ascii?Q?CuJIanwkXh31ePyw9SAq7iDLU39MqzTQTfx4p5VDLjpxTRq8H6zc3JQ13W6x?=
 =?us-ascii?Q?pNOlUS2zzZY6wJvwUszc83b7dHfFoxCnSPcexdt1bxxlItrDOk3BPQdhZfpR?=
 =?us-ascii?Q?MZctiJsjZdxOExIN1rl7nXwAAST+78kl38uT6jctV16yvHcuiScUt8ibrJcC?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5847de8-2911-41f9-09a6-08dc1c15d933
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:18:54.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88L9tjaJmsBeVlVYD6GHtEr0UxD3ljDmBxU2S1Y60ztfdq3VAG1VtuINrQry6mbg0WoXPdN1Nho09B4Nlu72hiIDvy19g7//cmdt/vn4ktk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-ORIG-GUID: S2AjbIA7gLedCDB6NR4W2RMM1tGTxQRL
X-Proofpoint-GUID: S2AjbIA7gLedCDB6NR4W2RMM1tGTxQRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=817
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194231

From: Yash Shinde <Yash.Shinde@windriver.com>

    Fixes: thread 'main' panicked at 'assertion failed: `(left == right)`
    left: `x86_64-unknown-linux-gnu`,
    right: `x86_64-poky-linux-gnu`: Cannot obtain compiler for non-native build triple at stage 0', compile.rs:1474:13

    Add correct target value for cross-compiled targets on stage1 during rust oe-selfest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/target-build-value.patch       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/target-build-value.patch

diff --git a/meta/recipes-devtools/rust/files/target-build-value.patch b/meta/recipes-devtools/rust/files/target-build-value.patch
new file mode 100644
index 0000000000..23e8c76801
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-build-value.patch
@@ -0,0 +1,26 @@
+Add correct build value for cross-compiled targets on stage1 when
+bootstapping rustc.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/b888e2f82b9dbe81875f50d13adbc0271a9401ff]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rustc_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id = if suite == "ui-fulldeps" && compiler.stage == 1 {
+-            compiler = builder.compiler(compiler.stage - 1, target);
+-            format!("stage{}-{}", compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. Using `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stage 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build = builder.build.build;
++            compiler = builder.compiler(compiler.stage - 1, build);
++            format!("stage{}-{}", compiler.stage + 1, build)
+         } else {
+             format!("stage{}-{}", compiler.stage, target)
+         };
-- 
2.43.0


