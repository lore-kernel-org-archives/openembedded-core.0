Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C00EC982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 21:24:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.770.1789680281215144435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 14:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZftbIHwU;
 spf=pass (domain: est.tech, ip: 52.101.83.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tG08KYaf5/zlR288Rn3gB32lg9qadnAYM0EQ+8cPyHgP7GUrOSzgoVLqmMXKWpvsmR8FRdIiznVwN6MqJp10Lp9zeLWnTf5eLP5/tGj3KvT+DKUIIWfKehGtccACtZNlc/a0D8cB+W8BUqpYIexX9kYgcJVEdwJdw9aYqUqMQzKD6nQg2+dCuUubRjSZHgiTuNwJxsXKcuolAvFfoQVwdQ3Wuh5Ai8+CzRgT1hX+oeJ0GkWGKVZceHpy2K8sIpiR7Ctymj4V5jCXU3PIYLguyzSNLgRQmiSwPDCWGyM9Y8PQF+zPmPpxjPrSIlaIk/RW7kTW92SvokUE4hfttKTiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YOhiwtM1RbAenJPU1sXQFUFqoWc5FjN2SK00+wP56Y=;
 b=tY/l8VqlpIqTi7NbbdIQyiJxARN5OJHmzL79MTwr5+FJn6alQPyvdnfpvZYEsCBFuH5kdYSHGcDrbS4DkwQEPkt6c/8DSXfcFUV35jh5k5yfnld5qGYrSvQpBqYNox6gTlpnI5AlSs0yt2bMs2t78MJN3Yi+WrrPDPXJuKYmojmwP6bfm6kNkliypIsRQ8G/e7x3U3UhC0MeMCq7EQJedYTUHBo/5uw8YANxlNz3FxSuIXn4O7ZyFh+G0H3KUQ/3iiu2fNSEor67SwclbMufNHkQ6Nbgq1YVHm6xaa8KNuqsvw6RdVQAyUrZENitgS2g2KmAHG2PyK6DMePJZVMDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YOhiwtM1RbAenJPU1sXQFUFqoWc5FjN2SK00+wP56Y=;
 b=ZftbIHwUnpEo323I8nkUUVLsf8Sxs8+3TBce+Ze6DitRI4FJoJkgCIDLytT36lim4bQmEcc76t61rZ6BoeL7GR3P6tlG28DEyiDUip68RKp31BC2EuF3dt1lp8GGJbfAR9F69JVZ/zTWWedKXoLCg6NpslJCjPU4F3BWgUTTd4AokiUknZq8ENGZTbYsUK8m7jubB2YWUmr+0ltTd2GIiu03ZBTUT1Is5Yoap2RhqLeCibpLu4TRAVwDF8BcaIaTXRZmWfQJhx/JM7bxU9NuR5YV6l4bNbqbM5xIp6i/+xF44h47+074UbsmoyZ+2sZX3LhQ6jfWfcTUjGdM1xWtPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2579.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:63b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 21:24:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 21:24:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] libsecret: upgrade to 0.21.8.2 and fix gnomebase verdir
