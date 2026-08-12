Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6322DC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:06:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6484.1786536369995223880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=v60H3f0F;
 spf=pass (domain: est.tech, ip: 52.101.84.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV8ZVJFYdJxzddGsSbiRlf/dmUIMLBbDL0H+Z/B1vrmyqeNgLJ5zJfJMHODv2fq/qGDYP6BeZc/3bjmaBlPKejmuKU9IvFepevqa52uy6eXvN/qVCveSczss6pZ9rBy4kNl7HFpqnsPceAy91hk7fDI8iXBgKJjgfZBFE8JAZb9jhFdSGbHiVFp6QLzd7zY3UBQnbvRqI5XifGisM0AG68VEEP9eoUphND8ufVaP+6rll0BfCRNvn3MpbN+xNGTFaNWXZJm14fZJ6IQ4G3aSo3HaiPBHSr5viL938B9pj0V9emjjmDMMk0O9oqGDj6i5v/8X5jtPeXOOJH1TZfRNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=BTmm01Rx62USOF7HAAbBZybQqoFtEV9RFwZMefZ+mZmbh9Yys+tWpQMfc+nn3HlofKRvR693C6dPNppQXumW5OvNxJD8PQqZ4lLilImycr+IzszNyIx0AEYEBJ+VCeb2X/5LSOK50peI/TMSegTP2vniSCUomrsylM9yKc/yklrKlLBMUs8hdWr/h7dWmUWKSkOtYNyD2yQ2HNIK1H6rNRa/VUQrdgG0vap0hmNBLtjsxKhZIz32v/709VuOr33JzbIBZWaQ2sMQy37t4e+4+RE3UWJW8VxsOYA5yIme+XXvggx62rNfoIu6rcZ98/q9ooJ0s7rIFmpoFYHHbQvpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=v60H3f0FA6sA5rR+u8kXb7otXM5BAImEc5sHN7QD9M/00I8NDuwxKIGaFcxV9QpvNO8bwDnr5kTps3hh0C5s9k1Wsw/PZC913mTYCbmq2K09m+MtOmsYNNXnWmTVl2rJKNttUpld3b0606KcPLiJD+c7d9KDaRTiX4CDZVzXD0p5P4dFQLMoipGHrBy78Va/7IKRuPVSqb2cLvUayLV8FTD/PUngIuzzNPADdvgXs7G0t/gmb4dvIC2aiBelDBFcz4w+u+UNMdEgnhsAs9ETnWJQuK8/agzbrIwYQGJzBWUXhESnRW67Z6aS0QR0wyKPZ/SpTf9G9waM4x6omSiO2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB3354.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:06:08 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:06:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v5 1/4] swig: upgrade 4.4.1 -> 4.5.0
