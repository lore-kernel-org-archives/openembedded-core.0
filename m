Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web09.20575.1630924314751014182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 03:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=Bda1iXSI;
 spf=pass (domain: synaptics.com, ip: 40.107.236.54, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA6STCfBj0YrOT3oLhkMaGLphScOcOkInHVZIaJozOIriMPrLCPAdx71GS/e16vbYQl5znDFMLZyL+f/scGKB3TnMjp2ejEgFvYsrPn07SqyJ5Diwv0MK/9LKG8gnei2YG0Q6coATf2cJIbEAoEfjhOlu9SHK1mY4WvG3F6TnondhJPCotGE3TD+38iAunNhl87lTmBelMnNkkq3q0vySp+LRRnwv8I9DFagkLY1O5O4Tgb4ryLhZXHlU7Es5vGwKnvyV4NP5+qiKcxTU0RU1z4ZNWBaBZU0WnY4ZCPZ8SsGR1y9lm1/BIZwe/HiOf0GJ6cZN3LeTGFAAJ+oCCkiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=33xTmYBkrheggDdVjwPL1MIKRA2dQmgFI7SfzG4OB3s=;
 b=He11Zqn6xSF7lyz0NYbBA7w2/Hb+g/NKVlqD/2bpftOunAMgwarD+t1HTUo9cHt1S66VlJDMFlO8FBDbdzMMzbzsjZ1eZ6gRqqli0By6ot7bvmq/jPiCQPAbHnqaCW7t6mgX2MFTHbrKNhZMDhwajL6iT0U+s3Mzzi8yeEyROfVm/vOAgekqvkz/SqM+A0EsIWw4OFI4s1pVXjdcxLzzV+G7/2i0BzWP1QLq1ecVdoQiA/9RuhB+lA2WfZYFCVIliEMU0uHbGVWbfKPIq7vbuy8VvByceaiy3QzELaDk8RXS8aowhkK4qqFLdulntxnVJ39sjV6rD2ZgQRI8LfzO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33xTmYBkrheggDdVjwPL1MIKRA2dQmgFI7SfzG4OB3s=;
 b=Bda1iXSISjLn56pTzaPHQVsmOGc4LqvIpON0I/SPVw4VEyJOVxG87WC2CXnFzp4GRq4+zK5VYbaN+xvcYyoVKgeZxCkzA6bhHnQit4mR0HQIFZTh1eU6/+4Y4L+MvAKwTI2e+nXwgJWSfierdYYLpSc76BT4BXEimsUgj2sqsJA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DS7PR03MB5464.namprd03.prod.outlook.com (2603:10b6:5:2cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 10:31:52 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11%8]) with mapi id 15.20.4478.022; Mon, 6 Sep 2021
 10:31:52 +0000
