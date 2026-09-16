Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EF3C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 11:24:37 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12709.1789557868272534519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 04:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=eWrX2wxq;
 spf=pass (domain: prevas.dk, ip: 52.101.72.54, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoYzJwyYcAc8YmBgwJn3rO7IWyMjofRL/60M5owMQ4WpjaBPQFVm94op3tQ69225UagqqgeE4wTAy+8c0fz/p6xihY0o8slR4nz+1uSkgeXxtvRHy1Jm9LZEYkPW1AEKcyTqkCbVxl2MG6aGdvoaK9dh6dSprS9jAzZI16CMJ7RVqdUgadjBnnjAlRyq2OwItWs6+r4EeW6g5a9JveYQTm9ddCV9q5oRmfdZp/vKnC2dd5cmuQSvAm8byVKNC0wdu0zIchSKwFYnOJbZK6kdz87uuiIKo8+Ir6XUGXpPTL1+aogh6dVO/hSkpxng5NKrz3j+Mu+0Rb2UwqJXA2tbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C2ZqhDQ05dITrwoGjr7Lg0Lpq00+z+Rset41crBlsA=;
 b=EE+/scZh0eU+Ds1nGor+tytgUC4NhWw7d1X0Lu7U3CkD9CBCfAim6L7Oti7CO64dggdO4TbLIoyDfrqYLpKqwnQ/gBsVBdTXpLzwVY86Osjh1VupWTV+zxGRcCDLGQs/AUMe980CZU8F0Kzt3BvuJPJZLUTNuU8bLBLvoZ11i8OSk9q3X5VY7AoynFyn/nfYKWDHph4ddN7W+ztjj0aAZMaiwlE4uyZj09AwwKDf43lxDh8aJIZY6tjH4BeUR6D1rD6eu2VqOoSIXi7Qt8TvYtG7bV+KHlVKecGRJxXnkRVPn3RdnNWzAlnQOgGf4kTcDbV9145nrqsW2nfWs/n4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C2ZqhDQ05dITrwoGjr7Lg0Lpq00+z+Rset41crBlsA=;
 b=eWrX2wxq0GiwPPiJs78oci0rrMaOsOoW56uHoLKER1AmpkN6l+i1NB8gwhlEqTp8/XXUyKzBwSukhSPhY5HVSM3cP03PZONkU/B4pBlJrJn7IEdU8U9y29Dj8AE9cyHDV8OX/G/xqSkHVhLBpAhws/1i3hhe/vxdN5cCW6tyeIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by MI9PR10MB992256.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:8b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:24:22 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:24:22 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Stefano Babic <sbabic@nabladev.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] libubootenv: add yaml PACKAGECONFIG
