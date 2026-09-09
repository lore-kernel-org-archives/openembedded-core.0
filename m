Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1139CC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 12:12:56 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10473.1788955966838197132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 05:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RDSj4laP;
 spf=pass (domain: est.tech, ip: 52.101.65.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju3Wiy0dkpjswsH62Pmtyam9pqgodv6NXTAyNT/e+FDyPf5nO447AT09iHUjie0AH0NTKgq/tPqJSx2oNv6eI6itv3bQLI5zzgYXIRGxoHjPG5CYxlNUGuCFPijWMZslYwsGId1Yaq1Y4jRNKE8NQ02p6uoGq8dq/jt+th4cYWP8XTJIpPd/vZT2+xVjQqKTqKvkRR7ukKS7U27aL7CthNJXRm26GbLGqxVpsirEyM1Im2dmYHpFVo5ffw64HZ1d23xfh72qS7OEdgcl6Vps8Un0S2UW6YrKtjlwBRTsVA9zOhVJCbTplwJfeaJFPCA5c2QQqYAfNn4I9kxAwGYzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+yYgMxwJV2oc+/4hesUiVKVZgaWmM+r7CX79+XZPfE=;
 b=so3qNyDaS80IzHP3nLpBDNlPPB6ShVlYrQP3RPggdSPM90fKMfNfaIW50qv+02sFvk2D4OH8rfVxF0qU5gFpX0ZUSfMhMRn/sFk6kZ9k6Gib1KOUGmvQDKDV7OzIK6nS9/2dZq3ICkF3r13vCT/3cAxYw06slAiT2dOTUGCHnhSS6W1/jRTHybm3N36iwgvOhFu3Ee4izchZJ5hJphJ1Hxj4fA/hwAyQiHxsIoc614E1nQzOdOg+DXPULyo7sTYlhUCEEpqEKrI54grO/hzkCZSDhdD8CbusyQHMOOEyJmPa5mlMZ5C7AeXuQ4Mcx6ZBfU/Fy4gAR++VSSJH5ie69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+yYgMxwJV2oc+/4hesUiVKVZgaWmM+r7CX79+XZPfE=;
 b=RDSj4laPdnjB5NKR63+h47+3/WFuijKTUM1K0zToyzwI7xHKhH2f8K5/BTBFuQdZpTV6Bl/sq0CQ59Xp0yJCqhMm2BzjaQ5dkxskVf4NYvPmKpqPkjlB10IWuYwTblCrZOD+H6yMCHFkWZPhD3Y5ci7Wqu+kS5A59YOEv098s0idXl8AxDN4E8+WvSk2WNFv0TLHGH+kKLbwkL97nUrp0Z1znA9D5K64grSx6wwo/ZKW2h1hmxsRYBafceyQhbYideLaSYnMtBzeaV0iC1EQOmrAnQ60Af1FmMO17GWN2zJYiQzQD2PDmeTQk7TjuKuoQdtpuevLSHDC+KGXOKb/RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1003.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:49::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 12:12:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 12:12:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers: Assign maintainer for recipes
Date: Wed,  9 Sep 2026 14:12:37 +0200
Message-ID: <20260909121237.27657-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0187.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1003:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a7687b-3648-49d6-6ad4-08df0e6ba44d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	HpeUjL/zRBsYZpo6RkoPTPD3AcgLkoT8ReRESbCfH8hMn4Ay8aZ/SvWR/ajf/Iw2SfrkKbJBCEzOGfA/MmTZmmHUIOnaD7i3cR1JfjnnKk4z+p8hMeBO1Gv+swopXhUv0T8BlygZ0FNJ/NLkhe9SZ4KhZGP22/QEG6T3keeS2As2Tlz+VeOkaQZE3u3yhXnDq+bOeGfPhpZ7EMFddV0zeTnQSFwyzCQE7wr3BxLRiEijupDmsCoMV+YDbG011DdD2/HNx4TS0kyoqwRi927MODDMg66LwSmMi36GKqAdFwqBY2RtyK6wvLfhwTl2tjIpDhTK8MDoDa8/dCOm8FH9nTl4ZZ0snoOcUH5NkVihmf+0fvn5sGjN/CsfWFO5koSiWQWkuHixMkG+2JTYfBnzCt2wlI/QXIULN8rQcSWvFoZBQvSKcAmtxPoyscdzAQH+FgJ9g3vG8FOWn9JzhUbszkgNEIM4ACkkATiFdNTPvTTAAxquyOx1parKEWPT9X7gU5tT5Ll6YPHHQzZ5MO52wlzyZFDxrwUeid1hYOUh37qWrlrSZ/jIx4Rl3itIN4FkOvYIJ1F+Ijz1CucP/fDO30GQcEu1F3c42NSpNYS05h0aNGdsuTvC++D6W0tfVVBhtrRy5AAy/8tx81tGr0TPtF8iz2Y6hME6GeTRKPy+brM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i7yqBohBiBBx+3ashrzlH+ECjZ3NG1/Af3aCf9xjzD+44gx7xx69p3dT7eqm?=
 =?us-ascii?Q?BbIfqKNJKD33+rsvRbHqh4vK4f/b640pMdQTknZRex22selUWvzoWGtBP1g7?=
 =?us-ascii?Q?LZO729npBlcbbs1LwbxDOYB+MHv/uYCtdc+jANs1XdITSFJxreijgMeuNMFm?=
 =?us-ascii?Q?I887kYBHqOeL765Z3Sppju0nb9sNkuJNt1o166vQBn5nbMTEoitgQpGfiBi8?=
 =?us-ascii?Q?nPGf0SA/kAyaABsPl3ngpOeKZt3tlAXzFyhzs/azy44RiEALjm9msDVI1C4V?=
 =?us-ascii?Q?v0nEOFO5o/HeSGdrqeSLDosXqDNYdfJpiDEyVJACL7ZsKrarJRgXp0X4HIS2?=
 =?us-ascii?Q?2B7Rjinl3rvRFSFf+cOkkjDPpoDFJLh294Ik+zMewP0gvb+zU1iiBhtKTY6o?=
 =?us-ascii?Q?1/O1VSJYVtq+YagsqFyMZV2usXEdRFMzx6v1e6fulZtEth7dygIjI3/tSD8E?=
 =?us-ascii?Q?lbM8grtiSoLn6pQH/HS1s1ZGy3TsJRFyjXFG3om08M4/lqoOfe8TRYUYrbqb?=
 =?us-ascii?Q?6RTUKNV2+kB3jXf6XpPKmPBYrjzAF8p5DMvX+sfqx+uIUh6qz14jQw18Xacs?=
 =?us-ascii?Q?JIjx0J6O02vTWufQSxdZRGq3/dQL6JO5xhkeFe2XoDJaX15vTRCy3ToC6CRm?=
 =?us-ascii?Q?BJYnMm+xMHz7NWT9K41/a9I4RiV+BNW8SVxMQU6nHOCzscagtbxAWwrZD2RY?=
 =?us-ascii?Q?xizE8CAmucJiW01/Wyq3v0FfkacV3I9wOj06UnsQaPJdzK/yGTCuRJ9hId+t?=
 =?us-ascii?Q?ZlgCxNUBiHqT369cFEqM4/CrE5G8qMlJdLVI/wvjBxAK73F5L1L/0OwBp4u8?=
 =?us-ascii?Q?IZN6cNWYk6xrVePzZd7kaR096KzOL3BD0L2h7LWOhn9qjcrEdBSFCfS/qAAS?=
 =?us-ascii?Q?JaresV9Us8sqLU4LIFIw4NgCBEiDIkMFobEoTbAvY0WcsZqaGXteQEJzJcD3?=
 =?us-ascii?Q?6lODWa9J2lLLt807qwh5Lm/aFAKeTY2QqTC9fSAciyjWfB+BS0ExV2h8a1Jx?=
 =?us-ascii?Q?chwGlM3aoUDd0jxjf3JtoSRYFkOG9e5kGqlFFaYTvJqx5gTS6GCt/aTA4kzS?=
 =?us-ascii?Q?3pGkiCzMGGiKADv76/rg1LNruC3T1XVpr3K8mv/LRauVjUbmJeb6WPeVjYVb?=
 =?us-ascii?Q?TvvWY2SKUR34VLSgri8R3aemOo9IVV3wx6Xp0kU+hYm4Slzw58V9+jdnq6fW?=
 =?us-ascii?Q?A7agfIpURDMsWL2LS/Bu+CvuI41Lqveu164RwZqXwx1wsmPFHmhUrwt1pwvo?=
 =?us-ascii?Q?hLJ2vUAMNTqRLSvVEV0zf0l4xctup/ADBxWDB2LOPaKOCJwdjWUqMdjK1qap?=
 =?us-ascii?Q?vdVqnNAtPCoCJnrZWfMlyLqzfEwreTxZWyoPtUxVXaJjuZIi8l2zHBqGVvFK?=
 =?us-ascii?Q?cOnGw5UcmKLMvf9BRrzOm/UL0s0I5GH2BAbrB2LUzRvVehla4MQhlls5oMUo?=
 =?us-ascii?Q?tHsJN/NTQTbTKWteVxu/mYDPxGunGsIEGRRSHMgze1lnnLyCd7DIzDzcZRlX?=
 =?us-ascii?Q?rfNOZ1xAk6WV8TvuJdIOKV/5tjdD3PZmCNMVt8N19by82cMujnxAY4JUss9K?=
 =?us-ascii?Q?ax9XDX4JsrusN3Ad+K/kuJeg5apUhtqLkz42JHaUZn5E7ZI/eQvwWaG5Er4k?=
 =?us-ascii?Q?x7Sv5LNU4Td5gDxIZYsSABAOB+iI45XipMIgLA1CYrYdHlwlPS0CJ2BVTtgL?=
 =?us-ascii?Q?TAX3lbQ/oc4DsdOhTj2YUVE5UwHaSzhvpOdMyNZnYmdpf0cy6+jVzwTWgdPF?=
 =?us-ascii?Q?cf4xPiaNWw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a7687b-3648-49d6-6ad4-08df0e6ba44d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 12:12:40.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEjBTWGxJAWdUJVIRKw5DqlxRbMuCT2HEqGqV1aQkAhFCP2ZydgySZdCDh9+vXyeBJilMS4phkhEUwNG6K9gK/vV5JfMIWfr0NakCtnLf/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 12:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245459

- Assign maintainer  as me for following recipes
 - elfutils
 - libpcap
 - libssh2
 - libtracefs

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index c1a83908ce..5cbc60c1ce 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,7 +170,7 @@ RECIPE_MAINTAINER:pn-e2fsprogs =3D "Robert Yang <liezhi=
.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ed =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-elfutils =3D "Unassigned <unassigned@yoctoproject.org=
>"
+RECIPE_MAINTAINER:pn-elfutils =3D "Jaipaul Cheernam <jaipaul.cheernam@est.=
tech>"
 RECIPE_MAINTAINER:pn-ell =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-encodings =3D "Unassigned <unassigned@yoctoproject.or=
g>"
@@ -377,7 +377,7 @@ RECIPE_MAINTAINER:pn-libnsl2 =3D "Khem Raj <raj.khem@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-libnss-nis =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libogg =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpam =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libpcap =3D "Unassigned <unassigned@yoctoproject.org>=
"
+RECIPE_MAINTAINER:pn-libpcap =3D "Jaipaul Cheernam <jaipaul.cheernam@est.t=
ech>"
 RECIPE_MAINTAINER:pn-libpciaccess =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpcre2 =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libpipeline =3D "Wang Mingyu <wangmy@fujitsu.com>"
@@ -399,7 +399,7 @@ RECIPE_MAINTAINER:pn-libsm =3D "Unassigned <unassigned@=
yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsndfile1 =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libsolv =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libsoup =3D "Unassigned <unassigned@yoctoproject.org>=
"
-RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <unassigned@yoctoproject.org>=
"
+RECIPE_MAINTAINER:pn-libssh2 =3D "Jaipaul Cheernam <jaipaul.cheernam@est.t=
ech>"
 RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <Randy.MacLeod@windriver=
.com>"
 RECIPE_MAINTAINER:pn-libtasn1 =3D "Unassigned <unassigned@yoctoproject.org=
>"
@@ -413,7 +413,7 @@ RECIPE_MAINTAINER:pn-libtool =3D "Robert Yang <liezhi.y=
ang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang <liezhi.yang@windriver=
.com>"
 RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <bruce.ashfield@gma=
il.com>"
-RECIPE_MAINTAINER:pn-libtracefs =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
+RECIPE_MAINTAINER:pn-libtracefs =3D "Jaipaul Cheernam <jaipaul.cheernam@es=
t.tech>"
 RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@nabladev.com>"
 RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"

