Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE59C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:17:22 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43193.1784708238209646599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HLOZmJKL;
 spf=pass (domain: est.tech, ip: 40.107.159.12, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNTrtKlnQdSnqD6QQzXmvbR3D0NUYl4sw7hUGveJHC3spRqXWSre1b1BVQbTmspHaK2BGogwK7oQXJ4BtZ3o3SK1NMaN/b4z3B92g+N7cicXux1mUFvD6RViAY5H0FWIR6JTpCxNAysx5AT/sqLQF9oavwla2MfA0HjpLxqKDB5YaS8iXBrLZ0XzjevGm/y1EwYRbu3UjKL5oXA2afS+GD/dzCl/G4sClZLuLlx3SRcUw9hoqjuCOChw86PwW6EOHDWbGNzfW40VAvSyaqHmSIKZyhticA431W+5M+j3xGcIPLRpFoqZtLi84DsCfl8QAqnDVlVhfN7OBKTMizx+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWX9Ebjzl2/geou2kL+4vREcai+774h1I7GF7fx/tA4=;
 b=zHC1gNsatKgG/HQk2aQKuoe4oy7rbeaPePLjcOzWFLpEtY8+fj6zqPB7mLZLmJU1k8kvss+IM1dJwmUEisTRyJw4XZu4lfReMhYvCqsYZ+IWtnNQmnHg3zvZ+QomF/cLlQuoktaXb0/3aTo9AvzzLfUOhWkgzX0iYj6TdQW08AjO49SlbdexaFE2HpZiRirsP3UWvJ0yYzV6y0ifhzZwwAwTilrRM3nFy2gebu8yCqSklwCv448db2mLRAG0OP0h1zutigDqjLWsbXjS1xA2IiZMDNEqGwo8iTrLvC8MPoveFU4HeTD2n0U6CCo3LvjknVNldqUDC7y2cghpFizSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWX9Ebjzl2/geou2kL+4vREcai+774h1I7GF7fx/tA4=;
 b=HLOZmJKL6hezhMS8HhKkadgNg3JrzK2zJSUW1XOXkZ+Y68MRKec/DS1nMB2jT1AKx3419+dRwVLgUuUxIEkiIvDepgN7aSI+4ZcqZGhFlvUzqXozE+Kk4pHxQRQdKOF4KxBwW7FY50rtSZ8URzRHwpFrM/3aEhEeF/+i8UeQO6TIMJ0PP8A0LQpXpFipNzawsjTcU8vaEXYanl2zpzcfvAaC6TabHcgoqQFbxmlCkTK/+yP1OpI3B1sblVwGEn/Ucdgci0bB2gdmVY7wFJJ5FWf8qV1fP/cEZQxO30AOxqvbdNZqAo69baV1a+448Z0YSYPgR9p1jwnWBB8HbgfH2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV1P189MB2129.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:17:14 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:17:13 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] wget: fix CVE-2026-58469
