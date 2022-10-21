Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C2DFA3742
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=ddH372pr;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyWelQpsc1oE2afk1ZUjPCWvAR/Ra3B5d/EHcdqjv+Q6vKnEsUH8f0ShJd7oKiNQMuG+GapK1sHokqCu2mZ9MsLlsdI2bOlzDMvLGCPSBy6z/qoXSQq/xO6kK61vfnFVemVok7VYK5ZjnPz9QpZHFn8TTuzW7Wbmj62RrQkYRFFXBB8BJdi7pAX59I/cZwrDbGfQMoM5foGL/xjJ09lDLHIepMpnLZ9m89/MytghSX9grbxqLM8sarrMyntajVRmQhWYgDcv86DTbK3GlHCRL73rhZsVHRlqMIxRG940isOEzEfj1XkK4Tx9L4cMfaFvKW0hf2z6C81e+JinK/YqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5+D02N7r7bF6CjDW4Mx2POl/H70s6siQWazSY94HWg=;
 b=mc59m/ixWpyNOfZV+3tewiiSeZ+zCf1sN1g5HzOvTKNsjPbztCAefjn4zjWzG6DeXLc0JDsE20Rqb7j0Hr18srdTNooJv72yv0t+qIpcLm+syxj6cQGxyUB1fap7h9CVoV+WQepmRP65XKrSaTMgI1BpWOlG0whQwPYCR/R5iJ4v0qI7tbxFNO//8zXpp9SUktIHi7xL++0r2QxudNT8w6uWDA3gNRYe1Jjk5y3K6jwCrjW7wKKa1p3NDXAo/sZ7mJp/NhdZ3AmJkC44FwJIrSGtHvnwi+kqm2Gz+WFrMv+tIP45kn66a1oziJU0fTQEXOTW62jEvZ0qQAFPHdTj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5+D02N7r7bF6CjDW4Mx2POl/H70s6siQWazSY94HWg=;
 b=ddH372prW7Owped9yw2XK1DxGgwDCA24bh+tpE92kj/Ffn8XTHiLURUbYZppqIYoYURgCCWJC15XTO/bVbU8c8SZRtDtQt94pwjeLZx5s5sPEe0zT4+V5kNrEiOhXq4zUo6F281BkV+9gLgYEZCOOGw3lX7AzGQ+wMGIqzDx8g0lEgDMXjJ04LsQVwBIjZDGHFGlzHEV5vLKcOPbcdBtTQTGY27+85AbC4PxQyEWZPQiyTPZq/AtW/Q6MDRJIVCv+Y72m8ga+jSD1cCI6wL1T8E3LXED8GBojmzO0vdAsffnhRPN8QQSSr8y3AkU65p5F0ZRN0LMwsVZh3KzEPehFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:47 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:47 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 1/6] uboot-sign: Fix using wrong KEY_REQ_ARGS
