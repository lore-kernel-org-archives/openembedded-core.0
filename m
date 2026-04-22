Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5467BF9EDD1
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:35:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81954.1776863014503626254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ur/vFqVZ;
 spf=pass (domain: est.tech, ip: 52.101.65.32, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyoLDmC/eiKvY4ji4eOScyZRITPCYDj2zh8zi5ZUMOGqM0VsrjPcXM54S+B643TqWJNZKjmOaULFnlfVLBR1S96dI3wFwhqOkHD1zgRVsvhZGSvuXK2aigD6+d2ITV1yUWQIJhbvK7lw+ok16MqIAlN8wIQxXa9In7N5G4v0RkIU7VOcBDVOiXTEJJrKkibc5o7rj2Z2hLfXXCRsYnMu6w3ZO8Ct7b6x3G7uYc8ucV2h6lskXGbKoz1dVIrFxpFMAZQePXmjdLfsn6nwjO9erbMOOLmDqezS2J4SSewDwgADmkT/rcsiEntQmkDNB0rhUE+3ga3oFnOiLUVgHmhH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDOX2C4b64XYcxf4FgxWf1N404xZPMQaCEAVGYOnNoY=;
 b=Ho20OYqLlZNFY91XuNglSb7nYdTcqL7pVz8sfPkG0cyX44RpUZw1/hQEV3B3U7y/s9k6mAb2KwsmW31/YhsxygdyxrcNPC8dLnklg3W/eKPMOfHdskTkLfXYWQFQ/I+pMOMCTqnZrpbr/8Ptvszl6Bye/yUnjS9NJSHi54nw6QEfW8HQMsUuoOA14wNhSmOpmomoFE1iLiTxJvbWIhPM3yvW0mJkZY5qeQhmmkMplWKf93f07GfBxRUNgVj4lEsFxD2M/wZ823JnudWqwxWdeBdQ5GdS3CuTrLBo+S6MtO03OqL2F6OOZI9tg30Is5wnczaWp3UarjnWAWGzxhS2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDOX2C4b64XYcxf4FgxWf1N404xZPMQaCEAVGYOnNoY=;
 b=Ur/vFqVZf6iVTsGGAqaLgvEv74pVFXtHBfmtVJqtAJpd1H0MleIpv0GIKbx5Z5sqM1aWB5KH5cjdgT1M2Ld4pmxFxv/7SHnx4vxiERbYGRauBEfDsAbCozsvZuJhQ3Sc8X/LFk5sDlsz+y0KxM4ewJOlgNj6spM6jHLzS55xBMLJqIlPhDepfYZW9+ahyK3MQYxynDgwx0NVX0WApRNh32oWG69rvn8sVCWszmN0qcQCvPePhiyhWgnh0eH22Z/oO/+5FWYq9RTjVtYE/WTTfSRorlUD7jwhNo8cDFFiwha7+E992vX0kkDsfqxXU2p0XS+o4lEHpl3BPa2bTZXKpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2812.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 13:03:29 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:03:29 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH 1/4] binutils: fix CVE-2025-69647
