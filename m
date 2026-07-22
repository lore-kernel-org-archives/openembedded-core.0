Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19B4C44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:18:22 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43325.1784708301719805309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xUSad18r;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8y+tf+q1Th93WkH5aJXFQlNpRMYZHWUlDLqi2hfo9QAGMicVkmAa7KKsxP0uzcGwKXXUY7a40Ytzxsu0MXyn+oJinb8BE52w+oP56eBnzLAbhktI52Ojj+PU6l3tIA/wk7+02YOKQyc95NEvGLjVYCSGSREP6/kKn3N3HEsqN2KlKdKpbxAMg4Yvfnvxso86Gbg77GWU8xnZXJdlrhL4ZWzgOsKlp756AcPxk0Rn8BPpa7w0/iI2koH6DhDtNSOmnk0tptXYnEbNSAQK4gkNf9JgsAGf7p28kRDjphNIthAZ/sZRjXr/W4QL+6Xfzj3zj1gg4C8w6l7gD4T3GfZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlKzYR2ynq6vryFi0XcXA1JaHYU/FGcyfj5jjW414eE=;
 b=V1eKFAnlacoVUFBNjHXLC/V+iFRDY9lCRZRhJmDfa9cvfKX0Z5RFQRLq3Sh7fg1xMxeQalzy3ZjN5416Jmsw09Y6XV5/GRtcyF2QrYwbCH2ojROs6IRa2QOlLQxz3YIoi3De/v5mCiLxyYxHdhspA9YRTcwQEh6faAj7S6GeQ91rvU2vHqqejM0CCoOeOufrhuiz+0DHqBJ1CELDSztbEa85ZUk0U6I1iITSD6yQcaRs36bRfDk4fUhcNp5lZP9W8jkdCJEkHeAXs/znIBayiyDHVO5EHmflY6EqMpdPpfs3yLiE7TGmANOqDh4e4deh21ZBBEv1VSLMit5pSoyDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlKzYR2ynq6vryFi0XcXA1JaHYU/FGcyfj5jjW414eE=;
 b=xUSad18r6xGIlMxCDFkJK5dcJsGF2f+HK4d/35xMBUjpl/zjBEys7M0nYokm7WTRvsaz5gnjDVryw3tAhHAJNhkcV/FKNYlAHkJZlG6XG/NP5JzMV0PkeaxoapdzYNKjfpaoys77ap8DTZzS3gG9ynkVVfpDgCFE94yLCGcszxVHS1qZwzmAnbPyh++laqdMhb6fGGNf/hzP8n6QZ3d6LcOd5HEHETZwDGbUWyQh4QmwOQAAUbzqRE4TG3rAPFVC8d99pIMXRyGtZAM0xvLI79ZTQWEiNaHuxBJ3H8ywbBzsoiggyhf5zRbGfRIB3ehqLG1/HeSn4AtcOo6aIsU6Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV4P189MB3630.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:18:15 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:18:15 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] wget: fix CVE-2026-58471
