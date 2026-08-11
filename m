Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BABC5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:11:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52146.1786446691655539095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xbK7K0Mu;
 spf=pass (domain: est.tech, ip: 40.107.162.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtjQOjHHiDVNINoXXGuzq92TQSX03Bw5+KCY0RGhDd6+u8Sz/5eUIhPQBfLBniQCqhnoGpKSju0ichdv70pXC7wVRaF+Kt8l6HqM7Nqv9csBFY5Fjd56mbFiGwGaUy6TAN2uHjSZcfo1Bsgzok4H+cUq7wnzuQmnCjZ4/SZ4FzLudjZ0A/jLZEMbTTPkVY8hUfDZ+9i5d9XToXN4Flz7p+5HYyFW4FMrfFTY1ND7vLgmqI5BnonXaFHkyr+EKM+b0Pv6noFKEMLOpQkMww2FZ43N9QlbpRWRf1x3ZeBXimiAuFXPyevrR2aH7g9AgkXJxwqP4uZMI3R7fqWwCqWHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=jmOhSil0lNZwa74FQToMDZJ5lcExbyExojK1U08jQnDiwkRcgxcqDWsr9xeX9t23jd1OF2PWoRlp8H+eS/JjqjrTRRdZd0BD5SxyvonsGlT8a9oXWTEdQ5fy5/NgeEtKgJ2hMDSoOessEy7OqRDmKwsaZYmkHbN2IHi//C6SF7GL6efksaudh17yM9ihpOYmXFuPLBXVkSthvOYtXCvrXxF3CMYAPwuB1fyoEwCBtNkPhyq3yH6aE4OdpsLWfdWqkQE8zvJNnm7uxsSLEwWIT5KfvI8TMqFysyKD5iIr7Dqb3b87FMI3Srn+V8v/URwxHXKjbK3/kp7n0unmn6C97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=xbK7K0MumygldlvJ1YKJfRRnkLa0xoUxnBnZy7aYQ4dERBBHcXnnA7M/ErMx4K1scSFO/X+rd5E1TgpebJsD3+M2+hUyZRtxWYLAP+sPVlMu3pCBj1OoTZ0EZ3XljJmQdRR1rFmzigy+I6wWiqSL41HhTItltQFSJzhBHmh3jpbQAD8MMiHnaBgcG37SCkkbVif2dKbl5J6OH07GdCSUk8tqKtv16poSq0PAJiNaS25avMLssbEZpJhD41DJ3N5GRAgkIrw/fRDqJiZeOofT/ksR5pDA7uKZFHQrs8tyFfKsYR0doYR26gyAtOH+FkGk7Q3LiRZXyyRNxrrMlCoeIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 11:11:31 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:11:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3 1/4] swig: upgrade 4.4.1 -> 4.5.0
Date: Tue, 11 Aug 2026 13:11:17 +0200
Message-ID: <20260811111120.17612-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811111120.17612-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0301.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3247:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3f125e-a47d-477f-29b1-08def7994be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PcrZFGGW5PnT1NaZbYK1CT686y7iy+Gyx+9XGZVX44gMAPgCTlJ5Xew2BDZixKI8VJ4v5xFZMIEndr9kOiXy7JfsaR7YiQz8z+vfued4GwBeHQZXSmfN1MfkMGD+UepT/vhOdX1Qjj8PmEY7gwE+PaeiROaNRhInq0NokJhm8RbuYpLyeEsOokz4GylppqwxHHGu0XPATh6wTU/c//ECnKfaGmXXqacJ1AvIFUXtAFZ4jG1uGOmCJiPXdb56Bab9UMceOdNWxlLHh7Daux7PZiEokjTe0SWpUsKXOhpSKWAaOLZPbxU5qY4fm/3ehnQ/BCDUz3oiz+PnCyzCmjBZN+DeJClxmFlwuqIrm0Eh7aUhlk9iS1h5lVcoyQ9k2vtvwH1QALt/stV0/39nT0ihMEDCyNOuhsjiT51zORMXksFjVaknhQ8Z2c1CF7aysVgmuN09zxFwprL73whm+6mxAxP1lr00GGzTlhMZVraLnIJ229sa+5X4XOsg/CPjpZeT5+AGJFNDhVH9/OkUZw28Qivor1bw2PWzmc60NkNyOKR8pn1iq6yusfpGQmFsDXO0s2Px6ZfTcCYWA9H+PC6BsoXuj0ssWD2vG2tYuyPdM7I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mYXZMNRX2tUbSDEqKjDBDMWS0Ho9ioVCNVMAIz+imV+SV4y33COyhypP+mkR?=
 =?us-ascii?Q?Vc54dEELFCasg39S4jRQr0vUSL/nQW7ecTByN65LSparLUXLeFy420jmcMEg?=
 =?us-ascii?Q?9k+EjMhIFvx6RZQ+T183IrVzq3hoo6s6elk9riT6ODUVJa2F2iezffDg7Hy7?=
 =?us-ascii?Q?Sq4yzcCB2N7bgr0ZmWOdx/EnVfIvrCC6364O2AqVZq9yMQjMxH5Y+AuHKjGw?=
 =?us-ascii?Q?HiWGLdBm8lSeDdxKTOQD9dS0S28GlSTVHWT7xkYOuIozoDXfN2EzZhZs6fEb?=
 =?us-ascii?Q?ff0AIAok7KIWhodYNpGp4vrOUjmuz/umAhrygZiPxFRE+njJNsl2uX7tD4wx?=
 =?us-ascii?Q?Q4Z6Lf3AWELMmyAra5W+zK6Ad7wlDujokyvhPzh8LJMqtQfz0VvKdz87qPar?=
 =?us-ascii?Q?wPRogAOti++HUUlPB//PJ0Lap4kEZDcGTVoQ7MDWt+EQfkENVbjni6rHQHYO?=
 =?us-ascii?Q?N0vaFqsu2EDGjbTZKLb1je5pJivylSp+g93JhUGBCpKZ72efhqZUeF8e3LUM?=
 =?us-ascii?Q?ZhoCVAfkl8HUiEq79LL6YegXQXZun64sNFTDzCzQIscy9jrV0Q0sUOti3A0I?=
 =?us-ascii?Q?pVEEJkOPrplqWQ3yetGX9Q2A3dKJGK98QNA5Luaq3PuEuEzO8jxjT8CgcDKu?=
 =?us-ascii?Q?Yjv3fll7sZKqgq4MdjPDoqW+uKqSeQNIbLAQZOuaFkXHYwVXB7pxklhqjNaD?=
 =?us-ascii?Q?I7cAOL2pGdiznqcJFMFsFJSMLwpc0kOavq3NgzbP3SDMu1USbXTtS8z29S8y?=
 =?us-ascii?Q?cUOfMyoKDmgiUgtgvGnOT/5u3Q7sG1+v+x9azVtMGB+D9KGqQSkTr992jWGq?=
 =?us-ascii?Q?EulqTRWHj+ITX4CRaJDJXpKlx8Rg22S4OIlIWnDSXjCYCdRsBFeTUePFTGxE?=
 =?us-ascii?Q?IVJcreJ11a83xD51agm6zxlf+aDTvNDR6Glru3jW64kL+uydi0AoWjQwhkQg?=
 =?us-ascii?Q?9tNTuIIJH2Y/yJrIrJSswn1Ip7uKpNK8SbX4ICwbGwGXBACSUnbw5WOSC3SH?=
 =?us-ascii?Q?i/VncVcKRRj8JXadFWPcvv5Lj8yslYR41QAo0MmTXUt/sr5CBUYT78ELeiQk?=
 =?us-ascii?Q?Ye1j7wONaxMIn2Z/GHN/d3eM+katyb1p9rpBUKgny23v50/sJxmgMDzQZInX?=
 =?us-ascii?Q?0/fNQzHQbSU9+oxzCSbsltGm8zziDH3AR18zLgpWLUb24IDrlaG309VLFECe?=
 =?us-ascii?Q?e/n8U09b4+1PHxY6wGQFsfhZEkorqRgdODfhNSupG0Xod24xxqMixgUV8lci?=
 =?us-ascii?Q?rFXBUBQF9/E8ccbAhAotChwmUczNm0ZwFrwqo1EbMTZN7C2Txfw0LwkNONS9?=
 =?us-ascii?Q?uLoCtmnEi26EASNx731CBAseTlWan1bDf8+rff4U6GtX2cZ/QoyGjvGux55O?=
 =?us-ascii?Q?Hoy9fe34sJpwlvJMRVchBSDc0zpnv9MG4PLe/ncXq4JCY+4VyJ7rCNYoBvKN?=
 =?us-ascii?Q?5ub+idTf0B8cs+aetb7dvhaWAa3Oj7ikwYfmVeVyJSptGL6a10TI21V0YDGZ?=
 =?us-ascii?Q?ATDy8UwY57jBwyilOU2vNe4Q2Dl7jcZLgtt1H91tedKuBfORwd8Ogy8j895F?=
 =?us-ascii?Q?LfGstYSNj5g+1VQhtQ4kh73Tz9B0Rlc0PYsFnIH6W7ssNWoww4+ftYUF9Ivj?=
 =?us-ascii?Q?3dLJSTcyzAT8QJYFf3mkGKVdX2ey67WRe7UowXVctdpCtg5xLW/uvvMcW66X?=
 =?us-ascii?Q?Eu7yN9vOF4L/Ip6hFMPyjdThMcFf5/QK/6RdUcN89yHioM95LG9yXo3fBMzn?=
 =?us-ascii?Q?a8HD2mcLUr9eSbRDa/nUXOkGi8YHigA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3f125e-a47d-477f-29b1-08def7994be1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:11:30.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0qnZk7ccYxOcDS1iFHMTYdtSuf6mpTMlRHpqHFtYNkO+PsXJNeGjq+6I3Gi9QVZfxqwobVMigZCA/XKiSZTx17evMloVPFN9MHxuORAd9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243188

ChangeLog: https://www.swig.org/Release/CHANGES.current

Release Notes: https://www.swig.org/Release/RELEASENOTES

CompareLog: https://github.com/swig/swig/compare/v4.4.1...v4.5.0

- Refresh determinism.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../swig/swig/determinism.patch               | 20 +++++++++----------
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recip=
es-devtools/swig/swig/determinism.patch
index d6af38248d..9b021091cd 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,26 +1,26 @@
-From 7df78bedb666e49131c48f1854c6be1597bd133c Mon Sep 17 00:00:00 2001
+From 218e2a20ff978cb28fefdf7b35af8a27768df4db Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 1 Mar 2021 00:11:10 +0000
+Date: Mon, 10 Aug 2026 11:13:20 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
=20
 Remove the compiler commandline/platform from the compiled binary as this
 breaks reproducibilty.
=20
-Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to=
 take]
