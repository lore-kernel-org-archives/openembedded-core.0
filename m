Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C35C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:24:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43374.1784708645748756678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aHQ66+iD;
 spf=pass (domain: est.tech, ip: 40.107.159.7, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlokgP0KGjIah3Q0d8BBk6E2V3o1nWNfGsYyh84UzM+hpl7U6LVZtspVPs7sD46DWFmm0s9bbPPOKLPTjZauKj/1thE4H8hBku5+BRts6sYr1LPIyh2Wl2FpJT+z50g9I12cPjc4Ylm92TzsUCN1m80hyhOaG+uKtmm8leg2aNV3ewWps2YmWqxj6gPMj7T5EjKdowPMa7Zzpb4LVn+Z+fJhy70jM6D7xCjVpbZnBJr+lxhNSpZG9fHMPSuyW6/sQaUbpjPHEr17dX350pUVGsfE3dNyuKwsLzAKrIR7j4MNdFmdUFjQXZVDRFpQauifm6IeAapUpOFWhOla3345Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uh26d/wwwcfcnEufyIOIqNKPVAintsZu/rq9r1qCr5s=;
 b=ST/ZzRleCjzcEBU2qSSuHdTyHg9J0llfEnW3I8i8ouoVQZ/cFe12ImIg8eXWeCMO/o+xc1zQIb0khUQLHnmHn2JPdzvDL04GOHujNlGEcknwg3Z2QOOcAgO7ZminelHsOJP0UyKOJv9Y5G5XkS7X/hGFljm9AiENV37xe2N9Z3lUGlw3gmJXeOhF6aJxUlxzgdKELZxoXaGsu2s4UDgN2cB8QNLDZR3J4cTmp3hpvrNeHoTdj8ExCu+/pg6niz7kt7ef+99DhYXw5bgmM1le3enYZGN8imVP0vx+VwpUBtPWb1BiaCHAi3bsUjziZwl4Zn7Ti4+MKLfcFj7gNL+ezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh26d/wwwcfcnEufyIOIqNKPVAintsZu/rq9r1qCr5s=;
 b=aHQ66+iDswchvrYrNGYT1C84Rm2XEWkTJfDebLG5PQTdrwP7yxt42UD+gdtIVNhTwZSQF1LdCj/ukFG8pxqYS3HwtG8yX9wY/IwPa3aaLWu9gCV40LiGe93EVtFlTAraE6pFt4Xf/kNur4IThQPetnVjLzYKnghFhbY6evc1JtAixbyo/ycz3hzq5GfAin6QXyLhglG3tvppIatpu95d+oO+OHYNK3qJ9aX27DW4WFEFnEyk06KqcvvN4fU4EMJwu6AMMmx5TAcvdAGLBE8l9uhYo0OYclo1fDIdHEaGOt81gQV4Fus8yFWUctiQ3OyGWc2qB6hL4T9/f9AwAy9Npw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV4P189MB3630.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:24:01 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:24:01 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/5] wget: fix CVE-2026-58469
