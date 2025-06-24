Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0DBC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:03:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.128])
 by mx.groups.io with SMTP id smtpd.web10.6571.1750766597000552746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=nbPCmCXC;
 spf=pass (domain: navimatix.de, ip: 52.101.84.128, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnA7zp2VdW5g6PRCAxKvHHMCFlCv+IU9t1SHw/gFM5odPUAReV2Mz1BM5yFWsTEuBObJZ1dSvOZZYWHxHyUHqfaAqVVvH0zSjAN0M2is+bAIC6OQ3LUg/l72mXNgJjnDdRSqdPZHZN0TAdNcLlQsZ0fvtdORILEbiCsxXhe8+o/meSjvrFX8F5zWGVcdSieM1X/aqaIZZKuKyAIWXfVSMWHnZuwH9GUj03a1DtlHXd/qN04xz5AsYN4AVsmj7f7o/NiuNn2vj42UkDSOgC+6pYK6g0CCxZpObP3A5RgHBQsDr1U7YflnMjNnQAGYPiIzVwpbrcYgzFX4ZKxV1yXNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygrhR8IemryNllZuAHOQDLf/XhTFY1h35U+Qy5XWIoc=;
 b=PZnVcpkd3pUK6FYnHritknpR93txerjh2NJctH8IIlnnNLn28XWiJmKA6cqTRrkYfsXguASiY4HOiHc127bF5GFml9/9Qu70Q91z9EmBXqBYfmQ4oWW5Ynyo1bqriWlyt9btVgWr+UdBYcuCmctZLSMOmN7g6q0bODWnQwJSM6Nr1gHtoK0ZeN28HhZ61zcehj/v5z7fDZUR2t4qg1WPOJ6ymJZHppVq1uq9r3vkxnQMX/HPD7wGgKmLmLBEFCFczuZfWDJpmnT+RU0MUtyPMHtFgHWHE/J1T7b6rVGxNWUukz3xGGzM0mmrNVw2B0uvIy0efYJR7fN2C70LSJabWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygrhR8IemryNllZuAHOQDLf/XhTFY1h35U+Qy5XWIoc=;
 b=nbPCmCXC8dw7knJtPPTJTQrUuIOizylN0f9L91fULxhhrz0B6jQMw8t20yzZ3H4nrM5DDHJNl1qOzdH/SQkF+XrHKEhBPmXZjGr8TXR7Lk8BP69UepTHZUWftxZccTY3JfuOFTt+eIJjT+YSz/h9/O7gHTi97iExX9D1NTXg+Zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1e0::6) by PR3PR01MB6347.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:3e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Tue, 24 Jun
 2025 12:03:13 +0000
Received: from DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 ([fe80::22f0:b679:b124:6e81]) by DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 ([fe80::22f0:b679:b124:6e81%3]) with mapi id 15.20.8880.013; Tue, 24 Jun 2025
 12:03:13 +0000
Date: Tue, 24 Jun 2025 14:03:07 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] pg-core-weston: Downgrade weston-examples, wayland-utils to
 RECOMMENDS
