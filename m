Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F10DCC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 15:33:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16687.1791992033505715131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qhK3mg5J;
 spf=pass (domain: est.tech, ip: 40.107.159.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0DKGCRO/96P1PBatHQQFb/iGPr8jVdpIoeuq7KqDMDAlD/NPEaCvk55PRhjBwQFCyW4jtsv5K/+YMUpxWIqqZ2dks32qS8XKq8JkOTgBg3jXGbiWWwModJSpAEL3N42TE6FcblQfjLPMhHLzL2YaW/0Vmmm8Z42GOOGg2pXJq8wa/i6tztpDD2n5Si91oNH0fCZv0iodVgo/MPdngPGmrDpXrtbvo+yZdTDeYPOlGQwdiOzg24/rfnZugEE7TSmj0yO6bxWmHtWBw4wH/vvvfxK1fIaI+FFDSQZT1ASsgLSoe0iYvsdyLzTTVr+wHWUvyxM6LrlZyE5+tckhJhvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpwNzkLP7q+96AJkOew8bi13dwUG0ENqyMReLmA/LsE=;
 b=XUg2f341ylmDoP+FeUWgr6dr0mCWbVtmq16Eb7LlW6SaX3Qwdhv7kx1lUw3fQJT9154EyIUdJ11UF3tf6sdSyLVYBNb9tC4/srM4cTZzJcLY7OTR7mEMpzuYz20aKE4f3+cb1zdJYsV6Kyh1Q7ajyM9R31ktEU5xXvcTGmG+ZI1/Ksygq1pyogEuRVKZ7EDp4FdXuXKiOvgu2gi7ggjGTHh4nxdx4DqxlRtxQalx0RnBCGdvq+LGVEcGN6UjsK2jfYgDmkjp03sMmjw2oJpNVGFTVvCiSnK+cZ7KjlLzlOaRJ4nKpMHxJu+TPfXXaMtLrpfyC/N6QwUhPQaoGJJvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpwNzkLP7q+96AJkOew8bi13dwUG0ENqyMReLmA/LsE=;
 b=qhK3mg5J+i6MAfSsTdtzfFgKURm9sGU85dQAovEBubFNJvpvAG55O467R4Xk16hYKxZ3D4dllSqCUWwb202MBatAEHTfYRi1fgxJVfYqsn8YyRMbR0lhScW2o4T6RpquZ66sYAi6hCe/wf3J6lvVy123XGh4OieHDsSf+h3J1mruePbXjugcb9WylCDvTLLxZTCpq/5jLbayjMMxMEMxWw8uaml3k92lEE1hgzejd4Sp0+UiQDiZ6lB9BJFdOJ87JrfIM80h+A+PIVd18Luy2AH7BnPdTbkudq3aqTifQ3iu1qtUQqy2Fn6/QKfPUzjeVN1+k7rqNOcnXrGIClJulw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVXP189MB2678.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Wed, 14 Oct
 2026 15:33:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 15:33:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-flit-core: upgrade 3.12.0 -> 4.1.0
Date: Wed, 14 Oct 2026 17:33:44 +0200
Message-ID: <20261014153344.81727-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0066.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVXP189MB2678:EE_
X-MS-Office365-Filtering-Correlation-Id: d2029d41-5b53-43f8-0693-08df2a088987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|6133799003|260925022911599003|260925021911599003|260925021311599003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	5GgmeJkzTR6jYTAm/Q0xN0E7Thzmr7dlYqyNPRLSgSYqDER4Xw5nn2Jq6bQbei8DQu6LmzjmRsN2REDrwyrLO2hnwDNl8842uCVKLsl/SHa2Vk+/tgpXYY51J3Fepc3aBS9uoSulhDxix9LeZKgjDVRj38Xlfx/8DNPnpIjY1eDcQBPxAtnFXntH812cinaFiLOb7SYUKZ0+uS0LVf1zpRi4P2caimZBNHO/1ZbQl4Dc9OuDBOHF9ImxSsdWL20Dy2a2DdWYtEItUCMCpQyvroWCCN8yP7ONKcmWgXZiDzpPD2FOI2SC0Sl8sF9I3nN/pfrwX3TJ8s/G3Jvx9fIft8Nw48bYSmylm2Dve/l0W22JWCtqGMx+YNxlKMqRXR8rAaSgm37qDv3QMG4Yt9GbyJOF25WeszX5z9HmyboDFngTlBGh9ar3k8iDDvbbh9yAjiZSsBmkxJLKDEJsWc9TQ/xTe18uPMiNGZwsWm6dkvBY5/3XC4pH+NobqhCUR7dZVr8IRSyLyJHTEksWePk+LMtE7AOFkuiql8zT1dJbvOUDNkBvroan4Bf/7sKobGCq++6Aln7ORWPcl87re2Q0wGzs4A9KMQiHmjkxPRR+HG8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(6133799003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?USsgXCHZWAyJRSAMnex1ZfczlT+2Wanlc/NFmQC4jnHywlY6SL9WADEUcQu5?=
 =?us-ascii?Q?NnDOqCa1zx0LL0UsCspsQcAYqhgXcdHuYYYOR6z8OqOvf5FPCPevCdAnW7wS?=
 =?us-ascii?Q?S5kqetjS/PF/UU9cwn+GB9kjfNodfV2gNclW+XNKcUdEOZnjam7gamc3ovpk?=
 =?us-ascii?Q?mI0VZRSb6dlRIAWcPuXNpeDBpifLtkywItjcOKt4GK4B9GwBj1i8t/Bsar8A?=
 =?us-ascii?Q?/z5+FitymHA2VjLnmNSy5FqQrDIFwY/gJP33tLyWHHHCr17zVcGo3KEX/lhE?=
 =?us-ascii?Q?C+clNOLUjteajjs9PeDc2mdRpT2QctmaiW419aO/+PjaStqNFVo6L4U9MhUa?=
 =?us-ascii?Q?hQzlD5J2z9Z38R2A2IzbNL/2cvuivcgo8Z6+CK5IMahQxMgwppEINR9QBFbE?=
 =?us-ascii?Q?t2zmjKqCsZlaAZ8CYMUVGPbsKlNKwDxqjBADxI6mbnrqc3PWfsdTd9xR9g6v?=
 =?us-ascii?Q?Vi2A1cKy9OHSCYuXFB3VR1viGamJAqltjiNuHMlNdBlhhF3c0OA+lKuX2vB0?=
 =?us-ascii?Q?5I1rwNS6NlH90WbG8V9e6itthU4wH/xjiFT7Y2N5AMDI4nDRgZYfWfD3IVmu?=
 =?us-ascii?Q?kLnPHo1NzuUaBSAYBqq2N+gAhs8dCmlj2xlLvKZSR8mWnEXecxqWMZWRYCoF?=
 =?us-ascii?Q?ktNiFub7C9f2GQ0avreRMufMv6PDL1WuHXXO6MjmyHSAwLFEKzXnh3T3rjtm?=
 =?us-ascii?Q?X8emQGJoklu064tPZc4UwWgfttWjK5V/i4gTR+Jwo5/DpJKfkdHCHETVe/06?=
 =?us-ascii?Q?JxcxUjGFdiW/F9TaQc0iaOAT2t6mMlwru9HRR2pFe4PfCn9NkJF7DTEqWRDm?=
 =?us-ascii?Q?L71jN4OuZKGEJLSOZWyLWrhnQK0+6rIr5kfME7B2t0utLLrIjunTH0uloFZk?=
 =?us-ascii?Q?aJZes8vKpX3OcVgTvtWVFkdhEPQC4t9ejqOm0ekykLEXoO1lNPpYYbVosU/U?=
 =?us-ascii?Q?GGaHPAxtLbrPVWmM68g2der3T7FL9cZ2+4LzbCxQ96S99SRnj6uGT/cBVGs8?=
 =?us-ascii?Q?qNSN3m5f/hq8M9bFeVqNYsDBohEzRLBynFNHIog8X9k5F74nDkj2iKR3C33D?=
 =?us-ascii?Q?xFbShgIPZ7ci+KNBxRGCQ68yXD9bMBDFEIXIHw8LaDGfjwAAEBqkiSxryzHs?=
 =?us-ascii?Q?gaS7yYer7tlL+raIzssl9eAtEiHAsY87luEMKMjgJGbqIPWP2PPbYtHxJsob?=
 =?us-ascii?Q?ddMMemtgTJ4pC5cksQgXjiX4OBmeTFYwB1YsLU9CIOV6OdpTI2KvyJxCHVKw?=
 =?us-ascii?Q?LYeLdFxvhe+B3EqbzcJI4h12T2BmNw5dZfmNcyZ7dLpQIpRMpLP7rUQyeS2/?=
 =?us-ascii?Q?7loRGLfoVyZ7Ouqkm4TQPyKx2rq4H8wZm6M25xs9sJxCeqmGgrLNEUGgGdb3?=
 =?us-ascii?Q?M7BXBm1/moqHzWtrMW37lNbDNzH4kT5ff44x65cHTJdizJPhmiEJmycC9NtZ?=
 =?us-ascii?Q?Z5oE0pfm3Gt6XwHkK0yUYQeKh8XNUXJHnn8TVtlZLGyreWSR4lUPH0L513q3?=
 =?us-ascii?Q?tK6FQ2LjonxJCfkThAWJ3hOVYW9KohkFW5P8oVvuY6cbd4pkjCpYMW7vlj7N?=
 =?us-ascii?Q?8EmuD/mjhUgxgPEagn3Z9mwJWzQ981fnblZODNaqhPoWJImmxIDEo/NZN0Uc?=
 =?us-ascii?Q?B3VdXM04MDPB6a5LA6S3SXr7KhlmRmpSlLktVxvz+G4xBgqsFGfVUUDluQNu?=
 =?us-ascii?Q?3pbspfI56fqeWC9hvHpZ2IF9hYBiC3CyiuaHE+SeIxUQWtNcO84xmmdGx8Sc?=
 =?us-ascii?Q?WLOe9UqEmg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d2029d41-5b53-43f8-0693-08df2a088987
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 15:33:46.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7+nNap38HTNWVZ4e7bj4i91pddzD2JooS9JaTisZ1glH+2QpTqrhSbJQUUaSroR95KwHO4bCQrVn6ylEts4Ssr+KsETkaQJmRtXfvjYN94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2678
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 15:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247781

ChangeLog: https://flit.pypa.io/en/stable/history.html#version-4-1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-flit-core_3.12.0.bb =3D> python3-flit-core_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.12.0.bb =3D> pyth=
on3-flit-core_4.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb b/met=
a/recipes-devtools/python/python3-flit-core_4.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_4.1.0.bb
index 786906b4b41..77db01c37fc 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_4.1.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER =3D "https://github.com/pypa/flit/issues"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a872983a882c694a8305f0=
8"
=20
-SRC_URI[sha256sum] =3D "18f63100d6f94385c6ed57a72073443e1a71a4acb433949161=
5d0f16d6ff01b2"
+SRC_URI[sha256sum] =3D "62e12b63ead8335b37f59fabb977c7167fe476dafb5e41785d=
fa8c9aff843bc6"
=20
 inherit pypi python_flit_core
=20

