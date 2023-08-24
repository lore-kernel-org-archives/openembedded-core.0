Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050AEC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:41:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.134])
 by mx.groups.io with SMTP id smtpd.web11.10994.1692884476446218037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 06:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=V+jTZ3mZ;
 spf=pass (domain: prevas.dk, ip: 40.107.7.134, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlSuZE89ui0GA4N99ouBxahL2iv0GtPX0vU6UE/wtGNCIvP81cAR7yWAkBrXD1CNdRomMt4SFO/VLcWOFqDLja/koVWwfx/oMNRjPH/cauhKpHhDbfpla8pbsfdekQiVymdxeFz651hoVWeLdYzKGwMWh4Fnt+dVj1fDMsgdXrQopyHctAyUMFKk4n/RvICiYfQvog8wexTMXyMQTk6vAAJOu3jDIV7qec8DHTtkBe1PRUYYk2wX2A5MKHty7hPHEJS4nCJquXsJccO8SdpWY2M5KSlr7pHducgtHMoOiiWOIJA9nR7O1vB84JjZV2M73DMcpev9Ze1R9A0k9Bl69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iqvZcOWlcp4ZfHJV0XS8n+LXbXMHz8LUSS3ZH7t47Q=;
 b=GjGGEQm+nEDz0FJv8dAIGNbpSGgg2hd9tvHBNqWR6UHPx/CPFMyZJkPw4J44d5Vo+vMIHOCj0eBxYH04TVgZ3WuPKMoYuzRJ7UTaz/PgILwfIxKJbWoSKmKxGgYAfsI5UjAfQT2q79BLqmcygA20mbdTc7ChK5gIJ82OiQBDukLZjjXRvlCbTyBWxNEHFUCTm8P/HbaljVdzPIDTFCTdAAt9UtSCaTV400LDN2rlJzrS4uS84cXoynMwVEQQiwjDEN3EPEOoo32/YMADMS9ctKt1oYcZAer7pVkYMrK/I2mNA+oG8C90QH9kSQk+IPB+JwIsCmIqczHVQ0OY7AnIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iqvZcOWlcp4ZfHJV0XS8n+LXbXMHz8LUSS3ZH7t47Q=;
 b=V+jTZ3mZQCc29ZFhtr6fDb5GmNxHkgxu+34UEV+LX18GFQQcc8oZ8fR0z0G2DD9O7jZOlul6gSrthJ2uhtOYcHVl4lEs+v3uBG6oYxKSjzRprq4qLSXwELTVNKSnO+7kLoKzVxQe+qw6EZniMcjpzRncR/+Z2KzBTUNxy9l847Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by GV2PR10MB7534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Thu, 24 Aug
 2023 13:41:10 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 13:41:10 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [PATCH 0/3] add missing CVE_PRODUCT
Date: Thu, 24 Aug 2023 15:40:58 +0200
Message-ID: <20230824134101.41906-1-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::10) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|GV2PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: d4dfc703-6476-4959-2c56-08dba4a7c680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YiV1waGtagACCSl6cpDfUGg8ne5rst9F3uGdh1TMLjOk8+9Lo9EIR+zLFOolY/f1CcyVg0Uesi8k3jpWQVbF03ZhjjzT/hx1xRB+lMk+2Rm0zsVU8oKFM4USYcKgG7u0hdhcDG+OHZMGoBGF08/jcZ9/ohe57ENkS9I0pcgFy3pAhN368T6n89bVRw5yGKLUGTXtHWWmdDShc+GLbMCCPEtCp2iX50aBRAkjgNF1xRVKNBxy4FCkBAUmvl3Um7HHS1De9P0fc2Jn8pgjErPWI3TngcRrZl9a2UiSzRds+vHSLXuONMkLP0vBp0+122UtYbf88Yb/+HNsY6gBQVzwy1r1qM3OflYsQljkGJUhrxHHObyOHzJcSqAEQWFLCPAcPPSk7+7riefENDQDCjZsdTy2FJu34cgK5DVA4x5FcFmHh0SFlPdYjHA48pnD7cYfTeOLvh1mWQveBnxz1Vf9f1Ki1X2ShPz+f4y1GofKoub233WxkFPnr2f14QR4AR29lIzeFPJ0lG0mTOE2nnZOtoJmSAInpKcGDRnfZxwfruq05cqqw4phRk6EoajDpXwbeZFM/xUceaToCsgGj93+LHFngHVkR91riCFmqlXQI/iDDpz1yuwHRfP7dedDD0x3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39850400004)(346002)(136003)(186009)(1800799009)(451199024)(36756003)(83380400001)(52116002)(66556008)(41300700001)(66476007)(38350700002)(6916009)(478600001)(38100700002)(66946007)(316002)(6512007)(6666004)(26005)(107886003)(8976002)(6506007)(1076003)(4744005)(4326008)(8676002)(6486002)(2906002)(5660300002)(2616005)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wXgZVcDgjiRjAVo+eI2wX0unU5l88lhcle7/JRpOclk3wOIJNjmiyF7tHPtw?=
 =?us-ascii?Q?X2iP8TJY2ZPUSNhtiX89jMDndx6T0uBEER+QhFNbbG7LJafxJAQ9uFDru/8p?=
 =?us-ascii?Q?monHYbvdNT2e6veMuvrojCh9iSWaoLyspgsrATjIm5O7SzKWTddD8tmo9aG9?=
 =?us-ascii?Q?xpYqhCJTnX8CkF918spXtj2h+rJT+z4gMK861hXBtFwURCxmEtWy94OzJb6r?=
 =?us-ascii?Q?LronRTqR4k/bxNCeyxl5JkKJmbgFH712cndfhM4il7RFTIzso3D2Xo8AUnn+?=
 =?us-ascii?Q?uL+UqOCy5TOIjOEAteH98EAVuj0PmLuQ7QqV2+LtFR/tj5hmL090wBpbN96j?=
 =?us-ascii?Q?IB9R6ubsZvdQoC1pw/H6u+vlLjhJiU0AWeKRe9iPqdG8sYLqqMO11dL5mq6i?=
 =?us-ascii?Q?kXv37x1fmy5x5xRXijKIopBPscXSxSgSZu40Uv8NrH6jbv6uw40H9oFSv7TI?=
 =?us-ascii?Q?i/3acXO1RTQEhJVQyWhrT+ZX8wZzoeHUd33HdH1Nh7o2MYeOBRUztNHez/OV?=
 =?us-ascii?Q?f5gKuPIELr1o9aJaeflMJKHdnb9JUdsGBn82eLZwnmoajT/P7xuQB84lWcox?=
 =?us-ascii?Q?t7wHjpsM9FxSKgc9ctVPhJOACUauLin3cDbzLpmgL+KayJMRV4TuBLuOpKJI?=
 =?us-ascii?Q?EpkO3/jm4VyEYRxiYs1S3bDGoqmhFYYUggF2Q/AXU9zr9nHYUH5lnBFldoHE?=
 =?us-ascii?Q?p6EKP+IB0sq2WuSFJpUug2GvzAEHx/ZQkT+84dvsX+3LuIk2VQ7C/u7HPpM3?=
 =?us-ascii?Q?3vue7jsIo5DEd5r11Xim+75kA2dd1gaEguD5A0sm467i8andxlq5sClSEQCG?=
 =?us-ascii?Q?ayJkpiV7WuctdxD04Xr4i86G9eprmUkVe1/c8juLMOOaHXAYQz2GIkoKldt2?=
 =?us-ascii?Q?x44mFSPdfNt2NLFfW+lL3+42yjGYWcHt85GJ/0Msp6avhrvqY+Jk8dXZCX0g?=
 =?us-ascii?Q?Z1tKG9B2O4/rhM5Knr4h9wJL8nAgAgBl10jDX6Yq/1RHrju0FMhhShMqJqIn?=
 =?us-ascii?Q?oZ6EtiuGKDmsD3IxJNGAEMauk5Ro6esv6X2oXAtlsbhww+6Kn6u95XvC2B6Z?=
 =?us-ascii?Q?cLeB8HYK09A9dEO+XGqbCvmrJFoBbX+HJYS7YIHZLYG4vyTsQ/ATqeUwXytB?=
 =?us-ascii?Q?RiSCaSZaOFrYIcZgEewerUjh3PXbO/DMzV0BGiKjFK3gkKlbNCc3ZTvg0vBP?=
 =?us-ascii?Q?2O+55kkKk5/TqDf92UmcvKpauLZR4ASH3HRS4hwzw+8fsFNic9IRGm52Gch9?=
 =?us-ascii?Q?FxxS1xmA5koE2+/gKWjVZWDxr/A2ugYprvSt4ncPnI8H4xmu8hrsqxEjQr/I?=
 =?us-ascii?Q?NnEk2CPom8peTKAYNjeHwaw9g0w/oLiKTk9CpFgSSXloLJbpE1GAj8FQ5/jc?=
 =?us-ascii?Q?PJCn5RlCFoCauiF68bukM4JVLNLp5bCJl6YJljbQ2afub8o2Chb8+V8xlXqG?=
 =?us-ascii?Q?OQOmfR78bNkX8V4fnyNzt7zmkwA+B5GxdoetwOFhDF4prXVSLlyoiEgZ3Pdj?=
 =?us-ascii?Q?uu+j+yroCXbs1c0oaNKxeqVtAuzzHcAtIAsfzaV9aa1oOEa9vV/ooY2ENOLT?=
 =?us-ascii?Q?tH8BEeYSsMDC8EP+Smxv9gmz17uOikcgYWiz+XDKd5sXwBVmQU4/e7cMk+JX?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d4dfc703-6476-4959-2c56-08dba4a7c680
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 13:41:10.1645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdZFjKsmPWRImQgmGypmXXAm2EMqjxw2/nIc3t2D3ChSAjXvDNZ05VmV7YFUyjrkEVGZe8WPzIVWWPDcOdA20w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186658

Some recipes does not have 'CVE_PRODUCT' set, and will thus pass a check
against the NIST database with 0 CVEs, even though there could be
several. Note that 'CVE_PRODUCT' for dbus is not added but rather
extended.

Emil Kronborg Andersen (3):
  dbus: add additional entries to CVE_PRODUCT
  libxkbcommon: add CVE_PRODUCT
  libx11-compose-data: add CVE_PRODUCT

 meta/recipes-core/dbus/dbus_1.14.8.bb                       | 2 +-
 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb | 2 ++
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb        | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

--=20
2.41.0