Message-ID: <bc74d25252859b33cf6d31e427766e8b55ee3ea1.1750766586.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::23) To DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1e0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR01MB7723:EE_|PR3PR01MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 7869715e-8cd0-4fe9-e5da-08ddb317189a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ne9cSGFl6OoNiHZdJdKZptuZ9cy45TU3hST71kbecKn2A51Tnd++sG+PBEVb?=
 =?us-ascii?Q?juLiGTSK9C/kGsXIfeEZl48J5L62k5t/QSHlyZkdcPdObba3pEfdisuV/EtI?=
 =?us-ascii?Q?jsUBs7UnHzE8ynb3gkNnhty6ivLpZzjLLheoJTEs49PHliOqiRezy4EgR8DN?=
 =?us-ascii?Q?F2uysVosTDDhKf6jaWN7SlVMQ+lvGzUeV0B+JUAryROV8Ml8AqrOtxgNYziL?=
 =?us-ascii?Q?LTJJibVZhpQ3r1OsoH8uxkXsjKz+CqVIFj1OaeXQTY14mvi2OfsBvekjiAbj?=
 =?us-ascii?Q?EfRgo3VCJzgqdRL4x9cahUWyIK6N78LuYUQ71ANp99OlgDM7vB2nwG+uekz8?=
 =?us-ascii?Q?aB9hbnjcLzBxg30gEJmd8toHUiEhBpj3gbb40frB0t4sqtF9eJQjn0xNOfy5?=
 =?us-ascii?Q?NErF/a4N7tWVZQ5GtfiQhtoiVhZb7SR2pBlIiWgV2GuplxOrcJYaqOdR6ZCp?=
 =?us-ascii?Q?znmMUY6sx+MLwZmRWCrBrK7RZ5wE6Btu6TmW595rPCrmMTNarJHkxukxuwyr?=
 =?us-ascii?Q?6QkrSrtjHjNkW+IgMGsXzLBGB/spjm9NkjGPFY7RebwTlqrKJUYVvW16voQt?=
 =?us-ascii?Q?XnSE56sLH6kAMDGxqa+MoTfJfTtGdHaS0mSsBkjrWfc4FJk6xwkGAHIBFOhx?=
 =?us-ascii?Q?Uo/rR9LZA9g59jBYzqs+cptiBsGHW86xSyZ54N+jFD0tL0VE9WMUB7XBCbZT?=
 =?us-ascii?Q?IWGwlQTjn9tHaqMTMuXi30cbg5oJPQD0mIJoo8K6br/k4NfBnACVxJIWQhEE?=
 =?us-ascii?Q?7h3IQ5WJ0dVK4zaOJ/YqUfe3fABNUAB305GSBrionNaoel84sede0tdE6qwd?=
 =?us-ascii?Q?adWYclrcfhefR3pP1SAEJRjrbeG+qIcaG97g20UJS46mRFeU5SGNgKVat+Vg?=
 =?us-ascii?Q?2XNqI1+LXrriZFlGxWpovsymDAGh1mXMkTFSG6eBJFAsaJqRahEF75uuileT?=
 =?us-ascii?Q?ffeXSjaCHeXkLzFNvNfP3/jcsZQBiSg7KomJpQJPOXHnwe5+QmWHxAsj+0KX?=
 =?us-ascii?Q?L+iGQ2Kox7HlOdALZeSdRl1TSWVf201pzHc6+Cb53Hgz/lUK/VMogV2aiaug?=
 =?us-ascii?Q?Ius7tKT+cR8R2DBojYicLsCy9bx/gveLFp0RkvQefoKw9/P8XyAsyieKCV73?=
 =?us-ascii?Q?vF01OxhO43grxCym/2aTS1QdvZfn4HgDGQuj9rc3IX/Fl8O02bAgkqaTW5Qi?=
 =?us-ascii?Q?t0rB8xXhtgtKJaNnC1tLlNRsc9yX4Cnl60K0wCVW4cIowZ5yyQdUam9s64kc?=
 =?us-ascii?Q?nG9K+b6wH3XLkDI2LykbQ5cSqodTvbfKQ7YAYBbTHeiRrlqtheqZ/3Z5lHXP?=
 =?us-ascii?Q?xZUGrHaYEhAvWQLJVTcm9XN7B6f9Nhevt9v5Hr5E/gE2RjbANQGPpE2C/qEp?=
 =?us-ascii?Q?1xhxZjV/WCP3Ld5m0ByysWU6v9oDix+mO3a4aAx1mAp/Pzev3I61s2T2Ccl6?=
 =?us-ascii?Q?SQ6j+6Z8xrc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR01MB7723.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?979bNcrFCsBUoU7lwQDJp+jnVSCuDjugTvDF5reDPgHimZFUXmLb454XI4vf?=
 =?us-ascii?Q?I8V/e8cBZrxXw5o947x9len2voXoHrWvmw6M1Uf3vz5BseoUkbZi9Kb/lGRt?=
 =?us-ascii?Q?uDKPIj0yaPzPvGphMAiCz1N9BB3h+e13Hl33FwY5TiPXa9rpDAMTtFXSc6xg?=
 =?us-ascii?Q?OXaq6R6axMnq6sohV8vhVzRAf7Q3vWPKngLZzfIpni8oOIJPRJQfEnvhyrbw?=
 =?us-ascii?Q?1HQirjv5TsqIRty0wxUm3Em+pd5KFe6UtfcZpdOTTO2aJ61sktbiJlu8jVDY?=
 =?us-ascii?Q?pECNjCRBrCisgvPTGgjeigo+wsgCx6wmNwx2aliLTlvXCPNHIyMlvE8NY0J1?=
 =?us-ascii?Q?tA5VrDn+xJF9aHIW7NM6aRAKtYWUwygCnoxh1iWvgaMxbHpDdokCkMEHSGG5?=
 =?us-ascii?Q?eU6aEFXBaQ2vOISq0j8ez6PvQ+hQd4RBZUdwY1JICwRXBLeaMDqHzlYH8puB?=
 =?us-ascii?Q?hm7GTglvyhg/GaYiipgWGQHAkaYID7RkaYNXCRKjjE81pVl/eMEVndEY2VyV?=
 =?us-ascii?Q?xDnq8KTGapfwDH+0nrva2OmPuNMKdpsZsttJG9LCPJOGNkaWdys4hDgsnEHe?=
 =?us-ascii?Q?TPiIMwzqhLG67kYD7/SvYEYro3QDOI2FDqX981aEK38CXvrn+HkbSEia6vQ+?=
 =?us-ascii?Q?dLKcNr53REXrgHfquJZqsEdyxCnyi0Uy0ROTE1KGYvVwGTaDSwpGEZVpxqpp?=
 =?us-ascii?Q?OQKby8Umb5PDp6FKPQ5xVzefcmNaX2RRV8dJZZ96Fh0FP/OnJUSyk8NHQeNr?=
 =?us-ascii?Q?2Pg/bFBijAyWdLPYcuaWqvE0u6Tb20BVYd1G7o7f9o9q+62iMMj8/WlpQnhO?=
 =?us-ascii?Q?yYvBhTfhjF3WSddKCjEVrT9JVuL9ohWvQksD4bZTCIPXL1jNbaOjZy7VzBj4?=
 =?us-ascii?Q?GS5PBkDqHt86Op0W98ecAqphNvopOg068PClz8muzPLaHOuunB5hFsFGyGIJ?=
 =?us-ascii?Q?ruYpBojJsHuki/XHA4O6pLxtlLVTBE10y3dopbkNEI2oYF3+b1jEw7K3OAxb?=
 =?us-ascii?Q?cJb53EnMoNqPSjNp29cLEWWqBteptGxgG07/XjXewmqWKt8XHRdlzdbAzMjz?=
 =?us-ascii?Q?wGFItAfeknheYwBT+w0thhGEWppfUuO3ltroed0lP2PoE5C+AajzSeJNUiqI?=
 =?us-ascii?Q?+JaQnSvbl06YjPMmQQ7elciYt9fHMXdHH4jL4+ERYKcKin6VNPIKRxonAHUy?=
 =?us-ascii?Q?s1nRFbbVgqbWC6kXrqxbouXXR/gOcxbhXdW6qrzGQGGqEhbWOs3YhIrYONtq?=
 =?us-ascii?Q?3Hy3ESnY3OUTCw53Rx3ytJvALNVgIvpMWxDGgDBARHeV5Klzk1IGGPuSqzxM?=
 =?us-ascii?Q?ak2SG/zHyhRZcQcxUHK9ilKpOI/zs2RDNTlmnytIvdqBG9EnzeYDJg+/Fr/x?=
 =?us-ascii?Q?RhV+L/S9XkRGDE+aqVkf8Y+IOEM3FSEko7rk1zAIkyW4B2sTvOzh9lEyhlJO?=
 =?us-ascii?Q?gnSEyuGxzW1ypDE6yttskt6/3KHX2ad2PDQAc5+2vZeOEpAl4UUz4/nf09vH?=
 =?us-ascii?Q?vL/KVSaPYNtnU6v5s84cHJxpiQTyBMr4NInRl5KHYsqZNfas5IDSYYSFX5qA?=
 =?us-ascii?Q?xZEt+UFFm7YqsNTkUlk8nPqC3EghSZRX8M75tDKwRpcxOYbRtn4fQNUHVjuW?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7869715e-8cd0-4fe9-e5da-08ddb317189a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR01MB7723.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:03:13.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvYapn4J80qLTn8FInqnTfukFLZBnpOrrikhP5OOC4Mx1u2ve+1QG9+Yk+YMaNAwU24mVNt168V22NUsB+lORduuWUsbDUt501hf1Z+/N+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219253

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

These tools aren't really necessary to run a weston session.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-graphics/packagegroups/packagegroup-core-weston.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.b=
b b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
index dd302c89e7..890e442edb 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -9,6 +9,9 @@ REQUIRED_DISTRO_FEATURES =3D "wayland ${@oe.utils.condition=
al('VIRTUAL-RUNTIME_ini
 RDEPENDS:${PN} =3D "\
     weston \
     weston-init \
+    "
+
+RRECOMMENDS:${PN} =3D "\
     weston-examples \
     wayland-utils \
     "
--=20
2.48.1


