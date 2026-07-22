Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6C7C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:24:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43256.1784708671868398014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xgnU3ba7;
 spf=pass (domain: est.tech, ip: 40.107.162.57, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgvbNQNBCWU6oQZhzS4bDqcKXGiLne7UkqgedwwBPLcSdDh2xc83s+uEiLqQkMRRTrJN+MCgfjTmeUMRJUsnD1NPqxNJVVo6h7JwuqJuUiaGmL1I0bZC8YUpa1mz+XFQqEDvINIQiXkQfZ+JSIYvQe1axSukXIZdaBZ/jsdYY4gfA18GwkO5QCSZQN4fo+RNZEVaa8MrmM6Rc6dAtmVqUjDklq3iEox2cdYO64Q42hSc7zRkGEfBZfrijfI1d4vgRcCvGTVj97u+WgOO9VJvszJ6LBCLlOTlUwWBUzoByAcEHI7++NWh9TGn5OlFha/9ahLQDpuXf/+7C5venenHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OllrhwbH4Kb4vGIqT+ydnVVGhtgEajXeld+OEI1Wvmg=;
 b=oEJ2VuioHRK+6ht3p0Kr5CsjkmD1j9IuHcD72MTdNiyqXjWoqNg4Cqpl3IFtF/Zi9XgxuyNs+0FwZ4IGFXhUpj9EFVFbrTib/ObnJd5Hyz9PqN3m3+RvLBmSkrnYouhekKPCTl4oTx64/ftFnr/3YqZ9ocuGPgL0uI9hnhW8AXBGZxCUPHui3EUlAVLkIYkTFZ7pfKwDW/9WJuvLQGsQVPRXSupqTx/45azaqhL5X+M3dSDAB0bdAbkG0trJDdvJoNyv5u5XxFEy/+ErAPG+pG+qYaqHKxQ908lThjiKaL2+o4voYX0rNINT9udCarMvFcjwpvK3Esg46elNhvb4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OllrhwbH4Kb4vGIqT+ydnVVGhtgEajXeld+OEI1Wvmg=;
 b=xgnU3ba7uqwbXZZWxw57JG8E05R5mO/wMSf34JXqOUgm3O5tFB63aGsgJHFGgbtUsHQxOOXeVtatvMROPQIzFXo7hYxuAQPQb3utvp/17HlO+VLGZXg5ZLYkIirQPzFLFxQ5iQ6R56BlB221vyVJ237bC2Gi4iqnbkXANts6VlXHoeN6rJ+t7jAruCCm5g4PI+3f1noJqyJ29wZUU4BgKBCu6JPrEUIJ0SqPDTEr2FDZrf/GOAPaxLbJJ75iUAOMbv63DTLj4y1PkG8e8dXAuqEE3y3r3mtOg4y6m/uDw2lUASGEX/9IMYgNHotvKjSXaIZeoeCXRggEBc883nTRqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2420.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:24:29 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:24:29 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 3/5] wget: fix CVE-2026-58471