Date: Wed, 22 Apr 2026 15:03:16 +0200
Message-ID: <20260422130325.386236-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0245.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::10) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2812:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9aed92-95b4-420a-0caa-08dea06f8c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QMI1PQHYW+g8B8dJI0rELRSk5qnIEWLHL14TCBA3UQYgBi7dT+nbhHJtbWXVMKxtQq1l1JxiRlfEYlEJWVDCMt1J7BkTy7gviyAzjHDNn5opugMOmbhBs9cGJ1lKKU4yuplJ6NeQ4PV1O7zks6zxvZ8rWGTk2mDO6qXipf0ysikJstz06wiZkcYBbxcbziGpQpmLu5sno/eOUnV45wVVNywvFkKbI/4Ac8PLrgrhPtWPQ2JGMg1BOkALuQnR7Un6DOJJpI8NBHA3iBjK3q8pITwqaoMUr4dr3VuGztojsRV5iYynMeHeeG8cRgkvE53/PiLEzzOtdEYICnakv3SUHRqycSGQvCukWbeTTU8P8zMxlqE3kgrWnmzm+i7xEnwDJc9/YqkvYqVFyksKQK4xzPLjBzB+VQdSPacqW8HeQsWzZoSHpjzOSScL8fYp9OTPrifnXJY/PfQHJrmSYPUi2PjI1Sqm69jrfLAwYmw9SY9f+N/DEdsp1ObpGHLRh/JhXyVRk9D79eYVPUrH8u6x/vrx5y9agyhw3Er7u3J3NU4zcfPy+EqHn/xG6gbBEqCCJJJfmFFdHjSkLSSu8zQjdsXicWz6rYEi+kRJYXEHSbuD88QthSHezdrOGWK8SuR4II3bsrZhqIcZpE+P+smgN8dRJDFch4jNf+AatfmUBcxK0jxij0Ke0XqopZf90O42fiGZhau4t+f7zjNhNWzBW7VzVL2oGH1W9UGPMRH7YEg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GLHokdR0IDkQ822dPga5o3Sccl7zzQ4wGGoYsrTx8RW43oi2hj9juueSrPTj?=
 =?us-ascii?Q?7Xogkzfq1Fqv7IHCOEeXugG5MVEzSGssVQ4KW2XttAdFsJYe8H5p6cQ/X3Cg?=
 =?us-ascii?Q?ufNVDm2pdMIW/w9V5RJAx/QNRB8gos76CF87JhFSJC8ZnaDvUuHDT13YQyhu?=
 =?us-ascii?Q?Cu4rWct4dteptMYeQYtRF6h0rS0pn3iJvxILdElPJLvE2EK37cTEytkw9mC/?=
 =?us-ascii?Q?oV/wcpZDfHGTlAJA1v8S/mttqS1XRHxvjBxybtZScjGinNnYZbB88vjwqSrS?=
 =?us-ascii?Q?UKKC1LcB1lKbgHBZiaRi2gXMnGyxEp8B2j1qrZY9jlarV9vebm/YFQDBatsL?=
 =?us-ascii?Q?CC7eCxF1j1DaidxpVY+zjGyJY3RPcFPWpgtNJtrkW4kXp+z4MQmgDazIt8m7?=
 =?us-ascii?Q?/tbITo9rVRKvPHOlA9j49ZEU+qWYSXbN+2DOnVPHrMCWdOkjNTudruUnobYz?=
 =?us-ascii?Q?1ftry7CUA8OniWrZ5xlWXUGqp8E7+Cvae09bddMF+uixRTSrRRK4tN+K8EnQ?=
 =?us-ascii?Q?MyAjJ0JwlFwntpW/NzFv6+GUJ0K4BB4J59VtC+rUV3ytxVfsIOLMoIrz/r9j?=
 =?us-ascii?Q?7ZYh995BPOcguPpaY/w04jIJgldXQrh1A05NksseMgX9VFfDEzA6LIl1QI2m?=
 =?us-ascii?Q?nSOy6TYEx680J3iT29A3its+bzWc1a6fv0mMtnrVDI1W+xDAQ0NPq6qjde1y?=
 =?us-ascii?Q?+QrMMRKmNM65HebofvZOFcYq2UkIg2EnW6o46v6nqXvwc50fpwMNFqfO2fir?=
 =?us-ascii?Q?ehltpg6ZgpGlKFaKWinA1U3y+IUMH/G9038PO8Jl2ResNiFuCnSMDHp2yKuF?=
 =?us-ascii?Q?gyCvSNz0ycCdUYOXpaMyTj5MDyr6W8Q2EDY/E40OBkTU/wU/RNotD8esNqjw?=
 =?us-ascii?Q?p81fonVwIcipsK/1L2vRzcoEXRyF4WCBj2J4RHUl8/KhR4QMeS2jFKej2lhE?=
 =?us-ascii?Q?NMbXtx5BkO8waPczeuy77Y5XTlGkztYulnakkQlp58V9U/NylVIrtHyA/uCI?=
 =?us-ascii?Q?duMnbVi5gFIwX3iQv+hnpZLEe6wD/GYfPkEqfYJCaSVA/36rvlUYfQIZXCe/?=
 =?us-ascii?Q?iYJO2zuzsgAhnUQRk3ejAtp/pQhb/2eb5T/Inmcwsp054RoxoW8GhOdbWx2v?=
 =?us-ascii?Q?XyK8T1B9WQ4rnrqiGKJEVwTZ1aDAOM4Eyjbx+99S/fSdegsM9+8/xc/XpsXi?=
 =?us-ascii?Q?NUZtNWfrRneGwQYAwdapNuPmZz8RXoFa3zWEWe4D655zJDG8/xqhP4dAnh2H?=
 =?us-ascii?Q?fHX1dhgfndHC2jF60d8sIsqK+YyC0iG86lstJKemBszkq2tTce73PZYhLNFz?=
 =?us-ascii?Q?QQdbhQRKSmn+yBNc2tDSRrWQ0SbeF5QH07yEGw9X8phq2pS4b1/DpDXTfPUw?=
 =?us-ascii?Q?WzXwsBWZlLuC9thZyLsbbn7u20Bk44QoZO2MuCIAU8r57UWkeHfb56hdwL8R?=
 =?us-ascii?Q?wkhbG0koeNZfDquCwxUTGJVyenX+WzWuXRlasHUx9fFy7l5opKRvtkU11OaL?=
 =?us-ascii?Q?jow8+kqz8b5aC9vqk8eYL0yS4ndMm3gFofqbZ0oI/gYozk71B7uggiH/fXaY?=
 =?us-ascii?Q?khFr1p+PXAJ2JZ4rEfIPLonYP/Z0Q/mTBj5bB4KHSztMwHv1A88gztLEwvye?=
 =?us-ascii?Q?GmGpVlyobOTv7SEtAOH0h4EbF0dq9lEDP3ysEMm2VMTlT9xwTKUZT5Hx9HuI?=
 =?us-ascii?Q?SvKjdF+iPVvtW5qbs1YdOFTtUfWqkaRifpvsCtM4lTDI7jHwdTa/KUL3hYAS?=
 =?us-ascii?Q?RGItmm5XZanhegYmTb2HFrGIFu82b68=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9aed92-95b4-420a-0caa-08dea06f8c84
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:03:29.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSFIWdsdpqQGUdMwwUO530q9R8SfobqQn5vbFRepl7BajdlzAd+8kkNV3E7oo56L2IUROy16rtObQBOMFR6UufH85Avvcz6fy5m4AP5AyNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2812
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235724

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69647 [1].

