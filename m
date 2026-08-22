Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE1DC5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:32:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7570.1787409121804302606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pibr2Zl7;
 spf=pass (domain: est.tech, ip: 40.107.130.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVjkfHc8H5YwNTPDrVMb9HkwxJw3Recp06zIUItQCUrFZZ0m44ZlmOzOdnkqP9drxmkei/RwlEwjDines46+Z32zid4d0SnJFm/sgM19dhPOjzM/ULvWEgRTkh2IYOtnSTJGPh5ZtEQMW9QC7Xg6YkkOlvLutcuRs8R/wTJkxhjxlFuDDmoxWwWiE9eaYspPRVYyl/1A08q2nUs3dlISfmWrbGO9U0702I3gjnGt5gots5DvBaPD55uQv/jSMpUCi3IqvL6LrwPERZttGfR0mFEEcTFbDjKjIgMM5yYS148uzmb17G+ce/JpAV3an+Ut58uuXxlcDw9aXqnN13oOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=iiULBRnLcWGcJ0ClIeABbstTdvm0q8zcBkJ7CwdZlRQapwdOOdLBOoY6msK2X6x8vjEan9+7UO6ieEtGhjmdjtegd4ordDQQn4d5ORsFL4IVipuRH8WyujPwG2P8CjnppzdScbDC4tt9ZW4cr85T3CMo0+d4oWKsKYSq9/qyHzfCzkNm+fjwvYpjJinvrJ3Q0zsel2Cw9bKowW/9Qarm5vNc295jA5A4UxCHZusscRctHMiSHiPhHnEcTiEwhKm4TXsz9D1b7jlpIktDyzmyUL0pQl3+V/MU3sRQ3y0rAJk1ugP6fUSN0PBf9gAwOg64PSsrW23vPTwraP8CCfyOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=pibr2Zl7zdYvrCu7jcfxOx+ZcNiECDSsYIx9B9tO9XVDWbr7cVwiTyD9ROaNDk930V0mdUWjcY3P0PD7l8qFs/F5aBHa754Kekwx/aE7PAud4LUMHjNEatbvtVcu04NZHhRGdW7D30e4bWBCSNUoeSWyh3Va4FAmL10DN6fp+jQl66g8nTMv9mEV8mQ1QW66cFIxAz0AiM1B3K2KX5zl8iynAvDY0Vx/i7QOZUBgvu3V6uSmUgppyLckciVafMxXiSQ7nyeHLEyf5IEYAlTK3UpkRGl9UsdIUroDgy3hFYj16Nop9OakPKFUPmauZwYkS3Pg3AXB6dUUbXlAYBdOYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0917.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 14:32:02 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 14:32:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC v3 4/6] serf: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 16:31:53 +0200
