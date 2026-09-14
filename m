Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E319C88E66
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:11:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18563.1789387889938555241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0xj0b6jd;
 spf=pass (domain: est.tech, ip: 52.101.84.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0nJ7UVtflwoBV6W0jQpDrmg9B5qOx6pg97wPeUuMbbl69E6zTvjRrE6pPfceyxa+kbRtTdntZE1PKIII4Z77/PDBzuc12iveNrZRV1W431A65elp8US2NUjrl/Epxnp+bcRkFRwNYOW2qWtKhotPEvIs5KcnB+zg0v9U572rvZEaz1lG3ict1rIfavphOLW+uBazYx6/1C3c2vQnZ2OYw+Cnnr7jpvwWB0UM9sX2yNXkm3Nd7BNepLDBgUSucgmOcl1KFpcvPaoNkJlB1ArrQKfp58K4cy9hkJFM1MKGvxqkU9EL8gY0NcGn+USx2nk2/BrW99SEGtnp/3ESYpK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vldCB7Tfb/6Vz1Qks0bGpDmIQMIWvF7OyTqnuQePsLo=;
 b=hSda9U2krZhLgBGxW8vSY5qwtKYgudQztJ4s2Oz/wdL5KakgPvnUWJvJ7fxvadlmSCVUA2ti1ARKDEd7YGe5QTOPdPv1uRw+RKafJ2NAgTae1ZJ75E1Phmpm3Qpa0jiBuK+aWaj9Ono7TYTGvUaTtG8WifNQraBPJwYNPGdY/H4wD6lTyrd6UQ4oVVN05Xqg4EawHGHTE3N6aSY2I5Ur8MjsD51vZ45TQtA0jXuqJuG0ktc8/YWsit9W0LoSn8N93W4Z0npfBzZUh6dSAb2rtZVcuIUXmwAr7C1kpBxC3WrVvI4ZlDAuCOp9GOOoJrURB9g9rbtVv3JTye5IrUSazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vldCB7Tfb/6Vz1Qks0bGpDmIQMIWvF7OyTqnuQePsLo=;
 b=0xj0b6jdpnQqBoeyPSbtOyBvbBSBkbvP/EVgA5TWiDn4Rp6+KbvlohKvoc7IoOBBB+Dsmrr6DWDehGicb0WttNk4BBz8ZMGdIoY7H2J/rBCxk1Bf3R4BA8gBzp23600q3vqr8ZFq78x4A0o46YJulVpujikgZ59nzdlC8v6OKZbXlYemlrc2MvTVpaVHbhp8CGh11Y3vezuyHqUlnsTKfKkj8Xzbk/lTv+opnHe6m1fFepjYizxY/90+4kOAf6jCwQ4ZKpV/MvOJP9cIDqZbJYCBXXGyt31oQyO8zINyycMncSw7S9YVMYRvTyw8Zu2czmUf7qAFO65vgrZiVJgkkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2444.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:11:26 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:11:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 2/2] dhcpcd: upgrade 10.3.1 -> 10.3.2
