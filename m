Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.79])
 by mx.groups.io with SMTP id smtpd.web08.8760.1608729024519644405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 05:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UvH4/yOL;
 spf=pass (domain: windriver.com, ip: 40.107.92.79, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYb5ylD2devcHolbEm4f7FN1E7Q/fcLf1chAZ8N2k/UpFGMafeqSLYG3ho2AvAa7sY8X/n/wvf8DtKF4OBbNCn0wJDKrq5Q9zhW/+gw4pflzmzFds8GOBTspPpHdDFjNgjFlPM06+QEwOQCtVQncCp1Y6/2bc+cwlgAfmnkGnuTVR3GA3yfBPEBS0Wk3ftAlfWQMtkiiuR+5kHUUuOV219u9HMkaG9tne3F62Pcf1p+uX6AJllvEqmC4Oh0RE8JVn8gPOxBeH6AtqpDDkRkDfe38BZWWVafLB+zr0FG4SCtD5UaPKVDpnkzbVZwQnbKCQp3hvs28NUdI5xbLUtKXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSGvStb+Ti9h9cnt5o9rcnap1nbF3kCkFqneNs1jBNA=;
 b=HoeIm+vhy5KG65tK5UXsSPFPeVznIKuqVLOroLP1skiD4tqGiZWEC61ZB4cvYEYRbgPi/UUzXzvvrFQwMjEfmJNFi7rSGFTTV8EFIyGXLtS1ulMpDUXWWVwLFOEKsaooAfeHwO2lV2MMcrWQuGNz4M5wIGYgFrE6/gOociBCcT81Tz7gt1NMlpHxU/1kt9TNKkwNVDRlNP61jHeLCkvbEED0/wjc4Ms+zTFj6LAsBEAo91nxRjZUOUHGnSAr9eIpwglsNkZcX4851UltyfJZw3NmmLsNjirfOBov1mONHygjC2dQRPhmgSSlVGBTcmaI85RZxMRxgshPzmc/vcwrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSGvStb+Ti9h9cnt5o9rcnap1nbF3kCkFqneNs1jBNA=;
 b=UvH4/yOLuUXOJfbiOGsAvObWFGjhbgHsW5RhP6Az9gv1AhrH4qkIDnkSc59hRN++FNLrHpCnWLnsUuIgJHqQg5YuJrTInPfhMSw6Kopqnpy/3FEEGjseTAM/CABOzWtmmus9jonAgW+23fv/PeUD1WTrY88/MFTGoJGNZePEI1s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 23 Dec
 2020 13:10:21 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%5]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 13:10:21 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags
