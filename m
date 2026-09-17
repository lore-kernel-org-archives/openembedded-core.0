Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AEDC982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:50:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34370.1789631403621938175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rLgShwfv;
 spf=pass (domain: est.tech, ip: 52.101.69.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHQyDR2jSqwhacS5/mSrprZAphBFSeSimIjvmYXXkCGqbcrKO/+aZ6sfC6d9JDgy0V8cIx5VSD+OgP8KBOlvrOyabkEaqD1ea7ZLFXYuJ4J6Njd0TAPKDCqkwDyqVCsoCw898tB7VJJtz/HH2gnpC27nmIcxxcxbcW9yZiCRIAIGpOgzzmHQZONJDipWod2KOk3YJrLMwph3p8vCYik/19ndMWzffBPayz8iiqi3HkjgwWzO4VgVna+ngFnCOxrDydICXZYZsHXe2+q3bcFQT2yEENYwKrOVCbrkDiqbOTKfoU05DX7Ndk0bG+1cwykN6a6+0yFy0nkisXPf/YGb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVafVZUJ3sEBS1A/uD+XAy0LDOQfoZmTXb40BJq00VM=;
 b=WlciuryeKAqfG/DobYSnloEOUBlpRHrTc0j7Tev6Q4CJ0U91ggxrZocOL3XHXkFUJsIkUlmiXqiIvck3Eyp+WXIh4MxCHYtdRF1cgEPRmN3Y6bX3TUCsBIVEys+g8wr+fTm6uiGeQ5KkT8NNLGuj6rVu+TLY7LspiHqmbIhnCUrNh6ZKba7nVO+FqhGaWYQv8I6ivzE0XwOEKe2py0JveLC+uGwPCBMRfUMe+9GTRMrXzKo1P+YoVrb68PJG4689AyOMC/gHBl7QJAS2lXTJHvV1MBQzszJD7Z0hmYZrhNchznr55/8gEYLSZFH/11O3tdDbfYuZIN11Mt3rQwm17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVafVZUJ3sEBS1A/uD+XAy0LDOQfoZmTXb40BJq00VM=;
 b=rLgShwfvgHbs/BJIsFmlpXmDTyd0sVu1Je4IsMj8VoJqmWUM6KjxqHonrNyqxRbcCK9dg7dLY49ldT9il62CnSJxDzrKoga/XB3zShPIgEdTT8v4LznmvlRyzi+Hg5GwAgSnvGNNMB2hhxijFn6lFx8l8xHYwZrrNdpuAWHVTsavywmg90529wojytoVFgaHpYBpyVKHhCZt0o34NDQQ29bp8s1QIuKfc0PaxMcth7v08s9qa49Ngl7YWG6c4/26OiYLbeECj6QbVkLGdjDZbBuJmv0o8SL9ujDipKJqm4UH04AU3lnR3k8H/dwm8vLykDTXBaz5fA+ip9ZmJqYJkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA4P189MB1261.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 07:49:59 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 07:49:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] libsecret: upgrade 0.21.7 -> 0.21.8.2
