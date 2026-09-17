Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E44DC982D8
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 21:24:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.770.1789680281215144435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 14:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bXyuGdoQ;
 spf=pass (domain: est.tech, ip: 52.101.83.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtQaNjJGpw2XOuvhpm+t19FOOuAxLis5d6TjTwAoSmyYjLrocNOD28nq0sbJGatiHnWTFsBgKcBZpUShKupu6MHYU5g+4LOA7cgJN5Rji22pZpHutxkIcQv4UYKyz95y42Zz1Dp0Ia+GSkHFdlGUwrgl7hr5pcZiynmHDJaNPXNqDxp3cuqsuk2wmh/vzw5eli3q+09H9Z4BIrj006O8SVg3s3gvARMhW0G2DPZczFSvNIDSYPjWsc+Ogyci3qLAAR29pVHFfb0qqzrb/1cTiOJ486rMYwnMMNhsQw5j4CTsQjzckHNZUxtKtf5K1EdQhzzRuSYOgf8pzvG29R6R3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfB0qTY7n18nx6sWpIVb0UGAN7ZlVdhtWyvSrFO5flk=;
 b=IVqIVPBALpb+esktzwu2sB80xe27FPwZX75nccek3oWvY1WEjaPrnwo3nZkittY1MkD3a3avdV9mZv0gEwVUY6+MzO7Dj2xM7ejtdsVWxnwQHUTaO72/TknfiP5V15ogrvWgcRYC0mfIT94LkAU1Y0kGbBGcDxSqREVeeJ//Zo4+oF/JmfOQTHqLEgz0hbAW7iKd6owF/l7Il1zVaOMh8YsFnnL1slr8BsG+yd3e8sBIduLmXJRxOu06UDAYwVwWBoi+MK8e8u9unXK4+xDVY89nEImZmZ7cUPulbSPU2DXouKJSUI2+DOroS8iqmcErX8rxKbeM7VNHYg2TX7EoBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfB0qTY7n18nx6sWpIVb0UGAN7ZlVdhtWyvSrFO5flk=;
 b=bXyuGdoQrmiW/F7W0qJW6/u4YrFsRHHNKfkG90Bb2TY100ZKe+AvHDj6FNx8TwTWKhgE3JpBvNjnTjXBWhUjoa7fYnKO33+LSwwjZUytWuo1ERIPb56Vw3H5WFgdPQdyrduxTWYgJdm3x/6PdhWoZbcp3t966ftZrE4C0+zNTiXFkgLCUrf5pS/tol/CbP0J6i+rNBYnVm/rcImM/kDOnocsD8vHZujDhZK/dn6msafxLdp+uDN+hJ9bwZvffTwE11iGowZ58K12xMfFg5hfjyXA+FoOopfy2J+pnEGBJGl/vHf/WUj1zBxMOcD1aV0FXxjBjw05led+YxBqziSWOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2579.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:63b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 21:24:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 21:24:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] libsecret: upgrade 0.21.7 -> 0.21.8.2