Date: Thu, 17 Sep 2026 23:24:33 +0200
Message-ID: <20260917212435.93696-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0217.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2579:EE_
X-MS-Office365-Filtering-Correlation-Id: 232d0c43-a05f-448a-1a55-08df1502135b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	T8AcRgp4z1dXUHJkJdGY75AVKkJyKZ8Yxz+NfX42T91Htb5lAY+2iUQLpEiG0CtU7DEJpD+NQiBAJf+P7yqEcAGkDW6B++b+e/Q+96bsyAMsWvCGmO0H1HksLomqs/+5miVavXkKT+nvmrTdjb+l2RoVxRqMGv+NHZhmDJ3NLXFu9pdBhX5hPOP3UxxPgkccXypSObCqJec5C4WaTwErp6uC1RfC7lkvehLZXj2f9FvI261MuB0VBy2PiMUJslZhllgVek/Bp0Tk/bIGNveaN4kwPbqKUd3BWohs2qGVAubQ8bRPcmTRD6CjiFaUKJQrSXY2fu6a2RVxvvbC1WvhxwBQfoQmN6kP4ftJGj63BeksxO5J4Jf6TphYSg0ahzRr7MDOC96D8dJFXqF9oM1rOAnXQznIrotudb4uKlWJiy0vnWk25jmbP280SMIVirbxpAGYWfey9M4OAncdI0aZw3tUUT4iabqANuSgJLzxxev1+RsJT6erT2BnBaI4ZMos7NuOHaKV5AedD7N0xhUK9HKH/sygy5wKQRVjDzxkGECwPGAopefd+z5PR3wBfXtkAD/YQHzzYQJID4E4XfM3sxll6Jz3Igr/nF9S3HqqSdjYB2bboOcFTRcqiINeNhMlXXZOAF2yDRpUbi5IxqQHQ1nP+Da46Wau3ijOAeEPgrc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vmlpcDzBZKYq0j311vU7XvxPwTFnNU0qQnafKponFCZFfKEPHLntPOLxJArO?=
 =?us-ascii?Q?MDPnVvHf5RwzbxC70a8qtx/lR2HD9XQpumd+KAcUB9RqzdT0zPu5bv7zIVfq?=
 =?us-ascii?Q?1rzttd1SMBHrLoy9Wz9Hp62Vi0pvT9BEVO4QevhVK084iHVQLa463sz7zC6T?=
 =?us-ascii?Q?+7P8mhkq2URnMCT09vErIY6dsmLYwJsxd+aZmKCPvd98Bu/wDXkMSXMUhsof?=
 =?us-ascii?Q?SRSxlrePZiYlXdxs9cbxuAqHbbM6P+GpaQVFrwRm6WfF5CoAtuEKJIwPuWgg?=
 =?us-ascii?Q?q8rGdO1m4CyBkRTEKSaKzW6gqFUTJDxCyW35w///t1jTgGIBYB5OJuzb7Hoo?=
 =?us-ascii?Q?/KNs4dFDq0fXM2lzDdHzNQabtWMb3i1u8jZCkA/sy66Bl4uUxkWHBP6Nnojl?=
 =?us-ascii?Q?sLGd7F5FRe6z2JZXYEZtLyzNGqFuHp9vOaHDRKDPTsKJyztZ8ysjYNyoqUII?=
 =?us-ascii?Q?7tsaz90UpVqo92bUYuhALkforDFdA2iS3mhUqh1qf7GVa6jit6CquJgMH/sW?=
 =?us-ascii?Q?4rqlUEn+XJqkE9DA1zedAXbLkvLGbnT9lFm8m0mgidOLV6GThkpmN6eXw8yv?=
 =?us-ascii?Q?gAA6riCXyFMv/vFZC+WI4EyWnhmtBZtGxwPv9+1j+t694/jT/XHR1lOqH1QV?=
 =?us-ascii?Q?TASDItgjMlCRtsb7vh1dU0okUjIophlMS4M0qVV6p+dboFCSrJb0aVMlvBKB?=
 =?us-ascii?Q?wA6sIkyHB8I5ROH7vbQj3QiTZjJ6WSnHkq/22B9h7BDb0PrI7pBESDiN8G5q?=
 =?us-ascii?Q?jyp74ABqtk+YEYlO8JL/j/bFihQnEoGmop9+hGJtk2xpdRV6Q+OZu1kDsTJz?=
 =?us-ascii?Q?dJi0imT5CQTBZ4jSu+1x0IIYgQ5heAZwrq57EZEvXKDsgn21IiRSMGfKSPbx?=
 =?us-ascii?Q?clHp8m4wEoSGFobLMo33cuhp6+x8z6CtibyrgFZSAx1qyuUiOlWb58/qDql3?=
 =?us-ascii?Q?CDzrB6dnMCF5217KUAAl3MXnwsj5KJH3KNvMFrLAECVdzA8Ff1e8kIO+muFw?=
 =?us-ascii?Q?d25m/1s0UwvRRBUePvozZUDuzlXraisCZErjILouA/JpXJEY9iv//JiWz2WL?=
 =?us-ascii?Q?czQi2Zl7CLhW3tVwa39YybGmkJSLlFfdxfqUE3pwK1JBg5I90MBXNTUrP51/?=
 =?us-ascii?Q?s/aNkP9lh3Ajs2YyRxXsZvELLwK5OqnzJXymToRCh104h0fcZmzZNacApXSg?=
 =?us-ascii?Q?eHcTOfr1BArusmnE4aILuOBa8UuOrEwubUczm4PAZdDEfKAHjPydUepYuQm8?=
 =?us-ascii?Q?kYs95ywUjlX0wEM3AfmGGDYQ9acfJQe1jcksPAtFMTBxNMDEBVhltBXs4Bvo?=
 =?us-ascii?Q?LEq2Gn+zei+OY1eo/u2CrCOjzU/6WCWqKpn7XVPirE5wDE9coTWuEzUOuePq?=
 =?us-ascii?Q?Dd7e+cdcjN/jctQdc7zn6GSoZ5BZUmoq3OrMiOnqYaXf5U4aQLaDIyNdoOtH?=
 =?us-ascii?Q?eXtKSZkyVS3tkRxlzyzQTUNcFsAa+V7P8FGl7mMrZT1/+Xc2HpKJiVht43ma?=
 =?us-ascii?Q?wZdAheFiLk7BMCP+qgavlz9jcue6LFHNPpSXtxCGQPMOrhMNdEkqrzSM7sgf?=
 =?us-ascii?Q?Ibf8H+1orY9ppWmDeyZDAlSb/S89ItWEYpysZqOx0NRgbbOGDtMdVNvrULnd?=
 =?us-ascii?Q?qJtttY2ML0jSQyJGycBmqAKRr2k/jot67BISH+ct9rCtSQBiRVrss9uheAjY?=
 =?us-ascii?Q?M0EyFKdkRbp5lvKexLy0+nOTdT6JhYblCZTCtH8QNxl1QO2uCmxdDzvRVZ5e?=
 =?us-ascii?Q?jvL4cUrifA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 232d0c43-a05f-448a-1a55-08df1502135b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:24:37.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF4xUAnNQr3sCpkRZFlRTG/IYCbI92QV24q52wQvLXcOFXK4MMkk/51YCgw2K8piawQsP5LxYNvYYqQKm+12rkL87rygPIM3PrwgGZCXfJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 21:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246092

This series upgrades libsecret to 0.21.8.2 and fixes gnome_verdir() so
the four-component version resolves to the correct GNOME download dir.

Changes since v1:
 - gnomebase: shorten commit message and code comment (no code change).
 - libsecret: backport upstream <fcntl.h> fix (MR !181) for musl build.

Jaipaul Cheernam (2):
  gnomebase: fix gnome_verdir for four-component versions
  libsecret: upgrade 0.21.7 -> 0.21.8.2

 meta/classes-recipe/gnomebase.bbclass         |  4 ++-
 ...eson-add-option-to-disable-pam-tests.patch | 18 ++++++----
 ...lection-Make-sure-we-include-fcntl.h.patch | 33 +++++++++++++++++++
 ...secret_0.21.7.bb =3D> libsecret_0.21.8.2.bb} |  6 ++--
 4 files changed, 51 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0002-file-collec=
tion-Make-sure-we-include-fcntl.h.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.7.bb =3D> libsecret_0.=
21.8.2.bb} (86%)


