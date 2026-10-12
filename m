Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D7BCA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13152.1791811232994244268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zEMwQU3h;
 spf=pass (domain: est.tech, ip: 52.101.84.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3hmRDy4t7jilF7Sv8eQnCyDwwTDozkuijOHxuc9H7k6vrxsEzqXsK/SFGJ8ohUiToqMaakZcB9r6yhcihOuq4e7VmjllZ3CNUa9Rb30MdzZWDBVloBGHSD6SeYyixTR1GVu5prmhzETO5YTNtn2ukP4xtN31WNQUcoAxHLRiYHc3fdDsKRzt93PAQMn+x5530mUj+HxBPxiHjd7LOPIrd80k8QhJR+edPAmqc8171FZ+4D929t6CgSJa2uL2GzcS6Z8gTTRP11+xCG3z20zgQh5jMLi68+xtFLjQGEqPD4+0RzcUCCbgu/R6OfF75uDeVVbsH8rc2xV7vgfeTflEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35PLWappULlWuBFoWuR2h4TWfw/1lukq3RXIXzdiU+A=;
 b=PuR/89tln1H4PAo/qKKkoDOfMqTXi70FieNPIGTVN+bgokJdgNJnUhDihzE+YoahC7oKEEI9yi+x+lrmdrAyja03Io+1I8JH27haVh59xk+/kk+8m76PaV5zWqp0tvoCZHP1evax1ktS+g/3JnC+UNKo8bsFKUsJUuX85pkWTzPfHPC8zHH6SCUvgXzg/WW/eccAJrgHnWZpgVgwWRavfsJtE81yTXT9QlC+HuAIIZsY7S4YtMDIf8yfmRESyXRkOnFJEouj1Jgxuhh2Ku5x0cJ93p1yg59vGvFN+MyP78vv4oSCgwpsVuvC07UlScSRTuoXvEDy6jC28qKcXUEK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35PLWappULlWuBFoWuR2h4TWfw/1lukq3RXIXzdiU+A=;
 b=zEMwQU3hzKf0/4HNObqUJd6zAzI3Q0eevQR5OWyIUI3NWOFajGdR+Nw1hy5y+7Q/mHxPYdsqSkKeg2mrLKDXhF/cZYwxFE+nW0OqhjIwMmME/RhYBywJ/cbMjVWF3j4ga/l3frlmQok02uz0cNVKYcmTBgz+JP/GsMM8ijnpsVE38MSd1HRnVsoeUO/knz0MZPwKKDoiIaKNd7Erx26lc2AQn6+mc9rBFdqXFSJcioZ22rn3sQ5j3l4k6kInS3ts0ktHca3HgSjCVHp6kzK8qPtqw+Ho9bOcaAh0aNDrz1+6ywHYNDCDM+fxf/SjyzakhXfHeqEtXFdMtJnCt0g8Pg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/18] at-spi2-core: upgrade 2.62.0.1 -> 2.62.1
