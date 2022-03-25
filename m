Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283B9C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 12:30:20 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.49])
 by mx.groups.io with SMTP id smtpd.web10.4453.1648211415801799497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 05:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=MwpdsHvz;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.49,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhagz/cwOmvX3DCQRLlKr0yzw5mPeWe55K3bWV7vgsW5Z5oaHi8lxsjzK0rj08qJh1pbLrzAceXG81JbiqGg4hwWwVJeP0vsl72s/+w5a1kYxwxMv3V+ZwFmVGIBdgLzYObC+4i8KroA3sR+/z5ApKTaiZhmhwVtCOp4Cqf2RpMy0dw/gAvqw/bg3Ps5+lK+SJ81Ho0uWmw496ScSG3L6HNkSSc0Mgk0RzJA8HbiLlLI1fmH40uwhSOyOnfe1I7RLnlXoNCKP0k86Ho6mokHIEgTL9H0MnxRM2i5oxFYh++0qcNAOWDk2C+VcYzv07pDr53BfWS4V9y3Rj+HQjPfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0eOing1JKhmDuScEOucgtbw8Wd9G5vTelRxeeULV9M=;
 b=oR0x49KiEs0p6xNwEpsrwduevEtDqzqO80te2v2qRf22K3eDUEGM5pvBvGN9TMvS9lJ1stIcZHXH6cNo+wiEYyaRP+sK19AQ2/F6xsq6yQMl+bGmc89tVI0ebVm9rw/WZdxWzAu2hhrP4wF9KdXY5gD2r+kCPKSSRMStfNR6IeDLU0w7YAtuTEl2uIf9O4m5bv0vma66X4VwzvdJI3ueCANFAxy/jR1b/E/lOLVDAjiHFz+++LdXcGg9GzHfVVh8Pj1gPmWTclEsmJ+vzZ/Vy1rgFz18HyNXpLHQ3N5SPf6ucOmlSias/iDRZh570xpNiwJwUQKtlR86J8xV3XAgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0eOing1JKhmDuScEOucgtbw8Wd9G5vTelRxeeULV9M=;
 b=MwpdsHvzWZh/siwiSMluYucqTj6mCa3WNlbKHvOuBiT3NyxmhvPH0di4KGB89DdtLDZRMeGicZgIjOcJERnScIuOqWvk6GRLm/CH9ijWBe6VMSaO2JaFMS+DoIyW2zV07wYFNScXG15H+YJkOGsqujBOraAYPSd2FODBWqreCkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB6020.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 12:30:12 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 12:30:12 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2] zstd: add zstd-bin package
Date: Fri, 25 Mar 2022 13:29:50 +0100
Message-ID: <20220325122950.1148-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0019.eurprd04.prod.outlook.com
 (2603:10a6:203:90::29) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 234708aa-6f28-4aba-a240-08da0e5b3523
