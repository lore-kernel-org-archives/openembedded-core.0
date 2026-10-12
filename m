Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C0ECA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:34:47 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10542.1791801277702732619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=njCXH9+T;
 spf=pass (domain: est.tech, ip: 52.101.69.33, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLBAp5t/ns/yXgR2BBHcR3gAE9/4SaFbGfih4imeqNfdNu4CsgkX7wo5uRVWuBpOZ6//GfRZwEFN8zBtwyPOtr1Z4naqFvrpcAuX+FTlL+6RqjAdHUSqNuQjDrCWdMEQYRMMjhIs65gz8OH+7p5IKw+mSPHD1MchyM5s9Y6eeNS7CQD5vRxR8N0HdvIq78KO6mw+g5D8nO63VJsS86PqMaIVLq0+FIPcOBcGtp8jK9b15JhMFAvbjZxap/IyM023IIDoZrY3oFK2VV5pMetVXPTGIZJAMSWkZVk84Ws43xBzKO0wiViT/NyiukMlK7R9aXZXcYjEK6XFzaRX7wV5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMU6efE/In9VwKCvDFOTNALzzhaobZQQ4Jhfd1JkaCU=;
 b=JV4RM+ApD73c37fx9cZ8WYLYxUXoAAJcTre5sVH8KELK3/isDeEsEYmMBXmzg/v9nmxKi9muZAzp+8ymhBN245B6ZH1w0dOdyQ9shOVD2rVl8hp7JcX7UKTeHGN5I9dxSGUQYus9yU82/lT+JHzWVNEaqMRhQPzdqaApFzQGm6ask2XYGjwlRIvkr94E2m1z4d3sM9IvlEyHXUd0pAqyLNPb85vAY53ZyXQgKNH1XybRzbGwZXxpfMq/RZwEdJL40wl5ZxVrZJXhiRSYScn9aCVWBkKkUYDIzWHB1EYRgdLVVNt+hZOdd7/Jhc3LoQEHXvftYpCFU0y2H3vFtkrK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMU6efE/In9VwKCvDFOTNALzzhaobZQQ4Jhfd1JkaCU=;
 b=njCXH9+TJl8G9kXcuIbCBIDlFFhLffn1ls4T7lGpuhuINZDqDoS99bJAMItIlTqc+COG5u4ioAkWHATVu8TRep/2mVedHm7Zyi1LgnL2jgrrhj5+0NPAM2OPQsg6XeWF41rx6DnxR6D3eGeLQGeok25xLUBUjbNuJ7I1gwkjsguVMnaBKmwAcIt34f8W4QXotlL25SgKgUAqaoE7BCsIMlO3dNRo9p1dD9spVK4StarB6EkhOSvR8fKp1CF3GUFSn7FQ8WPxXb+hW1uo/iAPVdc4UpVSKF4phomX06QtVGupkN0SisIfmLDjt9EbriLJfn6d5wKZn8An0SeqJi5J4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3710.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:34:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:34:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] mpdecimal: Add mpdecimal 4.0.1 as a new recipe in oe-core
