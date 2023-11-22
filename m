Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67799C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:08:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web11.20040.1700662102286360158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 06:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=UoGnwC3L;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.80, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZzpwYVaHrkrYE0YrP/UCKJuioat3q9MfNsX/jtsUt+RKFLfzJ5VvoLB1vv8OxhQnSN0N8Bp8DGU5Q5zjD1yyUv9WmAoaEpB+HGfLJMI6LLcHv15zyCKuteLYWkQwJnrjY6uGySRazFv+b9IM3xKoVpaLWZTjWAeNb139pAwkU9O6nsfFfL0o66NaMySjgd8ZJn+EkhWtPGnbhbu4ZCE0KwNUFxuI8nUV7eBV+HabfRZYQY2Raqi8LjSIX0SBOlEQk1oH5lQG+U+XwCjrFI6+F5TOgbqjSpxMf+5z339hspOpYTsBwgSMd5DkSKDBdaxPH1PDLcTWnN/QcBHRSyP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlEDiH6CquKR2EtrkhYL5cntJnJ6os2VJp5iO7j/gBI=;
 b=PrW+F4aHDA1tfvkyRpmAgCMfNzUnlFF+oXD6YPg48O4LShAegWPP/5a9PDAli5wmoL8eWFVNt9KkB2Flq+CbKydAqTCt6fLw4ADx224bXOJ+mYM+JSCLFI6qOE7pZueYK6IvNzUnTb3tTUSgPblsPr5vccxHh8pEy2aAL6J/1CFaFl/eNpshhlohb8Y4dJZJdpuvHjmb8vvZehayyWe/SDGwkIk20G1yzgkrkT0priS0AOj76QNJMEx9zjNhFi8YUtSzMogB9zGpjnW/rkKjJzzaCfER8SdDqQN0yf/TdBfkXvgkGiYddv2A8H4W50XtWLn8ZD7BYXAdKl1w69CfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlEDiH6CquKR2EtrkhYL5cntJnJ6os2VJp5iO7j/gBI=;
 b=UoGnwC3LRQYvwzgnokvxFDepTQ5RMKB5aXS8sWXaclwroiew/7x3sgmkczC2RmycN56nDs4Va7XJCocfaslkUGzTLxkFtcOtC5ZrfnVwOhhPPW5aWjuJyNhWnmTxm0Id6znrZ9xF8z7DKBp/jZPPY7coC0wumjpJszLk1OaL0Pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS2PR08MB8830.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 14:08:18 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 14:08:18 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v2 2/2] patch: extract patches with all-zero hash