X-MS-TrafficTypeDiagnostic: AM9PR08MB6020:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB60206C9BFCBE063BC55EBA17D71A9@AM9PR08MB6020.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JZ5I37TmoL23hAQeTeJsPtx/8FdF7VVSwre6sKi5WmHQUtgtIohCplSQvtlRUV6ZSzRkNsccjtV3GV+bbsA1a5YWYGAh15nG8PlTXWy3hHVVRwliYWrZfkC54QUBlhjJKt74SMM7V7Gtf+93I65t3RGMP46JsIMSqbE1tSm2wnKNtrnMNrYOX4RJNgfWgsDn6DBLqDuaLjbPcfCz1gD2KvG2cUO2BVHltZ82yvbWGUUxbrbUwUAkfDpmILS9aZquOYcnSoXieL1BsG4o4Ot6+98igJSGMPUuiY2oKhzHHIjwerpYsw+s/bGVt8SUe4zooiLQG9e8+c9LT8z7woRUMQpi88YHkmfnTo7h49TZfUnIqKPWWYFlZQbn3j+WSsM8oxTTbxeStFGYzvrOcIPpsiG78yDHafsR5QvOJ4f06etNQ8URDO2buNn71eIz4EydLr3jHmP7hocOlcjFCFJf33c2LHHtUHZ41xg+Nar/mCr1ct/8bxrFk6ooedEFpSL+0a24sGq91kywqTq2jDQjUJdeSrsAfvVkRKP45Wv0fcKSSL2l3A2bQpmEMQ1p+VC3fI/Kgoyvk29gKerp5fRmG/SIMsmQWPtE9HEt9oqqV+VQSKIBqW7r7CnbGAn7DKnZauWR1WDpFdIYDRUQC0WRsFfdv3sgfE1nVgiOkW0uxdekVH1U+PshJCK4F+XWmnzQBU/lHVKySTNL+qJAzn28qg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(316002)(66556008)(6666004)(26005)(186003)(2906002)(6506007)(6486002)(4744005)(86362001)(1076003)(5660300002)(38350700002)(52116002)(38100700002)(6512007)(2616005)(36756003)(8936002)(107886003)(6916009)(66946007)(4326008)(508600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TZcZIXtnOZbwkJ20VCxBqm0TC8pvYgC8LkUbihyIhch1yKWTXl4/wc2HRHCD?=
 =?us-ascii?Q?52RmvPPhyIFkpCdGZ/krlsFcJGhwkYtUpBUsUdjGuDLH4uha4EcHWVQu2fK5?=
 =?us-ascii?Q?fblofzAmBq5M3cHhTu21a2rdt1qqPo7gGn96IAOL+z/TNyGzPssdsAj97b5c?=
 =?us-ascii?Q?Y5IqbHx74eW5BGmWLfd/1QfxR3QyKTeJFHVS5AsE9qY6+V1v125NsNXVyDhI?=
 =?us-ascii?Q?DqEG7/QZ8+DHBPP75bcvNKfpNcpx6mYbVFoMBlZc3mMMEyOTKDmhjfg9nY7z?=
 =?us-ascii?Q?/FjoiE2Y48fjm1H4HmI7fdQAzAFiWvEC0QyI4PX1Wvxn8Wswt88mgkSOlWsH?=
 =?us-ascii?Q?XujG0NafmxuQZTX8YfMVEiOr1xQ+bC5re2K10ma89d3lonQPwmql4OaflKLo?=
 =?us-ascii?Q?i5CgY6hc+d4B2QSC9Z2FDekmRL185lYvCwoHjrD9sCHuWe5A899mcKyMFhhH?=
 =?us-ascii?Q?hS5dEZhTZGkyJjOhGTJ7yXsVnitfS0OpygodK4SzUOU2DYjI6dV4Ccc890/O?=
 =?us-ascii?Q?nAXyuEjToP0ZmW1zpU0xThxwC/e6OzjZ6/4tY0nf8R/3+uBmGiocWxhQ34ek?=
 =?us-ascii?Q?H9/iixy9FKgil/QuqRmNXUJBhD7ZS2wqMRTzMoLpysXTtdR2dZLx1u2xSGXy?=
 =?us-ascii?Q?+yTPpAJhRh/p8l7xLZnzCRLdwtXmMWWX0PawH7duxj/lSQWyc6AtuyqFNFK2?=
 =?us-ascii?Q?/T1+il6Z3aAsESF1XXwoTQEHTmEik39F/WqkwThD/Ye4GiS0ohMDn3GlVivB?=
 =?us-ascii?Q?HSGv0n/UjGUAP10ZtOEkdc7put63bUxQnSx9w+gvQs7bsqO943wRJba2MN58?=
 =?us-ascii?Q?1uQbnplxoqqQpYxl2AYa92BkCsZ2+BJvn1vGRNQRT6L5aMKXlPbtbKiAZo/e?=
 =?us-ascii?Q?ML9oxHX/GNBlTOn7/VCXkI8AwpsllYAv4sGr47fvUcXRpkXoq7dKCduqzvBq?=
 =?us-ascii?Q?X9ZY+8kWxlgDmvD9SwPyKnY5l9vYxZSrkTkxrXybCbE9u7D/QoiTjKmUCr6X?=
 =?us-ascii?Q?Z07jLN8A7CUEwxkojBykTabi5yKPbRNnBIeWrh/nwn7ao/Rp3+LxU8RZvu7s?=
 =?us-ascii?Q?CbgVqZa2Agb1z70WuADtxVSvLik8oUXDMvPc/QzXl3jXuSx/oM2eHdQJzobg?=
 =?us-ascii?Q?ilcelTn6fYnmivkcWb8GLR3dkG7nAPRCsNWvlNLoPY1GJbKyP8exhFslp0S0?=
 =?us-ascii?Q?9IiZEvCr/V4sc1/NWi2+7xQy3UxuIVZLTl0MWEvYDteIX4VWIN7X9kxOWCHL?=
 =?us-ascii?Q?nLhJmrnQ2jo/q1fX2Mr7cH6WKAkfMjgzqtcuamwbjL0gvlV2IXh7+mIv5PtT?=
 =?us-ascii?Q?Y7pFR3MCdZGp7ch3gLvJBTjem77HXnV88y5fXJlizvuCDg3U34RDd5ACklSr?=
 =?us-ascii?Q?/DF/OlR84DQQAT4PMznHrCytfFHdxwty5PoyhQBh1DOCBzBKSFIOUszjr6+A?=
 =?us-ascii?Q?hrURTIIyCZPljWr9mfeHZS7VpUugR+RjxjDGesL0GQXPeSUF005YIDOxFLSj?=
 =?us-ascii?Q?YhJnK77N958zpPYqxZ81JJ5fudzan3jEog59V1XUKxIb2oDC+tXMDGFHnoXK?=
 =?us-ascii?Q?nbTfzF6grg+O3yWHmEHYDce0yXmRZd9WhB6wEV45xcbgGQ/Hf8aWSI8x6kNB?=
 =?us-ascii?Q?msZeNqAO2cwa76BtvuDcCB8ou7rmJ81M+RzbN5+K+7O2zFcQ1YrRlZ7l14Ki?=
 =?us-ascii?Q?A82cb8lS0TvYYI2a+EqIcKiSD5ag1OfS7Kaaq2HsneJkfvkUZN1l7Sf43GPn?=
 =?us-ascii?Q?83j+2CGKgXM7u8r3CP7oUWVslXiszzg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 234708aa-6f28-4aba-a240-08da0e5b3523
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 12:30:12.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MNBcvuW+EuxMkwhAq0PCWF3IaetqeQKEEiIU6HWnQIJi8EMBJLeJMrNgWujzs5z3yf13slbsJj1LiGZtHy8Pyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 12:30:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163639

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a zstd-bin package to remove libstdc++ runtime dependency from
library users and reduce the dependencies and size of the library
package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Add zstd-bin package instead of libzstd package

 meta/recipes-extended/zstd/zstd_1.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.2.bb
index 0ddff469b8..2fdb9b6950 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -18,6 +18,8 @@ CVE_PRODUCT =3D "zstandard"
=20
 S =3D "${WORKDIR}/git"
=20
+inherit lib_package
+
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[lz4] =3D "HAVE_LZ4=3D1,HAVE_LZ4=3D0,lz4"
 PACKAGECONFIG[lzma] =3D "HAVE_LZMA=3D1,HAVE_LZMA=3D0,xz"
--=20
2.30.2