Date: Thu, 17 Sep 2026 23:24:35 +0200
Message-ID: <20260917212435.93696-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917212435.93696-1-jaipaul.cheernam@est.tech>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2579:EE_
X-MS-Office365-Filtering-Correlation-Id: 23206538-ac01-40b7-38f9-08df15021511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	diqnbSJU8M1/OW81ZX3/7PMKOP2CGUiRRLMUzPJAdQGLo1j3e0HbHPRj9HOEez+4u8ZECKXv3O8Er2vICUfTQHDzoZH5l8GhuriMntQ1TXPefFbans2wWgmjWuya5G38zqtkBEFMEKMn2J+N13FQ03sgRpEfaSJhgApcTyQB3yKz2Orr4kgkLHfQZxyf0EwR63i5K6Ce82ds5PFxcOIe8oZx9DF4Jtgvp/j7YEhXVO5QhkedMaFUB04Lrkmeoc00ckjJERouyT8ADi8y0eKH1zo3fFG4u2n8LGfdxbTlfx+50L+dx+jRrWY3y2aiHwEcwzfZ+znRtxpKJgvHULXwIEjr16QAdjual3lkkdlxra70rdL6m8jGMnszNw9A4hB5RyOA2bYRzWH99ghG37pK6drfeLdOF+IlPGIwZajvPaSMR+9ZVYrNPuGPUjJQ3Rb/c8poe2Cow1BM9zmyQu5R1Jnl2tyxEB4r6W0v+jTHSjYGeYX/56KSxZxLpsjm90DDPLolA5DNULMjBE2tpRuyBIqPuIzbdgPS9xJiAYGpk63VpIauvdSnA25Ul7xHe/wlUUyB17f8LSvrKlEYgnhxwd/JrdWIwBJvmlyiF1fVCCQDtudcamrbyWMdBIi3XJ3AESFvJVcm+4yX+YQrBH5xcPFg9oqvY8+4XpOYmomBwys=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NhE7PSge1I1awy0yLjF1kDW+eQG8hOZZiFoguBG3ca42KqQEVX3XmFQm6RE5?=
 =?us-ascii?Q?nrKkeIQiFedvs3Y7wRqRQrbA8xJq4++7wFZbGW+mkjlT9j7DyK2FIhmecFUB?=
 =?us-ascii?Q?ROTB8I859y+s+Moez5VejVZTyGshEDnlbCNqQTBrWaYRvRoTqGIR3qkX9828?=
 =?us-ascii?Q?cTf0O8O45gQAGS74rI3NJXAkY1TK/N8zikL3p2FEDzvXZKwaWhTB8zbzxYXL?=
 =?us-ascii?Q?Q63F10ABUSEES9vMZ9tQfRahPR4ZD1BZHMKP5Y+dJ4qzNMIPs/RvdUc8Fg3y?=
 =?us-ascii?Q?aTho691tCUfTe2kWV8PLbqpFXSk8nIrkwafdcO3GIBSTnDcU8Nt47jdQLFlx?=
 =?us-ascii?Q?imSApAgXSr7FGg8DZ0cvKbHPGCjNfUACJ5/yQfyLuAyQQjrxwS7ptrekYfZa?=
 =?us-ascii?Q?7Xip4UNTB7fbxJXVLmPqueqrCFlGTjJfsfqo/UkObzOh7KFNwfz5UoUbdkPo?=
 =?us-ascii?Q?5rIa74MFGU4ByWtQ9uk1HtRrwVR7iDkCO/LwJ8waIJgR/S69Mlbrql8VuKEH?=
 =?us-ascii?Q?i//KXQ1qVbJz5xEJlEyJHaSYJKkkt65IpEFrU/fuNj98ux9R+0uHxRpddta2?=
 =?us-ascii?Q?O+TTY9vmOx/f5J+3bWps0DUO8cLdn5L6YFmaoLPeWKYtNlBREsrqQF5/RoFV?=
 =?us-ascii?Q?2N8vDQkfL2ZW+XmkyeP/O63ydi4cyRWg8zuNSJWLjo8c9bjBOMopVUCEmxA0?=
 =?us-ascii?Q?vx6Fh8w5Wf4Q8YeG1wXMlaMMH8V2xZYHokXd0g/AfEbYqF0ULuf7r9+LeQXc?=
 =?us-ascii?Q?pIkPOUC78Ea5mcIA7UrwUF/SYsze/oJXE+4ATS5lxPXqCiOLipSMSstZztmx?=
 =?us-ascii?Q?7wVHkZZuF57y2fqX3l7RtJ/xi+D89a9QtCL44E8gSxFx4cH66SLWlfxiBQxi?=
 =?us-ascii?Q?7zGWds2LK4QHhaX12iSV7u2XYZHc96B26Ii60nMADDZhwFkTC4I5SWWLUFVu?=
 =?us-ascii?Q?DqkCP7pve+oNGaPEXxunR2eW4YIrQucCUKRo93xItCib0VsSHUQAJZ0z7nSl?=
 =?us-ascii?Q?+xLWhZSBJulZcGarJjx08wz9iE1KZh0kGaL5yhogpqRd9HVplUF1KH16eLgZ?=
 =?us-ascii?Q?jpcpyuzCrTz1ICRhAgV3bfMbEmjVWow5d9SRWTDE5/AoynrvbbsgKm5VfCeS?=
 =?us-ascii?Q?VV5NJE65blcqc4UU8IuE086SzrnCnR0Q7uIY6MabtoYnxQwiKwAcMStHR5xD?=
 =?us-ascii?Q?7GpkZ1PAu+JX5Zo+CVAPP3fEuexSGmMYuO5RBCN2jJMvObLZiodK0uNJnfgA?=
 =?us-ascii?Q?D+SEi26cqnYP2kwuXdwlUvqB50MX1Acjr+gXnbdjchs5Qe3Njhmg2oEPNghN?=
 =?us-ascii?Q?kLv7CtQsLCl15+ORJ/iHA81lBUAWsz1m6SWG3f9LyrGtJiYS0+86oSWyL4KX?=
 =?us-ascii?Q?6UMIA+OTrD56zdbduWre9RF2eaz1FZ6gXtaD8lBTyyFxGR0SV7T1lvscd2H/?=
 =?us-ascii?Q?istJOeAAcF1EFzSTORfNI74x3BBNOqMtGL3Q08q49m2gla9obHJbVUw1bxmO?=
 =?us-ascii?Q?YcZSBf7hilmKozX0HfGhj52JqlUbNsdbeXXrl06Xi2y0WPUdbmSFCkdBHzpk?=
 =?us-ascii?Q?vZMIuWzNcuLQKHFSvLp2Sd0LsNf1NwUFrjxmjJLDJxLUOrWM9QRD0cbtCM7Y?=
 =?us-ascii?Q?KV8mQJo/8KGyJ8/MXfaBdmOWJmDvPd2wtiTFJwEsgpeAULDp5fn8aV2n4s3n?=
 =?us-ascii?Q?UFTVj/rs6ka7ai/451jbFsHeXWoWVleilZFVJ717RqElWigO9ybIpxQmD2sy?=
 =?us-ascii?Q?EFHD9FSOaA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 23206538-ac01-40b7-38f9-08df15021511
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:24:39.9382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ssRCXtaQ03EFTFZ/vKj0AyuwqLe86qtQu++cOWwb+F9CsO8QjU9eOZ9sCknJHVtIw4FpCJd7tbknEIYki6J7pgx2o1ukdwdbk6r8vFlksY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 21:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246094

