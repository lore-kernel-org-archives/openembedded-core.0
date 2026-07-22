Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC07EC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:17:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43195.1784708267819870779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=biSN2L4A;
 spf=pass (domain: est.tech, ip: 40.107.159.7, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXgxw9v0nTFD4vpDc8CYbd1tVqQ/gj0mLNvlgcqlt9H8Wk02f07cvQKApf+RwH1tK1CpVSThsEOz/n6sZm4jPd4u3Ve+xnMXqYZ/s/CA/quM1vk2850C5k9fYstVSEUomsrVfmnPcrm4VBzmD8OLtnyWJzmF3HljDai3Y247LcyYVUF2e3C7Bleq7WepMvwEcTUB1mUKZ404s+iVFwgFcEO+RpAOUhXEcntY9IG1u8vTP8HELRHoUC4dO9OUPlHFN9FYhEaFZrqmva5AiKazGCCw0Dxif6nc6HSk4ka6xoLmyaE6IafQKKpm9h3T4Eze6DKiy7I7v3vBYbS6qQ7hmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFwRahHwYJl90c1mnkov1YjG+reQkX3qf/oMotq3nKw=;
 b=Rvco81SscrJ7Gh/x9enj66Z9XDpCJn5TzqRMeAWpsZ+74/30O7foNfQT3wQT/FznEfp908iU4d3t9iaGoCN+fpSSrjIzsxcHy7bCKcKojBbJDzvruuWAreg3Wm1NKAgxP9LNeO2XnggM+Fz+NofVWh9QG3CCX6HpjjiPDrOMP3SRBNdRMbiizmYAOX6mFrnHf1zaSJqKzrRMwt+jiqELhwyr6AfeonSEESC6awV/HXvdS/7MRi3VGKBCrvmfwpBCxt1YS5wIfHuDauR1vgeGPwGnWfNQ7mQTYx9H51mGtX91yxbbvnechlMU0bSY+p9EhTR3z4jhomdMpHa8K4qgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFwRahHwYJl90c1mnkov1YjG+reQkX3qf/oMotq3nKw=;
 b=biSN2L4AoJXWlUbtnwirp0+xZOfcvHZeE0wrcIPc2N0qtGA9Yhpk83+FV6WX/RrLx5ET2fPowP04rsgWq74D3yyHAYs9pYzwnYkamLezLTlDR0XwRp8qk89UpTsHCMuNHZ0HMHss+WKnK7RCL8pCLqVvtEKzuuPEiyM8yhj4aiuEjG4uwZxRG0Mm+ion9E0KUDp+O3d70ybpdxa+U3pE+FzDUp9ILxGgn1sefszWFUVE7Sp7QIgrarNYSgbaJ3GrPklEKDr1CNPORJcSAMKL6x8JlPmYjyzUVKew0oUoL9qe0oqRUqSXkN6pJ1dGf07Z1Iy0xSfeEpXv5psJR5Qivw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV1P189MB2129.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:17:41 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:17:41 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] wget: fix CVE-2026-58470