+Upstream-Status: Inappropriate [OE reproducibility fix upstream unlikely t=
o take]
 RP 2021/3/1
 ---
  Source/Modules/main.cxx | 1 -
  1 file changed, 1 deletion(-)
=20
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index f68b609..0c2aba3 100644
+index 83ab22a..79a513a 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -633,7 +633,6 @@ static void getoptions(int argc, char *argv[]) {
- 	}
+@@ -642,7 +642,6 @@ static void getoptions(int argc, char *argv[]) {
+         }
        } else if (strcmp(argv[i], "-version") =3D=3D 0 || strcmp(argv[1], =
"--version") =3D=3D 0) {
- 	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
--	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
- 	fprintf(stdout, "\nConfigured options: %cpcre\n",
+         fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
+-        fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATF=
ORM);
+         fprintf(stdout,
+                 "\nConfigured options: %cpcre\n",
  #ifdef HAVE_PCRE
- 		'+'
diff --git a/meta/recipes-devtools/swig/swig_4.4.1.bb b/meta/recipes-devtoo=
ls/swig/swig_4.5.0.bb
similarity index 92%
rename from meta/recipes-devtools/swig/swig_4.4.1.bb
rename to meta/recipes-devtools/swig/swig_4.5.0.bb
index 842a7b0945..161c23f0af 100644
--- a/meta/recipes-devtools/swig/swig_4.4.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.5.0.bb
@@ -13,9 +13,9 @@ SECTION =3D "devel"
 DEPENDS =3D "libpcre2 bison-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-            file://determinism.patch \
+           file://determinism.patch \
            "
-SRC_URI[sha256sum] =3D "40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306=
a0a554c6281fcf"
+SRC_URI[sha256sum] =3D "22ae0e887f8cca8031a325c67d005207653200b40e71edb3f8=
8780e28e47d0ff"
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX =3D "swig-(?P<pver>\d+(\.\d+)+)"
=20