[1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D455446bb=
dc8675f34808187de2bbad4682016ff7

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-69647.patch    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69647.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index e27502af72..a337a3e850 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -71,5 +71,6 @@ SRC_URI =3D "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
+     file://CVE-2025-69647.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
new file mode 100644
index 0000000000..8e3c1c79e7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
@@ -0,0 +1,85 @@
+From c87ed59208e1ce665f08ae2b2d8c1cdc2a653ea2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 22 Nov 2025 09:52:18 +1030
+Subject: [PATCH] PR 33639 .debug_loclists output
+
+The fuzzed testcase in this PR prints an almost endless table of
+offsets, due to a bogus offset count.  Limit that count, and the total
+length too.
+
+	PR 33639
+	* dwarf.c (display_loclists_unit_header): Return error on
+	length too small to read header.  Limit length to section
+	size.  Limit offset count similarly.
+
+CVE: CVE-2025-69647
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D455446bbdc8675f34808187de2bbad4682016ff7]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/dwarf.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 72bc9d7497a..06d68074046 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -7221,8 +7221,6 @@ display_loclists_unit_header (struct dwarf_section *=
  section,
+   bool is_64bit;
+   uint32_t i;
+=20
+-  printf (_("Table at Offset %#" PRIx64 "\n"), header_offset);
+-
+   SAFE_BYTE_GET_AND_INC (length, start, 4, end);
+   if (length =3D=3D 0xffffffff)
+     {
+@@ -7231,6 +7229,11 @@ display_loclists_unit_header (struct dwarf_section =
*  section,
+     }
+   else
+     is_64bit =3D false;
++  if (length < 8)
++    return (uint64_t) -1;
++
++  printf (_("Table at Offset %#" PRIx64 "\n"), header_offset);
++  header_offset =3D start - section->start;
+=20
+   SAFE_BYTE_GET_AND_INC (version, start, 2, end);
+   SAFE_BYTE_GET_AND_INC (address_size, start, 1, end);
+@@ -7243,15 +7246,21 @@ display_loclists_unit_header (struct dwarf_section=
 *  section,
+   printf (_("  Segment size:    %u\n"), segment_selector_size);
+   printf (_("  Offset entries:  %u\n"), *offset_count);
+=20
++  if (length > section->size - header_offset)
++    length =3D section->size - header_offset;
++
+   if (segment_selector_size !=3D 0)
+     {
+       warn (_("The %s section contains an "
+ 	      "unsupported segment selector size: %d.\n"),
+ 	    section->name, segment_selector_size);
+-      return (uint64_t)-1;
++      return (uint64_t) -1;
+     }
+=20
+-  if ( *offset_count)
++  uint64_t max_off_count =3D length >> (is_64bit ? 3 : 2);
++  if (*offset_count > max_off_count)
++    *offset_count =3D max_off_count;
++  if (*offset_count)
+     {
+       printf (_("\n   Offset Entries starting at %#tx:\n"),
+ 	      start - section->start);
+@@ -7268,8 +7277,7 @@ display_loclists_unit_header (struct dwarf_section *=
  section,
+   putchar ('\n');
+   *loclists_start =3D start;
+=20
+-  /* The length field doesn't include the length field itself.  */
+-  return header_offset + length + (is_64bit ? 12 : 4);
++  return header_offset + length;
+ }
+=20
+ static int
+--=20
+2.34.1
+
--=20
2.34.1