Date: Wed, 22 Nov 2023 15:08:11 +0100
Message-ID: <20231122140811.1021807-3-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS2PR08MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ef5b38-35a0-403c-4fdb-08dbeb647a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FUA7ossfA/ZfEz4v9JMfXgnD+8zgi40GEWDGE+1I5UG3rWmqbiFtcpeW3qyuD7YadwwjVeZVz+5414U98oMKkkT/jVJZgyH0u8FLAu51Lds6vjGT0tVnNTvk8YR36sh5O9tqHPSSezfpuul2+ffNBI4RxfcKVZekRcQVfI72MAIfWBpqNTR2MyQhk9ONaoOYyBGipYBHwlLcUrcBjxKO8oAI9I1vscMoY75fmWuMjO3GVDHvkbnLDyzCjphKM4K0cA4gfg3YZo3rRn4la4Sk6xQjjP01fIRhyMkw8n6VyffzkgAJ4DLXbqDOhiHuC0Op74TmBK/AzbzrVTGqiS66ha9Iuoj7M4kipe7qj2f4X0YvDjUwdYMeacX0/RippAJtz60BfVSRK/yj9ufGLqBDPeCYCdwr3VhsccZd1riGHptMV+Y1JhK/RhxOAV0yra3TFgY1YDW3a7/+tnm3f5bo2wmQu0MQuQeHW5/0dg4hiWGqibOXIXytLBvI2q5IwcopeV/xu8+MPG84E/C55GRvFuOBWXTTu7pTuPmz7QYdnlmhzAH5so/yWc+/6YEram3gWPsoI+PE6mg1ZPrcGOYEMDOJ0Odei7s3sm/vGj/KTczsO9pWQVEPOhCCGYNLhveT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6666004)(478600001)(6512007)(6506007)(83380400001)(66476007)(54906003)(66556008)(6916009)(316002)(38100700002)(8676002)(8936002)(4326008)(66946007)(52116002)(2616005)(6486002)(26005)(107886003)(86362001)(5660300002)(4744005)(1076003)(41300700001)(36756003)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eYFetPw1ghKmfhTlApzj0gvMitpgsOP2AfSConykN1pcdjhYtu+xgDpklIK1?=
 =?us-ascii?Q?eBe8EMp+R9Y/Ja1bRJEWVLTwOd0QKEYuP3kNsbXKQbTngIYaGCCzij2rZbvV?=
 =?us-ascii?Q?PtQKtUBMxuwK2PlG3ZjJc6L3X2CZhU7nl73QpxkNIKHKWvUlNOkSfXfoERaR?=
 =?us-ascii?Q?E7u9mOCDncLoaGryB045jt3yST8MQ715ruAQXu6ixljNF+uApK7PeFbeBEyT?=
 =?us-ascii?Q?PMuPgXw6WMBfu08fgONzxeD0ZLtumNArz9TLDa44NeaPV/3uk9An30jKGBhT?=
 =?us-ascii?Q?QaJLVpIR+q3IPLT39Du+LhZSLaQemBDePC3QFwWQSxduiYWfQwPVrDH/sEPe?=
 =?us-ascii?Q?ORv57x+RAgY0qjx+0brJ9u1IGoSEbUCFYn//cXOPyohntlWfjy/4QZDRs9P3?=
 =?us-ascii?Q?NPHtNMNPijpC2q1ZnXag59Cb5Ui18AgZcj//S8gWBs2T4ztrNoekN2sSl8o5?=
 =?us-ascii?Q?vehjtq4VH0QYqiw7QPgLe4ApdHbjH6TSZNZwmchJZKvoozCKahHeO8PWhbcv?=
 =?us-ascii?Q?RuO1YJN/dUBhGgvibZTMWMi3lXiUZA9VNRA3hzIctojWIaKg5sNHpWAM9w8N?=
 =?us-ascii?Q?Z7UoYmwzVqCFMMuHBUeqw8SWGx36vjKa5jse0jeoOdT47LCiuGaPlKvuyLsT?=
 =?us-ascii?Q?ICHN4xIMP+ToSn09nrWxUwPf1VIdGzP8VxzmlO/nRo4LhmsoZcsam1BEdLCE?=
 =?us-ascii?Q?P76n7tRQUIyl/JsbltcvOmzW2xHAZmF4wjA6B/a5T5sDxBCbRtmsGku+S6dc?=
 =?us-ascii?Q?iqKo8w4zcom4pUBzxHu/6MlI3ypri5JD6X4zcuPIGU8OzPXpbuQzTaMwlVF5?=
 =?us-ascii?Q?qBstqA/tjqYrA7mx4ZMsaStuB1pXMutqX6t9/wk3adnmaDNJ6QCnnyfkZEJ6?=
 =?us-ascii?Q?OrY+dhcpjMiWJk5Nan8TGYECmpL46T7hcyudRPSqyVgZisxx2tIOxmvi/6tG?=
 =?us-ascii?Q?SVbbzXrJJUMAxu12n7CO8FVlDu9ewcTf5jxT//cDkkYldF0ppaU414LMYDt/?=
 =?us-ascii?Q?vgoFSeHyQHIHQ48ZLh58YGp4JM6gaZ5j06wqWQaBdt4pNTB0vK8XWO4U77Us?=
 =?us-ascii?Q?fSytuHLqKPlVTie+THmFh+N9+w4TWwosxV9m5/S6e4TbDB1Ql5uXBoRJrp14?=
 =?us-ascii?Q?mNUlqDvaCS+fzjP/yJm7c5NhmkZEO3zzLdakxmtz7S6UDSZYtg435SdF7Z8o?=
 =?us-ascii?Q?Gw+rJGNp+v4KEYJZZ18ffuDPYKBOnccJr1tqFW9KzRl7qsHDzU4pod1S69M6?=
 =?us-ascii?Q?LJmRz3LQeKJtrbezh99BCHsJCQfdjh0l02jWLxxeMDa96NQYIMtB6nPAf5DY?=
 =?us-ascii?Q?pK/eqZHpmCqWoLOMqy3/odmDF38xFm5Sb4Bk2xHEO30CBCpI6fD5y/GBYWxV?=
 =?us-ascii?Q?WgaYuGe2DDfMh3HyyY3GH1+bk6Z3vBKcWLodR8ds9rvUVYsX7Mki9NY7ywAE?=
 =?us-ascii?Q?wb/UomNjipRKoeM5GImEn1W5tZ8tNcVZLKA2ttw4ceubC9rksG1uOlCbdUk7?=
 =?us-ascii?Q?dVgbUP7x9GHcXB6q3yGOISXewbMqcQvP6kyxj+WADhIZFs/Eun/DA+8+dz7t?=
 =?us-ascii?Q?YZyiKSiw7NwfhZSxUg4XgqVGs3MYhcZQS59x2g8AIwm4fLmix+DL8g59cLDc?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ef5b38-35a0-403c-4fdb-08dbeb647a35
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 14:08:18.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93cWnyFRNwa9ZdTO0O5lwesrb9Ugh0yn/XIjARiSy6RjIJ8MVTdiC1c4CoGvFTjW52ks0JzzXJIsu88ScWh4aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191107

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Extract patches with all-zero hash in each patch header instead of the
hash of the commit to reduce changes during patch refresh.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 495a302121..6d81bd4f67 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -467,7 +467,7 @@ class GitApplyTree(PatchTree):
         tempdir =3D tempfile.mkdtemp(prefix=3D'oepatch')
         try:
             shellcmd =3D ["git", "format-patch", "--no-signature", "--no-n=
umbered",
-                        "--no-stat", startcommit, "-o", tempdir]
+                        "--no-stat", "--zero-commit", startcommit, "-o", t=
empdir]
             if paths:
                 shellcmd.append('--')
                 shellcmd.extend(paths)
--=20
2.30.2