Date: Wed, 22 Jul 2026 10:17:56 +0200
Message-ID: <20260722081807.14885-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::13) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV4P189MB3630:EE_
X-MS-Office365-Filtering-Correlation-Id: b86cd7a7-2f8a-48f5-6d22-08dee7c9c7a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|11063799006|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	icCBOqcMXjrTM1Ta3VB2qPT9O5jklMQOS12GFZo+Ey4/MYS1FGagv9jEAehrZvU49gNUmh1tS2DjPMn1LN9fLRx2zryShjI6KBY66Rgt7sfcSYCttvnK7m0drD21cWN0RbSmNK5uCTQ/nZWcx7rYLsr7PSsnf27YVuUa4sNRGCSEPdIA5946wBXPn/1Ta4I0uBTmKBiSl9v9Ym6daQ1CTRX7YeTFsMWY9RjTUPzxaVgYNKVMqBFvgU5HAc17/ZpQeniIAkpuAIlsGVNJPUshuym2UFJloMHqP7QrsWd6kDBOGbHfTThGfGvSq39dKLuwr/iU9QBifE5bGGOJ4sLBR8q+3oE7CFCWkqZp0nELUqm9Zwlp0v4PcvS4V2An4Awj+nU+7Sf4C2XrdI53wy5RZEj5iJ//7/50q+WNXQvF3oAjAr7Ij9xhqkb/KNgv24SYlXgpxnJPfyVVoy9hy9SBE8Sv3GQii5WwU+6s6IvxvD4oWmWTmgX/v4SKFr2HgqbnSao7FO/aausvHHK0JzyboFt2FXM+L5CJ5qP3VyyZTNnUDach2H7qLMoP8zzr2S8xsOW+eviN6ykR6PwjoTDgfFr2aAWBs0WNUOh4f8HyRk8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(11063799006)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pw/ZPpa3GxfQHyG1QpSz7qUgj2rMSkca2KuViYoXAa/zljbSjnMa3prGaVUO?=
 =?us-ascii?Q?LQy8gZ/MoxGNwYNN46xHE64yp2prw7P0kvH3UPbayWe96JaxQTTcjQMioxCl?=
 =?us-ascii?Q?fJvRd57Ay68A3nlbmwqxaY5TtzmzNq8gFqMIAoGIh+wRVZ474pqA21qDnl/b?=
 =?us-ascii?Q?8sqG1Ez0r7OlHeaU6BPisgnZEkl1mWHenJDBcgs2OVXmc/ZkpRKHQCug5zjD?=
 =?us-ascii?Q?R29dxvY2IqAvD74g0p9MCp497DthseOvJyg3fOlOcR9Rhrfu7Va9uGh1eMv7?=
 =?us-ascii?Q?KKsvLZJygaayWx0lQ9+KE+3nblxjKzWQds5gtJdHTLx0MOEEgGVo998nV84I?=
 =?us-ascii?Q?9GSJ69KONacUjDFDLvOcVFyykHUTqCFqeCpcccTRU7OUS8EglbrALNG3lvI6?=
 =?us-ascii?Q?vIOfQzI2onV/XJK1w+mjyt45WiFjX/GMOqaKge5emzIwePJxIBLUyV8ksFao?=
 =?us-ascii?Q?P1j/y3ozXgnVacm9BSi7oJx0WgpPT7Cy2uq6Z4cqQv0skIxB9Q6IqB5BwiLR?=
 =?us-ascii?Q?iT24zCtRz/5PRjwG4J8/byI8yhZPNjE38ntjPH92shqVY8BhOgOKma7Bx9sH?=
 =?us-ascii?Q?PKQX6lTjVTj41U4akLpDhSDcHxoJk10imq/llErg/xFYUZXZfr1GPMbxcmw8?=
 =?us-ascii?Q?U5prcIXg589w58nMcuOKFczz05eIlxOE7So0xKjqhzwJcx4T3vIEfM7hk9i7?=
 =?us-ascii?Q?32S8vr3YhEBl1/VYHhSwNoaVxjRzZnGXmedIsIoz0YxtdKVFHyOYXUm5R2DL?=
 =?us-ascii?Q?ZNEuwiZpPLxDxah7P+G5ejhB1bkJJrAltTuG8NrqOvMxk/4uBVaCn1lUWv/x?=
 =?us-ascii?Q?Z8tBSWpWYaJe6CW6e1Xi0jRxB4YFsHl19zc8reMczx/WxkSjU7eNhwmztLBX?=
 =?us-ascii?Q?NcWvwQuK90haGV8DRim0mJAM9wmqtzOsrBpe+cMy9wbVpO0Dz2U7JJ5Y2hbk?=
 =?us-ascii?Q?/I8UJAgrrLOTZb6QetYZaNTR8bSSoFDcfrGZaLmQlRsGozmKJ3n8CftiDRFT?=
 =?us-ascii?Q?aaZcHmwvxYGMNAR/hsoQPwsZdUPT76+mDgU67VPcvmY9g9stnVfzqlEtpl3M?=
 =?us-ascii?Q?qaVYBcWaQ3kaNjydQ8vEg38WGLbNAl1SF1ymF7XpRlQo+pwQZnmxpBesn+dx?=
 =?us-ascii?Q?lTuLvsjI6Fh4XGNHR8atzH3dPEou/SmZkFmcCJfipjYQtp3+JFGYItXmqag0?=
 =?us-ascii?Q?HhdBxcGCBp5hvjbJAl62fZThZKcpKy40DJtlAwpqJyL0tKL0JqL2JDqcdfpY?=
 =?us-ascii?Q?FC76MWujKTCQPrB9lac5VN3dTWIY5eNjREVSjmIa2h/gP7h743le4n8EZIHQ?=
 =?us-ascii?Q?+BZLkAAz7vd0ZOER6F51lhwvenOZ/+1QtXjpMlbO1Me6KjmBNkoRAIwsqYEZ?=
 =?us-ascii?Q?1DgQLp6PfaD7OPZmFKQKDHUKbC6TeysHc4AUjGDSzWtmetBH8gmjKcuAP1Lh?=
 =?us-ascii?Q?v97h9ewMe2TMC32epk63i/o4yllJBmj+J4kChr8ECcPLRsxVDxpMxUhZn9kW?=
 =?us-ascii?Q?96mv0xpfXL0kFCdCkc4xh4lzlI74yLDS8I/Qs8tOFQgLlFIbqTq7bHWfu8ay?=
 =?us-ascii?Q?mToJvfAPpz+mXgfuk3NT2RvLvxDn5PvMObbESAwqAhQbSX/2rwQrjyw/atgo?=
 =?us-ascii?Q?QQj06oPvJ0Ttj2MxjSmUNHf+h1uBiwUBsRDk0F38P6Ue/hlrIz+328VbXDBF?=
 =?us-ascii?Q?nfD8YM2XEwptInU2E/jqxKrQQcQLZJNbIl9E+ZJ7D6z/PhCwKM8/ESl6z73K?=
 =?us-ascii?Q?iMENWJ9cDg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b86cd7a7-2f8a-48f5-6d22-08dee7c9c7a7
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:18:15.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUNvGzlf/ozf1sWqMjKyy3EUC5KPSL1QT62ySccnGO7AESilJarIw/QEHhd+ZYkNHN+jDSpwRBcYFTWX2vGAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3630
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241611

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
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..a69dd5ca81
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,70 @@
+From 532945675f0d67677cefb04ac4293005ede61379 Mon Sep 17 00:00:00 2001
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
+index 2f27c48a..7e7a3cea 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index 5268ed968f..8d9b983de5 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58470.patch \
+           file://CVE-2026-58471.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