From: "Hsia-Jun Li" <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH] cross-canadian: make android pass target sys check
Date: Mon,  6 Sep 2021 18:30:34 +0800
Message-ID: <20210906103034.95057-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: PH0PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:510:5::12) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: Randy.Li@synaptics.com
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by PH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:510:5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 10:30:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: def886ed-f420-40e5-2161-08d9712168b4
X-MS-TrafficTypeDiagnostic: DS7PR03MB5464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DS7PR03MB546481CA56CFC105C0C1278F86D29@DS7PR03MB5464.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q/rRkqDkONcNc6wzBfpjoeJd0moSVU1bR56mKx154iAANnQm7IYfnbXAiXXF85AxMECgAub6UsnET4GrkvJxOIDBRrbkikXhUQR3a8OXAAZyXeenhojTgnY+twC7LjY7GfjlFq4k1xl9nursZsWliXxsuz9LifEVT5o/XmRo8CaukIVR5ot36Qa0AHWFRe5KcUfb1LorZhNkcddHgG4qIiORWPWm7mwCZMoV0okyQ2GrbqH5P0NERZFjugGSkCMjQYaTWMfvun6Jg/K6i1yCa7EnGipT9E0c42m7RSz2iY7/1UlNjkjysWJN1mZ5XJdbBpKZkHkGRcdhcy/SGlN2tkk8KojLcNQt2lQJDfqLojj/t9YpVmgBnA2ovsriEOnB3mXY/816GVnIR2uBblfK30RFMHiIxAtZgrUoirbr5DUgeVvuqWJNYhKok0gEBKiICNnPpa5SQSbm20GVtvwKizXx6Y1Uc9x28M40Raxxy0PfJt67pfw9pNlclIfiLXq/edeOXYR7cUZ8lqei6HCxGS8OLUvUatfss+BQBYc8DHhY9AJnyNmvYE6vMnjz3cu8Q5HxC4q4j6YbknYzmfML+X9ygaTIEO3NPnmbGGrhwWuaOXs70vgLxuxvvUqDkd7wua5OHF6jD7naJY+iSeP8X6x4ED2C6slJUcVwAd1kXsFk4pcLPBlV81eAENgCV1LV7xuu5mRjCwiyBp3xPW7GdQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(346002)(376002)(396003)(366004)(8676002)(66556008)(6486002)(26005)(478600001)(86362001)(316002)(4744005)(6916009)(6666004)(1076003)(8936002)(36756003)(2906002)(4326008)(66946007)(38350700002)(38100700002)(956004)(52116002)(7696005)(186003)(5660300002)(2616005)(107886003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bQMLy5wMZHJnT/dlJsz3D/F9g6XF/tGImiIC7UijyVTBJe1iBWTqYKEqlULw?=
 =?us-ascii?Q?Yg9B0pAw4Jvf1PmESskpIwbEZJ25YVJRq77kiB7D+bhRTC8S2WDdqRmhre7e?=
 =?us-ascii?Q?4e65flzcEN/g6MhVYmc3U6dVg3JR9lonUdp1xSwwrzdGIAp5A3l3t2aMH0VL?=
 =?us-ascii?Q?R3fvWTWqjSwJfCatMCxm0PcafEceje6FnVhSORbyxa/i50yAt9bWdLKfloSF?=
 =?us-ascii?Q?K0PjrbRbsfnD3a6O3k30pLpQlFAX88WGKQlusOo+n8jReuqI3o43x++kU+3S?=
 =?us-ascii?Q?3hzg8L6+4ZIWFG6YhJ2tS0zoGl/EMjvwmrlqW6loer+emv5sXIQVKnkPGSuW?=
 =?us-ascii?Q?Dc4xglE+OEQuS3gfYlwy8ZpzhAoCUpRWy1OylQrUy8HIUIQg9sPPnxTA0VVB?=
 =?us-ascii?Q?APfDZSJiPblg6ux4JAaySak58rjXT/Rc3tIYZ9FPKY2vR4c5LbIQr7GUdcVe?=
 =?us-ascii?Q?fg4O9VZXYiYMaowdCLQGodCMqRlCmCusGAZR5OhzW0YtlmQG5K5AU1yUgfWy?=
 =?us-ascii?Q?Yn02A50Q5CcpEjqy8j/f1ri6XmJn4OJRed3itX+V4xSOMuebNEagtlTySUoy?=
 =?us-ascii?Q?QTXKsapOMzYZZACS/Wn/ViZsEk6EAHpkBsA1di1w9gRE/bMm25tBwDJnMLiI?=
 =?us-ascii?Q?VDzuyhi9qrlXXAe8HydeDOwcr/fYiNzDauRWCQj40CzCTyGkO6hw1CUikrKU?=
 =?us-ascii?Q?9SV8tQ1eRFjisiKMzSCiRaRg2vjMX9EleYlYxNTxNDvx0UIw9O+/sNBDHM2o?=
 =?us-ascii?Q?C1gHOuFrsAk5DtfUNRYRTjVgcTCfeS5Yly+5ms7dXxRygn5slkXCzLT2pvFp?=
 =?us-ascii?Q?gb3FfPXeVChKRT+7kX0gsngoX2pVsmFy8qoPtadEPYnrM7h7vSy4BZqxPbuT?=
 =?us-ascii?Q?p5CuUItinypBP9s/yDvRBFZ8IbOpDOokFg5KR7BCfZ4J/L/MWnfu9Lc7JFI6?=
 =?us-ascii?Q?sBnaXQYK/DADCsG9zhHWgP2MxH7rpJXYpqGrsnfNpJKkIiauT7Rg6DciUZGh?=
 =?us-ascii?Q?moRRa55dz74JnURIE/VKt41kxae1nVxOBIk2gTuTOBarptJXJ8lRDBTJu3pj?=
 =?us-ascii?Q?l1fp0tehqWsvdeKKlOmvDmSlSXCFynbdF2XCdE/zZmX0Jsuc+678XzNOIzVm?=
 =?us-ascii?Q?xlyRgbQEzk8BeY0Do28ZtWIsyI9eqZPQY9VcWzYiC437e4BtjmLLuqDgfaQG?=
 =?us-ascii?Q?FA0K+d8IG6uWLJDrf+rKA7b/3QnaKUy+FGk57Y/An99cGn7WDa9GpvpezVmj?=
 =?us-ascii?Q?9ybWd4zbD5UnurutmQ8tmUMPd5khkwc1UCN+yhJxF27DMxyQcP1hpmV1rlPU?=
 =?us-ascii?Q?jyBlLM23vEQ9p1PFy48RfACF?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def886ed-f420-40e5-2161-08d9712168b4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 10:31:52.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsriYbsMm/+em4PEedrbwz60m/LKb0MUQA/Qa5QX7fRffmk2GyZ+KKvvgTLjaNTpwu+Rl+66upYEFfNO9OH6gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5464
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

We could build an Android toolchain but its triple should
always contain the string android or clang can't link
the right object files for it.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/classes/cross-canadian.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canad=
ian.bbclass
index 447a2bb..ffbc216 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -40,6 +40,8 @@ python () {
     extralibcs =3D [""]
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
+    if "android" in tos:
+        extralibcs.append("android")
     for variant in ["", "spe", "x32", "eabi", "n32", "_ilp32"]:
         for libc in extralibcs:
             entry =3D "linux"
--=20
2.7.4

