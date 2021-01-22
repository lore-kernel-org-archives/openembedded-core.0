Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.47])
 by mx.groups.io with SMTP id smtpd.web09.4706.1611290696735499591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 20:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U4Hwnkjx;
 spf=pass (domain: windriver.com, ip: 40.107.77.47, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6gKj6BOfSTyHNPcxxiGOaqwfAwH92RE8+tZ159VSrddIqx8RbYrdB+C++WD9Otl1FNLlS9qltjW/CoVOoQXHzSmEsfX5dTx/OEhEQvD38eTm1RbdjSu0UkTakA5VLO/dPIY39zYRtNZXptK+lk+x93s98HgJiy2RysUeJqJGKS7kgoTEzlfw8Mhg0WH6P+noZqWuhGaLO8zeCJdn7nNjZ1ml2GpWnB+dMZWD9jLlgjorUVIelrTHkO9qM6uOwL5ISFIkEfpVUQXNgtmCC1ethnc24wz7mdw9cOWN24cnQa6L6dyyBUCeSaxaJ2Mi2DOsbGtzCoURnbAPbaBJ6HBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubcVkUX0AKPFvQC5iCfmLvGlGI875s0+LAJ7jhrk1d8=;
 b=HUlLRCvu4WS3ommlpShvCAg4OyFD8HAK4qRVD4MaCvdiw17+EaO4Lm2ktgT0E1cNK+TVam/dAR8DidGfxtfa9wfY8V/+nXOXgNxSO9uPirp2s9eCCS1DhaJ1xNTu8zhwn5iIIXC7d9Q73/VdIZP907LkJB3Ol9uf2L7QqmSXyXvObubF6yf+5WV9Hcl6/YAYPUUlMJTKQGscXufVuDuDmCHh8T15sp4Odqmc0kYoWjWrZuhXsKA6EwfV5rliUto6rIB6Im9A1YEj5pzFx/C2MtLnKZ4AwKdKX5xi1Q8mlqVfNw8lSzcp9CtEAD2f6HCQZmdsPgRGXsyU0KWz/VK/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubcVkUX0AKPFvQC5iCfmLvGlGI875s0+LAJ7jhrk1d8=;
 b=U4HwnkjxNdXcEI7DdmdfueY4aiF3NrFu0gALEFMurrx9o7QdLLviEWYhCHT9dJrdptug9zVvIMRMdb3eEiiVHgffgZlAgOQKTuFv2XAiX03yafKMTJkEsgEV/3aUExsElH8oJ1U+CT8TcbAMFBLNViJ6pNmJg0CPeU1mtH1VT5A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by BL0PR11MB3347.namprd11.prod.outlook.com (2603:10b6:208:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 22 Jan
 2021 04:44:54 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3763.014; Fri, 22 Jan 2021
 04:44:54 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gobject-introspection: reserve less memory for qemu
Date: Fri, 22 Jan 2021 12:44:26 +0800
Message-Id: <20210122044426.19719-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:c9::20) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0033.apcprd03.prod.outlook.com (2603:1096:203:c9::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Fri, 22 Jan 2021 04:44:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76f8148-813a-4425-104a-08d8be90764c
X-MS-TrafficTypeDiagnostic: BL0PR11MB3347:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB33478F82AC847B01CAC01B63EDA00@BL0PR11MB3347.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z8QRAJWx2ay17seUmL2RZ0d0QoicvPne7IU/bg4H6jelVpj/zz4rl25WC2sGCbEqkaaDh8t139sQ2B5q3bY1RUdM84JYqPPxIdTHTsFybz6Zb5bV2VOQpJsXi9P5qOvxaiV4/+RVwIPfz00tAT91jWKZodBHv+/+ZXsB4Z/NSDBwYua9eQJPPRaXb4SdY7mDBGMKpC6UniailBRaYCwYM7TeVBoeG8auBoJei9fN0a0+ZmU50EJebZp2SCNwCT5ezRU/cJkOqQpNmCWkHVWE56dTKbPtt93gKln/Jr+9yvZpkZLLWMwcOZzTdHeddMjMzqI2DovRCsnYe1RviPbflez8wAiECQG7k9AqyUqwMwVKG3Ff6CqYigMGTpYuBnDHrOJXmodYHRgBBXE4yHzSIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(186003)(6512007)(36756003)(26005)(1076003)(6506007)(478600001)(66476007)(52116002)(2616005)(8936002)(6486002)(66946007)(5660300002)(956004)(16526019)(8676002)(6916009)(66556008)(2906002)(316002)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?HUFdBYJ2gXNCEscIAW01LjOzZt6KxSDqwtww6GLrYuVTbdho7rmxPImwbYuD?=
 =?us-ascii?Q?J9dsXjWfMmt+jOWGcBRXrl4AAcBuvANaS88xkqz03uSwuDnpnHQYQ2w2FZf+?=
 =?us-ascii?Q?jHZBe/8/olhN7IBxjxkTFLHkX5FAwfqRVFjflLG8U8IoIDgYrPBs20+pf6Lu?=
 =?us-ascii?Q?6ROyYxi2pZrgezQub4bmYf91w/knuKRaSGEwKnE+Uv2PoQe4rGXC4yt2MYP2?=
 =?us-ascii?Q?ObeZdfogwbf0coaUeSc5rYlV4C914k8zdENpPd+S1nfBfCXaMETxVNsF/vkh?=
 =?us-ascii?Q?TJ/qh5So0Q2BwYbC0OyL84V1iH0CmbWa13tAGwvOxaI0gOLqRyoizyC6hwF6?=
 =?us-ascii?Q?mh0Ox7SdMu6KQzYedYue5yuly/i7Api/ZB+MuoX1hdapSiSvB/FD/iFYGNQT?=
 =?us-ascii?Q?rqC6t0qhfDFa5zBfwVOsVqBW/3w1vvg5isx9svRlY29A6O84stZ8jZ4gc8Of?=
 =?us-ascii?Q?cFv9ztrpY4DoHeZpnTT3PJdd5zP6sg3lARwC28Toj1mUnSyzCPBwCGwEQ9Nv?=
 =?us-ascii?Q?Rl/SMCzFcGB80m76l/iUL1w9wxiDd9sx/lqO1EmQb+tpZf8p1/XyjszQK0hd?=
 =?us-ascii?Q?KkTYWtL4PtCvD8ez3932iYTq1CVnOFOzNbedgTLHs99VE0iunozuK5yeJUM9?=
 =?us-ascii?Q?brEapICCmiK3OvSKmB0Bbv2rrvHUqAhAYSNK4WTKYy/eGWkR2a/VwjaTO1i4?=
 =?us-ascii?Q?P1dNvyKNLX4VAzffh2/OgE57qyPfpcl4curwviX7YyAQAtS7y0nnfG2c6NiJ?=
 =?us-ascii?Q?WR8bDx2sd6qXWJeoKPIP9pO6PJlJMbzhtc4/7l7l1KSap2E3X3h6BxKFChYx?=
 =?us-ascii?Q?2wUdtDuyfsOgstZwkBimAz7M+7ZiI0bG6cGYAj0lH5taX4wZMsixiDj/R1pC?=
 =?us-ascii?Q?oMzj4pVH4or63dhcxJK3mG56TlGItkUCrFhi2jVmWVocDSgarLqRjrv/f9rF?=
 =?us-ascii?Q?SrSZGmT8nqdvdsCyl0n/HXiJmxRmY5F3J+aeBT5mpIJUu9RbzMm8sxBoJlHE?=
 =?us-ascii?Q?7THh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76f8148-813a-4425-104a-08d8be90764c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 04:44:54.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2mhqujSQ6mI2bjj0djfrkV/VG9x4lmIU23zC4h59TQ9OlGarabyiLTwqW+UZHsu5OFf1R2M+jVqYlHt+9RhZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3347
Content-Type: text/plain

By default, qemu reserves 4G virtual address. It's too large.
We've met error due to lack of memory even on a 32G build machine.

So change it to 512M to mitigate this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../gobject-introspection/gobject-introspection_1.66.1.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index ee0ab2866b..6c49fe31ba 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -36,6 +36,7 @@ DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autocon
 # Also prelink-rtld is used to find out library dependencies of introspection binaries
 # (standard ldd doesn't work when cross-compiling).
 DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
+QEMU_OPTIONS_append = " -R 512M"
 
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
-- 
2.17.1

