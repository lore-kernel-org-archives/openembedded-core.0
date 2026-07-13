Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8EEC4450B
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:41 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11129.1783950378178147133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 06:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aYC8q0LM;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJ2lgsJPP5UOi83fzX8KdTwWV5Kp9ExzwAINgswhsmNmO0IYxc/tvc9KT8wp8jGLqHv/B4sUabHPWrP7+HOJ/zBbGAx/DhtdS7Ta7DrXJgl26C9xDpkBZfoAz+8SSFHaHojRYn7vaCbgDRbolNyY00/u0ivic62mtfzjIC00PwjKZKblZPT6ibyMfZD8CdH2Z8mpQbDvm0xAfs26GcvwHIJq8Ne0lLX4Ax03tR93LHKMquzGqBxv7Yc3OFfA0krTMMgsOCTpOV2usGxfuTN/T2x6TpyqwZdZa/0ADsYR1labyB7Ty8lWxlKLsz8rb6E1YdqeQaKdrUit9VFVKrRFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xk27ji0o5f6oLA6a/7iKDydH21l+yEClflwMuws+Y0Y=;
 b=R8LgQEPJ96O8nB1Ip0xxyYJK4wcnXX3faJSZUbsx5A1dPzOeHNKxmMt3JuF9CXQgchZ2eAa8IK0MQSBNXHvtN2H0XIGlV8kxkjr3N5cFOPfo8Zacxg5s+fmQ4DVWvnpZIJFQCER01HaYd343gJwRV5BEAAfLguCFUbAzR3YT6GSlZ0Xvx59do4p10XKcebiryP1Uob0MmZ4crVLGJfvokssI1y1wVJl4DrB/p+BvOETNSoqTBScMJaMKoh/UAfQW1io9ekByIOGfAcApFzPfOur8wl59AlxpQlVhdD9p5ixmoc93jnNrQ5/ZAcp797ldPBnDUwjZzkpNf4bL4d37ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk27ji0o5f6oLA6a/7iKDydH21l+yEClflwMuws+Y0Y=;
 b=aYC8q0LMeGFWekRHP0X8bfEfc6mgTauavlKzbjuQ+cuMd5gOJoibKvUGPRENosxrZSkJm040GfDToJbjF5xf5Vnw1iGYYI0S9M6f48VH8zZVQ7pS7rJeggn7DF6QYX/THvFCNXMYUEO2Q/q1NxIHIzKxRW90mnakdleAQy0gA4pisRCfs6VfJI1/tuLxaX6wkU1UeMkONUHSHqdomcgB4Z8G5nF11rvdgS1QPF4b16WdfeASLEpgp82BU7UJOxbEMsmwNa5ZQ4lpZ2DTGIJ4dWIbNHnlW3aqmkcLlk2uQFujfK7OLBPz5dhIjw1psj2GMr7rF7d7KvgutT1tJge3kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3536.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Mon, 13 Jul
 2026 13:46:12 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0223.008; Mon, 13 Jul 2026
 13:46:12 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] expat: fix CVE-2026-56411
