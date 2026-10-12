Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A8DCC6B06
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3961.1791836843813899989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=c/SgI+V2;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6UuuZrDmBnHJL5BPQT98cI5AhVsf3LNo0rmNwRx8xP7v8EPjpS0dmMKnR8Gvn4ihnTIfCfkWXpdaDh6u4CbSRXYbjNVo2IrsNQLnk7jCaCOEYZMuZYhtk3LmwOAkieq6DHuYOF2z2Jn9smiAXNr9jkxVVwAKiX+AXciQKziC3yMJ+mECBPeo95xCK47eQjkfB9Q8rMv0RebBAF1aLAKcj1a/APG8NiwKtuPsvU4R3LK6eotbl3jWud9Ebf/mby707VE5KD6FxRfSPqz/pBN3X13f1zM+SaSzGzGG3Iudn153Enh0rZ2DtkF1Z+oWu4HTgvNldIQWEJ9SMYhRgu2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOKhwhpghjdZpTfiH515b1/pdmDrrkyJ8R77tsnSZ34=;
 b=RJZyjnI7EkS8dnDesrqJU8gg0BfMfsA0cTnGajdNH1Ih4J8MEt/Lfj4ZTnUjiMycVVY2I6KewzLgTALY94ysBgaVLj9AyenQ6LM+qNqQjvaI8wgSLUTJNAJMXpANMLT9HZ7ski6qmtpPVhPt7gnT4f3YFf7iyitpoPl++8g05YGt4oyvMWGQo7IfsUg68OE9Qc0508ISREL05K1HJOA6zotqw6N2FjsK3EL7igvaSpywPmmYwPvDlZTTP1kcfJXt+EPsyaGt0OIzTl5rWNbhGNV7V3Abe9b10iVTBNWepGja+gDYFO5OZFh5YHzyyyPlbF2K1lqIlcjx/OnPurg/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOKhwhpghjdZpTfiH515b1/pdmDrrkyJ8R77tsnSZ34=;
 b=c/SgI+V2hhEsyngJZ4k2Y1Ub6tv1GaUVnH/UwiKkdN6pw5Oxrw96bRkbYSHxxJswdl66QiI+0423kY2C0Lwb8szK9lSMWWMkxMXXWlA4N8Rv1wSCg0+enqgH5QWuD2JdJOfjB7Q04vqIqvMEjQQqlZFNH3Oh+0GIQc6qY5/8Im8HgMQQ4KeEjZHIZDFKMzGjBE0TQnApcEQ1Zfs/VE9WTKxi0AGHsWXUVEwvbQqU+r44ZTziLb4V8UpuEZERyYhXdfMjAYZr953tNPF/riGioWNNIwKngP/O/tAkaZLKWtKOgYfciLWCP7Ee3Ddp4oqAkeYGrRBvAzyO1VCLqdcCyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 04/10] gst-devtools: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:10 +0200