Message-ID: <20260822143155.39273-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822143155.39273-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822143155.39273-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0917:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e225fc-8c13-4f60-3cab-08df005a2195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|11063799006|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	SCCYqxbyfCyTDFfWlvDopOvrRVF1l+rpvH76UQb5IbPN0aLNeMkmr3jez1f1uNzV17zfooTcv75n4Cc8YLNc4v3OH4mgiIPZgqA/QQignZmmn4GGccZMyL8Cyy9lQGH+aGmXfioShbWjSzNxP/SnZqdH/aJXNgg2m7Cm2J1AgURP9y563fBAKKXIIkXtuSAfOPESJgU/sbSMHs4Wf5sF4GrggXTfbwmZi80oeWctbUhYG+PcCVj0aHdXCxMhU8xBd/8SxJUM1+WWLUNqBaFTx0olPfL5qic/y9DlazNDWYWI0+qOhx/1XA9evLicU1GriH0R0+cdTldt+jrVkb3l2XZ0cU+kTvyXc8DT1ATc4JE2bJ20VEm6W9W3kObWqrk6tcfUsRDEdsxrY24iWgSQ0cAj4/o6bkIpnta3dTRqV9ZH/B9RYsW93QQIg5y3N6cI/x9Oyg/UMC4wIspbx2mJbFOI4mD9F7Jrv/fDerYkMKfnrFUhaxhdFH6mhUs4fM/nlF3uCJA6tEkkaWXV3Nx0q9ZzHHP/9cZW9OaJFR3e9Bhjmxn6aRTCKYwcb6JtCNCyO0Gc/rKtbCQCeh8DhydWx+KjIa1RDPQyQFEHx2ACgk/ZVbsRIWjMrIIZPOifyFxyhhyyRTjOTwQC2jL04tM3xx9w6vdbEjK4oWq6lnnfrm4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oA9Vjz0UxGgoPkAQz+XrEX9GNkOowbaK3G7C/z7t6b9q8e7qtn+WZ5OkeFKG?=
 =?us-ascii?Q?jrkl/3Ghhsth5l+IyaS+aqqPvxgR0XUB810ujVXhBGOiInGWynifyr8PFBn/?=
 =?us-ascii?Q?Lph3yfzRjwnxbswuJxgKFOTnMnllcM5iCVVJk84nWDQc1PkXk4zQ8dmFOg28?=
 =?us-ascii?Q?yVn9sjpTIVidkSkOjK8OpAFdeocKnpbFENJuSXWypKeozhh76Hj0LUEiv8MR?=
 =?us-ascii?Q?wJv7sz3L4Rv9nwvLAeANNiLl4RTlgS6J9inXWjEHa/NdTEHhzeZMkqBc7XWG?=
 =?us-ascii?Q?tbYj+rspff84pLun5vXAQRCRDwORZ7DZmf80L++fmO37ebX8+MPG43xWFlK6?=
 =?us-ascii?Q?Ojcl+E3hMjXCF5rn3DVRolFTXJeZBnvyd2hJyZJLKNSuOLfj8qTV5CoF1FE5?=
 =?us-ascii?Q?yX50ezz6woK52xVAtakBoM2gODPCCN555pcXbgVk9rKOBwRFy5kD1LStM7vv?=
 =?us-ascii?Q?qJuwuLBMZWFVQdmV0DNpdR0KjdTO5y2s1cLOXK0Ol4V+r10CVXNL02NHSF6+?=
 =?us-ascii?Q?FRITmj3CWMpUQScf+v38vUY5RD6H4wsGUngIkorsXfcU0RMfZTWvdzLQgXXv?=
 =?us-ascii?Q?1lMkL93n4PG4hlqzX0K0v5POxZXAtJ38DzTEAn4H9WNPNzMLZnNyHdkZoOqw?=
 =?us-ascii?Q?/HREapyAjPgUrfp5tm+0i631ApPAow06RMK1FseL9oVblUFXjKcY8bSr4Kwx?=
 =?us-ascii?Q?X6o8+suRwxAVYaMnFcKyngQGmiv8DWHnzI89pKYK7T95YkjFWme0+zK3/i9G?=
 =?us-ascii?Q?dPXOQYETlt1nQ/IZqdRCTPyFo8qajzUx1sUz338lTozOY4OPKf2VcR/S+r6Q?=
 =?us-ascii?Q?5J1mUrwP9fApaEzSu+sdMrWN76/2xUogVH/WynwlQJvPXI+DQZQyqk9JzymX?=
 =?us-ascii?Q?1Hxq4cl6rcrrrCfJxBZxuaPeEF/lLIoXlteJR3pZlifIq/nFWy2BYcrv4vN1?=
 =?us-ascii?Q?zvM/w25QriPWVn9ZumSVdn+SBbKHPUP4VE1FKJVPGNVBfvf28xHTvevFxG7j?=
 =?us-ascii?Q?gVPNvXkwqgLxRcvPBSqT2CIdE1Xb/UdKUnfwEX73C5oqlqHrvszjKMWieUJX?=
 =?us-ascii?Q?9JOD3n0RTUcguA3pxWOxetbtlrf0qMR7yEuVI34URafbrpA9uYmzoZauovWQ?=
 =?us-ascii?Q?csZXDfy9XT5A+Eiy+Fom24qzQjPTx+Z9tBYpMa1UxmAOnuqpOaHy0RTN1Tm2?=
 =?us-ascii?Q?zwnV8+fHgbHpzf1haTb0dd6dFv2SxPvkIRtj1EJwT6z+2Ge/CY2LOYOpz25O?=
 =?us-ascii?Q?qIHXUmLoOfmeC3SzLTtSw2wK3ZA2dK6xv1qa2DqlUmpWPrrctjWv/O/T/RZF?=
 =?us-ascii?Q?BIDuzocPVHG9kbpZk4RHUt0fCSoIlDsmC+rkjvnA/megdLturJBF/qhvO4W4?=
 =?us-ascii?Q?KGFLAtupm4kdxZkxIOIUCSNXLgXHgQ4ZabIndDTAUZhEFi4fKgeN5rp63sLx?=
 =?us-ascii?Q?c+PHq2W5ZDOO3ZzfxkuJKl4EcJyuhcIIjMV/DJSr/32MZHS3FoSEW055lnQK?=
 =?us-ascii?Q?KCoLb5qHcnwYMbyq9A0ecaKMhg6Q0/mXZozsgWLM1hA9zsv7uHo2TdoYziUq?=
 =?us-ascii?Q?lJ6WJwzI0m0k+lb2DzbNlnbe0Uac+vtdMaP4X14lDNX07RtQREqbX6UoZUtE?=
 =?us-ascii?Q?/bA23wrMFl1Y6ooDS8vul4ixlFA+nkWAUpLFg5LyXY85gkdEmdkPpd/tDucf?=
 =?us-ascii?Q?6Q6/FK7FbttYEP5K5uK0qkSRlQ3xvOcqzax7sWvhjQLvSj1WqHBUVgKXd1VP?=
 =?us-ascii?Q?WPs0nrz2sbEeo7mUWBNZEjXu1WBQPNmQFUbhO5hpllegClZV13rhw7mxlrrh?=