Date: Wed, 12 Aug 2026 14:05:55 +0200
Message-ID: <20260812120558.24897-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812120558.24897-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260812120558.24897-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0149.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB3354:EE_
X-MS-Office365-Filtering-Correlation-Id: a0be2956-8d36-48ac-8d95-08def86a17f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	e2Wx9p/RRUNZ1eAVfiMpT647uyig3+h8TiigXYLazzo3bkqmLstWQ7kyMHTR3kqvVxjJmsVimS7D1d0ahmhqscDcjHdNZcBpiaMvH6AlF/+KzDCWZRFYoNAtIOCY8C6tVrwbN3E071EGNJCDoKkb3HQM1ds3eP5/KJXD7JlHMD7Togzih4UwLHRnV3xKby+3M2ZbehtlFJbFhJrG7O82iiGZ++wd9rWB4kMrMLzGWYjHaoB4NtDVCreoEKY0n516LLDFdqh4ZCvtCWSUkNSEis2qz5FYKf9flHHh8mMvT6qR7hHgspfbu5aV7eAJ5SkyV3WvTS0L9/1es3KiOmheWIjWa+vGNy7TOzRbilrdngCHNJSqrE6VKcfBoK2QhQqDtityzg31XyjPy/HaWtkiEve7slaNe3vmQFWknl5ypl30bVGQBb3i1WgzbcvQn/f6UCKSq4brdZYht7BYsOIyLVe4DNhLPRmbb6+yi8pDPk6VhovM202BmoCwkP+5Ju3K6S2thFzXOLco+EC5EL0cJn1UvhS+8HcghlBNM2cFy6lZoiCLejWdjpgLlhmYEXdNwvGVLvZEHNWEQV/1EtDfViOxwFhUpi+Kmut698MrOp0UPuG1vcp0GF67CofZKSnh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?34zxI86Nuunor6tF5rG+0OkghHNR0ooOq2L1YijnJXyP3q1xwoAWsYsdTtUc?=
 =?us-ascii?Q?TuK9hQYIoc1WsA+qgFO1Od+lgW8pIs9L/ffQ+tbyrWrMi1NobZv1P3//a0Yy?=
 =?us-ascii?Q?HooB/IYTC5/22egKapSAUaM/rjV7dQXHAPYzOyDp6OukGO6biYUISI6cEiKp?=
 =?us-ascii?Q?NrgnFMU04dmfahHeRAmJlH0b/lcRFfUDkZ7RjcAN3VlqaPFcHGfliPGJvOZb?=
 =?us-ascii?Q?pMU1ckomKlvviRx3I97HFB8XsgudNWLaedRt5+pL6sQ8GoOTuexzn193ovX2?=
 =?us-ascii?Q?qtxL7CB5XIlsLsaEkDsXSS7KavZS1P5u+wK0g2k0PjwPTqMzwT4IaRf8ItUC?=
 =?us-ascii?Q?/F/bAjODExF8tK5jlDP1y0dYtZ1wlrFB7JXwnhd9W15CzFHz9lBgYGPT0Vf/?=
 =?us-ascii?Q?28IXoOacaWaNk5w6w1TNx6xlN5Tw5j0guPWXRNfh9VoWbflu6PYrN7fClySC?=
 =?us-ascii?Q?x1gi2XVhg2Zaqfs0l9zwsrMRFAINQiFniN4JQXCukwXifAU4IaYMDK80sX+S?=
 =?us-ascii?Q?pYS1lg7N4EES8JtnSxaVAXXq7UE3AmO2c4Sl5nZUUnVnLznZqWxLASzet7Ja?=
 =?us-ascii?Q?hk7Axzh3a/jzTZBmIzBLReV+JOPgWhA6jXifyqhlLci7XENgBmQzzcZvf+ZW?=
 =?us-ascii?Q?pzQom89OyiDKs0rUkuny4TYxW+/daHPW7LOaj+RiMegieuDCJHb/jneaU8oC?=
 =?us-ascii?Q?bHvDkzHcCw5Y5FTPN719JFjL8CfSSPSxa3XpSCjgyk7zoV5E6w7KXzL+t+Pp?=
 =?us-ascii?Q?pikqKICpCiKlmBDMljrj3v34QJ5iPM4dw0lhGOEgrKLZgylHauWJLgYajhK/?=
 =?us-ascii?Q?ZueiZVsNToMXI4WnvJpGS4SP14E6q7/e708bWoqLwM5SDGkPa0xiWENmHRag?=
 =?us-ascii?Q?DRhxdX7cahagGhbHg8bSzXxnsS9bsV0zH9k6OmTaizy3zhJ+DxXbzFBbgVgm?=
 =?us-ascii?Q?Oim0DHNfrwnsHnUHyYV829HgCo2Zp+cSOlVJw+wc4rqEDXyMyJ6JyRZ56Ly4?=
 =?us-ascii?Q?qmq1lu6anFjl8lHgFhbkDyotglqDBfyVoJVo/wbEQXU1IE9oGDYGX6fAYx+L?=
 =?us-ascii?Q?tQpsfn0/azKhAta8NhYg/LxVAtINRPylzm6PpJoOr1KKzsTA7FgOjEC3/W0s?=
 =?us-ascii?Q?IGwLva2OlKVLSVGw++TxgJjg0dkqGTWeJL4UvI3C6jPOZnmrJeoD9ORwTr/C?=
 =?us-ascii?Q?z12tlchFWG1asehBfmfsiyTp3QTDli7+CmsbRHM3xo91gHJPh6iPPoyy1RW/?=
 =?us-ascii?Q?8TB8qoCvJHTchsccaPZYKlAD5ggUQ8IuEENTIhd86xc8cnYaWv8ac85+LlqO?=
 =?us-ascii?Q?kWBxUz/XxxRBsdzcVYFAO4/VKvVrNLde0fLqt8sgrP08qYmUSXfYNeMdpClV?=
 =?us-ascii?Q?pIEDNLxpt6Zxc3IAcu75PihiH4B4MYu24cHLt+v/cwl9Jc4+ZslQI6i8B9ob?=
 =?us-ascii?Q?Z4ejJvk9kgd1pcBExaFnK2aki4CV5WMqMiI3mto7f04XSe/dW+a5Q00RvNqE?=
 =?us-ascii?Q?6MkNB+aIPzT+/ZGyPsekBKk8BX2huPLCebbbfgm5qnoHmTskTsdTFuICVh92?=
 =?us-ascii?Q?FlnksFni5Zs8LHIqKbwVSmaZ2WIRFkq8xv3Pe8x9P0knxyhkdT258IPjgSEs?=
 =?us-ascii?Q?Ei8rhfoRQePFqPIay+PE3Gf9ozQcXm06NREbTRlwJGVe3nA46ezB1ecm+qqi?=
 =?us-ascii?Q?6EUUO/hQDjiT5ZzXtfcPfz2w3rJtSNzQ0u+3+RDpRWGS5JLkCXfP3nSxebQB?=
 =?us-ascii?Q?LyVaqCsDHk9yhDwsvaEAFtmuXvE4HVo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0be2956-8d36-48ac-8d95-08def86a17f1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:06:08.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnIRasCXEQ6nHU8EvjBRNqBrxg1pNqc50XNyKZDEI6goov1Pgnr7cOlCdNjDY9GqIDi5qtbACY5Gbl6jz0slWdYqug495/t1XH00ymr+4cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243279

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