Date: Mon, 14 Sep 2026 14:11:21 +0200
Message-ID: <20260914121121.81692-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914121121.81692-1-jaipaul.cheernam@est.tech>
References: <20260914121121.81692-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0317.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::22) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2444:EE_
X-MS-Office365-Filtering-Correlation-Id: 51267f50-002c-4e79-cc2a-08df12594cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	isvPxWjOhrV9XY5PdsGnRyCjWRcHVBZJlXW9QM9hK/V5Sg05muoU3Mh8rhLis4xyyxi9FH2W/bHhGDZqWzcZQZxjp7SK//CFY5r7YrGG+CrR1IUM78QevJEr5HXIS3y0RvIDJbO0kpj7vSTNOVXqT/VQWpYOUnl1pRjZWT2lbgJUidKjt+cs5pkz7NLMBRyuSLf7xyNY0TkJHhgyvcU4jfQAC37tFn0q0w8jRX2vcGe0Nzu5jk6MV5jXnVf3c/d6SKCP9M+HzPmmy4S1UZqKYDo+jS5938O7+HwgbT1o2i4VwQfRvEUe2AfAMHmqo/eB/MMI+Uh+62xJsfRGrQg3SkgnKOlu5AbVTeudQXNk2beyhh0EaIRPhi0um3fDXWdOLA/tOjgfJABupt92xxmf8Vn9eEKjiSyzlXKNyodr9GXvn10ToF3pn04rcdOgyl9l8dRAhwWYYyjMomwlFCNJJQ3jTJhSUkiqwCRSoafcJUujuKaUFdtUNewO077//pm2r4+KRpRyttywDU8Kfmc2tnbY+Es5eTCZewGmyQE2U7BTrzu9T8+YgzhbZAroZH55XGji3g5m+CAC+gQL94xYw73glTIcnk3TyLuEQ/iN9xSNhfjVkeiJ6v5qTMsJyOTeZxqWgqb5juoxHh+ljgrV+I39fOfYU3xAwzCr5IVJx9w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Md9iVtZBjd/Xo6Vn1rSFeaHUfUBGxt2wcMEWiTBS0+H5k32mBYY3KA5w7pAa?=
 =?us-ascii?Q?Bjw1Tve+4NSZtL4R1m3um0NCau5fZkIqWohmp4TExS8zIDbXFP6ZOKYlThJH?=
 =?us-ascii?Q?TpEw6lC04ZsG9XBK3CChw7uAzX1x4hDmH/J/23DyE3y4ja6UNeT19BaYSTDQ?=
 =?us-ascii?Q?/fzycTqXwzyIfytDteC0aEPfSnzzsxW1nt6qyI+oWBlwgDl8dCL3xsgIOyHl?=
 =?us-ascii?Q?QXDyCvagsav8Ja7bfGydnFwZxyKy6U7kkovod05TJUknm2/vX8AcWGycIs1h?=
 =?us-ascii?Q?rULJtZ/+kaiCdlV99v4/4oFfd9aS4VquUXjLY9tG4dGUExIi/EO1DgQpjT7c?=
 =?us-ascii?Q?zQSwKNKe4WDNeU8d05Bt4sa/XxRLY5KQ/QjZ+qRhf3sqDFa6ByA7tUf0Ihpy?=
 =?us-ascii?Q?zB5yqubA0E9K7XOGBuJ2elQWyvcQiL+b2zBoHaN0xVcrJPNqHvI3bi0ne2fD?=
 =?us-ascii?Q?tsUHIcyRGX37AzAyZ+wrZW5T4LcjnXu7RF8S8LVkKSWhTlfokeMWIUAQVRJz?=
 =?us-ascii?Q?C7zBpLwdaKja9tGl/5b3D5SqXLzIgpyRj00GMiS39x6U4GHnxRYi+9S9lBpl?=
 =?us-ascii?Q?8/N94+tApeyyLsTTv0slNIWOZFGSqgU6q8toB90BXnvX5oaznksBa23qs/yW?=
 =?us-ascii?Q?3J8g7s0X5kzhNvNEEZgXyccVel1QU8ilF0Jv81pSqjtKqn88wZdqeUnBMOgN?=
 =?us-ascii?Q?+afun8X9OS58TanCBq/2uLVjj0eqPbMbVQ1WaHYY0sKG+BT4T8YU3hwvF0V5?=
 =?us-ascii?Q?JSDdtSlqHEEfeajKIJS47rwtAIQsQQfLWXnvszKRx9GDUm+mUrSYvBAZBzRg?=
 =?us-ascii?Q?nHtWW6ZpVDMMklMyNmO2FpB7MoR98m+q7B2Ywr3ym2/qUopaGcY7o9dEpodB?=
 =?us-ascii?Q?V3QpGxkazORCvrFRroBO5k/9cLDwIw701d4MquXlY8Y5FpSQsH161WQR1cc3?=
 =?us-ascii?Q?UhJWJHkh1w9eGJ8TuCixkxfoiYOk3ct6f6197SxLMS5IoNpg8r/PRc0ysmi5?=
 =?us-ascii?Q?NuHqZlOH8VKsL2Z6opKOVYooyLqdV8BMKILw+Sxv7qJl0X0zdHcuzO1PDQW5?=
 =?us-ascii?Q?v/zBmEzclCCvBXA6rjCxXjwbZ3cXMPWoIFKUDiJq22V3PQxqxnc9v2xdEfwB?=
 =?us-ascii?Q?PQOLnduYuGKNaCUSaYLr/Cyh0uhT3ZdvMGkZXB0FK2RK+jXdN1kCsP4ugaas?=
 =?us-ascii?Q?9U3sycKQ3X7djVpHMHSYlzePNgQM6oxlXau3bTwv1a3yZEUX7ofHdLuUahUg?=
 =?us-ascii?Q?QhQlRud+omiPfPJdAb+NwmmUkfBO4d9VzxJYvBCQK3qkUKDqs7d0BT3rKaBt?=
 =?us-ascii?Q?O7VO7TqgAwPuoZAycKAMTLpWuVF3bcDUMwlkLsGGhe3yBdRybS26goqs80of?=
 =?us-ascii?Q?GkuhG5W8jgvuArZQRfCSqXdkR3ufsrab0coyEPbOyn/YK6amOPatE8HGJkcs?=
 =?us-ascii?Q?bihooUY7+O49WOKYs6uqS06Gf77cbThAR9zmFDDbZ+ev7gavr1XqV9mIFkfX?=
 =?us-ascii?Q?0KL1Bh8sKjaSO/re5PECwKBVdbQQdld8hxybqbTSSI2wrLicb2+3Q7P4fHEY?=
 =?us-ascii?Q?jKCDi7a+63tEEKNK6+tsN+WDgIv/vw41zT+mB7y5cdttTLxZ3m4qGklD7qey?=
 =?us-ascii?Q?vyVqxcawWIutrclF3/fugJc2nANQPnLl1drdYue5UhHK/aoZIT0dceOgydbk?=
 =?us-ascii?Q?JvWw1trljmGeTPvrX0MwCIf+yH9dHYnTPp9Duup7Y0S4vtcj3xMoRUxj1QHs?=
 =?us-ascii?Q?KoPM3ZYcXQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 51267f50-002c-4e79-cc2a-08df12594cf7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:11:26.4207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTrhGYhZzWnkcqKSc0bcD8OYEZ29qShc1dKJO3km96RwiXMLlGjxQwVm0YHU23ofEPaE/NVrYgntM8ofBaVYu07MzyU4ySPdMjwPI3x3WPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245776

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e61572f9a24839a1a2386a51d40b561f340f78f)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../dhcpcd/{dhcpcd_10.3.1.bb =3D> dhcpcd_10.3.2.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.1.bb =3D> dhcpcd_10.3=
.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recip=
es-connectivity/dhcpcd/dhcpcd_10.3.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 065451c065..b86c249704 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "git://github.com/NetworkConfiguration/dhcpcd=
;protocol=3Dhttps;branch=3Dma
            file://CVE-2026-56117.patch \
            "
=20
-SRCREV =3D "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
+SRCREV =3D "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
=20
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-imp=
rove-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 512e33aebf..7e04b5c303 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-th=
e-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-th=
e-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From d1581ce103db0a5db0b1761907fff9ddd6b55a8a Mon Sep 17 00:00:00 2001
+From c91f9cdc0ef56fa64f6ffdd811cc5b0e41991b2e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with syst=
emd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-confl=
ict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/fil=
es/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 484b84f94a..9d3065a48b 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-err=
or-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-err=
or-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
+From dd892eba0147120efdcae923746c444a9d2a76d2 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 91fdde2c..b467dc3b 100644
+index ebbf06c0..c7ffee6b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-=
to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001=
-remove-INCLUDEDIR-to-prevent-build-issues.patch
index fd3fae7e7e..bebc79831d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prev=
ent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prev=
ent-build-issues.patch
@@ -1,4 +1,4 @@
-From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
+From 0775eb1b965bbf9b0efb0b1c42c3adf3d8cd31cb Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.co=
m>
  1 file changed, 5 deletions(-)
=20
 diff --git a/configure b/configure
-index a60da137..3673de8b 100755
+index e9c08f18..3f0770b7 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=3D