X-MS-Exchange-AntiSpam-MessageData-1: WbKvgFaJlfTqV4nZDEbCr63kvFPDVJSezC0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e225fc-8c13-4f60-3cab-08df005a2195
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:32:02.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctAW501WOzg05GLtejIUAztpoH5m0HRZOke7d1FpusyODeqNQdG4ShAgACfBx43lCJ+kyxQwKKkeKZnYSXD0qYYnLaTMFGPlO8xEET6AHqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243980

OpenSSL 4.0 made ASN1_STRING opaque. serf directly accesses
nm->d.ia5->data and nm->d.ia5->length which is no longer allowed.

Use ASN1_STRING_get0_data() and ASN1_STRING_length() accessor
functions instead. These have been available since OpenSSL 1.1.0
so this is backward compatible.

The fix is already in serf trunk (r1935023) but no new release
has been made.

Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r193=
5023]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.10.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0=
-use-ASN1_STRING-accessors.patch b/meta/recipes-support/serf/serf/0001-Fix-=
build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..2392cf1dca
--- /dev/null
+++ b/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0-use-AS=
N1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 11:52:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r19=
35023]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ buckets/ssl_buckets.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/buckets/ssl_buckets.c
++++ b/buckets/ssl_buckets.c
+@@ -567,11 +567,11 @@
+             switch (nm->type) {
+                 case GEN_DNS:
+                     if (copy_action =3D=3D ErrorOnNul &&
+-                        strlen(nm->d.ia5->data) !=3D nm->d.ia5->length)
++                        strlen((const char *)ASN1_STRING_get0_data(nm->d.=
ia5)) !=3D (size_t)ASN1_STRING_length(nm->d.ia5))
+                         return SERF_ERROR_SSL_CERT_FAILED;
+                     if (san_arr && *san_arr)
+-                        p =3D pstrdup_escape_nul_bytes((const char *)nm->=
d.ia5->data,
+-                                                     nm->d.ia5->length,
++                        p =3D pstrdup_escape_nul_bytes((const char *)ASN1=
_STRING_get0_data(nm->d.ia5),
++                                                     ASN1_STRING_length(n=
m->d.ia5),
+                                                      pool);
+                     break;
+                 default:
diff --git a/meta/recipes-support/serf/serf_1.3.10.bb b/meta/recipes-suppor=
t/serf/serf_1.3.10.bb
index c6b51452aa..fd3560876b 100644
--- a/meta/recipes-support/serf/serf_1.3.10.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2=
 \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patc=
h \
            file://0003-gen_def.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-ins=
tall.prefix.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessor=
s.patch \
            "
=20
 SRC_URI[sha256sum] =3D "be81ef08baa2516ecda76a77adf7def7bc3227eeb578b9a33b=
45f7b41dc064e6"

