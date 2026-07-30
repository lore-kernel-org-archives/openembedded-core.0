Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9719C5516E
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 19:15:07 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14548.1785425351614334596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 08:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fdkDNL01;
 spf=pass (domain: est.tech, ip: 52.101.72.39, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig32qX3plfgJrn3KdVns8DmYftVGcEoXpEoGBtjPZAav5on+T3pFsKZ8+QYfYUW3L8C4bzNcnnwi7OawJGBpvnVyWrwuhgbs1fLYcmzw5bUdAPCJ9wDkcWAFZC7nvueKKFBgEIZr20z2MD5uQHWnp5VGxKPRLUfAgFpbhgnpLT677wlvOqNkE0OL7s+f7oOgZcs9sfomNXkmU4EAmkqLwxk4ySy8oZDVIoNWQ5Pst/LmSU985Nv3yAlkXsReO7gHQwOVEj9lR+hyNTrB88vCEVWkgbCCa/JdcDFdlVef1Q2iAebg2Z0MpcDfaR77w7rBpCOWQrWSb5G7kVGSzroETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK0JqWV2LgpYxj4ydyvp1W2x1uyAP94GOjjv8riC9bY=;
 b=JYrxnrptHkvyy1TyqTXdYtBxRA5LJP+2xnlDHAxa+gUAXyQFyKBy4j9OaZV1EyrhTtBEsxwBtfsNFMnbyjpv2wyURWjfCwOy/wNqaVIDaSnZn67XRwdqav9BmN5/npc0ndwPlm2qdrMXvWh89giVc7g9bMCZYCKNskg3ZL9WqvwIwHBUOdMO2vBTZ/r1BXRSijjxwYnepry+bVL1kvyUUeCB/TT9CphB42nEAnajkGgh+WretX/RFWDicyi1Xq2agGkJ/jJSaExH70AS+hfikmIodUlz6Id6+yw/Nh69m2A/ScyBCeFq+r3bG2Y/LsB37iEa8S5w1Ul25earCuwzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK0JqWV2LgpYxj4ydyvp1W2x1uyAP94GOjjv8riC9bY=;
 b=fdkDNL01bCGzzsG6JebUKsQV+YtQP1SdTzxetoZievOrWE5i9rZsZG8YgPGN6pL3JUwsvp27c+IOndQWzjYGdYQG9vOIairSA0/cG3AQ/zWd4gHTsDTcj2E/WaFL6Hp5KOnobYnVo9qdw55lzxSf2dfYmKv1TLT03euLszBKLLbZbdYsA3WPQagvJi1ZwGdQRJHRjlI62Ymk+0DFn0jRQbTuJXsNAc0FEAr34pY+Kb2W4BtplnHsmABmqp9tMWh/Bdrelv/0wLp+zB5vs9HNR1V445YZcX6+mqIh52RJ6g3g+UKLJenZAP28IQ5LydQRohqGWafidpsQaAfbnP91kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI1P18901MB0734.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.9; Thu, 30 Jul
 2026 15:29:07 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.005; Thu, 30 Jul 2026
 15:29:07 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] gnutls: fix CVE-2026-3833