Date: Mon, 12 Oct 2026 15:20:01 +0200
Message-ID: <20261012132005.23909-15-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: 520f94d4-5f38-4f9e-c045-08df28639557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	TCeCqb49MM5HD6e0fmPTgLzKdpPUNdAxaLzVTDpGb4nG9C3LsNSbRqSzVO2JB6qyspsUoUgnQbQESvIHOg8uI5sat3OfXR+jo85EJ77HIba49QKYU8XUllsTfJ+f5gMsILgs5CzEtFgjSztA5kA8uPUiMYOXH7AapFj0e6xUq9gZv5w+mXcCOr5gx6Oll//tbD9PBwXyQsYr8ZdP6GSjZzh2cYssmCvAe13mtFc6621IvAFnZewGlmaYMF6vCqF48wbzlW5HX8m52rf3o+aloqokBEJO5kzXqDpID6BTxQtrCHLaMoXMka/0fMagFcrZaWgdG8tcNJw6/QrNc4SDVVsHH5lPuISl76Pg5vrrP+z/ATnmhP09PwLlbOJ9dlVSgPpkPqcgQ5zkSxMl1yaqyWnZ5HaEroEiNtRAgNV/G2zfydz8fnQxuxCkrxmKQJA2nNilRiLuOchctVS3CjqTXl3gTFcRcYi78Up5/C7VYaCfKtHw8YWGYVoWppqsa1wSON4x5AN7zDn8RDRf2g58IFlHfC315YyqNcCqZdGAd3+szIcWPCQl8cPGpk7FWqX7DlaFvLxH5O+jg2gBQw7SyyEIwkJWEfzaS0uZ9ojRLV+sjChKErRDDQlukp3SqIVtPhjVGlScLxvZTlcJ7YnQcYXPrLxPOxzv+gR86l6RMddZw5wX/A3iF5jdgVo7LTmrm4hX5Vtp08q02d1v7zKI9sUHh78SbUJb5gtLWCLeC0mFFr3iF4Es4UKSnOOhWKJblA+zrSYIQikEziYNzV89sLz3CGQo9Gmgu52ldGadXqb1Vb8l8af2rHBmfeKRy6vwKfXFiFPyYM18388GQJte6WOGA0nE5tjU7Xmk7+rC3Sb/e+88u8znTvq/vpxHLQLOTdZMgHkod/LBXmB4hqx+y5a9ffOHtBKKTHPRaQdffDw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jgri01RZBczxXKT8YQ7eD0u8EFWypNHeQey2pj8QyYf4l+31rL2lQNVtgGme?=
 =?us-ascii?Q?huzZmA8L7ryUz96qF88vC9eT0eD0pdVggs2OOQBgpu1gBZ98MO5z0Qt3T7DP?=
 =?us-ascii?Q?ATRxQ13MWy+7C+GBXERbtn1/3McGFbnDLXUzZ+me/bQxmh0IF3A0xCrlCpcJ?=
 =?us-ascii?Q?+/jdD05vFuLbRfAVBx3xxUV0vf4JJ5cjhFsTO6g+0OXm4P3NKj2neiRMgCrd?=
 =?us-ascii?Q?D5QuE5tW+NIm42ZB1z0Lp1NoMuEOo39aqYExYfqZFOBDc7tlTEOjJoxBKu5Y?=
 =?us-ascii?Q?/pelXgOnEht/wAJuIL2zaSmDhsK6iSoyitG/idqwytZlbXAnag3ZnorS9KDw?=
 =?us-ascii?Q?kpNcX8BK5JXt3q84nOlt7GGtoUtibI1nkYLXOksBP95f5Ik1W9XZ69NrXUP4?=
 =?us-ascii?Q?KO2i5+Q5W3vtK6Uq5b1nLw8f+1AAs1stXpnpCtuMemuPLWq64V8N72p57U4w?=
 =?us-ascii?Q?rEJXRPTGPV7OFkqK4/HE/Achh7HLD6OfKehn0JmYTA1CjvzkmdD1tkui8Mmk?=
 =?us-ascii?Q?tq/SWsRrL2moLQ5DdN30xceiUVjWf7BALxfFbnDGQIc3wSUxpW9UYLlrTnMB?=
 =?us-ascii?Q?QDzawdHs0icZGF/QLwkp4mJ/L1kcT3UQeMdLvG0HfLL5jVJry6wqCot8N6N2?=
 =?us-ascii?Q?9t/bWDGwutEwEzaK7n0LOM/Hh9cVOKPdUD1B/2+FxBDhbawvQIj8hSQnAQVy?=
 =?us-ascii?Q?iyP/nVkcxysdykYuGNRrvJo3SMDUIj8EbcvckvYTWvOdw5xtpSFo2KrRJ1OG?=
 =?us-ascii?Q?BeD6G2dSTNR8cJTgrx2iGFc+CHmh08epiMPU7J5UAq+BodLPrGVH1Q/kkGh+?=
 =?us-ascii?Q?C2WafvZpGWlb1nilI15YSPGUhjs+sVmwGc77FZSDkTBaGIfMJmWk/JUOLuRo?=
 =?us-ascii?Q?ie/AWaIjcDhDXkynNmZ3D8SBHotumcYFNDlld1eBxrRICZCJPuvt3wvQ1+8n?=
 =?us-ascii?Q?6K3MfQKs90OCqH1hJ+9kUou3udbvs9y8FqiBa4RAw0TaQEJgpTgMosXl0ii/?=
 =?us-ascii?Q?FEDLLKXlb35wE3XZjZF9PaabAHosd4lHWg1my90WvDpg2FoYD0361tJyZp2r?=
 =?us-ascii?Q?2E4YGJZpsDf7Xb0Ntw61JbRD1zsnBgC+ZbdPw6WACnultn+ZaEWvXY1uxi0z?=
 =?us-ascii?Q?/FGTQurV5mdPFFGJBegCttqkIgjrDuNVkjIIJyw5+Rh7dAYBI+vCDO6RIIJ1?=
 =?us-ascii?Q?Ad0wDyAYLs6vFtY4gaRAD97kZM3kQ6418MxcUc6qoOqR/OlTG2plkwRpjawd?=
 =?us-ascii?Q?wcqdXiRoiWqvASt7IXRNAhpCpiCyBsO/1GcdbspsZ1YU7PENApzF8xQlJBYR?=
 =?us-ascii?Q?dlAKWOYWuTg/PowYs9kgfk9QlpceUr0ChVk7D4wfIGt23q5pp7SUvomXrhXc?=
 =?us-ascii?Q?bXFX4lr8JtkiNW2oTo72DGCUDH12Ii2uO2CDbh4hdnXdZ94hve1C7U2/R7fB?=
 =?us-ascii?Q?kddl35Qzz9pX2h/I3AUhnm4wAQoZ2pL2MbiybFIdaoi6Y9PQ7u1gZNR1fpnF?=
 =?us-ascii?Q?b/bOpHppgZJ0xTs4cPuZEXzhV/TivVhCfYPTuvPHQAw/S1ad1M9hp5GS5mNr?=
 =?us-ascii?Q?LyZspbwxKOx9cEgw0jEj6cbsxzXx+lrgQLRkv6HkvCk8krSNLokGf0ZIRc62?=
 =?us-ascii?Q?b4114JrYIMBQJKtk5LXi+COt2a28ZyXDFf+MJxkXwUqtUhDGeTBQspkxFoKB?=
 =?us-ascii?Q?OunDZdL193We3Sq3QwpMLoGTxE+Rp7tXNhPNvPls+KX8S9B1tSHx+chc/gsK?=
 =?us-ascii?Q?FPjh1cdNPA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 520f94d4-5f38-4f9e-c045-08df28639557
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:28.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pzo9z6N2mvp/miTTWq5PRAImbuDgj890g1S/XrVzZRmbkoHevxRJop1aKvoJ5WCAVMV41bOJeMjE4C72SHBcY22nMwN2N2usadPGNmVDNnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247658

Release: https://gitlab.gnome.org/GNOME/at-spi2-core/-/releases/2.62.1

- Update to upstream release 2.62.1.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../atk/{at-spi2-core_2.62.0.1.bb =3D> at-spi2-core_2.62.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.62.0.1.bb =3D> at-spi2-cor=
e_2.62.1.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.62.0.1.bb b/meta/recip=
es-support/atk/at-spi2-core_2.62.1.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.62.0.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.62.1.bb
index 2e85b14dfd..44b0f7e7cf 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.62.0.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.62.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c"
=20
 CVE_PRODUCT +=3D "at-spi2-atk"
=20
-SRC_URI[archive.sha256sum] =3D "fa462f1834bae569c5944c34608872f9447e5a2889=
ba2aa4d5ff9f2d6ff8a395"
+SRC_URI[archive.sha256sum] =3D "cca6b6a86e4389d89b370288761ce2385ddeceb10c=
4412da78689bc30c88af2d"
=20
 DEPENDS =3D " \
 	dbus \