Date: Mon, 12 Oct 2026 12:34:25 +0200
Message-ID: <20261012103426.3090-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3710:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a657e2-a090-47e5-1703-08df284c6474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|260925021311599003|260925022911599003|260925021911599003|10067099003|261009223027099003|11063799006|6133799003|12006099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	NJ/mUz+Fkt+GYy22JHmPgxfvUyB6ra2J/zALhEGDYufDQrVsYK0Nc3wS3tNrhWA00J6cCEjkKj2QBOSwq28X0kltXvWxlmS6sKQ1mRnvEo4AvgTjMC76XncwTmagy5g4Z+8HMadpyrTt9FYd/Ytf6WazXggVf4PmS29rD5ymLPFbs3sIT7Iz8WV+RfBu7Ngh+Fdyf1D+Q2WDeDkdSMsHf9befcxWPXyizXO0h24q4fFvZLVhoiXdHS1xcqZ38dSvSvO1a9KRh4Y8sla25QJkB5lZNf1hCmBewQQxEsBO8M5JdReZH6UkM7Ha/UUIsNWaUjusn2f1JnS9IrQ1jujEpRjp8QVcSaXotTR25tt3BXk3KCvRlTkuN7seOtePjxI9NAWjjForP0sMUcPWaGSIxipAWQusHQ9MI84X9sKCHLCkZCD6N64BwXXcv+x0VoFEVro47RLR/32iezhzbrW13N/CplH5aiVWcbh/NF0KSoiPbKZCeDo9ACYao7LANE0pLY4cvVbPFKW+dyCnzLiNWF6Yoc+/e2HcjU05f8Q16BwwX1/1Y67ALreckGEL1fAouas52VpCXvmMgBs1GQawmw690v1tj+TAI3m+fXkQTfE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(261009223027099003)(11063799006)(6133799003)(12006099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cch8uSYyIzNXErc9HKJGy7oUW7McOnAEm2g3ZWHAsK9C/6s4ckyOO8CqjSiC?=
 =?us-ascii?Q?enrngD/Ul6JHoWFvujY5mE1TknbM7/QgmOPbbl/piHNV0qH+sbOKQrnKnCxW?=
 =?us-ascii?Q?3bO4+0EDexApWIiPLwJCA6Fl0pY/avuHSBnkJ2ZiSb/6yXAr7euoRemmvb8O?=
 =?us-ascii?Q?3itPNlB+DGbFbSbOEih+i/tnL5wxpMqyPsNMNxqk8EaJCyBgXUiKwcAHgOy8?=
 =?us-ascii?Q?yH2q63T+WIhmP9QhRpWkd2zrtMc2L9O2uGW+s9r7GX3FEwopcn4CLHMHCK7w?=
 =?us-ascii?Q?jP8Fv4x6xknL8KlI77B/FBIPxjJQTqlXG+5amGEp9ElAHWvL76bvbsrOZz/Z?=
 =?us-ascii?Q?nbqo/FEFX3pzAJgoMzPwz4yr8Uc1SGvs/92En1mbkk03DQmOWeoKNgUhrVMl?=
 =?us-ascii?Q?K2nA4Weu9dSK5dQTqbl4ysCXSoswgQZT6d1m5evns5L3Io2adcSHeM0OlrV5?=
 =?us-ascii?Q?PHdGBvwqNb1kWuTVLOpVGGTBBVD40vH9TIfS0q3BUsMiUwj1HaoE0uuWsvQG?=
 =?us-ascii?Q?95+c7J8tIoizB0/ja5u46yJYnUT2K2bx9M4DCKD65IOYphpfXxy2CoMrrmrw?=
 =?us-ascii?Q?x1XpjhufeeLqKRmpnFQiyUzjNx8TBNILOK3zRuly/Roe1JIYH0WhDCo2aqqb?=
 =?us-ascii?Q?biWSORTNXyFIf9DG37u0/DNh/iwsJEDlgFvErQQVwjELkcXzlOXQ9Fm2Axtr?=
 =?us-ascii?Q?VdgdQZZrphI1kAx1oT3kbNRkxUFsj29WtWL6A8dHj0Hh2ccvEQ2sh9M+NduB?=
 =?us-ascii?Q?mYvooWchP+qGnS3+mtbHa5ib42vWJ1uMAT6I13FZxqR2aptTdn0NLvctLtzF?=
 =?us-ascii?Q?cQLS9M/yBv2pertqZGhDc6lsBIZaIyQO7bYoID5yaOlmtoGqVMpCklcjx7pR?=
 =?us-ascii?Q?UlqkbKA4rVuf6kkiD3si8BsXfIOvq5zB1dtnmlO2MT/eB7AFQGvmO1d8MoBF?=
 =?us-ascii?Q?zqh/SIIhlgyP/jl6OQjLqmzmc0IUy4HlqE6/2SgQFunFAU32DB8JzCNprr6t?=
 =?us-ascii?Q?jxXSMKEME5SsvrFGcvQK362W762vqLsZCh4fgk3sqWz/7BQsoCCw6Tg9D2Nt?=
 =?us-ascii?Q?h368EgMjvleXi8HqFO833zLW9Kn4quETqMhvN4PiX8Ba31zQ84d2pwM3kzWD?=
 =?us-ascii?Q?31YLQ20U1fOoBhAuxbTpuN/0sT1AzC5wdK5T2t9TELX/XSWMtZlPrm1J0xjB?=
 =?us-ascii?Q?o+wE5ObCC9KahgzKK/JWtaGgVN+jgdkftGrFBodjVkGkYeMfvxnt+oypWaDM?=
 =?us-ascii?Q?5QNmCoB1Sflgt5wLzQVhnuAwDAojYDNqzGZTrV6kwi0oK3Bt4xUAHiuevOhd?=
 =?us-ascii?Q?tcIgJABD63WcjiCWhgz6h5dV9oOT3m2j+2e2ZMNE8uQZUt6XXAjBuSYkSawq?=
 =?us-ascii?Q?H9EpC1JRrkLjg65zezQ9Fh9PHMyHeIxO9lRZfXzl4yjju6wvTu756cpaVhEo?=
 =?us-ascii?Q?nUJlU4AmNK2V98Gm31TRZ6n4fBmk9trSAl4gkR+9Yh/zrP3ThEeNt7xnHSL1?=
 =?us-ascii?Q?RNiTO1AIU1HPg+FzzJNeVvEldJNWZXGw95tG0feg6AmQkS6orFqqKyWKgwpI?=
 =?us-ascii?Q?9cAHGwAV7WC99Hg9uY3C91ToHa/x+xgMcGOMLyCXp86Q5oyx84JZIf9d7rR3?=
 =?us-ascii?Q?69u7oU8aWt3IJbWBYPmspE1NqrNZP/t+UYCfi29PdlG0bIfo3BwG9aFLonmh?=
 =?us-ascii?Q?ioplUCkkO9GKGlGaRJfDDVAuyzU7oBx7NCBxPogGFHI5TSDSvpwdo21fz73I?=
 =?us-ascii?Q?2Y5/D1Y4xw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a657e2-a090-47e5-1703-08df284c6474
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:34:27.9489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlbeLQxNeFHN9u7xpYbbwXtu+VBxOANgpnhFNoJvE7aaQ+fFGnM3ECJFtpy7ojB0r2IBVtlP6+aZDZRa0IYCblFNXccCV0mdtUY0faSTwns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3710
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247626

Python 3.15 removed the implicit fallback to the bundled copy of
libmpdec, requiring a system libmpdecimal to build the _decimal
module. [1]

- Volunteer to maintain mpdecimal

[1] https://github.com/python/cpython/issues/115119

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since V1:
 - Updated EXTRA_OEMAKE flags

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../mpdecimal/mpdecimal_4.0.1.bb              | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
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
index 0000000000..5d668a3826
--- /dev/null
+++ b/meta/recipes-support/mpdecimal/mpdecimal_4.0.1.bb
@@ -0,0 +1,23 @@
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
+# libmpdec++ links using LDXXFLAGS instead of LDFLAGS
+EXTRA_OEMAKE +=3D "LDXXFLAGS=3D'${LDFLAGS}'"
+
+PACKAGES =3D+ "libmpdec libmpdec++"
+FILES:libmpdec =3D "${libdir}/libmpdec.so.*"
+FILES:libmpdec++ =3D "${libdir}/libmpdec++.so.*"
+
+BBCLASSEXTEND =3D "native nativesdk"