Date: Wed, 22 Jul 2026 10:23:46 +0200
Message-ID: <20260722082356.15455-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:10:234::13) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV4P189MB3630:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa397dd-840d-4f65-fe20-08dee7ca95eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0NDqw6A8nyL8P4hpLQSCCEyN6wq2KbZqQsuPrMonT2HVD9J1zBmMT2/z632/m0U0CCsvIi4+4aXpJykQ9Q2zbDJT7NdHikNOyC/UV5k5GxT4bqxepiRCZLrzsn0CD6d3tfdFv7KDO9GGiPP92aVHQV5giGbMIK2k2Nald9gOsUE/L/HQkfozhML+VNRnfkHOPmc4HFg6PWAUaEmn1fOj1GhHhCe6rS9MLB/nsih3D3lgOaNgzlA7UxxUepZNuewwXF/t+obkE5trQE4V2YwDLCczCHvvS8zVqhKhqCxGClLqNZb6RahDXICw9/IaLADhbaiVPxLHPXjU/uYsWHPPyNo44zqpQEPkVPdE9nlbe0+mz9MeDRDMnhr0+e6IBIrT+0aSfGHlqH/+ith5uhyQYlKKel5AeZuCbr7AUKDtpgSEywmGukmNZAhjiSUOWWZKaJgPRsBMU1buhP5b8xv3QEcyaZHj/6cFvkAMASD9oUDxwKn83ZDV242KpI+B+H5UiCbuFrCkPCN4BqkPx41zsQC20tbPyqYOtxa7vqgW2xmIfcZ7ed+8ngtS+Z9S6BB8MhXwj36wq03RDX5DAfDCmjL4xK+B7Z/l9r6/hJwS7gBOk23o9HNfhDiOny/e9UwR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S2pSQadHKN1qfXghoVks3bcAGiWze0IMxemcp0ivHb8jQyDq7Tzsf8cM4BuW?=
 =?us-ascii?Q?SiAXrZ9FKbJ18vxe5HE/Z8QF6fOIZnagY0aMeqdP0bmjeBY6h+ATMCiCjpdZ?=
 =?us-ascii?Q?ne6eCgEfjl/ENNZi7nTXuS5sQr3NGUkyNDDi9BFQdoTJ72Pt/OdMedCir64D?=
 =?us-ascii?Q?cJgwZxMfjh2OAp/HWQr8LojAfM5L3bBuc4qhOone9ztzIrXgvuMllFAu7TZn?=
 =?us-ascii?Q?0BxkYT8M14kOLhGMYORKM+Zv725lkPatqY5DJDdMtfCm7YCyPVGWpP/9Og6e?=
 =?us-ascii?Q?xEocIEYVRUUT9E5RVqdG0cl1gyA+Sr8F7uh0sbatI3Fv06yML/FxhCOtqF9l?=
 =?us-ascii?Q?7Omq6QOaSJojj5gVUlmcxaSeDeeOBfi742mkYO831XoYRBERHAsKGDU7ZfOY?=
 =?us-ascii?Q?qSGed2aH4i4dnqk5zPoO7XzlRm+NqLQD/E/1qDb5c8PPhR9ktvizhYx07Ti1?=
 =?us-ascii?Q?kQtW5hMpWEwwtJy2HX4bczLcftqvBLM0I7fWggf49n6lQtz8s5jed6+SU4+h?=
 =?us-ascii?Q?uO568zsHBP3SaAKDU0Q4bx8fuyDSB6oLmIMCbstKEhqXu+y9EeLs1PeIOa0D?=
 =?us-ascii?Q?pHxR7BKG27U8OE6vqBW5a94cdxXVadwTUPW6YU86+tkjwaQb02oKTLLxH+57?=
 =?us-ascii?Q?ldjKA4glwxoTPO0Sm7fO0BT2DYlssur/RPvFm+UDuPqnOD3CWJF79b64IkOB?=
 =?us-ascii?Q?6BfyRZP3UFBFUriOhNEkufdWBWeMKQguGAgS3jvMUlAvwV3elS0sE+9tlOwE?=
 =?us-ascii?Q?ROMkS5w4s4znyqvk9gwyHcLI47dc7TSHX7ZMvPlpTNBpcjYkJK+tRis0MFzk?=
 =?us-ascii?Q?2NCkV26KSr030PDRh/7E9RJrQxbcsZOsKIP0b7oeGGMz2s4lSG+5z1K0wv68?=
 =?us-ascii?Q?KBEAA5z3unAWdZtL1EzPyPDye52FC6l/cSfTZB/OMeGRxbxHuWI5oVi0XClv?=
 =?us-ascii?Q?uBfIt9yVxw8To7hfTP1jSiyz38D4YaTQeeFvQAZQbymXDxiH1ifb02iAi79n?=
 =?us-ascii?Q?sbn0Fw0ePhft6QhTQvrkZnzzvnD1c9BWETpkPNqqFf2LKGQxUq2KYQLsZpUZ?=
 =?us-ascii?Q?plXPlE2qXcNIByP8UHwmeUfriKqEd02Whsz2bS42NmH0oAyy9zAYAl6lN7Af?=
 =?us-ascii?Q?HSIGF863q3tRVuXJRDaZwn9IFvtKfTW61fLSezT9tDFMuAmFaV7UEUCCZ14d?=
 =?us-ascii?Q?rtLq8eBMZzC/+Hc7Ea0NHIfSOdRoEzO/EIwTqWmXdrq3JyU/ibereeYJpVeK?=
 =?us-ascii?Q?wCsM+1FecNPE/H5N2knOcE6amZxMkCMDCCBS4YokWg03A1P/7xZsV/DFHLdG?=
 =?us-ascii?Q?wHIrWfYiBf3mBPNmny1S7z5stXm5cxH8+yyhjZ+N49fcFGRUlwM9zCK0XQB3?=
 =?us-ascii?Q?VgZN1KK6qVrz8fmlTkyJY7M9XHcY+Snwezks8b/aQunzdY95UWF7RJVihXLv?=
 =?us-ascii?Q?0wBCSabYKhsrW1ykXIVIhX9OUD1iQ6yKrYNqUIM6pIwLTfunalZ5dKEImU+K?=
 =?us-ascii?Q?XjhvN52qBJ1UbXkt0QS65H3t3XbZ5kgb7/u+pwzAhG4Yfgxh6Ht/cDJ2eeB6?=
 =?us-ascii?Q?S5p6dgOGApH8d0kZftpYu0A4FZtCYqymWp06vcYxlPhXWs4e0zNpgMtuwKsO?=
 =?us-ascii?Q?WUVIqkjCLQTTrUIAnUaacUBHFdOD64dV7TWvUrbj7py0DgJSDdaq0ATjCRi6?=
 =?us-ascii?Q?p0e+WKtwFd9e2/lLFatV919rJPFsUNarjbuZZPGWu31iubzjMWu9ekK69ibC?=
 =?us-ascii?Q?27dl5P7gHA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa397dd-840d-4f65-fe20-08dee7ca95eb
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:24:01.8571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiD+UfzDRU/Pd3W6GVz/YZ1RugC0hF5XQ8Kb+F/UVJsLxzAD3wJ5Auog0LuJOqswuW6apqItR8aHGRH9Fl/bZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3630
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241622

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
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58469.patch
new file mode 100644
index 0000000000..a86d89259d
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,52 @@
+From b33c317397db195f9584082be835f051d56bb163 Mon Sep 17 00:00:00 2001
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
+index eca839c2..10d58cf7 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-exten=
ded/wget/wget_1.21.4.bb
index 6d66ab46d0..031a9b3eff 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -2,6 +2,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2024-38428.patch \
            file://CVE-2024-10524.patch \
+           file://CVE-2026-58469.patch \
            file://CVE-2026-58470.patch \
           "
=20
--=20
2.34.1