Date: Mon, 13 Jul 2026 15:46:06 +0200
Message-ID: <20260713134609.300881-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0201.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::26) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3536:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b713630-93e6-4467-b639-08dee0e51a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|13003099007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	teeX3UGjf+YxUuHmb+SECiamx9n8g5WPNm4s7BRSWEpB6+diks55neMIKS+OdnJtDC6Iv+jsC9bfohKX13RDrt3s28mFrcBBIEurcZSuNLAerNm5ugjZia+EQ287G/MIVPTR/UqZyl4+0iFHGFKQttypS0kCQ4asEl1CDRKQjNwpMGVhb1NBKpJZN5C2HQnpv33K4XxQHl6YoU1GcIyU42NnBahR+GjGBk/DWaD/nnlTadKbZM2jTXAEKn9TVaINWoimUmGqsWIpAgIfmoV9aKodZO6/M708EarfyyDy5uWaOIZcJpmbg/kPOF70HkX7I9qI9OYu9OwCZd9Rl1Aa7vmHcoBEDHjkINXdzLyPmAeU8sZHPjwLoCyAtNSFmZeLugSfx+dDNokb2jB/3gOgHcH4d8GQoMXwgF1KzYfmeXRrmG1eQgBMzbOlBPj72oToDPngMVL9pEzT7v+dNHVNXBRT1cY2NZrnUAkoL8CWkdH/E5JzrsJA9doUDdSj28VIvCdtonbdLtfmQxHUvx0s8MGJrTV8xnCrQR3kfazViIFIwBAlmGPvUuQBrqNd6fCy6RefgsaF2cphZ1rlL9sZBT4rU4EhU0r6H1YOVLTtcBX1NWgG0arDUjscF/IKuGnaHigaNrSy5dlChZrGYqsmELuhXLnPY39xjlgMIQWSeK8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(13003099007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CPHxY1ZdflpKE4e8Xbt4gLsbHbRdbCNHGCW+r1UMNMxLPyWALiUE1c83ern7?=
 =?us-ascii?Q?XFYCPiV+D86u28ApmerLeoKBu132gNMIOwRgvMp8nJhOGi8ETwU9Wpm5j10C?=
 =?us-ascii?Q?iMkqU/uadozFiZ1snfFPklYxwLZDBM/5ctxt8f8fK9HMjzIwTudXU13ZSsW+?=
 =?us-ascii?Q?464JdNlA7VrT4wO2qX0nVhTbBWhICwZ6mXMWXy8478B50EDsPHZD8HEk2nnY?=
 =?us-ascii?Q?Q0jg+ewAK3F6+79H8g/kHBC8m4LrAPxowMgvID6v0lXg2Sc+WM4R9Zr7OqFG?=
 =?us-ascii?Q?Vh/EJt0mcRxWp7Y7aqhp+4lGqTyqPXnsVx9hB8EqH9qg5laJ8Dv4Aa20QHgN?=
 =?us-ascii?Q?Gj5tIKsx8e+A5ZSc+DRcghIKw0G4MlxqIPwPRDXOuxpM6wE1nfAgUJd3QPX3?=
 =?us-ascii?Q?Osp2AQp8JFm628Hc8eqiw1fgUj7cGL86ZT0FNwuJoSKf2jC6U5x5hDk368Na?=
 =?us-ascii?Q?jfY6RNfErVzWmnQ4/wYFgkrMhCjNd8SNu8g47oxEEnxsOIEls/KS6iYD+6Dm?=
 =?us-ascii?Q?JKdjmJ6Q/xOvYDl1YJEK1pNu7PEiIv/2UFqD5hRC/oUPCEBt4ywwqdqV1z/L?=
 =?us-ascii?Q?YerX91KPdSwcLb5Sx+gtI7W6Vv2+zCWQAuZ9vkVHRwVaSktrZhmiQH18xOUm?=
 =?us-ascii?Q?oD/MTJtjwSb22WFXM9OnQ6B7h3sCkUa4/U3CLWYL4I/4n8xKS+YMhstOOOuE?=
 =?us-ascii?Q?Uc2jqG7wheoIFhLMvvKsl3D/h92ECHmP6O1Ym+wUnMXJIO5E0QP8K8KJdHtx?=
 =?us-ascii?Q?gDxDt3iuZtXYWs0klI9XS8QOL02FqMUzbDz9rpkle2MmGC93mZs/hFwcb4lu?=
 =?us-ascii?Q?3gFAo95yOE5Oc5PU5tXDD0yibh5IHuVi5bb6df7gPEppUYXDdqFoNv61jxSK?=
 =?us-ascii?Q?aVaXYGchI3sfQYSo+lBman5cZkeNLTahz46+e4pcH0pWYz1nSW0fD54oOsqW?=
 =?us-ascii?Q?1XBZG0DOXGU81x7QuKRE5D1iOPyDwSOoWRsARgwFjYGDSTkVmmrSLfGAtqri?=
 =?us-ascii?Q?p9dyMM1/ronRJ3uULYQDaaWlS6DU8S1cZRd4vwgbD4uO/ahBXl7fh46Wsea3?=
 =?us-ascii?Q?Ts34tPLW5qItPl+7NmRokE30AFhx/N7RedakJj2mhppghn299tokstJ60W+/?=
 =?us-ascii?Q?d1NXQIyO3f07Co2lbH+Ps8/vFe6/4r81XdNNo8teF8yu5EiyBpvr1qwFWkrL?=
 =?us-ascii?Q?wXQnTHXHSGZZPImppweRF6fhbfgW2jruzMGRrgdY6ciDsqwoohcBJfAtMuzi?=
 =?us-ascii?Q?rJeRS/LUuOcYxtXldTBFe7gEZB71xnGLowkqLw9JguHQ0JiH4HKiwY6GVBtu?=
 =?us-ascii?Q?K+BMytlH+qOFHIyVyP8M5npnj9Pl7eGpkeFwU2tYSkYwiSSvi58VOfC4n9e0?=
 =?us-ascii?Q?f8QXyuxiNgWKaOqFlYylkEZSJPzuU5F9uY5CsRMfpPwzNnjQp6O/yrxAQ4Hk?=
 =?us-ascii?Q?+rK/PHPEdQsDNnVjoNlpL7eCljoEyBR1GnlBDt/rXBiQLvvvrtC0unlcd9L5?=
 =?us-ascii?Q?T0s7V9ddoFramRRZ6i+PG5HHB39aZVCKvlYY/uCG6+e/XPcHn7WuY3hiRpgB?=
 =?us-ascii?Q?QviC6prnqdB/j+bD45bHlwipSDyG43jxTPKz1UGc6AeBkAhaH8g8aabXhhjh?=
 =?us-ascii?Q?ETboMDxfPpowh9iVK7pjZrECsgtG+20Hq6ZJ+isFpW3vLq25wu2uk1TFOncQ?=
 =?us-ascii?Q?CRfPsO+2CLJrUlQeK76PNt0QTk2hQzxCXXPIJFCm7uIixQdUpic3nLXG3Syy?=
 =?us-ascii?Q?XDUIKGf8ZZic7B/sIFy31T7DlyDExBQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b713630-93e6-4467-b639-08dee0e51a25
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 13:46:12.5286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DROtrH4KZTXs1Pa9HAGfYsn1R6OOpkn2GeUIsHvhCTBhlQKwubLgMoRd9xK7uT02SOmtqkTtOu+vMpyziZswsAhE6o7ny5NMQM23bytVbXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3536
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240879

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport a fix for CVE-2026-56411, an integer overflow in xmlwf when
allocating the notation list.

https://nvd.nist.gov/vuln/detail/CVE-2026-56411

Upstream fix:
  https://github.com/libexpat/libexpat/pull/1263

Adapted for 2.6.4:
 - Changed notationCount and i from int to size_t.
 - Added #include <stdint.h> for SIZE_MAX.
 - Used "freeNotations(data); return;" instead of "goto cleanUp;" as
   2.6.4 has no cleanUp label, and also free currentDoctypeName on the
   error path to match the other exit paths in the function.

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../expat/expat/CVE-2026-56411.patch          | 62 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/reci=
pes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 0000000000..66cab29bc1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,62 @@
+From 021dd272c0d3d40af16575f46a9ac197031c2acd Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH] xmlwf: protect notation list allocation from integer over=
flow
+
+CVE: CVE-2026-56411
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1263]
+
+Changes from upstream for 2.6.4:
+ - Changed notationCount and i from int to size_t.
+ - Added #include <stdint.h> for SIZE_MAX.
+ - Used "freeNotations(data); return;" instead of "goto cleanUp;" as
+   2.6.4 has no cleanUp label, and also free currentDoctypeName on the
+   error path to match the other exit paths in the function.
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ xmlwf/xmlwf.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -47,6 +47,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdint.h> /* for SIZE_MAX */
+ #include <string.h>
+ #include <math.h> /* for isnan */
+ #include <errno.h>
+@@ -381,9 +382,9 @@ static void XMLCALL
+ endDoctypeDecl(void *userData) {
+   XmlwfUserData *data =3D (XmlwfUserData *)userData;
+   NotationList **notations;
+-  int notationCount =3D 0;
++  size_t notationCount =3D 0;
+   NotationList *p;
+-  int i;
++  size_t i;
+=20
+   /* How many notations do we have? */
+   for (p =3D data->notationListHead; p !=3D NULL; p =3D p->next)
+@@ -394,6 +395,16 @@ endDoctypeDecl(void *userData) {
+     return;
+   }
+=20
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    freeNotations(data);
++    free((void *)data->currentDoctypeName);
++    data->currentDoctypeName =3D NULL;
++    return;
++  }
++
+   notations =3D malloc(notationCount * sizeof(NotationList *));
+   if (notations =3D=3D NULL) {
+     fprintf(stderr, "Unable to sort notations");
+--=20
+2.34.1
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/exp=
at/expat_2.6.4.bb
index 048093f010..7259ce7436 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -46,6 +46,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.bz2  \
            file://CVE-2026-25210-01.patch \
            file://CVE-2026-25210-02.patch \
            file://CVE-2026-25210-03.patch \
+           file://CVE-2026-56411.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.34.1


