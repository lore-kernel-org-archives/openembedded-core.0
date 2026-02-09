Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6901E81BCE
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:22:29 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48362.1770646945766696531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gFr1sNT7;
 spf=pass (domain: est.tech, ip: 52.101.72.5, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGxpD0SxgHKag+631CzBytdWCBHXHhtBpDaByiwMc+Xle93JdUANeKRv5p/HVTtKuMT3/2LUVO+jnxyWC3DRO1Ocd2wlTfzECA69DAfnFqVn7QR3UDkDB7puKKORfTngAt4OQE2CpAGtnpf+UN05S0C2CIa7ZykakG4vljMxQ1Be0fl7hyCjK0uBFkEV3YwtLhftAYsGQdFUiKlVocQJuxkLpllCO+HK2uqPfVmVakC87xDmh8fGkzkIDtR5eDOh+kE+Fqrui62yBF5uW7CbWVmz5j8dTWolJpjszZs37NQUJ5vWYxsp4zbAl7d6gkcNlkCSt+VLGsGEZYzxNI2mvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSmYh6x4sDwZId0b0SYbTG55UwcMtXcF4vlxAMvRulU=;
 b=A17GTzVeizB6F4agZ81MFul8Uk1nFsDxCSVX6iXXJDK/H+fLECcf1CICfNSMoEpFfZAALicSdiXnkbeOJcKU7AWbZHc2ebJE7OE4nJyXrO1YAUn3rxfQwBQD58j6QATJFNzlP3CSvvXTVwWOnnuIYOO70CAsJZOvhabLFen0o0pztTCzdUlD+5usds2RJkLqH3iynuYJa2XVWSQv+oka9+TyYOApnp/46R6KZhil3UhyD8BwHG40S2mc6acVaZCfGzrfVdmAUrcXlzaiSIkuEcxxhEeQIiODLwSW9/ul7rzRNj9HGLIB/xgDksYT6c/aaLBpxzF5hb4EHuJyDfj5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSmYh6x4sDwZId0b0SYbTG55UwcMtXcF4vlxAMvRulU=;
 b=gFr1sNT7nKF9bRBoAFnrkvInd+C4CIu2efkx+u3AkCezXOqPwPlPbrxFbRGMnRcAGunJ5JA8lBqNkuN3NRDi85qdpD75L+DlHluOc0T7W/+XbaE6kgi2kqbRKbAcfqsEw4YC2IW9J+M6DlpA9BIsBfRC2OAMkQ+IHKatbsnQ72hGYStKoQUcHGeMUY1Kupoh69eTeHCFGxDtJBwc9TTi5noj/hUgYXrBJjMI+Ajh6VsV1UPU+MjJGnre8X+3YbBc6rlx3l7vsDPINhw7xQ0ALb0xZ02itWm3Ti55Qa8xPUmNhO0874+2I/5VQnK84eoe0ISPsbd2gL+ILUOcWdcHLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2224.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:571::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:22:21 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%3]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 14:22:21 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 2/2] avahi: patch CVE-2025-68471