Date: Wed, 23 Dec 2020 15:08:51 +0200
Message-Id: <20201223130851.20413-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR03CA0046.eurprd03.prod.outlook.com
 (2603:10a6:803:50::17) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR03CA0046.eurprd03.prod.outlook.com (2603:10a6:803:50::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 13:10:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 716b1768-0599-4576-b575-08d8a7441a4b
X-MS-TrafficTypeDiagnostic: MN2PR11MB4678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB467893BB125D73AA2BDFE804FEDE0@MN2PR11MB4678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eMo0o4SzTiVDb/v4nbEQxPXfHPyXtBm4Hit1jax5Q5uaNXJRBIRA/pY/YD1C6UiyFRsmWw/ESsQq/ZFk4Fmn6etiry720mhChONuKkAfMTUiOmv/asMZVxTBlj+ZzLynJbC13s6Fwpo6eOV1qAzAhMC7raidRIS6g+unLFAXcoLStkkYonh+6ltSUXYnIXuemrpwPd+leTlm1iOVIFaC+jonwZvZf5tKCB3jg3FjHDdEfdjwvJ18hF5zXAN+Ue9kil1athJwc1JXX/UOda/eKzvHwkE2+eAsa7MU7XJNd/FifVw6Bv0njyhO1f5E6RozeacwLfD0REgCZqwe+oN3tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(52116002)(83380400001)(5660300002)(6666004)(478600001)(44832011)(956004)(2616005)(316002)(36756003)(1076003)(6916009)(8936002)(66476007)(6512007)(16526019)(186003)(66946007)(26005)(86362001)(6506007)(2906002)(6486002)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?zElrgabzmNHWIM7nB5LGYYcVxDBL4fgiZPu35ehFV3uQ5HBouzgqmWqTmA0O?=
 =?us-ascii?Q?NxA72WYm+lJYO2BtH6bn8XM5VKVwYa0T023G7s2K2NNy4ltKv+iqDHY9xiLE?=
 =?us-ascii?Q?wRZ8177T/8ygTXAqJb/P0ogwpgtxKEzJTV6CFBvR7vH95vUwBZAY11/axRQn?=
 =?us-ascii?Q?RHjWSy/UAVUCCZQPFdCQQW/r4gYAvpQAJis4JXShGiaAsLaQQlmxB4wCPwMY?=
 =?us-ascii?Q?EIpCwIErfW8b+JWkAxZlff5Rllp7gKzA9jJb3d4HlaFKhq7Ph6D1ls3a0/sp?=
 =?us-ascii?Q?Hnby6rE1hMdwcbj+e+NAiTteWkgp08zWJ5Oaexq1GjmBiyyoMTKoLw7e7K8H?=
 =?us-ascii?Q?m9UJY1aSzU3FznwI5ia8daT1xhVl7A+oMw9gOIu28T/87IKiXG7EuK8Rg+af?=
 =?us-ascii?Q?PwMVP1nX0jcTYC4Rls1p2cKOg3rWU2DyQKVRkhfeXhU9GSfdGRVDYcexZSai?=
 =?us-ascii?Q?zeZKavbeTTldd4d8jBHDzxp1/wjnQ23g0MBFytEqqnboOLTZcfgkcLBBHhY2?=
 =?us-ascii?Q?/jYT57YSA6Et5ONzfmQxR6Y9viwFU2seaHJucB04nABjg/T6tegIt8eOUg+i?=
 =?us-ascii?Q?dFW0c06jL0ztOik3+iKDkQSauXLdNperOX4OjSiBxWGYcpmj7Ivp3iYybf+0?=
 =?us-ascii?Q?iX7SNvBVj9Uf16ym9F5RCgHN7UJIX4CIBGEJ5nmwKHKx0X5WqMZjpr13pzSY?=
 =?us-ascii?Q?19MmEcCe1ystkBRg2TbSDYxseBtlTkvf3tlfMex7b41Ab6ywwLePBwb5oKDM?=
 =?us-ascii?Q?s9t9DMog8mZyV+uAzmRncOxXyppq/Mi6urmb9H+ugyU9G6bIkmjKnU6dKP+r?=
 =?us-ascii?Q?R21S0f0soYyPD6p8JQxFiP1Xn7jtsZ8HJBjrrnidJEH43v8VCNJAa/V5oJQL?=
 =?us-ascii?Q?qDZgqnYCR+KSknrD5SbhNiUSq/0H/2yCjpSFt4wPQraT64CI1kI8kr8k/Iym?=
 =?us-ascii?Q?FMnGnjNig29gIy6wRjGt65uhlyyLl0BFudmBcLYKQ1r4n4XM+X/V8wEtC0yF?=
 =?us-ascii?Q?2lt3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 13:10:21.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 716b1768-0599-4576-b575-08d8a7441a4b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVT8xy/agAJPr8n4ReZYts4sVJh58WpwvoHLVOvKrElJaPDmcZ8ya4Dhagg1J9ELvYy7se14tEgKTbX7bATe8ocMknZs6lysTkpZly28xAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
Content-Type: text/plain

Currently DTC_FLAGS kernel makefile parameter can be specified directly on the
command line by adding it to KERNEL_EXTRA_ARGS. However, this prevents
scripts/Makefile.lib logic from appending flags that silence dtc warnings (all
assignments done from within a makefile, to a variable specified on the command
line, are ignored).

Because of this, the do_compile log is cluttered with dtc warnings that should
only be printed when compiling with W="123":
...
/soc: node has a reg or ranges property, but no unit name
/soc/gpu: missing or empty reg/ranges property
/soc/firmware/gpio: missing or empty reg/ranges property
...

To fix this, introduce the dedicated KERNEL_DTC_FLAGS variable to hold
dtc flags and export DTC_FLAGS in the environment before generating the dtbs
(make allows "+=" operations on variables that come from the environment, so
the warnings are silenced properly).

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
v2 updates:
- Rename KERNEL_DEVICETREE_FLAGS -> KERNEL_DTC_FLAGS
- Use "-n <var>" instead of "! -z <var>" inside if test

 meta/classes/kernel-devicetree.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 81dda8003f..d4f8864200 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -9,6 +9,9 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
 # Generate kernel+devicetree bundle
 KERNEL_DEVICETREE_BUNDLE ?= "0"
 
+# dtc flags passed via DTC_FLAGS env variable
+KERNEL_DTC_FLAGS ?= ""
+
 normalize_dtb () {
 	dtb="$1"
 	if echo $dtb | grep -q '/dts/'; then
@@ -50,6 +53,10 @@ do_configure_append() {
 }
 
 do_compile_append() {
+	if [ -n "${KERNEL_DTC_FLAGS}" ]; then
+		export DTC_FLAGS="${KERNEL_DTC_FLAGS}"
+	fi
+
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-- 
2.17.1