Date: Thu, 17 Sep 2026 09:49:54 +0200
Message-ID: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA4P189MB1261:EE_
X-MS-Office365-Filtering-Correlation-Id: d390fd97-d2fb-4f51-75f0-08df1490458b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	gJP2ZEYEMauUYvKILGiKz6zkxIwkFXObRVfWXkb5utXktZKPEH5HldFZ4gesNKEKJGOZDFZBestQi5b78fW+I7do9BUFvNYZO/GUa0YmZIu1Sj+538p4i3Hn78WAIuMCNU8J7XqGKxzjLB0d2DhRUzKriyvPj+onxWRPBuuDiKXbgM/pyN+AIbA9yVo6jE3+44nHraE2y/+4gqPouLBcBSZxo4iDsfaj6cb/2Qj1TA4Cv1XiVMVYNoYUt9tiHHUZrIyiOa5hatTmaQRnwt70OpdaNVjVt4yOZtdzGPCaLj83QLEYU4epvdM2KIXpwASxIsmZCCtqB2A1bRUINvPCEOt5oDFyURwxpHFJhbiB96fmPHEJOnPnd8kuYFtvw4fnqFYoeOYyUvusCAnGJM1iJJgrJZav8d7MmVGpU48sLtqXdjz2B4+wWZTIzfBdZ51cBH2onBxGLMilL/O1uVojGC+BqJjnES5WZ3bymf6Gf4K2rTrkIqa6oOQKo4ji2MmVVneipyli2nB4YgxynWyNTFUmaibzz8zgyv6W+G0mLmh8g8BnDEEo7KQN9Y5Wt+uhfTb9b11UJg5edh7Zh4yZ1m032MiW9DU47Habdvxb5p9XXnAn6EtMP9GEH1+fKholtp7b4Nc+lMmKd7GUHXwcZy43068VjKCzm/YjQr3iu9w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EV+8faMaqPwE/FqXPIfTwdivQS/+r9vZqfaHX9CL+/SsVuEre6tzb23LVpHb?=
 =?us-ascii?Q?XpU1LJwBzUjoVpdfUkboaixycHnVyiT3gh41yJr8UXVjw3fuf64wdeFXVKLV?=
 =?us-ascii?Q?x9Yn74tCrHNYxsCg7ktvuFknw43nIN7wgIeWWZ0nu9bUg2Qi28HDskDTnZ8O?=
 =?us-ascii?Q?fNgGY/3mGRa79Pp6jOipakayj5UcJ6RfX5WamPD/aRwr+J/uCKubOWNM186Q?=
 =?us-ascii?Q?jQn4s5uWOnRzmmMToGyrZ2OrOXtGrNTPYYH4rU5lMOnJIXlJYjTQdVpzcwd0?=
 =?us-ascii?Q?cuyjuQJE2GaarlGHSCvzGKxJ57RDJV0/ahhyJX5HncrSFYmObVExejUcfgsH?=
 =?us-ascii?Q?YT0AjLCJqnRNxkiA5tkEafHTEom5MaO7cS95Wcx2MqoF4FrNeVZwk+Izq/ep?=
 =?us-ascii?Q?nVYkvqRJqJvmP6r67zY4QwF8UZ0lrJ79W1O1h8zTWBPx4Y7fewOarmNpfFC/?=
 =?us-ascii?Q?Ek7P0tisI4rj6pm8Xwq8ZHxcBVsBcjVUL3RgELigOH1+idVFJePUc9tI9jJ8?=
 =?us-ascii?Q?QLtiAe+aZDS1qFxaftplRf4a7nJAW3M8UEn8SP1geL48fMu+yGYBwCgbpfUb?=
 =?us-ascii?Q?NsCFFsAqBkz2SHTY/FbinoQzCZ77hFc6MW52tTjZK4leLbW+91/6WNq32IUd?=
 =?us-ascii?Q?Msaa1FmNxJVJqRDd492sQ7qBWBnxRZTB+z/vGfgTlESmEMzpdy6eW2MC4/+Z?=
 =?us-ascii?Q?/kBuWo6drqr6OMt7sOFCNJ+MwiPCgy1wC7Sywz6L7TdiSImoBGdbwNEgipxO?=
 =?us-ascii?Q?zahJ9m8QcyTJLDopY5TLcyIdF5kxx3UQY234hX4Dm6N3FfIDPe9iQU2XJODf?=
 =?us-ascii?Q?O5vTUoDicar0FDhoidyistb37aZNq+ev4b65zfYdj4/fPgL8nxcZnpzr3bHB?=
 =?us-ascii?Q?13NFlD0xXK9aqnNCFBV+cBF4GEyAjjbm4AIIz3yye5o8uD/p2TFJUV0i6nFH?=
 =?us-ascii?Q?e3UzDrp3bMrxKdVRdzpkOm87Y+7ylLUsOW6y0aCxNXGDXpXWSCPrCyDaN01d?=
 =?us-ascii?Q?ed0o06UVhVHGoaEzA7pFBGrkaPhK6ZlXAKGDB1v+CLkT+lLmgYeDaDn9QAZM?=
 =?us-ascii?Q?FS1gZI1elOpmokrKMOP0jiMocJRsP0AtRIMUSCzU/nILsoSU3HEHLNDltAch?=
 =?us-ascii?Q?R8JUgi2kBQHOqfm9dQ7+B9IPgX571NhqB+GTi+qI5NIa+GxRYN8SMTYfP7wq?=
 =?us-ascii?Q?n0ALUfZHO1Y2uWANEfwh0HwbtGiF/+rBbj40ncsLoEOFizRZmCFOgkqjSxRl?=
 =?us-ascii?Q?58kVoncEYKEolmO/M2RfUgG+YsaxuNkNDorOyvLbSXGpLMs3N8SqN7ih0sWF?=
 =?us-ascii?Q?NWFfTMyP4oob66PRtk5+Y25UrH6awQBng2NEh99asTAUp5p9H2HDxKN+Nsf9?=
 =?us-ascii?Q?y2GRdHn5SptcYTTuMY+SrAM2u+M1fkVB9fQBkm90GMoSWG13TjB386xbWFGE?=
 =?us-ascii?Q?WeowjY11RHPyET7a2ekWN21L8OK+l4Bd3c978RD1aFRnWw2hW3QvAUnnNQs9?=
 =?us-ascii?Q?oCP0qmd6tRrIjD1zs+WAaWMeo0JliRrsOMRk9Uc7tgUdRhZoWFmyusoburGy?=
 =?us-ascii?Q?jeZDmCC+KnoLnT1PthVPrc1CV4C8UGUJER+mX90SFgFJiS5g/ZWO7SpCpvBh?=
 =?us-ascii?Q?8Zvy0ZNG6Tt9Y91LEgwFuuBUgACCR75oEuVe/7+VxB+4CvbBLMnJHNmWvhZA?=
 =?us-ascii?Q?V6rR1a05XpnqAR1+nggm2J9hx54iiCclms0tEhs+aZKNeI+2yuetUHzDSJ68?=
 =?us-ascii?Q?zEGyTPzVxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d390fd97-d2fb-4f51-75f0-08df1490458b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 07:49:58.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRQvcKsXzIqjyJ0Jd9NrVZIq5XY3ZArtsy2zxfJ68AmdqLJkKiFrqMKKAYf4U2LOtFq7+5h8eF6vCI3XtNWlpybrQActFz0sjQxkG1Tb7o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246042

Upgrading libsecret to 0.21.8.2 exposed a bug in gnome_verdir(): it
derived the GNOME download directory by stripping the last version
component, which produced 0.21.8/ for the four-component version
0.21.8.2 instead of GNOME's 0.21/, causing the fetch to 404.

The first patch fixes gnome_verdir() to use the major.minor directory,
which is unchanged for all existing gnomebase recipes. The second patch
performs the libsecret upgrade and refreshes the downstream pam-tests
patch.

Jaipaul Cheernam (2):
  gnomebase: fix gnome_verdir for four-component versions
  libsecret: upgrade 0.21.7 -> 0.21.8.2

 meta/classes-recipe/gnomebase.bbclass          |  7 ++++++-
 ...meson-add-option-to-disable-pam-tests.patch | 18 +++++++++++-------
 ...bsecret_0.21.7.bb =3D> libsecret_0.21.8.2.bb} |  2 +-
 3 files changed, 18 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.7.bb =3D> libsecret_0.=
21.8.2.bb} (92%)