Date: Thu, 30 Jul 2026 17:28:57 +0200
Message-ID: <20260730152904.567709-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU7P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|VI1P18901MB0734:EE_
X-MS-Office365-Filtering-Correlation-Id: 054f06ef-02c9-4785-ebbf-08deee4f4bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|11063799006|3023799007|13003099007|56012099006|18002099003|12006099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	fdqvHg8IQIIf3YNMzGJ9EyB7O2bPIWrNwkm0QW+jilKVeC1u0ug1vQzzROPkZwoUeXrEfKDByDwAcuZ3wSvhz5aEShBvxw5LKrj5QMtr+xOxiVn5Sw9NAznlWF+xGFbrhqPzs29GkCYWANHLyoLOTQtK2tTj38DMH1mGSD6ljfCLNj1vgFYCHZuNaJu5pokyscX3VXO50lS1B2ElvHiuyo8anmSzY3ytQcEh8kzdELQ/jk/WkPGUnopNARkJTmfAtQdeuVR/OLVRCxmr9CZA47GG/nAAgGx4PGlID2keb9HrZT55CTFQIjJvAVSrGJe6I6cqZ1jTaG2JaEHko7kcROIyyKv7Qrr8OWElS01VovknSSX+dN4EnjV3dJ3sMbZ0ujtXTaFOxSlC8AWaPQV664mmfyv9v7v2pVjpYdEHRlFhAJkI8Y9GOtBeLCeAgXeOL9FOggMjXl0K1ISeuPjNU1Ovnx+zm66m0f3Z/Z4FaMsYtS287F9njrBhw2C7g0S1y+pKbxAZJ2fJrkrnOY343sZhJa6V1qdvgyza57Ojml6iXGbGs+2kp9wsY/oQ4F7c8uDFjWIaqcUov7/ki7cpdYIq8skOmzr/kGwliRM64Vply3NhxWKF91KobmzN/rJ0SCq1YB2rfdrP+PzUrgnn6cd+LURY0DJjuJA0R342nnk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(11063799006)(3023799007)(13003099007)(56012099006)(18002099003)(12006099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qZolfSGCcTGXytCITc3ecf3w5kqUklIw5kaJ7MAcY43QDMgd+BIMxknpT5fe?=
 =?us-ascii?Q?lgJ+GXL8942ZUpXebH3/qjYrhDyK7X1yW+wE+dlTHVGxUD9TtyQkuJVxzDSH?=
 =?us-ascii?Q?C/+EtdOSHzR079FvD02psc2arBeTEYVfqOf/ua9ut2cUdArQmba1xsfy+HYW?=
 =?us-ascii?Q?qCPRDSTs23+IAYwsSI+BAvodIO0oD+ZB27ScKpg2o4BWKyjSSAW/C219mPXm?=
 =?us-ascii?Q?FzY6CasaiUw568s+oDQCC04X/Tux3Nh9Ls3IkNVBNY0Ap3NMEAzhigzUZqlC?=
 =?us-ascii?Q?ecsspYspdDmsPDip3qqFd1ZYnnK8AN1v6zQuAEQ6XekjlBmSfrUC3HdGEiVy?=
 =?us-ascii?Q?6WbCJb/zzt0w/KYdzlm2hiItIt1nY8+ql4JsdFmGPqNlveIbhx2L/N9H9khN?=
 =?us-ascii?Q?Ug0hjk/pNkvgnueHoGxfmDkpHnKs1Q+gcy3CsIc1SnLvae9Y5FynimPhjFm3?=
 =?us-ascii?Q?JAMxBDbLC8ylop/SxRq7ZKuYV6AsKFlgYz/D/58mUPj/C0mRPDZ4W8OkXb+3?=
 =?us-ascii?Q?eOWZ6xPXvaaUCA43k0ZEmEzNH73W9g17sKnrGLgUa1dbS56+iKW47NBgBRqf?=
 =?us-ascii?Q?Gl7lhnMUO6jktFtHBtGZAwO7NKT+qA7dVH/dSILrFSUOmaCp1kqgJiw1hTZE?=
 =?us-ascii?Q?rW31NViVa/ztn/IH2g0gPElVIwTkg13n7kjHIXPnTv+fvaA6dIKxHdKSrNh3?=
 =?us-ascii?Q?hqgIwN109WNzjxIM/LF4gHVLQnYo8Es7j/IngGGs78zQwo6KJgDy0R5uuIdu?=
 =?us-ascii?Q?CGzRa+5uSBfJSRq0DGqi6NSEoRAf67ptIqzfWtKg0KhE4ayH1H4etJX+aO7H?=
 =?us-ascii?Q?pFcO2tQTRV742ovZsFvLqf9u88CXcZJPgdBWNplVq3JETthXG67QFJvO4m0S?=
 =?us-ascii?Q?zkKSyEXJ4fst1ZrrmLVnbdppH6tPjxvD1wr59k2LrLNrpVL/W18LNXS0DYx6?=
 =?us-ascii?Q?l0aKfsJClriihsq0MoTqxPaDMLsdPo8n+z3bs6LVbP8MSBYUEDkVKUpsW+FO?=
 =?us-ascii?Q?5KJmfpZztMKXNyd1/J6JPkU65Q4Z28xyGXgCb2He/VE+qZnTanLndvBnV3qh?=
 =?us-ascii?Q?8hn4Cxpq56slHmn2aTqUVpMqqvYtH2sK2w9Dep0v5U6/AHj7AyIV8q37U/G+?=
 =?us-ascii?Q?Qg+D80PbsVO+F8hs6tYCxq6wGvWJtHg+OAK4nz7cI4VwaKTXQqzZ6fD2zve3?=
 =?us-ascii?Q?YAD75seQrqBmMeNAZnt2GP6XHTfVrAB1iCe0vMacskfTLRrgsYxMygC3GnZg?=
 =?us-ascii?Q?aUeThrJgN8SmuY0yOeZKv6ZuZW7h7eoWF+Og8E9CSSnAPAPkx1GOCrFhSqUx?=
 =?us-ascii?Q?+zikyD1TaijQRkFsD7PRMpTgAVjt+Po/LbAvlX52Ocfd9sIlD6gtCiLODGEF?=
 =?us-ascii?Q?dsQ4LI1DX9DN/6IW1dwi/eH3ttK2bvKY8wmq8iML2RENFoTwAmGX87+MxhEO?=
 =?us-ascii?Q?vGiKnnbYmZAPbvG7oI8RxOBk4BNBTwlVB9S+TWOuaEg+LxgFJZGeQ+2AVeIs?=
 =?us-ascii?Q?R26ZPLUNgjnnDDFMv5ZH3yZHM11aG5aBaaqtbBM4OHqF69Lyptzvs4IQteZS?=
 =?us-ascii?Q?GXcOe5av3/12xDIj7TWQtcroO8L3KBBC9OY+JDtZ6/BZqNNSm30d0kXy6w7P?=
 =?us-ascii?Q?bYom6MD/ohG1psVgWNbHbjjbtJHzI45QzfHDz2eFA0sr4/UEwSM5gSDxCnWo?=
 =?us-ascii?Q?TTwHDaObowN+gROkXdzTVY4Q437nBVbjyWYVNjZEDC9cnSQsK2GGjBHFU9WQ?=
 =?us-ascii?Q?Zsh0ub9k8qSko9uSQ42eHSttTcpr9ECPSv66XkDVMqVFw+gL9xaLcUbUpqrd?=
X-MS-Exchange-AntiSpam-MessageData-1: xcRALDM01M9YDOygtpP0ZjBYf8rth/Cs/UY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 054f06ef-02c9-4785-ebbf-08deee4f4bca
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:29:07.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzR0RF6WVpahfmiBGLhwFK8o1S3ErR8XBw+bxMGDOwNcxe+Ib3OdH6l+KIDTFNiAbwrP6gecN+ObP5IQZyx/PLSpljceyY4sQUMKB9AceOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0734
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 19:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242376

Backport patch to fix CVE-2026-3833.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-3833

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7=
ca6d962c5

Tested with ptest:
Before: PASSED: 369, FAILED: 0, SKIPPED: 17
After: PASSED: 369, FAILED: 0, SKIPPED: 17

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../gnutls/gnutls/CVE-2026-3833.patch         | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch b/meta/=
recipes-support/gnutls/gnutls/CVE-2026-3833.patch
new file mode 100644
index 0000000000..a92703bb26
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
@@ -0,0 +1,90 @@
+From 47f495820c5c049933563e869e931a2180e0a428 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 16 Mar 2026 15:29:40 +0100
+Subject: [PATCH] x509/name-constraints: compare domain names case-insensit=
ive
+
+RFC 5280 7.2:
+> When comparing DNS names for equality, conforming implementations
+> MUST perform a case-insensitive exact match on the entire DNS name.
+> When evaluating name constraints, conforming implementations MUST
+> perform a case-insensitive exact match on a label-by-label basis.
+
+Domain name comparison during name constraints processing
+was case-sensitive. For excluded name constraints, this could lead to
+incorrectly accepting domain names that should've been rejected.
+The code for comparing domain names and domain name parts of emails
+has been modified to perform case-insensitive comparison instead.
+
+Reported-by: Oleh Konko <security@1seal.org>
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1223
+Fixes: #1803
+Fixes: #1852
+Fixes: CVE-2026-3833
+Fixes: GNUTLS-SA-2026-04-29-5
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-3833
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/19f65=
08647bdcd3ce21130201e484d7ca6d962c5]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/x509/name_constraints.c | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 04722bdf4..dee045d25 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -35,6 +35,7 @@
+ #include "x509_int.h"
+ #include "x509_ext_int.h"
+ #include <libtasn1.h>
++#include "c-strcase.h"
+=20
+ #include "ip.h"
+ #include "ip-in-cidr.h"
+@@ -80,7 +81,7 @@ enum name_constraint_relation {
+ 	NC_SORTS_AFTER =3D 2 /* unrelated constraints */
+ };
+=20
+-/* A helper to compare just a pair of strings with this rich comparison *=
/
++/* Helpers to compare just a pair of strings with this rich comparison */
+ static enum name_constraint_relation
+ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_=
len)
+ {
+@@ -96,6 +97,22 @@ compare_strings(const void *n1, size_t n1_len, const vo=
id *n2, size_t n2_len)
+ 	return NC_EQUAL;
+ }
+=20
++static enum name_constraint_relation
++compare_strings_case_insensitive(const void *n1, size_t n1_len, const voi=
d *n2,
++				 size_t n2_len)
++{
++	int r =3D c_strncasecmp(n1, n2, MIN(n1_len, n2_len));
++	if (r < 0)
++		return NC_SORTS_BEFORE;
++	if (r > 0)
++		return NC_SORTS_AFTER;
++	if (n1_len < n2_len)
++		return NC_SORTS_BEFORE;
++	if (n1_len > n2_len)
++		return NC_SORTS_AFTER;
++	return NC_EQUAL;
++}
++
+ /* Rich-compare DNS names. Example order/relationships:
+  * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE y.b *=
/
+ static enum name_constraint_relation compare_dns_names(const gnutls_datum=
_t *n1,
+@@ -121,8 +138,8 @@ static enum name_constraint_relation compare_dns_names=
(const gnutls_datum_t *n1,
+ 		while (j && n2->data[j - 1] !=3D '.')
+ 			j--;
+=20
+-		rel =3D compare_strings(&n1->data[i], i_end - i, &n2->data[j],
+-				      j_end - j);
++		rel =3D compare_strings_case_insensitive(&n1->data[i], i_end - i,
++						       &n2->data[j], j_end - j);
+ 		if (rel =3D=3D NC_SORTS_BEFORE) /* x.a BEFORE y.a */
+ 			return NC_SORTS_BEFORE;
+ 		if (rel =3D=3D NC_SORTS_AFTER) /* y.a AFTER x.a */
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb
index 12e658e300..f9e0ee1b3e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -44,6 +44,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-8.patch \
            file://CVE-2025-14831-9.patch \
            file://CVE-2026-33845.patch \
+           file://CVE-2026-3833.patch \
            "
=20
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"