NEWS: https://gitlab.gnome.org/GNOME/libsecret/-/blob/0.21.8.2/NEWS

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

 - Backport a fcntl.h include fix so the file backend builds with musl [!18=
1].

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1: backport upstream <fcntl.h> fix (MR !181) for the musl
    build; use the GitLab NEWS link.

 ...eson-add-option-to-disable-pam-tests.patch | 18 ++++++----
 ...lection-Make-sure-we-include-fcntl.h.patch | 33 +++++++++++++++++++
 ...secret_0.21.7.bb =3D> libsecret_0.21.8.2.bb} |  6 ++--
 3 files changed, 48 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0002-file-collec=
tion-Make-sure-we-include-fcntl.h.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.7.bb =3D> libsecret_0.=
21.8.2.bb} (86%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-t=
o-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-mes=
on-add-option-to-disable-pam-tests.patch
index e0a5737eab8..e57aa94337b 100644
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
diff --git a/meta/recipes-gnome/libsecret/libsecret/0002-file-collection-Ma=
ke-sure-we-include-fcntl.h.patch b/meta/recipes-gnome/libsecret/libsecret/0=
002-file-collection-Make-sure-we-include-fcntl.h.patch
new file mode 100644
index 00000000000..2150e310b00
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/0002-file-collection-Make-sure=
-we-include-fcntl.h.patch
@@ -0,0 +1,33 @@
+From a5cd57f103038c06b64d5f6ebfd0e627bb40af4e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Schwarz?=3D <aschwarz@usp.br>
+Date: Tue, 15 Sep 2026 00:11:56 +0000
+Subject: [PATCH] file-collection: Make sure we include <fcntl.h>
+
+Without it, libsecret fails to compile with musl/libc++. Specifically,
+Clang compiler complains that the `open()` and the constants `O_CREAT`
+and `O_RDRW` are not defined.
+
+Fixes: https://gitlab.gnome.org/GNOME/libsecret/-/work_items/117
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsecret/-/merg=
e_requests/181]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ libsecret/secret-file-collection.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libsecret/secret-file-collection.c b/libsecret/secret-file-co=
llection.c
+index d528023..59667a4 100644
+--- a/libsecret/secret-file-collection.c
++++ b/libsecret/secret-file-collection.c
+@@ -24,6 +24,8 @@
+ #include <sys/file.h>
+ #include <errno.h>
+=20
++#include <fcntl.h>
++
+ EGG_SECURE_DECLARE (secret_file_collection);
+=20
+ #ifdef WITH_GCRYPT
+--=20
+GitLab
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb b/meta/recipe=
s-gnome/libsecret/libsecret_0.21.8.2.bb
similarity index 86%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb
index e77f83e92fe..409a2c0857c 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb
@@ -12,8 +12,10 @@ inherit gnomebase gi-docgen vala gobject-introspection m=
anpages
=20
 DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
=20
-SRC_URI +=3D "file://0001-meson-add-option-to-disable-pam-tests.patch"
-SRC_URI[archive.sha256sum] =3D "6b452e4750590a2b5617adc40026f28d2f4903de15=
f1250e1d1c40bfd68ed55e"
+SRC_URI +=3D "file://0001-meson-add-option-to-disable-pam-tests.patch \
+            file://0002-file-collection-Make-sure-we-include-fcntl.h.patch=
 \
+            "
+SRC_URI[archive.sha256sum] =3D "142948339c5b971d8f6a8c7099521f6fd319b6fe73=
d2694b4e6d3310ed28b6e6"
=20
 EXTRA_OEMESON +=3D "-Dpam-tests=3Dfalse"
=20