Date: Wed, 22 Jul 2026 10:17:25 +0200
Message-ID: <20260722081735.14807-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::15) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV1P189MB2129:EE_
X-MS-Office365-Filtering-Correlation-Id: 276fae16-d0d2-464d-a6a0-08dee7c9b363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|13003099007|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Sehvo/LQyoulgwJfQp7M+dES7a44NF+E5lMLobMld44Vimw7e+EJ3gLsZsH4w0X7YdwHlbJ72j9PJWPq5E1rlM4nSOWAEP1FXzO57qp+i8k1tdUj8N1Q5j/zOW1ScE18JkOyJ8Wq5e/mrvP4ybujyAiW3FKR9c1UKFB6gV6OYlLA7FRzO9NCaUe2F35enNhdq+l6n4vkOGQL4R8onSZdeGBUMGkLWichaKQY0bkQVkKElDCYK7afURv/khwvWltwrj4dJsbO0fE1HQs4Ee8cBK3ErczMTpqKIRlcgFxju6rL4B6xUxMg/jSHFPq9T0xSKirVUhrbQZNdNoJIE1ywEF7AHDOCAOKFJYf9nVIccMnMGR4qo9G+6h2XprSbKISaknk4zSRczm/bpPfJQmoZ9bVVNYke0NUMeh6GjyVTbScAjS0C+wjN4KTq6Hdt5l+6FxBvUVJ/W4HJrHp56YRswmTr7G39VZM3dF/I/uHL2hAz+XAg+QoDE+/T14UCScAlP5al29f6/nbynl7rcKYdaGAbIQm1s3gMZgOQ5MmUKaeK1NMjq6Lkr3uMbPcn6Y7bB0pcxVa8KM+q4NYkZF8MGf5m8OmNteQU2njg9+SzbXobyjC/ueUHKHRdHcvAr1Ke
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bG9m4XS8oJ5SlrBSl3kHa73yXrwpUQs1gUDfIYJJt3ypJYmZzaUe87SxWW1M?=
 =?us-ascii?Q?Utn81wJ4+cYJ3/Q0cUVksYFe+xblCTVFDxA0TbBm03KlZF4LCKR3WioltJ6d?=
 =?us-ascii?Q?oZ71TtAqWAvt8ZpU1qlxLxC6LPovVXPnhqcbT6IVwSDlwMThXB5NsFdumd9J?=
 =?us-ascii?Q?w5rLLTrjHcmcOsWrSCtK0RJNGDHKO/zMktA/DGTXzbz7dZuwrBgHnB+sOK51?=
 =?us-ascii?Q?DpZmmoJiOaKVC9MVS6AXbzFZMNCmHeLDuY6MIfQ6A4TW+0e8fERoTHfFyANo?=
 =?us-ascii?Q?IJQVufXgA0zsyjUPIZX9L7sMqKB+W65Zqk6EEd0QSMSeKHYUNfoZhd225lGT?=
 =?us-ascii?Q?27B52c4plUjQwTLJh4Yg3kwCeI22k8Hfe1400/KQVC5IKFdHBA3HMa6Nx/mk?=
 =?us-ascii?Q?2hpmRd0JXu/qVFB18WwJO/JvAtcA3sXEOPKrhBeGRVTzM0VyNne3IgsS/V20?=
 =?us-ascii?Q?ud/ecvMOV/OJNPnEzUJ8kkeNyKv1PIK8H2hNLApfrMEI8EwJ7PnNHSl/Mm3W?=
 =?us-ascii?Q?4SMieOy/bnqsO7dhn4tdR8OvuOvSod936Jarh5L42S1tb9k6rkTnM5KXz0XG?=
 =?us-ascii?Q?Z8BRaDg16YML7gCngyYryulPMgDDGLcvmnGM44AyVUnbVXRKy84Frv4yNuwQ?=
 =?us-ascii?Q?DPvfQf5MTNg5AFB7tJj4abYVZ+eZpIxtbHChb8kIHyoBvOEltRho/G0GAVjo?=
 =?us-ascii?Q?MZGVc6D4NZN1khJo/ktjHuLD4jN0QNzUqJXGpSlfsHkkJbYttpPLDn9Csv1b?=
 =?us-ascii?Q?/UFK3AyJTNcpbmQyjTb/OpiZY28HFjYPc8bJzQxA22cTJtITUY34QVed4jAu?=
 =?us-ascii?Q?m82vUXUsAVmO1yRuORh7YvFOqvYSH7tmb2gn6cSs2VPAWX10rqxH6sOOa0CM?=
 =?us-ascii?Q?IXqwUNhEqfh+wZFE/THHdzp8UoP8e0ORvjzJYPjY+GP+/66EP5PHWY7W16iE?=
 =?us-ascii?Q?vjFJ9Nr7aI5NhYw4gxci1vqMl/JqnyCQx/6OeWo4N1enHt0Rb57xGHtFch0j?=
 =?us-ascii?Q?oaHBPyeuRw7pfc6ToJMdUtocfKnroX7uK2RrnzuaCuha00upg+HFiiD9lWyq?=
 =?us-ascii?Q?guBw0v3B2GfBGteORKdIHEkCqQl23CP1TubFHYoWyDyqx5ETOwmAGcjhJo6E?=
 =?us-ascii?Q?K8wTYx6ZRv0N1ek1YuTUfEbdA+D1sqkl0P/KKOxSgJiJI1HAK73sdIXPafTI?=
 =?us-ascii?Q?NdlSp8g3/nW+aMswbFy60BqYMDMvv1QahL8p4CCa3lF6Y1UbdbdwBkLU/svR?=
 =?us-ascii?Q?Tvhek+Tmj5d7H3Pw54SBpZ8xrFmoNDB5lI1+HEDfDiKf2vFUzxofmCws6pY2?=
 =?us-ascii?Q?PXAIpdmnqL22JhgWBXD4g1tjkibvVuuqYpwlrIWWlSfxqm4CUEFcrmGMy6mC?=
 =?us-ascii?Q?YLGIH3hCwD9ZlZEmSctr2Js7xqNDobJidX4Sno4eNF6LE1OcRBmfDOaw0oSJ?=
 =?us-ascii?Q?p4WoM5uNfBHXfUE1/oRLC8Xy3t1zoUiccLj1bPQr6nccfNsUdXpqldyH1kwm?=
 =?us-ascii?Q?uvlpzK0OI8dfVjn/B11cY13sbB0NcR/zP0fdx+1iL+71BoWK4LD2WHbxFoAc?=
 =?us-ascii?Q?gV7x4GDqIJ6mYCFmddl7z9Mv4xa0Cni5O7AhDRZWAXXXOAHcchkzVFhY5UXZ?=
 =?us-ascii?Q?deYKDNAZqdHTyS8/Vua9P58iSZ0WsbLmUp2JNxcEciXjhaCuj9w3k8WBllTg?=
 =?us-ascii?Q?UD04qvN7gqvSY5WE/vYDWmrRsucXYkQQE9OfSsxUTYa6b0W/YZadf2mcu6Oz?=
 =?us-ascii?Q?MvQJgDpsxw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 276fae16-d0d2-464d-a6a0-08dee7c9b363
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:17:41.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTFQiZmYh2bNiq3sY/ZAU7Y4UKJw6pz3u2f1GEx06XHPU4PKo8oCyWCEvvXby9znFbQDROOncmV/gBmjI5SEag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241610

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58470.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58470
  https://www.cve.org/CVERecord?id=3DCVE-2026-58470
  https://security-tracker.debian.org/tracker/CVE-2026-58470
  https://ubuntu.com/security/CVE-2026-58470
  https://osv.dev/list?q=3DCVE-2026-58470

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd3=
0c34ffcf [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58470.patch            | 78 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..463292651b
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,78 @@
+From fd316db417a4d368f6f76aecbac047dce7e40699 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba=
9336bc94937e6fae2365c6ffd30c34ffcf]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 07af1867..ea2e591b 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byt=
e_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+=20
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_b=
yte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num =3D 0; c_isdigit (*hdr); hdr++)
+-    num =3D 10 * num + (*hdr - '0');
+-  if (*hdr !=3D '-' || !c_isdigit (*(hdr + 1)))
++
++  errno =3D 0;
++  num =3D strtol(hdr, &end, 10);
++  if (errno =3D=3D ERANGE)
++    return false;
++  hdr =3D end;
++
++  if (*hdr++ !=3D '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr =3D num;
+-  ++hdr;
+-  for (num =3D 0; c_isdigit (*hdr); hdr++)
+-    num =3D 10 * num + (*hdr - '0');
+-  if (*hdr !=3D '/')
++
++  errno =3D 0;
++  num =3D strtol(hdr, &end, 10);
++  if (errno =3D=3D ERANGE)
++    return false;
++  hdr =3D end;
++
++  if (*hdr++ !=3D '/')
+     return false;
+   *last_byte_ptr =3D num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) =3D=3D '*'))
++  if (!(c_isdigit (*hdr) || *hdr =3D=3D '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr =3D=3D '*')
+     num =3D -1;
+   else
+-    for (num =3D 0; c_isdigit (*hdr); hdr++)
+-      num =3D 10 * num + (*hdr - '0');
++    {
++      errno =3D 0;
++      num =3D strtol(hdr, NULL, 10);
++      if (errno =3D=3D ERANGE)
++        return false;
++    }
+   *entity_length_ptr =3D num;
+   if ((*entity_length_ptr <=3D *last_byte_ptr) && *entity_length_ptr !=3D=
 -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index a1f34dfb5c..5268ed968f 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -16,6 +16,7 @@ DEPENDS +=3D "autoconf-archive-native pod2man-native"
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2026-58469.patch \
+           file://CVE-2026-58470.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