Date: Wed, 22 Jul 2026 10:16:57 +0200
Message-ID: <20260722081709.14764-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV1P189MB2129:EE_
X-MS-Office365-Filtering-Correlation-Id: a3883924-31ac-4845-03b5-08dee7c9a2ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|13003099007|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pdmzGNW6D0/GJ6NOY8T3xh9powqUlqN42RkPOTZLlr2vBEU9b/eicW8iWme8L83PQKtjqn8ezZaLcSW8IOTFjU4wzDi3zOiqK2nHuGcsy4gPW1srK5HLNkC+f9a5ifKUbM85gMZ88zTIDhl4thkds918LS8iM6tkRD0SJs6EThuYf/829z969f2jMkP/toOhGI52klIQq79bmZGC1mAlGWGEm6iZL7z6/fJIMn23L6Y+zOcRzONELkl2lC9gfIzjC8ry3Rlkl5XsOmrvMf/12gSknCCVBAbcCkAyavU/v+eIR7nw61ZE2dMuv7r/ofYd/Ld3YlFeKI/1playdlUFW/7f7rL3rvPLX3eiT3Az02A4TKm7DiVMLNvtcTTu+AjtrGIQZOaDxAqt1+8KeSbE0RseyKdAXq70vGsXbPdskCMUxkv2BJDA/d8OwmkTPgB5uinDDAlXozjXUVdoFvZ7UTHm5Kzp8oe0ZzEAwKc+M+k0FGAtNY7oZzRr9mJ5O9GAGrgSz+0amC4xX+aMprHAcqTHnqjv/a41plSrrFfsAVdQkmvpcHL5aqKuAptcPD7kM2eE964oEvpc5wSCiAG/YCvAtz9F5JKFVO/k+DOK7sR8urCuB0oA57ucILgJr8d4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XrTLxQGdDuyd43kiLe7JO9a2taf5gOjA251FFDFg9aN0fhckEzy5Xa+yJNQC?=
 =?us-ascii?Q?8Lbykp8Bpu/lAi1LvFLfpnCiY0SKAz5zkmp/Ue3jZvWOdr/KOD6QqWvrvdEe?=
 =?us-ascii?Q?PFWyCkL7lzYmhxbwejNUZtUF2b7UTGzvbjKvDNEr1hE2WrfWH54+NMgl/GzO?=
 =?us-ascii?Q?sGFPqIGUb2Yc6Hniary72oA09a5iBT3JPMfzSenp6PzrCYq9JAQllHLBHr4A?=
 =?us-ascii?Q?BFfpYisVeMLbUHEGWHN//1VlqbkZn1IjlvY4GXifK6oGsktQR/HUV0dBLZly?=
 =?us-ascii?Q?j3V0oX5kPe743kAYgY6+H3HwRB7D/yAJijBO4tY5LdPdRwtgNV/YSvNm9osg?=
 =?us-ascii?Q?2bcPWx65wInP/+7Jrf0b6SjEiqLyM2mq8yAOMh6QgjymGYGQtXeScisNro2o?=
 =?us-ascii?Q?9VKTqrJtP8ZLOkG+kt8Xovwe1cHGS5UjbzgV5TIHerSvaobCyUARzV4z7tCO?=
 =?us-ascii?Q?htaKVME0hBiSsebJc/69++Wx/tBFSTRqPTfjiRPp9F2O0ZFfjm0dPJAU51Wi?=
 =?us-ascii?Q?A3Su4o5ylVKhQBGYac7+UBXq2SXtAGdArDU5JfDFZsRq21LhygUHK+4+XcB1?=
 =?us-ascii?Q?chT+FlHFinoqPWa/5NmjED97IzStKn+nGhUOd4H25KmZ97ODfeTrOePGUCPc?=
 =?us-ascii?Q?Crpuph+/3wOwqOhmoZp548m0/iVs+0z54QFUr8n6jGlE3pN7tZPVlWXu/PMM?=
 =?us-ascii?Q?gFRFHUjebVhMMCw/uFXvQFv+gZ246Q3h21qyb7q8dEpnGnW+bRiogZLVAhVk?=
 =?us-ascii?Q?o2cPqubmCiyLyQ4qzXgwQSl0hdwrAUv6ysxMVwjKZr4A4s+nHpg2DZAgqb7s?=
 =?us-ascii?Q?mXd0tM0mSBvABn7Hn8SG8V4/GtCJg9ivOWKBZlrX4dT4Qs9IIp6CeMWDIvfU?=
 =?us-ascii?Q?WO07CAvLfaAPtPoNPcDkCRQXZter8ulNnomRYS4gdoAQr9kvHGHLgYNI9eW+?=
 =?us-ascii?Q?rN7RYpy2Mlj1m3MxY/in97w3Rq4odrkTKU+lGJBWyFt37eQqYVdRk3nsv0ot?=
 =?us-ascii?Q?a3YKG8C0uxDaVHbNWmZBZtBnWkA5FeZmdKIVA7t0eXYj7F6vnPm1j47Xoqrf?=
 =?us-ascii?Q?zmqWtXzIpu/cwEzhsqsXRWfmYSV7bWDuucWyA1cM2pI8Y5cT+aIK8JLKGUpo?=
 =?us-ascii?Q?pW0QYojujkuiqJkf3v7hL7H3ur+7T1HaCb1DtdGD6GZNl2evZnuvrYLGSYBv?=
 =?us-ascii?Q?BEP/7dzvmg8zXcn/RikWf26EE9oKmj7y/gb+vYjSNsJjdmmFGeZU0PsyLUuE?=
 =?us-ascii?Q?UNsqMUhSU8mpyd/CNN5LCM7ym5471imLHNlVzg8OEsyjYscw6r7zULe0AM3/?=
 =?us-ascii?Q?XX2vJf8d88be9IHDMW+8lmkT4WS6APCoFb4KJGcVTd38GU20wmKur5HkcEBg?=
 =?us-ascii?Q?nzPnkjozUdjFRMmAS+1S1siymZLgCXwioWATH2w47piYGmJijYpcNAPZG2vA?=
 =?us-ascii?Q?pDFLz5BS5+XsHaSdAzKRkV0KQXmRXUfFa7G4P6TiGSyGnjUeuOZewUL9cQYG?=
 =?us-ascii?Q?UCUTEmAdKR+ejW+t7eC8NOiEoN32Upleh7b1MDgsr6q+913eN3O8nYyMIWU9?=
 =?us-ascii?Q?xtcZAF8R1JYz+0jJoJpuqhSQWqb5FnMQclvK4eFKXhWdKzJfslKkXRAgDaJL?=
 =?us-ascii?Q?oZRMTM370dwat8fql9SL/QpWCdoqVWTOO8wi9rc/MSKvz8bMUKvB3Y5Nmllf?=
 =?us-ascii?Q?EU8GV8JNtMZy7ywKPLO3ioY27OYshGGNhXsx17O25EM2eNymnR8DDMzFyuqt?=
 =?us-ascii?Q?IxrGBXmngA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a3883924-31ac-4845-03b5-08dee7c9a2ae
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:17:13.7591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCxFFfsECHhXNsax7r2b4Fn3icwe25h9E+ZROytIUwy0w52vuTuCH7uDoWcHNXInnoGtfO23ET/PyYZNnMpswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241609

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58469.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58469
  https://www.cve.org/CVERecord?id=3DCVE-2026-58469
  https://security-tracker.debian.org/tracker/CVE-2026-58469
  https://ubuntu.com/security/CVE-2026-58469
  https://osv.dev/list?q=3DCVE-2026-58469

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb=
0b6f7826 [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58469.patch            | 52 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58469.patch
new file mode 100644
index 0000000000..c5d3df9090
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,52 @@
+From c7d858a9ca8b9840e5edc520c36fe4f33f2e9cea Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:32:02 +0200
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
+ underflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/37a40f=
cb450153f69537c7cbc2a7a4fb0b6f7826]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/metalink.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index de2439c9..2d6e5846 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1041,7 +1041,6 @@ void
+ clean_metalink_string (char **str)
+ {
+   int c;
+-  size_t len;
+   char *new, *beg, *end;
+=20
+   if (!str || !*str)
+@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
+=20
+   beg =3D *str;
+=20
+-  while ((c =3D *beg) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=3D '\t'=
 || c =3D=3D ' '))
++  while (isspace(*beg))
+     beg++;
+=20
+   end =3D beg;
+@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end =3D=3D '\0')
+-    while ((c =3D *(end - 1)) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=
=3D '\t' || c =3D=3D ' '))
++    while (end > beg && !isspace(*(end - 1)))
+       end--;
+=20
+-  len =3D end - beg;
+-
+-  new =3D xmemdup0 (beg, len);
++  new =3D xmemdup0 (beg, end - beg);
+   xfree (*str);
+   *str =3D new;
+ }
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index f0d3458462..a1f34dfb5c 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -15,6 +15,7 @@ DEPENDS +=3D "autoconf-archive-native pod2man-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2026-58469.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