Date: Fri, 21 Oct 2022 19:37:21 -0400
Message-ID: <20221021233726.1751124-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221021233726.1751124-1-sean.anderson@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:208:23b::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR0301MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: fee44d69-c879-40da-b60f-08dab3bd428b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bfpwZEr2AIBn5F57CdhtUd7QG/Aahbj7nKnRaSbI4xe4yXuJuCcm+Wu4XARqLLJY8PXp0T8Dz0jKpd7MQ5uh8Yh9W3ZqNDFMF7pnpbEM+OUaSYiNVNyQHWodLNS2Nb/Y0khhSoya6UKmSIazkUsDISYgZsYL6PfyJpRagmC/r/l/eUZb5DRE5x4yHlAveQ/mVMSTc8o4SmQZhQ7TGmzv2jnincbc5p11gpUIGRbeDRVSkm/2DFT5LY4FNaJftUOPUpYUhhnoICvJmvcELVRKk9+meRIuaYZ9JFdiMaZUXMlDN70hgcc9n0iP+r2N0aAocjCiuQKkub+YZmz27zh4XC94wi5QJ60ShhNfK0gkDHXlGw4hr1W2cWtHluPv8k28GF99herdS076fTkv529DFwA/dDVPQ6dpbbURCGT3qzVB4duTe3TXe9ji0471Eh9yrXSJ3ArUBrbzqruOmWYezQIUsp5S08cgoEKYMxMVRbWq7sXFPTBkRQC5lcN5fkHhF5ugTQz+DB7veUZpYeojGOJ2RqPzQta6xWu6BP3U5TkJ1K4oSten1U9SBScXZMgvyF7hEsN/Z1mwWicKiFxdz4+zilyuLKX2wkzi487DIg4bJ7DxCXcnCL2L/CHTJiVYHD00xM0vJp4WQ7QO5JICa83dj1pf/8jnxMQi5xbwsjFkJFBfFpU36EvPETKYg6/7Udujs6qUWCIEo+4RCDRFxiRySayEbKYuOrk16jgRbfM5EGMB2nqd/Xt4LlXVAbD8PU8Gc+B4KgEDUQ3enNVTeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(2616005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sq6OVeh4dA9mwSY6kJJg2QV3WtbkyrIdAmvZZFJqxCXpFb8udJDcZdzg6VdM?=
 =?us-ascii?Q?xwzuQLp5smHxuTX0XGEbbgpLzVGYjhn5q2gB30DVSUj07eHLLfxonk6AfJuD?=
 =?us-ascii?Q?+Gyz7XGik7YMbhJu5xBEVdYD+34UkIohX9Fapk99iOd7eiA8xg8qv0nwQaoT?=
 =?us-ascii?Q?5FSmKhi42zIItLccm17eudwTzAWzrL6NaFuTCaT4t6TX0j03z2w7guslEN6U?=
 =?us-ascii?Q?SuDaDkKAxPYu5VAlVenuHVXyyy/p6pIerJrYBK+KvXKduXH3EPrl9ORQC77a?=
 =?us-ascii?Q?KXnkJxsGOnr2itbBZ/riPq40CUgoREVTASlWFtOzRaBviKW97ooXZE5yU53I?=
 =?us-ascii?Q?+wzMSEhuJ6Ze8IwpQls8Dp+vfPvsu98lGoa0V7a1tmWMDHz44mytTVQb0ukb?=
 =?us-ascii?Q?UY1GHwW86CRMhTw0nAGKwGeqjQgOLITt/fSXJHdtaUUynLnWYlhoehSj78hh?=
 =?us-ascii?Q?lK2Fup3ZUXiHLPG6FQt1syKyfDXNs1X1V4HR9z5+TgyVZj0p/OCaUz3g6wCm?=
 =?us-ascii?Q?LTq/JEbPa4LW/MmNTx2thm8BhFsGt2Hz573H4ZWkg4LCwFqwjUVPdHsEOiqw?=
 =?us-ascii?Q?rWuesWNvop3Nr9K7HjZnXzBbOEzJWVWEyrpHZ31mUrvCK5GaywaP0ZkGddkv?=
 =?us-ascii?Q?uO2oY1NWQWPuUQgbPClV5eou4ewF1KiynHOoGPQ3c9NdewzKkhs3q7zMMoeY?=
 =?us-ascii?Q?3X0tYDja79OPsuS7mg37FG6cXG2OzAlQ7F2xCQdWVabIjm1zSMKkNu192fLy?=
 =?us-ascii?Q?STfOG2sDd5SyABBib8CW72eWmqG7y2tOzM0wOkE96506OPVdVCMy+8ivHhTC?=
 =?us-ascii?Q?16M5w3BENtfNdWBqxFpKt7ZF5dGSibR945gnRfoL008MFvFYZeeesjFyR+Q9?=
 =?us-ascii?Q?4TjWbzgn7jROYuZpfJl1CwziGvwmJlXh0qz9I0RlS9iw0Pmb0ckKx6VO/hhF?=
 =?us-ascii?Q?k5uC/cGdlr5wfjm8WG+yieRyTzjc2I9GX6HB6QXn2M/pzNdH+s6ssdDEaVT5?=
 =?us-ascii?Q?wpO3/xOVSbT5ODMRXMod2iGQ/se2Z5O7hNcE3i18O1BPHFbKxGI8IAl2mhwi?=
 =?us-ascii?Q?NFpDP8pLlqQNuWFLWZLYleR/QUXzQEFbJwvelS/KBdy9V11wuTnwvcssSFl4?=
 =?us-ascii?Q?F1Y8cOlKlkL/C5ASO3dKors/qkFn6p9Vz9sqLM/bVb7HWVVdo7/k0nQ3glnw?=
 =?us-ascii?Q?6vIa4VPH+VMia7CFugsKK3haFYCeNAjYIAPx9OoKOiQ7escyoywBPXxmS1kB?=
 =?us-ascii?Q?CyD0e87Ki0J+zpE9cQboankHRpFqyImAmMm8jMu6kn30I2eACPzsb5NprQOx?=
 =?us-ascii?Q?4JJTAYZa3xVPnVv9jT0yDG4bOYy3vndsVPICT7dD0bbaVQEj0Nr87RM749pZ?=
 =?us-ascii?Q?Q3G97YbQVXAt6JgUhcvWt/coa0N6Ypnq24S39Mtl7GqfU8xNJM80vKoliUYV?=
 =?us-ascii?Q?XJPUsl4AqofBcTAz3c2E85wsHAbc/vuPZ4Vj7/UpzDOCaRZJfIHVnrYsbYSX?=
 =?us-ascii?Q?+nTjhhciuKMlcTHgm3TkElwVMV42g/IaUiPgZMEQfAFj3dyST+hjI/qNdsOY?=
 =?us-ascii?Q?1PECUaEpiFw8/gRnIqRcugR1WnAp19pM0r0Sx7qdu1tZWBQGgDknE95AQyYf?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee44d69-c879-40da-b60f-08dab3bd428b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:47.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QbU1z4F6Wq8SgpvDA5d0YpTlV3U2eK7BoPTNhTr7h1o/sGNwA71S2QbFfKsdGuDx2iL1DPm7MdD9VRn/G73sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172050

When generating our SPL-verifying certificate, we use FIT_KEY_REQ_ARGS,
which is intended for the U-Boot-verifying certificate. Instead, use
UBOOT_FIT_KEY_REQ_ARGS.

Fixes: 0e6b0fefa0 ("u-boot: Use a different Key for SPL signing")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index debbf23ec6..4b5912a01d 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -298,7 +298,7 @@ do_uboot_generate_rsa_keys() {
 				"${UBOOT_FIT_SIGN_NUMBITS}"
=20
 			echo "Generating certificate for signing U-Boot fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
+			openssl req ${UBOOT_FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
 				-key "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
 				-out "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt
 		fi
--=20
2.35.1.1320.gc452695387.dirty


