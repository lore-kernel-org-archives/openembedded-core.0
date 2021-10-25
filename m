Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2C3C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 03:38:22 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.79])
 by mx.groups.io with SMTP id smtpd.web11.27499.1635133102115722768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 20:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=T5/zKg+R;
 spf=pass (domain: synaptics.com, ip: 40.107.236.79,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC39TOjK0DQht39q9XmjjcXfLvqZnuhqm/W7qprIxdznkZIZhAILImbLV7zNg57A1nXITKzB6LGcjPWFurvYKJGaEh/y/3A1dNlU6uTlVXU7VmBQPaK5iIqZZetg2qB2OWZSMXOUkBeohWkjUkDrrwXwpz4/W0qwM9mUtmR8/LTppEnRFJglZI5UCItMB/pMv/ZYE7hJ/IZKF9qJd965Jhi77hAGfnIwxdfVndxxa5YSVtu8TQpgc9yWYdtGwJ6cdemz2xfwD6nmIA1haJJj8v8W2KlXbWGv+PVCm5BHUORSPRVnR4Oebp6I/4Km/KOPuDlCc6kb/UM7/AxyNunDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFyVLtcVzWUioKmsGm3HiqCgJsaMHt1qJswayGHfiTc=;
 b=lI3RgVZIkvnJm/8y3E4Lj71X0VNqGY7x66AmlQup9rJAwLtlONOS7k+xLtof90uMY1wD3AaB7wvQiZx59Obu2590/YaBrrIkBxSA/MIzpWXCd/4jGYLPWSZTzTGO/B8tpkWAwrnO7o/zQVhAJYs2HhXkkUzV8epxpbvGvRZfnuXy0jKY+ILsKy88m2M/5DtUrj6V4PnUpqUHlrWtLd7yyocuYaroxISC9bxycLNP7TsjbmZXT+MyZ0kAcJxzp82U0IOaNaf8WXxc0xGmoiZ3BqJ+I4lNcwl340BbxwrMCEX9YF/I3Mwq65PW72G4u9bVg6vKoKAvuvxgSR51+HbZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFyVLtcVzWUioKmsGm3HiqCgJsaMHt1qJswayGHfiTc=;
 b=T5/zKg+RtMke8eQdRGO5CAQHm5ZUuekkD2wnygo81dIAifZ3YtrFYZh7NV5QDfKN7BCJ0BEbRcjmWBd0vxCaqmJFmuKLKLOPYMtT845cjPfRV1WmNByo+7cTQccUP78l49EKSUiUHS3mnZ8bLeSBX+Fn8dFfCijVBI2V+2e7hmg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4427.namprd03.prod.outlook.com (2603:10b6:5:10d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 03:38:20 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 03:38:20 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: Randy Li <ayaka@soulik.info>,
	Hsia-Jun Li <randy.li@synaptics.com>
Subject: [PATCH v2 1/2] meson: move lang args to the right section
Date: Mon, 25 Oct 2021 11:37:43 +0800
Message-ID: <20211025033744.753260-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025033744.753260-1-randy.li@synaptics.com>
References: <20211025033744.753260-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by
 SJ0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:a03:333::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 03:38:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 445742cd-3217-49ea-5d37-08d99768e3d9
X-MS-TrafficTypeDiagnostic: DM6PR03MB4427:
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB44276C612FCCDE57F99C933286839@DM6PR03MB4427.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aj4HEVj8JrH4ntPodcl1nOJW0l/ar9ZOrekS+haFfyiB8A2UWTDs8uEt+352LCTEOWDzqagWTrvzzXHIVA08tKJQWt37BOcLMrT029hJ2Q7g1Gqetr/dR6NoHr3EfYeMy63p8HWmxDQPitE9ANYmkLcQ70oOFhcnuVMXVRDInVmQwMIFGVReh5RmRsmxarpToU1ywlzWL3K4532Z0at5ZnHvICHltnb9p1Qcbv6aOCG+mStN2q7Fy6NTbseX2pKyWnoxhC1hYYVJEF+hxtUhC7Ir4Cy9B9d549z5NI/vG41dpKMn2ufQNnEmNe0ZM5kEWnFkcdT4lfKgTPjm1mrEg0q3OUatc8Moi0zS4hedO9Jl8RD2/baehjqKB+Y11aMwQUj9wkQI7RFhh2BNU/eVePvwenMrv2nXLlCDupLtvTgqPW65DijMspDmgV/NhC9FeS+XNcEwzm2f/kLukhL3Awx84G28+8RvCrL+aQS5IxBO982nLaayo3DI1zNCTESWuotm/xlNjKkrv1NknvEBzkexFSud7cgX3n4DamLGaHMm7zdkpKRDOebJPdoM1CqrTkYuomz0gq+9rSb3RpEM6Xjd+rGivSxPvTwhEegnaaCihQHcuVh6foPGBSlF8m6220MQ0XvhFMSqPAVagXdDScAp6ZY2h5LA1SMVnnWK++yCVTs7DU4bR4wphJU8yt57IqD5TDn61XGu/rUPpR+jjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(52116002)(8676002)(956004)(107886003)(8936002)(7696005)(36756003)(6486002)(316002)(54906003)(2616005)(186003)(26005)(1076003)(4326008)(5660300002)(83380400001)(4744005)(6916009)(6666004)(66476007)(66946007)(2906002)(66556008)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0dtHBzUO1Hljlec/OTC0cUzt1g76sr151YfSPNmyvxDGc27+w5yJ0JlrNKYV?=
 =?us-ascii?Q?JpdGejMS/wrJqvqC1WXaIpjilLC2/d3xBqCfFLX8pMlDwLm7s0goAfm/32JH?=
 =?us-ascii?Q?iM6MxGfY8G0Oo5P1973aX4QtAptsS2nYKhasdisBgdXPbY/9npzn4QfgT+wj?=
 =?us-ascii?Q?O5MAFDuNSBD+0EzpfxSIlxSi5VhRAKKsulH+DnSTJ+GQduHz1xP+POCoqM2q?=
 =?us-ascii?Q?ALMiScmb32qF0qlx8ET/X3MjPEMlAmrg5l9xn9EYMD5I2BBLx1w4hx3H0qs4?=
 =?us-ascii?Q?Q+iVLBwEVAzCM+s8UzSaT8g60VeGfSp66/3bIJ1Rs4xx26X6/sbUNIiZc5y5?=
 =?us-ascii?Q?BntdBp/XFq/DxrpjJDzTXZcC/tRHGeHN8oy5eYqXBfAX9BOzFlQRwV8OjIlz?=
 =?us-ascii?Q?CgTUu/Hsh/Z2iMvX5cFo/S8vW5g3Mn6y+ZQaeXZ3DM8YGAw3SQfkTI36kSjR?=
 =?us-ascii?Q?U8U7xdO37f0TzsaDvsdXiDvhaymwZR68NylQy6KHQSv/Fl0hpD/uu8M77NBu?=
 =?us-ascii?Q?lBMZjAco9xEIPPKAWCwA5k1AePnsArqT4I4QrJ4u49Wsq3D3fbUa9M90DvuK?=
 =?us-ascii?Q?3Ysq4IB/3WDtYsMWsZL5UHm+lt/LbCXhUWIsOtHlE/9XN2twS4biaRw5RWOp?=
 =?us-ascii?Q?7hv2nLeylywl71arAS8c4C92OKq3ExcdCNaKas5RZdgAWIT/oidijm2XBdFB?=
 =?us-ascii?Q?8JkIs0RuX8+RBaCyrdBes5PFgRc1+noTmWZMNE+kdg03uVrVwAi5ibuxk4Si?=
 =?us-ascii?Q?L7a3fGZF875RPttLPPoM1ZEWE6WpApM3m4QCZMjoWk4qZ26QRtyBoqdyouFx?=
 =?us-ascii?Q?fcJ0APCJjDLRfumhmizwAz+OcokCHUn0iIi4v1lD78RR89q3amTVLu/GQ4L2?=
 =?us-ascii?Q?L3UcwjmQL02jg80bnx+jVrD7UteuUAgWZfXfaa5Pkt+xj1FX5oXfO7b7vF5j?=
 =?us-ascii?Q?aGLJcgqVRK6/qsyYapL6qQxTat8qe7scklATS43ev+PZda3caF2NMVdu56VN?=
 =?us-ascii?Q?w2jYV66p8XBclUj2CnYeI8oz2bJgsiAXP5bJppSGXaypd1Bns1J85gDyXUxY?=
 =?us-ascii?Q?jMbFuj3Ex/fy6zCmS7+5lA6Qox1LYMumJVaJRIQ0xnQjtuk68Mn0BenFFI+d?=
 =?us-ascii?Q?47VAo2S6USoGVZ2ksEfxJteNKYHmqaD9SL3aGLK0uWkax4Le5HuzeN4bCq+m?=
 =?us-ascii?Q?+BmCzIzbEj29sCG3k+fKx7iJAv9d3n/ZKkBE2/QHtacG/RSN3GUfc2QtTF5S?=
 =?us-ascii?Q?Bg2dVShiBD0Gc+OsCN57CGEqunLxaWJtJevMaxEd4LNQQXXEC581TqzJlkeq?=
 =?us-ascii?Q?c2L4RccbTsGbeNMvM6GXtbppNEwoWrjR4cxglEpkpGywUaH/4qrfnzflVT0T?=
 =?us-ascii?Q?FBAvQzPDankEoVdVVIqvQ9W85IyZIf/RqxrqgSdJEDtOJU/2k3Io47WeQHNX?=
 =?us-ascii?Q?JVf1Rtq/bSGd6FquVv87nidbgWC93ahHrMlqvQZE3YCDHbBpVJ/Dz3WJ2lnP?=
 =?us-ascii?Q?n78SgV/a89j3qZ2jgwwYpiPRXx/6NqIg0Jpzb6D2s4oQHX4gq+TmU32UOBsf?=
 =?us-ascii?Q?lqpUcKmnxrty2wNSEq7pPLjKthpnHT7IRcmbmRXjkplSE9VNVmHD13Virn3U?=
 =?us-ascii?Q?2F2/eVsgh8XSqFmkSiE4Gjs=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 445742cd-3217-49ea-5d37-08d99768e3d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 03:38:20.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AO83pE9A+8vDkf/h2HvU0ULSP34GbENHa436hZv0mk3dPJ4QpFXV2UYozmSPnJ4LRBMre/YQBtRQFH1dTrV8vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 03:38:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157330

From: Randy Li <ayaka@soulik.info>

After meson 0.56.0, <lang>_args and <lang>_link_args would be
regarded as meson built-in options.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb b/meta/r=
ecipes-devtools/meson/nativesdk-meson_0.59.2.bb
index 0e76cc7..5657397 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
@@ -24,12 +24,14 @@ nm =3D @NM
 strip =3D @STRIP
 pkgconfig =3D 'pkg-config'
=20
-[properties]
-needs_exe_wrapper =3D true
+[built-in options]
 c_args =3D @CFLAGS
 c_link_args =3D @LDFLAGS
 cpp_args =3D @CPPFLAGS
 cpp_link_args =3D @LDFLAGS
+
+[properties]
+needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
--=20
2.7.4


