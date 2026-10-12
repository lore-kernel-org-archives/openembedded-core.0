Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA09CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 09:00:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9383.1791795637860349831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 02:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jKQY7ocq;
 spf=pass (domain: est.tech, ip: 52.101.65.24, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvobNcPIKTUpg8PuGc5h+aZPK7QfCHm8kP9MOXT1fTqzUC9r5ZYyWpVhlxSMyY15ymV8G0xnvbZ9/oybORSuCfCtHKRwEVg8S39veMjBkdpo++INkHPn5zzqQhc5yXM/Dl3yhunr6UTXdAZya9A0z1ANAqYjdCrF331G32gi8yktbyKDd5DWpwtlTS/pm8laBWRQxb9Tf9cmcOkQKiW2br5XjhoktusR+hIIsTaBAS4wEST6ClxShiJedW1DAzmK7J2kD0F2UNTfrBC2kdmUFZHaqg629zxsTBCWr2/YruqKw/+I2sviZ4p0jxRK5d21I/rtXRMl6Ek5lluLUIRSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmXbmhGLVSJNWut1uTHfw9tIH56ncy5BaFDBJklNHjQ=;
 b=KerKtBDbyMiTOiWvGKiOGpTCNG36LTF2jt2dZZM/Lq+ffKE5+A+jeCXU9SAegFQf1bf4fiBB4w1z2wTpJwbk27S9AoHnJY1s6F3a4YIA/rpQrl+34mb3/jvVNsUUe90yvgTB3V5TW7J7YYnkK2uV2Uu2gtiWieRzEy2ReU7kFiMd/43Ezr7q8LNc3+LwoCid7bmtZENNtY+RZZBVin24z3GU226ppFLgcqcQ8xP6qvQzs2N9/JnDb1Vh0GIifJVrUiHdyPCwXvhMnZLlbh7/49nRkEP0EikZRMxR6fxHhwGzhYW5mIZQvgBh7gAyF7IQrzislR+xcHb0mIghdAr3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmXbmhGLVSJNWut1uTHfw9tIH56ncy5BaFDBJklNHjQ=;
 b=jKQY7ocqpjsk2WxGnz+H65aKmR80mUwFngZKY2zfi655iJd1H7v9QX9mYFtZurL2FZeuhF9KKSoZgnZD/wZ7DEYRS3IJToi5DcUl6N5b2PuD5uejWx+KRH+4pxwmMKQfgzX7muleyfhIPGL70ke0XdLrxVTV5a6qlqQyYSvwhQdIMLCafvsK8jU4Fzpd14n2HI94O8MOZKKNkNrte2rQ28DLApxNcWAC1u/X+6J7Ih6bsLhFzs0QUykUj0maDMnkz5LsamYpQiqUASoQOIFyoozFjm62RkzpN9AMDu+hAr+QKpC1MrKs8zJu1nhMp4cYrg+EBrMinlBIvbuz+FxkOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB2719.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:55e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:00:32 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:00:32 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mpdecimal: Add mpdecimal 4.0.1 as a new recipe in oe-core
Date: Mon, 12 Oct 2026 11:00:29 +0200
Message-ID: <20261012090030.95901-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB2719:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a364bf-886f-40c7-e0be-08df283f456f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|261009223027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|6133799003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	w8lCYIfm18B74LpgKQ4M2euttmmhsCbBjh/T/3RLPhrdCTWjQE4wqVFncH6n2dhS504QtuLKd3br0AudeHRYT+iBRCJ0Lj7x3vquuq4wwe88zpeeSgySgzidhzuZhBzKjzig5eQS5p9lF94EZCxTAIi2rsl0tmjxP9shNmWpFvdpEF56mtvTe4nvJBM6vJlR7MgSzH+iee3Dw2Htd7hIenBTYqIqs++/phFx/F0DiDJeisdMVXTAD1YdCTvn8E39qmdIs1Q6/HOw7OSoM2boaAT3lyZ2pYzaMHOlQnvloVebk4FwSVmlhnj7QStP9VO6TAi1qz7QyIEsTtlpNv5zQg13Rjp0/txFyzOBDHKfGJRDBbHzTXs6aU8OldFv3wbhfyG0I+gnd73SO3w+u0dNprerNu+xwDJ5IbQFBZB5WM633tOyt3qnue36yCatSuGSXm2lGoyX5MgTJnvCqM1O8ByamxzsI+s7ypu/pF28dcowLogDOHddtaHovEC3GIjrIw7fDi5e2nvTKKrjbb1UONNpQKs/0ZdCT76BNrGIlMreaUWs1L127gmItm6zQtZQXbIR7p7vvD824wnxVFFlIIj2gsaTY8NnPyv3w7xxQaA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(6133799003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sVF6PI0NtYnKY4L4NkWRMSk4IAnX1GcOYcpTq5pza7vxLOhm+PA93XBaO62n?=
 =?us-ascii?Q?DQeQ5V4owSscO/FV+KhPJy9QcNCiprqD0YYqmEicbv1BeHWYWzu9OK78r3xa?=
 =?us-ascii?Q?Y2+QnlZe3BbbkVmkEXCiQgsUuwbWW5VZeg8UNYndD+QTPwvJ/UGcm9fkcQwL?=
 =?us-ascii?Q?yW2koKU8FKxbdl+xxXv/4DdEKYUbEk8+5+xp2EesHGo2n3I9RHNtlXcX+9S1?=
 =?us-ascii?Q?hJ7V06zcvgTqZgGe5GHEZWr1+Fv1o4XJ2S8aojCSlV9FnVlAMPDXLLaYTpD5?=
 =?us-ascii?Q?g6JlLSyV7gxJrbFUyt+wQ3obQc4CJ8kDKWyZqNdtDEnEREEfw6qpIV9DNxCU?=
 =?us-ascii?Q?MYCKyaUBKwAmxZvi90lt8iI38Ezj/rGmr/zVTKGR45aetUpA0twEC029l9jG?=
 =?us-ascii?Q?ALbrJNICRqJP3gKQZMM9UY5P9ujpc7OpNuzn5ZryGJezRS9YZI/5Np2CZPx/?=
 =?us-ascii?Q?yPp4yOIOCnrLfSrcsMPeveQFjwEC6D8fvTx946MTd2jo/gxxl8D9EpYHGXF8?=
 =?us-ascii?Q?CCOd1kYYFy9rK00AgFqTllyxZx0SXMh9KVhz/f499b8C0OpaWHPr5mc26eux?=
 =?us-ascii?Q?vZ/l7JWp79xAuDWpgSFqK5A0gh+ZhGauHgnCS9tyk3HugO3Q/HcUGNgM4Wa5?=
 =?us-ascii?Q?VaBf/ZKKXuH6aYtk0BoMwdoOV1estvM0+4Mn51/Kecdna2j02U/ceOOX4r9m?=
 =?us-ascii?Q?gS16D4sEKWe+GYBnjerjHu2S3JWJmPIitY8NnA6K5t1kwHxARwrbg61nIOc2?=
 =?us-ascii?Q?QGdo+tKIg1+uI7XhpGxND9uBFwbNYjJ6QbTJBxha4QestRGaaurn55NWYP7C?=
 =?us-ascii?Q?li5/uaJT0RuQQlc6tEUHAwq4xhGmJeSJfAKBBZ+IkzbFCg3XrYzOP06ONDAj?=
 =?us-ascii?Q?BDUpTY+VQ9mvIjDV/VNM3SgZuwMvlXoiQvTADwMAQUFCT0aC9YmPlUjj2+vO?=
 =?us-ascii?Q?5OJIEBNK1faSU5n2UPSgah0J0Ky5ak3pYT6GKrFVA/nypjzHC0O7FMGv2fNR?=
 =?us-ascii?Q?hLklHDSBxeR9p/oQAcO9f2F0FGSL1mP6cTpSNWMlMyi4ZWHBEzugjyYzbSv5?=
 =?us-ascii?Q?Uq2fKLZ2P9RYuyAveAHsKaJZ1oWGLIUErhY3RbIafokM/Bb3pJMCGoeN7IDl?=
 =?us-ascii?Q?5Kfzm2T2ePjfh+3Plhsq993Dmd4cRJKGw4PKTZIGgl1CHCr3y/zQqpgtplEs?=
 =?us-ascii?Q?Ixj91vFjHPZpBsvWrYz1wd7i6WHMwu+UA4NElITZ7Yvq19vK6pU+HIne/lNG?=
 =?us-ascii?Q?5IMoAkdWKBejCFOPJPcgY7gK7N1rGfiLyhy6HVCcxvDIhuM83mVtOFjXPfSz?=
 =?us-ascii?Q?qXzRZvWY6OuVOGwPB50jAksQ2GzFcP4nruQ6PlXi0sqseSDvFy5hv8iddn/b?=
 =?us-ascii?Q?UG2vNrD+sy5MwXZ7CjsfK69Spc5sR3s9BfULH9nFwGro96BejhQvTqe7IjRs?=
 =?us-ascii?Q?gh854PWW0GO2x0eINLRQ7Ho9YUyjsLnL5g+Bkm3FugBEgKkKICmstWBDC7Ec?=
 =?us-ascii?Q?81ajFaEfpiTJRAFQHrL9GdflQjHKjTNoy6TzDbKuRpqGY5tKdrjWL+s38fJy?=
 =?us-ascii?Q?/ea+Xix/dNxR0lhoK2bCm/hT++y7dJHh0FpUiXU05LUFeF1K6+FMb7+sEPek?=
 =?us-ascii?Q?LbtwqHhmUbuzeHWXbvHn42X6TpoEbN5xOb03ns5jUnnFWapLqMg+fYFni5CW?=
 =?us-ascii?Q?UnxT17p6oGNCngmnwoSEic+Y+wdP9YTBq5I1B/7I6/6/agOQjghPtshlvmnJ?=
 =?us-ascii?Q?SojuguQAcQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a364bf-886f-40c7-e0be-08df283f456f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:00:32.5573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSG6JfVJCMjLrignC+1pz1r7v/yDmQT+OTGXBG2oInzpUYAXleSU0feP0sAplDluDjHCNNwZ+qARBH4kLpV9Vbgu6yPLkIEj5CaijlC8nAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 09:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247616

Python 3.15 removed the implicit fallback to the bundled copy of
libmpdec, requiring a system libmpdecimal to build the _decimal
module. [1]

- Volunteer to maintain mpdecimal

[1] https://github.com/python/cpython/issues/115119

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../mpdecimal/mpdecimal_4.0.1.bb              | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-support/mpdecimal/mpdecimal_4.0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 94ab0ccace..952ca58cb1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -542,6 +542,7 @@ RECIPE_MAINTAINER:pn-mkfontscale =3D "Unassigned <unass=
igned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mmc-utils =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-mobile-broadband-provider-info =3D "Unassigned <unass=
igned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-modutils-initscripts =3D "Yi Zhao <yi.zhao@windriver.=
com>"
+RECIPE_MAINTAINER:pn-mpdecimal =3D "Jaipaul Cheernam <jaipaul.cheernam@est=
.tech>"
 RECIPE_MAINTAINER:pn-mpfr =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-mpg123 =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-msmtp =3D "Wang Mingyu <wangmy@fujitsu.com>"
diff --git a/meta/recipes-support/mpdecimal/mpdecimal_4.0.1.bb b/meta/recip=
es-support/mpdecimal/mpdecimal_4.0.1.bb
new file mode 100644
index 0000000000..75d6b71150
--- /dev/null
+++ b/meta/recipes-support/mpdecimal/mpdecimal_4.0.1.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Library for arbitrary precision decimal floating point arithm=
etic"
+DESCRIPTION =3D "mpdecimal is a C/C++ library for correctly rounded arbitr=
ary \
+precision decimal floating point arithmetic. It is a complete implementati=
on \
+of Mike Cowlishaw/IBM's General Decimal Arithmetic Specification and provi=
des \
+libmpdec (C) and libmpdec++ (C++)."
+HOMEPAGE =3D "https://www.bytereef.org/mpdecimal/"
+SECTION =3D "libs"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT.txt;md5=3D61bb27059c72d53804ef475f5=
b18d38f"
+
+SRC_URI =3D "https://www.bytereef.org/software/mpdecimal/releases/mpdecima=
l-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "96d33abb4bb0070c7be0fed4246cd38416188325f820468214=
471938545b1ac8"
+
+inherit autotools
+
+# The test suites require network/large data downloads and are not needed
+# for the library build consumed by python3's _decimal module.
+EXTRA_OECONF =3D "--disable-static"
+
+PACKAGES =3D+ "libmpdec libmpdec++"
+FILES:libmpdec =3D "${libdir}/libmpdec.so.*"
+FILES:libmpdec++ =3D "${libdir}/libmpdec++.so.*"
+
+BBCLASSEXTEND =3D "native nativesdk"