Date: Wed, 16 Sep 2026 13:24:14 +0200
Message-ID: <20260916112414.138992-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0016.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::29) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|MI9PR10MB992256:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f7cfaa-b967-4fe5-588c-08df13e50e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eDrD+G1++IzHQKZOXsOPos5T8WMAwD6kmC5urL0qeaYWU1WcQRr4mr2EuDtrxFtQXK2exkjoSO+6bNPRv3BMSSfCtr+bgw3B1nAPzCtbw1oiMKb2JKZx12goErDx8Ih+Cg/J9TN8B5MnvUwt/aobq4TVOvnC80U7d8nqTIZb7GQs5G5P802LN9r6RFWdwgbDo8we0+mmVJNuOVzmp0Vl3wsDcJmv8oeLB7AeLat/4TERp7yP0E6DnIUknp7jD8+X1K1mnHBj4ETb8K5UaBbB8nA2tyQeOy+udItHpnmgof7FxQZfdxb3ov0xSYff0fjUeYHezmCpoYfghgwH5qsxHnwy9/Pn99ERuyiBCihNhT/73LCxWB8aKVpAl7GKy58azr1jTpMyf7oSFPHqGZ2RihBiZge9Cm/kj6aB+HzFIn+7YaIAy+u7VU10i6H78bu2aFL2dYrB1Ox/S1ovrmnqCxGxS7jGNV5w+7Oe+8cyOWM4ttEPALU5U4ja8XOc/cwkiuogBZZMPJNLEHNsm3W08hFWj7UXMNBSN3He9Wu6kwY1Sl1yLNfA/rz0Zx4uIjAejuImx+1WdhY9oxuww7p08pjUO2mH9Sem58CeBDNQUc/66MtXEuRUzlqDYihYGqfR4YvbjKm2OWbzkMk5x3g72oYfeWOHldyAHUXohqaFi9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cylayf+0spoER8ou5A/1HREGx4WI0/2eYptNjVgehVmBg4kTZ8BDQmfjHyzh?=
 =?us-ascii?Q?1NJpYg8wKk/d+6a0koUxgcN05SUGFuYx3Zf4cPPzP+2ZAp0Fl1p4D3ODXBCF?=
 =?us-ascii?Q?o9dVa6S7Jgt12MA+UYbA6QOYhAC53CycDLpCWh+JF9WhIwCwXFFTgZRjuzSK?=
 =?us-ascii?Q?23DzIKGX0HtX+GyuHBzfRbXYJorUbHZovK9nPpbqNiD1nvqVd0/tGmlPVyDy?=
 =?us-ascii?Q?kaEn/2kqC9uUBPA0GxIKd5A1GAj14MZMGK4PwsJT3U1GJckIZsFBbgVpUrIz?=
 =?us-ascii?Q?WaglDlZh0F4PLWSe8rxkszhDerra11uviQHB2XeqcX/sBEsOq9RdYW2aGMSZ?=
 =?us-ascii?Q?GWzYPZiKZYr08OPiLLSsg3g+J5S5r1hA9B8l2MVUMNXTzrm3vjmhVL5Evvhg?=
 =?us-ascii?Q?YCG2EaYtOesSH4J+4neXIbw9o/Gk0238CNGAvbjrxzNcHAvM9wl67JpJv+ws?=
 =?us-ascii?Q?/kwHRFtt32TxaP2W9LUu7jSO1uZLuQKWCQZSJ9u0nH+5DzkqqjC9efSK6i6G?=
 =?us-ascii?Q?gfnoS2HbHfTps/s/ZncJAVPqa9YoPfLTETT5lETUHqAxreR/syBf6ViDoqte?=
 =?us-ascii?Q?SRkaOZ47wYvZKifFEz4PFjih8TQ+h/n6480IcVNZjjC66V9l2Ogba110lsQF?=
 =?us-ascii?Q?9ud/avjKn7i7XX/vIKmWu3hEWgRhUu647HhljlkR/7fRhAaYAjG5IAD+Cixq?=
 =?us-ascii?Q?vcux94MFf9t8mgySJmOi8/oLjSSiZqn2waQ5ehx3oKgnAghD4C2WSbkiX4CN?=
 =?us-ascii?Q?YyY3dAkEoHIIgj5/rRqk8rgTJ6fsfBZwBT3A3mlqO+3qh7p5o3RkTZJOodI6?=
 =?us-ascii?Q?nYjDHo6QI1YFkfeIozVnzO9vtB0nsafPwnC4L1bq+1xsJvMy899NF0MyniQk?=
 =?us-ascii?Q?RZ3ZYoBZqX7RRsyKVO2kWmIjxh/k5D0KVgtPv0+ldxiN+Wrhom9649aSnW6J?=
 =?us-ascii?Q?+6ooogGkoAjzCyxxqJVdkNBnywpv6OaHYGdWMAU04TPu6PjXmcnTWV2/lhMi?=
 =?us-ascii?Q?6Yc5hVTTIdGI4LvJL3ObdJcJcPv6kvhxwu0xZ16KNLNGufPAQocFqIqUm4y2?=
 =?us-ascii?Q?E/RGp/SHyPp4IfP4bzTeDPl+YqoOiim7h2TRju3QLrMw53q/F+SGTES/XsPy?=
 =?us-ascii?Q?E78RvhE3BWuky3QMK4VNFtLYX4VcYze5F99ilDsoKvsZjSLSJ8aZaaM4LXBf?=
 =?us-ascii?Q?xYLaizdRwX7ZvgnjeFD5rzCJefsXnNcnrEwbSwBS61hujpWgpu4HmnIHHEAY?=
 =?us-ascii?Q?D3x3WCeOh47FllBRPTEg0FR9nO3SmsgXxMiR8zUR89WOmCJmwdFZ/S7vFFgn?=
 =?us-ascii?Q?zZogwAz2/+rIAffvC95riz7r10pffvVnjLduaci2cqJtVVJCSbSGtW+2LfYB?=
 =?us-ascii?Q?BNhakgbKafJcNc//poMW++TFWufv1tuxo49LpBVB/JRspHdS29JcHYzbWISc?=
 =?us-ascii?Q?Ellr1/ZLXV4txSlClNOSaxeDuhVNDJwH2012KGMdzEB6POZ1KhEHaxHY4eIj?=
 =?us-ascii?Q?7wbKHZInodVDHonV2VeP1BnZonM0VNa9xXJQ9zeZGfGnE+Fh0+Ul+yng010N?=
 =?us-ascii?Q?4RM00F5xQ23XUbKYlHaoFfv+Ap4bDMFtRseQk/+B7nP1jf7mCCRiUIN7mtgl?=
 =?us-ascii?Q?V0W23D9Zde80DZXv7oTOyl88EPcP6bNKgvV2J00kIKfSzNlKPRvP7JRZxhPC?=
 =?us-ascii?Q?+3IF0srpYFPsQ8pXXfWGH8WjWwodj6OGifDJWEDKqE9Mv8R2X5lm+/Bn92Vz?=
 =?us-ascii?Q?yIFX4ySZoofho9OItkEvqvzC1NL4LgA=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f7cfaa-b967-4fe5-588c-08df13e50e94
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:24:22.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBWhMZfwuuiJgZzqir4fPNCzU3o/E9ky5wiYeeoFXRVQR6Fdb2AFXcLwtbWVPFU6WWvd7p3RdUK+bjY46vA274bZen60m/kjWtR21H4lUy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR10MB992256
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 11:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245951

From: Rasmus Villemoes <ravi@prevas.dk>

The upstream project supports setting NO_YML_SUPPORT=3DON to opt out of
the ability to parse its new-style yaml configuration file
format (i.e. only the traditional format used by the env tools from
U-Boot itself), and hence also removing the libyaml dependency.

Expose that as a PACKAGECONFIG knob, defaulting to on for backwards
compatibility.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb b/meta/recipes-bs=
p/u-boot/libubootenv_0.3.7.bb
index 7b5300f38b..373f26e4b1 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
@@ -17,7 +17,10 @@ inherit cmake lib_package
=20
 EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
=20
-DEPENDS =3D "zlib libyaml"
+PACKAGECONFIG ??=3D "yaml"
+PACKAGECONFIG[yaml] =3D ",-DNO_YML_SUPPORT=3DON,libyaml"
+
+DEPENDS =3D "zlib"
 PROVIDES +=3D "u-boot-fw-utils"
 RPROVIDES:${PN}-bin +=3D "u-boot-fw-utils"
=20
--=20
2.55.0


