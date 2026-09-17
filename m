Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F178AC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:50:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34370.1789631403621938175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=c1i0JUjG;
 spf=pass (domain: est.tech, ip: 52.101.69.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOYNt6LP98grrqKp7/IQ+bpMYM4nGzFChnzIlfE1aa8uFUOnC/dcYeTXuFV9tgrJbHBM5Sx2bt8BM4PEFhx2/LqgEFi4kW+Gx2MTR05pwodkAKbbAgOmhzqyD3fJLZWWDMU9jTmt9eO2z6mlWhg/dG+IwE06BUdBLLiAm/UGUzxT6M2kHurVyCiLW6us8cUkmJLiZslVq6MYJ6Wt41QpXLSAC38sguvtDm5S1EBJHmlAgJXjY1fsKiPMEgPvwDim1ghrF3alKDCIbtUvCliXuLYByiUi3STogU2mqILW8dI+b9SAV43U6Co8aX/03X0ZxT8eS8aKCv+ZPVsA7HhjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc5zCIYUOXxES9BTGLO++MBOEz0C0ewAaszVWznJAbk=;
 b=LLBTXspfvCefit1Lgqs9ixgPZYfQn2Y/x4wbgPKNV92yjH7I5add8TZcGYAjS6mzwR8pF2oHe885AvvHCrDuHMbmnGZnX5ivBZo9sVbMBdJY+KxM5RaEgwX6xoFQKNwT7MDuBmXEEd0rbVpZCz4DH0eQNWWx+P4XtC5WBS/jDzwMUM50dsuNKnF2hZ62yNVTFfcHzgYtE31KrPFmVj2qINWDbiwsTFoEpRgt9hyJfUaLwV/CFft8Hu/2QpQRF3sLMHaAC3GJd6bY7pgOpMIb1OJvzU2XrUkT8z2+09gRECEivlIzpHxC8/H6hTlDuUVKlLtxUInhBs6voPeJ5HLOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc5zCIYUOXxES9BTGLO++MBOEz0C0ewAaszVWznJAbk=;
 b=c1i0JUjGGIUGV5+ilpkkPjULoRybJ3pHgYCv+/EE2HDGNPiUhQ+ZJeNKT/fCBnwwgczKFHrsg/IrFgcFHZwm+OndJ6NadjZBZmVFtOyz+o6SovjsgeIRPGH7y8IaMglL6ndeKszhAqu4l/DpGmzDhP+uqthg75rRfRrMdjY+JohesKo052ibDppKOPFlJMtsVmmjGg6ZAyX59nLtpmwBdpggPAFLYUatpMphQmM8n57QSfFFwgUVayVMROIjW1T9sG1r26KEiiFdQbkRmeyAQueJaFo8H/Y5AtHq9dcnC2mCDLSki8W5U7+gOj6sVUKnN1psrEfNRZBxRu2xzO8vHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA4P189MB1261.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 07:50:01 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 07:50:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libsecret: upgrade 0.21.7 -> 0.21.8.2
Date: Thu, 17 Sep 2026 09:49:56 +0200
Message-ID: <20260917074956.22252-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA4P189MB1261:EE_
X-MS-Office365-Filtering-Correlation-Id: 3342ccee-1a9b-4213-3af3-08df1490470e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|3023799007|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9wjphivPRygOM3ydVsYtkHNCm2rFqBYgW4gAwoy2NJ1V/cz8s+z9A1nGxLTtNzw3OgNxBgWPR6Ge9tizJS3nffo7aAN6c74KcRSDqtczH2RLEBpJRNp6WkrWq65aWpqURcOV2ZBn24MkWwdIZji6ZX93JYkzb8zkucwbA2Bui1pByslS0At3p0zICIzyAjf9wGh3ctd/wVaIzxcJmhoIxtxmmDJcxp9MrNhHaMxIGJajvubYvlT6jmZ6/JDiwkFckMXrM4/wY0xEacJdD0yqY5L+KE/dj2+KhHu1vE0sH0/6bHaaxKvitmBF12pKkiNJAUI7lPx0OO0ip9ef8NLfxzzj8WeXKZ2nRtyIsZSsT6FNJdyPIgaOYK7iiN+XupqAP7bEtHQpiBXINwQPbXHT9RVK9pO1mOngBCZI91psESfLQoGKavplQvw2kpPGqGt2TwyQn0J3+o7LEeMp+F/xXQHYJZW6ETDyffqmReMX3UOr14oW/PB1MEHEfAmgxN3xj4ne6/pNf91egF2fUMzFC/CIPKsqSxcT0rUjqDR5hOCmPeslSKNyQA5uxymSlXtRLJDVgME7gZD3JZwOmrANJ2VbneE0H46v108dV6b1tJIA/fKX+vopyNcxaUNZeFEc7tGhG5eDvraE+TkC9HVjlZIwl1GbI29PT5654PH725A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fPyETz0D5WWH4usHxkucfP/0jxNsFTmKlt5J/ZUkE4k3Wjki80SWIFnpJFSb?=
 =?us-ascii?Q?bwNiX9PXgafRJZWFLBL9fqlrY2G46oun9GrBTETO5sOLTk1ola+4WX0qfOvY?=
 =?us-ascii?Q?oQyjFf+G7eYTV/uKtOUR3XKDUWYpJJTVxzrD6lreB1FgDxL/JUDx2UbwjqOs?=
 =?us-ascii?Q?i18Gb/UPXpazXzyxQnuN53pLy4sdwHn/1B4duImtr3t46+AoHrZl5+oamEgQ?=
 =?us-ascii?Q?AgK7vFxAAIYEmXqeyUVNJ+UsnPgAY/eKvMr8xMA7egYute9SL1DKBav0b/Uk?=
 =?us-ascii?Q?T8yzm+iirFzgov3sn4KZXa4Swlf0zTzr0JRNcmGj9T25ciDEbEujImHHJ7XG?=
 =?us-ascii?Q?Mxvb2ITanI+w/MewWmlxpAibxZZ9/krMDf0Lo1GLqJQHUp0yL2I7Yi/4QvKz?=
 =?us-ascii?Q?Oh29VluvvWuVdEjwlYwxNqzBfvEBHu/ufPnoihOi6AZCJJe/BRtIxprt8Vuv?=
 =?us-ascii?Q?Cu2K+G4HECu9FdmZz8tcR1RjBWduBiag4wCG1RB8tvT9J7qBCVcmQsiUU5E2?=
 =?us-ascii?Q?sMCTfSgk3Cn4X1MUu9a3PNpSNd3n99a4pbPcywGmuRGIz8IXIzaLxvUyA6se?=
 =?us-ascii?Q?9n7CsEKMOpLNa0J8IDuJD+AW25nix98hcsn58GPu72LG90T0w10mGHXQSuSk?=
 =?us-ascii?Q?j8JP8LHt7extpICAF1uu9FTOxWyCDSaEzUlnVdQVPDEX4V89K9Q5uIolOAZ7?=
 =?us-ascii?Q?iTSQyoG1Zmju7dHPfehJgh9siZUM+XrMo/zgklHW7eUxfS1nG0p5krShgFHf?=
 =?us-ascii?Q?57XI5RGoKQRWjdsyaLeHL8xG7F3UQ3K0FPgNsBeSysgsRf7E279gKSHRezLB?=
 =?us-ascii?Q?OKNI4enAQGRhQuKz2JeiIhQa33tfM+3oZbG3M04ykFlJuTRuZuXuXr65182J?=
 =?us-ascii?Q?NiuTm70enSGzjyWKCGuSi1lhcCID8emVlEkW88ZrxB2lYlgGDex6w4EdW6em?=
 =?us-ascii?Q?Blc1uKxzH/VqmNvZ7qMmRInuMkjzVR+7M0vTjOLJ2IfprNpzP2aZG6Hfsnyj?=
 =?us-ascii?Q?5oWxcCSlTziYseUETnmBGtMEr5OMzqpTN4vjovfvtC3ARiqAtrg2dXJ1qSkz?=
 =?us-ascii?Q?W+GiaeyHR2qA/BMdHsld/15JeXqpr11i9bzhj+2JSKnejYnlvk39kY9cEbJr?=
 =?us-ascii?Q?aFh2txZIE/25sX1YgROWqudcTfmoZ3o9Tbt3X9+awXnd3L5QFFYlqEihbjyw?=
 =?us-ascii?Q?rjTnoseCEilOohw/vNIfPAhsqxF9nkqI930YFr/YvEuAl1R+LJm7x8PEnqBq?=
 =?us-ascii?Q?OwqeNWOMdqDVF36WQ1jlMxAyJW5g6RCl6XmB326fUugj/kqYnA3bZ/+1OAhu?=
 =?us-ascii?Q?rtEc4UULPq3cnP/r73m6bDWzdHi5bcvjCRTArfSMEfaskCFNSBQT0OCAcprf?=
 =?us-ascii?Q?EBi7juyCgl0exHxKEcz/4db23SucBDZO+0BVO1RjUfE+mwhWkNOkxqTRG/Qc?=
 =?us-ascii?Q?3QVqist5rMryly/mDPo5V1r7yP2OKkNGMw19w+G83L8/uYZx3S2Y4xMCY06C?=
 =?us-ascii?Q?xbx82ZBCYNg46o2NtYid6wuZfKtUezxjNFID+Col3FPQDG73lqkqDp11zL2j?=
 =?us-ascii?Q?hJP0l1MLOxz+NOv6bwyOJE6QxOOBaH+vAPHt18/2I0pIY5NZj5U4fXEZocLA?=
 =?us-ascii?Q?j4zw6CBAfDe1K0rxBRH9rIkAZ1bk+H7frzfjvNUbZoVkhsdWy5WRX0Fbq5fS?=
 =?us-ascii?Q?6GpMqFe3z7hFL3qkPnmQy1nBbB/Q39xWEmLVVFtS8UX5QJC7Z1hsOpi0wdCM?=
 =?us-ascii?Q?IGhEJ3jrqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3342ccee-1a9b-4213-3af3-08df1490470e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 07:50:01.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXPKrP6TaAiPwGDYXdqotTRY4r0E07DrYRUU9HSLHus4fN+xcn75qCXmKeLXMXMQAbAhoseZywU50Gkt9JlFUYAmGXoMlwhvnF56kweoqLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246043

NEWS: https://github.com/GNOME/libsecret/blob/0.21.8.2/NEWS

0.21.8.2
 * Release to bump meson.build version

0.21.8.1
 * Make secret_item_load_secrets_sync match async behavior [!180]

0.21.8
 * Allow the content type to have additional parameters [#114, !175]
 * Support individually encrypted items [!174]
 * Ensure we return chained up GTask [!179]
 * Ensure length of DH shared secret match length of prime on GnuTLS [!170]
 * file-backend: Add thread safety and file-based locking to prevent concur=
rent write races [!171]
 * file-backend: Fix possible memory leak in error path of secret_file_back=
end_real_search() [!173]
 * file-collection: Fix memory leaks on repeated calls [!173]
 * Replace some SecretSync with a sync implementation [!108]
 * Add linker version script to hide private symbols [#70, !159]
 * Stop using CONST annotations on non-const fns [!176]
 * secret-tool: align behavior for collection option [!164]
 * secret-tool: document --collection option [#31, !164]
 * meson: Put test setup behind a feature option [#101, !162]
 * Several test and CI improvements [!172, !177, !178]
 * Updated translations

 - Refresh the pam-tests patch for the new release.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...meson-add-option-to-disable-pam-tests.patch | 18 +++++++++++-------
 ...bsecret_0.21.7.bb =3D> libsecret_0.21.8.2.bb} |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.7.bb =3D> libsecret_0.=
21.8.2.bb} (92%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-t=
o-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-mes=
on-add-option-to-disable-pam-tests.patch
index e0a5737eab..e57aa94337 100644
--- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disab=
le-pam-tests.patch
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disab=
le-pam-tests.patch
@@ -1,24 +1,28 @@
-From a9fd7dcddf8bc64646f2945ab564357c23111541 Mon Sep 17 00:00:00 2001
+From 5a7a8d10d08892dda84092afbcf5fbdeceed0287 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 3 Dec 2024 15:58:17 +0100
 Subject: [PATCH] meson: add option to disable pam tests
=20
 Upstream-Status: Denied [https://gitlab.gnome.org/GNOME/libsecret/-/merge_=
requests/151]
=20
+refreshed for 0.21.8.2
+
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
- meson_options.txt |  1 +
+ meson_options.txt |  6 ++++++
  pam/meson.build   | 44 +++++++++++++++++++++++---------------------
- 2 files changed, 24 insertions(+), 21 deletions(-)
+ 2 files changed, 29 insertions(+), 21 deletions(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index 936eff8..2ae14f2 100644
+index d7b1628..0bed21d 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -61,3 +61,8 @@
-   description: 'Build PAM module',
+@@ -66,3 +66,9 @@ option('test_setup',
+   value: 'auto',
+   description: 'Automatically setup a test environment when running tests=
',
  )
-
++
 +option('pam-tests',
 +  type: 'boolean',
 +  value: true,
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb b/meta/recipe=
s-gnome/libsecret/libsecret_0.21.8.2.bb
similarity index 92%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb
index e77f83e92f..d7c5410a96 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb
@@ -13,7 +13,7 @@ inherit gnomebase gi-docgen vala gobject-introspection ma=
npages
 DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
=20
 SRC_URI +=3D "file://0001-meson-add-option-to-disable-pam-tests.patch"
-SRC_URI[archive.sha256sum] =3D "6b452e4750590a2b5617adc40026f28d2f4903de15=
f1250e1d1c40bfd68ed55e"
+SRC_URI[archive.sha256sum] =3D "142948339c5b971d8f6a8c7099521f6fd319b6fe73=
d2694b4e6d3310ed28b6e6"
=20
 EXTRA_OEMESON +=3D "-Dpam-tests=3Dfalse"
=20