Message-ID: <20261012202716.38597-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f00980-ede0-430a-f9fd-08df289f39cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	L/rDFRDS7gbcdOfeYuP4s6RRstJvA+HFzO6c7j34owF6GqWYZNZ8gKWuvR2TAz3avZRZE85yHJCJX5FXNM5DYEvkqV2CHYsAURd3hxWtZi9HWlKpBNdmIb30HDh8DgO95KE2Cu9jU2LmFIgDayttwrCwWqAm/ctMpv68oO22MxmSKlk65vMgedo8E4TspMW6bHpwf39aPoKpbmLgrvPzb8Bomcot52lzfPSwTfa2PaoH7LmTJ+so5PjICBcFVMl8auDhYcNYDyA+WuGkBIaUNlYbV6RNfefetsjy3DdU59SpS3gW/x/9Clra6UIrHQQTHQRRBZSCwuIhi6DjLtD8Bwa9CXzw8Cl40e55IgF3QiS0PobvVpH+wKsxp6wc0haJIGse/dRgszjkg8gqgtouJWFaai7icFP+Enc4T8PWryibiHrKfct5Q84ab3mUF5AYhlUpKMkHawWLMLIQLZBNMIgrFRCFBfY7j77Z5c7Gyso9K9iEOLCUr/8IwBeDTu6ZNKUBlBiZXt2LKdBPWHPG3tdPdAgVSOhSZpcF+yKJQvgmo/sb17t9pLCvlRj7QF1N61qLaE6/n4P6uEH3WannHwNnAT30rUrtiTUMKtNRtRU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F8PkZsYGilWW+Z5IVBKxZcyR4b/SXm250IGxS+E98brk/I8Hr71Jd0PjDY9F?=
 =?us-ascii?Q?XIh1yryMW2zZRHOhSGc4IYsPexu1vFBB7LYOo7I5nUCM8SIZ/Do2vc3mkiaS?=
 =?us-ascii?Q?MmFGNGuy3+ipBKFPV/Ny0M1aTCRVR+doHNWqGiOJpzA/54D/D4GwQThkueaN?=
 =?us-ascii?Q?aJF8wj8m7cl6JOXlBthkSNjHwRhEpIBA8CSR3bcXxFHjw7zoIlv/yNlUprlf?=
 =?us-ascii?Q?0gLQ2ycyjgmLN+AVLluO8W4MkumHn5dWSgFe+ySPRN3IPhowCHLWRyMXrOE6?=
 =?us-ascii?Q?LvYR6Nv+53G/b8mlb89DNVLj7H+JiudIf52icS+by0NHY0CqeD2k/KwUtJYb?=
 =?us-ascii?Q?iqxjZ9j9TFTUpRceZEvU3E+xt6w1Y09u3Bur/JkfLLzFl+gPHztDCtDSDSgE?=
 =?us-ascii?Q?2fuV+2MgsIa/DHHDGAfwxHVJ22LJ+9NfJV7dixyGrDOUQSilyGc9VwDN6xGg?=
 =?us-ascii?Q?Hk3rffXaUiL1b3wbYP2sRb+pMyglivQkhZHok6/N/opgPZdwJRwy/b0uwii3?=
 =?us-ascii?Q?v6xXya0E3Rx98oVJgB2npY5XcKyaW35moDLFgmNwx9zWzVVYIqwRBip7HaFv?=
 =?us-ascii?Q?+mtlmTFekFHOlwgxzwcHx4CANd/CRrvxnoYBg3iCLKmm/OkI0uynwMxmVqW2?=
 =?us-ascii?Q?wTXr9d955NU1vGJkCrbJgsO3K/nDVyA98Rn/SqwrYV/9aCrZVSIr8mQQtDAQ?=
 =?us-ascii?Q?HTYwAKCZ6samCrvpr9tWtQH7Fve/lq8jT4teh+wKpxHw6pix9YOLRrMld693?=
 =?us-ascii?Q?LaydgwriP9lE9cNy3nFIqBlA5ouZL4kqw7kxV+kInb3uyB8qKJoNeEQWmJKi?=
 =?us-ascii?Q?wu/Zh4OdGfcFccaJzbdZ+N4GzLY8+wPC932dhPerlRarvDmdMRRqpXzkJN6C?=
 =?us-ascii?Q?B47pNwdpE8aOPgqkWi4nwDC1Qdkd2xqx8QQX1PHUsON3L91r4Yr8J/MmRvPk?=
 =?us-ascii?Q?I5BfCKV+DpchRIJhz3TBmO4H8ROWtyNhNoTrPq4ZUYfYmvVJaVQQiLLt0Del?=
 =?us-ascii?Q?UAkHtW7ALj9SQ5RlwZR5RVrI3OoaF3tdaAAYnpiy1PQumPKYLrBYzDI2Ldq5?=
 =?us-ascii?Q?MaUqo3KMPeOQTWLQ5gkcoWqbL8Wbp5/9DDXOQP9KLgUZOSpqv85Qnu6tPuLU?=
 =?us-ascii?Q?hX1qDDPvhPI/5hu3xFuXM2KqL9gGtkvK8DcD5xWM6rNEesGK4yAI5qFusIxR?=
 =?us-ascii?Q?5eav1aspYTsBxD0DMGyfzCXYAUqzfqYciaTpVCX6XYDY/pUqX2mKbGolUfD1?=
 =?us-ascii?Q?NSY7Au32jJCIiNrZWIRN0shqNRF09G+2E28tnPz5M7xzAI6gB+nX73/zYPzu?=
 =?us-ascii?Q?O4s8gDmGUOgw8jt7xIJ+Z6KRQrPzunvX2bEitFC2K9xXAVp5qJFkLmnO+Pkj?=
 =?us-ascii?Q?6disN9H/1EGVIARmg3OpWjGnaxWxpXksXdWST5AP8zZmA0E3fiiHoE1b8AbF?=
 =?us-ascii?Q?SqAM+hILcqemmqIxihB/9RLMPAnLN6fL6BAQfmcV0yPOvy4hmioVmlrZ4g4L?=
 =?us-ascii?Q?RjFE6x30xfEuLlWPtlL8DZyfuI3l2wuX5yc/W5TpYgNBYSEDgCRD2SFYkznz?=
 =?us-ascii?Q?iLJIxXuCncz8S5iZzQd9rm0zvWbpqdF2/xqBQlRroKh2ILIRBe7vow3lHK3t?=
 =?us-ascii?Q?U4cNn1MEYH3kyfpLHhpZCvuihFExosmhrQOqtFyWN04sKSX+aWAv11W9Mtjf?=
 =?us-ascii?Q?LXwqa1k8IGvA1rRmJbOqFugMkQ1mtpiAk7XWNnfYMUW2PFyH4/N27AvzUmfP?=
 =?us-ascii?Q?gAkeoSXIwA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f00980-ede0-430a-f9fd-08df289f39cd
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:24.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfFTKnHfAUE9rc8YNRDo3gsfmufUGUNGq3zZHtU/jkXgPJ/dtXAfqPVQAAmC94qCYosY00UUhuODnZwf3FPzSjJrgUo22KNK/i65uX/G2j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247679

 ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

    - Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.28.7.bb =3D> gst-devtools_1.28.8.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.7.bb =3D> gst-=
devtools_1.28.8.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-ha=
s-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/g=
st-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 3f07a429e0..f10b0e2e6a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-dif=
ferent-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-dif=
ferent-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 80ad3bf3c51cf013480777db355504c4308d9030 Mon Sep 17 00:00:00 2001
+From c02d717c6796b797b6da66f022b6a6604d03e510 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb b/met=
a/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
index ec07499f67..ac46adc36a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.8.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-de=
vtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
=20
-SRC_URI[sha256sum] =3D "9f3a389d6a7efa5a18d7564724a7f3b1c3faecffcb8fd1351e=
d0e811d1873ad5"
+SRC_URI[sha256sum] =3D "a85275f91e421ae55c8ec08779459a3f93f620d2acc25b6e67=
23ef43573c6ba5"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-=
plugins-base"
 RRECOMMENDS:${PN} =3D "git"