Date: Mon,  9 Feb 2026 15:21:48 +0100
Message-ID: <20260209142208.55564-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2224:EE_
X-MS-Office365-Filtering-Correlation-Id: 8daa9701-0abd-418b-b816-08de67e6a366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ln5Ti0OeWJQtnziVKH0TzElSsNJl858Gdgk+iMDnyopR+pEbqbGh0EU2zhOr?=
 =?us-ascii?Q?HQXDLiN48lz1PmOEczcS3LiDVZ3UGe9LKTcCPNx2eQYXL2BMljMMRHhJv6w1?=
 =?us-ascii?Q?EARxyE9BMNakNyPVIotac62hh0KuyusIygBf8+GwPdsbKjV5mhfNHIctM3lT?=
 =?us-ascii?Q?RWQpfDSpJlFC8eOTVXkqCJRT1zfwus+LVxGbIcolkuyKO9dtiyQIKkXiPVzV?=
 =?us-ascii?Q?R17sE2uBisictsypFiaeHqC5zxv/Fg3RJHLqQao1EjY8VZnL8thEnIyip4B2?=
 =?us-ascii?Q?yI+3hIjJGlCR+U/aZyVb0K+yahbtWPeeV4ItBRrnWuF8cx2Ii3PIk6AJ6MeR?=
 =?us-ascii?Q?rSPCgQpwhgmv5mfi/mihEMUn/GbmLBbHNPHiXhckTBSwoliXZRJfOrKK3qZn?=
 =?us-ascii?Q?+J9xRBpoF5r6HecBlBOIbTrcLJMj/wWwaBGgYTBH//KmA+RzYjTcbNUV1en/?=
 =?us-ascii?Q?rfWtHoHha7p90ouSB0C960jJYR/9QYSFy0RtWeaJmDQAPpk8dlSNDwcwBEhI?=
 =?us-ascii?Q?xt/HroootG9XPIH5GzTZJ8sAJOFHtSTXjYe1uE5GOt3CeLVVAvKAKueagGAU?=
 =?us-ascii?Q?EcApuHe1JzhBRWJkZcoIYsLNX5x8VUop5oN/iXpz9swLq9Z+WyKaz4Gqui6T?=
 =?us-ascii?Q?G0LUw5dQ7o+4FV9t8l7LXxAnGxiOVHHyRkBrtdOjv7khvTAJnCZ/eG6V01BR?=
 =?us-ascii?Q?z62cM82JHwc7W50rXXJxSMD4pX9OIbxP6CsxXPjUKk9ORNYfi2Cz5RDjeGC/?=
 =?us-ascii?Q?6KYt+l3asn5hfj6jfCFnmJO68thLacRBP5Gqe9xngfTTn2Fyisf4dXoQxaQb?=
 =?us-ascii?Q?R9wXPwOqDaLcWj9/IwAZsfDKeysLEktv9NpiaZuUOLFSoP1144DdHwEQtR1h?=
 =?us-ascii?Q?K1XjPBIW4TnUIOQH7dWsOSRmD5ws825cCWZi1HTGu7IxdH6bOEQNAZVQuJ92?=
 =?us-ascii?Q?FPAAs0Ylv8eplhEygYKaEpvQnv6DO+/M03BMcYjAmtufWnlmdH/hSEDZCkpZ?=
 =?us-ascii?Q?Ue71xtLP78oe374vItGyn+06Etm3wlSGVERPfhbC1GOal1k3TISQkG6sEyd6?=
 =?us-ascii?Q?6iPZuiKf30baF/Ogii249xQVvoLPpzO2ULFnhuix0B+b0Ze7yVeunFB9AO5t?=
 =?us-ascii?Q?rfaN92DXqsnpsBzhOnxW6Cmd1rPEtJl1a2emxiIOAp1C5YCjr6W0PD0YdRMv?=
 =?us-ascii?Q?+RHnGUc/aIio0mgE76Q253asuOGOwR9u/FdAk32Y/LMpTEewX0z+BgGRayNO?=
 =?us-ascii?Q?r/9H4OmDpu5GzE/8Yl5HuhJoYpW0FPDc+42hifXkPbNglMzdyGpNLKLmOiMl?=
 =?us-ascii?Q?j8e7I5D3e/BGet+R1y6gi1lxG9S/r2V1LdA/27W2evGvvJ/jbcvJt80sMI+M?=
 =?us-ascii?Q?l+MZ1SFo/BYDnVr3QJCAK/LNmBu+aKf/b8Q7/LcpyL/lTOnoCW8zlSJfzAUm?=
 =?us-ascii?Q?RXC3yofdoarBxBJ1hgahLQHcaEXnM6JEvXWFbrQHEWPCsg1ZfpF1mxNdIHif?=
 =?us-ascii?Q?HjCAsbHjM1UqLq8VgvdmxA2pb/I220bb/sNL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?miXFGkRqOqxur/cEN4leN0VoFhG10abeyIshxHirUH773AazcL8mRP0fgg8t?=
 =?us-ascii?Q?A80hkERC0rBzQBWcdYRzMtnexKsLYCSWR1EIr8OYh6NuiUouLNe4OELwdZzD?=
 =?us-ascii?Q?hyISxsC/Xp5LASg+A9odpxLI7TtSIb/dTb/vau0/M1wvQHd6Z22XeLasnXpW?=
 =?us-ascii?Q?3IdkmAqJXmLC19xmWjD0khtKmFxk9IB0gO/1QLgizr4r5Wla+CDZB+47PHi4?=
 =?us-ascii?Q?LAbAuvZPK1tG8njykFgUdZmDufnNz5yZ/iWS+k2+1KVy2ucWuSS9hMHY8xvq?=
 =?us-ascii?Q?+REelDW1ZRmvN8obQl4iuBlaxObAajCv0vs1SqEELX9Of3HHC8jzdhJZ1D2i?=
 =?us-ascii?Q?rg0sJr6Idy5rczPs82KA/BihOCMSCt2j8E8gtE4fyQtptBmt8ng++b0r/Khw?=
 =?us-ascii?Q?FCwe8c97yYMmtvtEsWys4SbIuCREwRi8/7WHCFPqxSXlPXmqkyM3kYmgnDk/?=
 =?us-ascii?Q?wBgbmfYwCLIXrXBJLY1NxBlAR738N6qpknaXd8zqtmln8VZ6AnucvgbsUUHy?=
 =?us-ascii?Q?rxg6fnos6k/RA3IKYmQg5kQNhJST2luG/M60qF5vydwzLQJAejVrJtcH6HJa?=
 =?us-ascii?Q?EmD07fTAeRhG+6natgpvr8eCQjxLVg6x/8ytpbQMr5cb4Jk/fbpWXLjzV4Wb?=
 =?us-ascii?Q?/Ao/fQpXMppdfkSFL/ipSs6WgYZ7Po0N5rLQb/VaNd/qxda76AXmJ2TPC4El?=
 =?us-ascii?Q?J/R/hRMON5BLG3X14l4HTiRIbDPU8Emn3REWkY0elvXbGEZFhBZ2Xz+htXPa?=
 =?us-ascii?Q?OlY4M7JcDwLKXrZVOXYP3FFkJK+ybpy4fesVRqbV7wMAA8x/zWEgyxTvC1oC?=
 =?us-ascii?Q?7N9gv83IQWokdDP4NfUIaKECG8j5fS4s2ZVbgtJI1QjCrGdnvnYmMCDvWLh8?=
 =?us-ascii?Q?2vtq/I3vqyAZkzD/3BqUcEwwg1HfCsDro59ouE35HPvrlmoHOOYuh1nyGMR1?=
 =?us-ascii?Q?gZPCsYdCeU0eE+gB9ZSOQz6dstymrDFO06RtSiv8dW2ZzI6IgttBR38vbRlb?=
 =?us-ascii?Q?fhvY0IUV62GjOVtXE04qaXCP0w48QWXOyvoDeV8sIZWKfpmjJulkb/stSfV/?=
 =?us-ascii?Q?ImBA/uTyIZEdTRMt5Pg5lKTheFH+XnkpDZqoOR90u2PF5HmmtFNB9evYZju+?=
 =?us-ascii?Q?UgaW/uwiM3xaEyXGhxYcvC8X739IryrV192Ekx2wFi15Cmd7qweVD2YLk7Z7?=
 =?us-ascii?Q?15nHayHdJwCx00QB9F9pozFNP7grrfqTYWLIQu671V9FZ1PMDD6u0GcjbPDU?=
 =?us-ascii?Q?cOdpWPpK/T72cwOu6u+E/hFacDGvCQ6wEHOajfDhmVWE+L4ktvFDA8dOaxBN?=
 =?us-ascii?Q?c/LXIEm22NN3DphGtCrRQMImIBpG67H6coi+dqn3IIJLyU7oSGCB1btwXRHA?=
 =?us-ascii?Q?whZNZ3/jLrw/77FdB78fA/pQDd4dzG8vow1i9TidYedthJiVjxOTZaah8SWT?=
 =?us-ascii?Q?TVEwuohIAXxr/QvFfEUgIDd9RXYNXJycEi++0E/1/bdnF8D4vwcAZTcr4Et1?=
 =?us-ascii?Q?AY7iTZj/WTzBvLIwcf8HygssHmMee/VCcHx61/ugV14Td2+qPHiztQ6tXEWw?=
 =?us-ascii?Q?tTTG+Kl7UIyEkBe0ju8aClEzGlJgPmq9R5wmlvRuHQYNBAtIPnuMZHiCRoM7?=
 =?us-ascii?Q?/QjHleLZb5qjYTYW+GsdXDFsMBHN0fNbF07Ug3b9Lbak4Yl8jDx/osT/nmLH?=
 =?us-ascii?Q?8v25glOvPoEygrPCNa9ehdzKyM++aHFfxJqAru4SoCsf+CODshWGv3FrOI+o?=
 =?us-ascii?Q?FHgN+CovVA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daa9701-0abd-418b-b816-08de67e6a366
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:22:21.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZMXoTi5hbLLz21B+OyndBPzVPfCufLQeWkdyl9isjqwgD9RjKSXvAEkSFZBOBd6PYFFpClB7ungA7ZHC0iyBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2224
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230802

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 4efb29a7d3..6c58613475 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
+           file://CVE-2025-68471.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
new file mode 100644
index 0000000000..210565cdd6
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
@@ -0,0 +1,36 @@
+From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54c=
c0aa1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e57..86e4432 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+=20
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) !=3D !(l->flags & AVA=
HI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+=20
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+=20
+--=20
+2.43.0
+
--=20
2.52.0