Date: Wed, 22 Jul 2026 10:24:15 +0200
Message-ID: <20260722082424.15496-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::12) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: 665eff08-d957-4625-f5ab-08dee7caa655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|11063799006|3023799007|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Ve49PhRsg37Yzxvcm41KNpPmRF46mfxHX+uheULkbwAv8rN+ta+J3CtBiY9Ybc+A25W6NBVRlm56PExqspWVJQuf3Nt1R9ZqRt1O5OTv0TB8VD3EbixKpUD8yFBL7cA3hjxq5p7b7H2S2iTp7bPOHt87OuXqTnjBzequ+gzGEHkUb0aKXRaQWoTQfjStq00sTNIXcA3RyHdbdvOgEjJXVOG7V0yreFy0OhWNIV5tq7QWc9sH0slb9Te68T2nq0nM6vJ1HAwHYk/iZ7rpmkKMdxqSSbaCgmZfN4Ds/aXrN+15nXcDyum9sOiFRO9aC3oJaCgIvWqdHtJ9pIS6cr+fpdM+n4Jgir9isFR/wPUB7leP0QwpxbegPq36ln0sNPvkM8JIg7oHBj8pNO98NKgIletTuSUwm/3WwaeYQEtijluxQHOYfFtcnY0cTRvVXe/T+TtIS7yZIwWSj6snVIaif/FHpcNaReKYs+Bc3nkv57huKT2PdNhWUWNwXiqGevqTJaTUvyxMx8sT61jU0DezGADtBq7ZkL3CSM24N6a9YMrg8SWM+oOVeOO+t0uZ4YxDmW64WJnCbCLozi1D76f9Bs4DdySnhiKg4QU8jMjMrDc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(11063799006)(3023799007)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cXiG1pg7+Mdk0sp9r3+zpdGg5QtJqUZAml5fFwELH4UnYeTHHgOAMhupStjm?=
 =?us-ascii?Q?Tf6l9edXPCbxEwbIRtA4B+eZJw+Mg4e1a276Ci9Y6j0+BOVaODKi537MOMPh?=
 =?us-ascii?Q?B8uEUyyYUtn1448GFttvLjtZum+lurKGsRBhet0+2WIwtxn24+feaNemBJX0?=
 =?us-ascii?Q?f2NJCd6cLYHR+3bSSuCnJKYKnfHN1Ob5E0Br4+6f3P1icKgBa+znoiW9a0KW?=
 =?us-ascii?Q?T14JicSG0ltCxxbenWXbI1ZdyFRmYvRneABZRZ9Ksci+jB4d+aEALjJLy/wI?=
 =?us-ascii?Q?1nIzQ+NaaxBvw1Df/wrc8Cbnunk/5Rn0HdOO3YBNY9ocbooHDdWDGpFHPtGx?=
 =?us-ascii?Q?K9IML2Iz9fLVNs9d43iEblA5wxfXZfD5aMIuuBzM34LggkCTd1WkBeB41aYG?=
 =?us-ascii?Q?nsn+y/w0P6WCHy112k0hrKaW+Vb7DvFtVkiNTy8O0fHMCL2D06JssEeZ0BGB?=
 =?us-ascii?Q?2M8S5PyTKXXIEOR9Gtvp7Wu8ck11sWrCVP/GTLNjeLEuocuwa9eM8eIG3qPy?=
 =?us-ascii?Q?Eq/Aar9eD31ip2r2xqERUREqOXDiGuAk2OkvoGaxBqHwIqu/6Xrt26V44YBz?=
 =?us-ascii?Q?hw924AHTbx1fC0CqDngeBnxZMfE1+zOh2G/0iUvaYZIbNH170dIdqDz2zcOB?=
 =?us-ascii?Q?L9n8+ovi3jqBaS336DGurMcIln+HTYHXFDQbjd7HlWhGr2TLzmn8ccKswRVQ?=
 =?us-ascii?Q?Yy5tpKXscKF/4aKXNIuEny5422sgS+i+Uchl422Wj6zoMaCYxXmbU8GevC5Z?=
 =?us-ascii?Q?/st1S6VQjxODZFwoUH6xXXswL4Ud3CIgKP5np78yCr+QCLVEs8ys51fEtraf?=
 =?us-ascii?Q?dzthqbAGevD545T+MhLBhMcLVmYio+jXjBL7lS/VO1aaOGeSXUle7BRXTpfb?=
 =?us-ascii?Q?b1aTTkRXsexY0jw91QaPTEo3CXy+3He4plD5ILmD4Oulp/BXR+mLdLhB+lLO?=
 =?us-ascii?Q?MW4qTZzcS+EB/5EsFUMfUVRZyJ0bxk46PWZjKpuUMXSyAdedOq7RdLTmUIyg?=
 =?us-ascii?Q?61OUL3TbimHojRoKTfZzmWVCvvNiAwxTmZxI4hxhYMA2tsFrJ36r4LsTeH2O?=
 =?us-ascii?Q?y937uOwRcH9XD0UJ/B4SMv9c2gdzwG5Wo5vGk3y2atRRA4v4nKrByWUfRAbR?=
 =?us-ascii?Q?oXa0TGguylA5Xbn4evMeTy5fBUHgtQMAfHRlVFvfOoDuYNnR05Wd2kVOtCGT?=
 =?us-ascii?Q?H90sXUO+bLbkD4D5d7wQl+YZh+hdwILmi1k46pYOuWUI2+hDiPt10AId4Wms?=
 =?us-ascii?Q?3CuLUwm3e4Fv/BmsY7XBGDUdFuMwvlXBzYBwvVH7Baq3ERaCvr9yLBPVhgjb?=
 =?us-ascii?Q?cbVoJYB6tQ5ftmg6uW6eGdYoHL9RSfaFpHZHxHE12AZnShbciEwtQLnTsWKQ?=
 =?us-ascii?Q?dStohA50axv+vo9zl60kvlB2s0RUuFPfyf0en/tFXT/w0eqB74kH9GtWJ7mH?=
 =?us-ascii?Q?5gcc0nxxUX/9OANGzDKnkqwsJFrKZ5W4g4HT0Tuh4gKiUEunGyhG6/vJyFvi?=
 =?us-ascii?Q?U5n1QOI07BV4gCXbg1TuS7Org/XSKHlmH+MfuPG3uju3wa4qLcQV6UtuWQ3r?=
 =?us-ascii?Q?e+CIWtaC9KCnWUwG190B6Y8HD2yo7sPuiszAlWwpfj0N3/BJaCmKzaf8RtS8?=
 =?us-ascii?Q?S4x/KtKV9JdS9Tmc86kdPr/dU/fm7f2Pt7uDxb3bhHGRF/JtpPwpfOV9zHXq?=
 =?us-ascii?Q?DhrlLoZMg2Y7en5L6ozDtgXYjvN+XenSjy7g+3JDajenpfR4KHjslWe4V6H5?=
 =?us-ascii?Q?WYoXwhwZqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 665eff08-d957-4625-f5ab-08dee7caa655
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:24:29.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crLhYgMYiDgvKruaA7FpMEQLH9sAmB26rqpjsSV38WnQk0YcNQByDzOujYL0MfbHDwzE7MD9yIUcPx8vJXlK7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241623

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58471.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58471
  https://www.cve.org/CVERecord?id=3DCVE-2026-58471
  https://security-tracker.debian.org/tracker/CVE-2026-58471
  https://osv.dev/list?q=3DCVE-2026-58471

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d=
18b010ee [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58471.patch            | 70 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..679ca738dd
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,70 @@
+From 70abbfebb48ea9d2f4b564cfaf1e9e417edfb449 Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+
+CVE: CVE-2026-58471
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/c2640f=
e5171c59f87c58dc9fcb195b2d18b010ee]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 68688256..6a9efe88 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1603,7 +1603,7 @@ convert_fname (char *fname)
+   const char *from_encoding =3D opt.encoding_remote;
+   const char *to_encoding =3D opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+=20
+@@ -1625,7 +1625,6 @@ convert_fname (char *fname)
+   inlen =3D strlen (fname);
+   len =3D outlen =3D inlen * 2;
+   converted_fname =3D s =3D xmalloc (outlen + 1);
+-  done =3D 0;
+=20
+   for (;;)
+     {
+@@ -1633,7 +1632,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) =
=3D=3D 0
+           && iconv (cd, NULL, NULL, &s, &outlen) =3D=3D 0)
+         {
+-          *(converted_fname + len - outlen - done) =3D '\0';
++          *s =3D '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encodin=
g));
+@@ -1656,10 +1655,17 @@ convert_fname (char *fname)
+         }
+       else if (errno =3D=3D E2BIG) /* Output buffer full */
+         {
+-          done =3D len;
+-          len =3D outlen =3D done + inlen * 2;
+-          converted_fname =3D xrealloc (converted_fname, outlen + 1);
+-          s =3D converted_fname + done;
++          size_t used =3D s - converted_fname;
++          size_t newlen =3D used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <=3D len)
++            newlen =3D len * 2;
++
++          converted_fname =3D xrealloc (converted_fname, newlen + 1);
++          len =3D newlen;
++          s =3D converted_fname + used;
++          outlen =3D len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-exten=
ded/wget/wget_1.21.4.bb
index 031a9b3eff..6f6d02bf84 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -4,6 +4,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2024-10524.patch \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58470.patch \
+           file://CVE-2026-58471.patch \
           "
=20
 SRC_URI[sha256sum] =3D "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51=
df27525bcde04c"
--=20
2.34.1


