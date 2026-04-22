Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7107CF9EDCE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:35:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82105.1776863062002634971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U+D/cXYX;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2y8EJ9kTCrfcWxzeYvoqJdLZabwl3knhJJ79sOIYlwsya0eImV0FWqSPa8JEMmfjdUoYaqZN8j8myRMqz/FuP97GJfyWmNp5Vexc4RnZcBt9V0fc5NpFw5TZZpGGvKRgdgdPo06bDlMAALMw7VoXQoVBoVPUQINULbH+QRf9eh8RULvExgy1j+MXyazoVjiXq4f8YXx+H2JjvFfo4gSng1AfNeQAjaZtvM2wFIMXRjNbnh4EYhtVt8GPiJXpHGoJjKNrLeNcaL1/a2cH8kWGBRfj4DJBpTHv9BACEBzySZGvot1YYJAbuAVQw1WTllC+Zz21rd/Rr/VXr63xQK02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt0a+1rDxPO84m7n/nL3sfwYLSYrKEqppEsgWQ6U+qk=;
 b=LdYw0NHwu3PBL+l4y1QC27LF3rdsVTR9VluEjBdfvR8abTa4fmTraXi3coDPdfkqwM4263mtNu6eaTPWdV2CT4nLXjJAkGs1Qrt1ortQRvIMJx7MwKn9oT0Mb/i6cf90mnDvusZGFUPsytyRh8PcI9kbBtxPJHayYKayEx6QkXjhoXpG0Wl/2DYDEGguPl3Zya0ymPpKDWN2f6gqDa7rqqEQDqZleLPwu9VLd3Wyi7hyZ13dJ2WNpfUy8MH/u9Tx6VEKP+IBWlaQkqOIIQi5chQGUzp9bP+0j2Raz8J9C7V6yB2VtdEzbr3lfvI0Ef3Xa9C5caAvEKtU/AwRwkpV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt0a+1rDxPO84m7n/nL3sfwYLSYrKEqppEsgWQ6U+qk=;
 b=U+D/cXYXQ6Xu+wlclfM2vy9hcreVGVmv/E2dnTuPZG699ElSUPTmYnsIG1K/JAD3vMp23i3L8jY7yknswyEdYF9YdSPUhweAJvOmiS9yXGsAwVmQDsePLXPoM8fHCdItQGGTMUpUJsGapU8eUo6K4soHWl0IrTiOb7jMgoZTj07lU2yO0tBXACKIbDzRMDXiJv2ZbVGwdQfloHWnRTdEQwza2jdsorR0L3vZRgsCcabL+EIet2bSaQXIAlREltMW784J305Nhb6PxUiB2RBOEHJ1d4nVWTHbDH44KDJ98IghWy4K1AV19PU8VVIpr0j973NxOUhwclb6cRKAnoNyzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2812.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 13:04:19 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:04:19 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH 4/4] binutils: fix CVE-2025-69652
Date: Wed, 22 Apr 2026 15:04:11 +0200
Message-ID: <20260422130413.386573-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0694.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::16) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2812:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d8d04e-92c3-404b-1e2e-08dea06faa5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: 
	x4HwC4gx7PTgfSywwW1v0BNmDOEmpMs33E1PPnjulslFbuq9LfZD9bva/K4mhuI8dbmpiAQub4DA3rBLDNcSOw2lAw3YZ0pYEq26mrhXgS0eeF6is4DuHuNWmw3feTbhqWoZNm0tlShIGWdbDGw84f3MWqdJJfgiH/K6cSK39Ujn8iTATJH1NwWzFMJi/Y2no1axzKTdhaiKRA6T+VA7Trh9pT4Zl1OIhIIR42MjIp4OaK2ioL2+thOmvzI5SufvSU0XXr04jQ2x9CTEcTKeu0gDvoIKgN83KoVqFBw0xqOLfh7aYVIt728UrzmomxQuGhjx18BzqPNXEOOlra1whJV2JDpkzelM4Ihsbk/VvQ9XEoA6F0UTH5QMYdyCrR1Nu9xtItOpJnoYCU61l2oGRGSxyZ3uqjVtaevoHye4QavBzWqyLAkljt4zEfotSOrfogk5mAilMlCNy7EWpfUdwgNRSJn1euWMo4/aZPOr1kWnga8JW/i8u8Oe+zfh3XK55qurX9DXNGIgvWx+jDsl66ZC5UnO1Fr5nlqEMEH59/W9Tl7ss6p3SlbdODQFXPQD6h9w8x9Pcv//fvuSMD81QoxGqmaT0HCL5PuZBvh4MrpB9w75q4ZVVkwMLUZ0dUqi+gVLYYGavncsVwmZLjoWo+k5wb7VzPqvpvHQFX8gexHEfMinsCSAwtoYEQoPpPrNxlyadLiS9BPu13f17auMVZEyCaMciqj5Z6IVqvEkfxc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VO8Gvr95a3kjXlfvzxVm2jHm0ZXNe1wvXK9GO2acX+i6rEWH8aoYpgFTjB4L?=
 =?us-ascii?Q?duGdL7hJOXqsDb7sWojNIhLZcwKgAyleC19qQnqjko5DqQmEhemE9II8rr3U?=
 =?us-ascii?Q?4wVLwDqR0acn8rdp3WfQIlHJLIS82Zl8GfviPCA3uh68XvFnLVvLwz3jf8mX?=
 =?us-ascii?Q?m1pzgOPn2qdWU1pbaagZcBUn//pQbWBMxj0Vu83QmUWDvA57dCDA+XSemkOq?=
 =?us-ascii?Q?pLBYDBqVL89KvmXFRC2rlsuqq8BrXMAIXbfp+bGcKYR8lEaNdxuPmeEM673m?=
 =?us-ascii?Q?vLOHerBoVGnxbizwqFoA0HZjElH4P1JVEMyjtg/YcGBZ4NxW1W6a/HuV9K9J?=
 =?us-ascii?Q?hnfihuAtEaX9L3H0UWouz9FdUZcs66UeTh7tN5FYO12Ggjvxt/p4sLE7EaOv?=
 =?us-ascii?Q?lQLKDH7IUvZUxqtE1XCM4MbMHiNQ0gRueHFAD8kCExQFXtpZAjIm7vc6drtr?=
 =?us-ascii?Q?8RImJ5YfcCW+UsK2TK8sulhyLIGHwiHGyAER9lfnwd2EUjC3bCvZm/DcGeh+?=
 =?us-ascii?Q?OYaJ3KYJmDeV674D8AFXmd0eqhUhErkOiwEWJis1TSeh6+rYB0z7BRUcZhTY?=
 =?us-ascii?Q?XnY8hgJ9ouImf3QsYARPt83R0EQsHmpj1M65FCDOJ6TpYyg2JEMKXfsU8b4t?=
 =?us-ascii?Q?0M5FQiFjNhj8Fe1QNIw1yOJ36lVYdsf8wgmhSZaobWyRLsLDaSkNzINqUVS8?=
 =?us-ascii?Q?9xe72SzF3LxS3rCtKmaLLKqIW1ZaUzavVDTGzx6vcaCCrWnKOLF8iHQ2YuO7?=
 =?us-ascii?Q?fA5fxAJKTsg7/uWH8mRXedfLXDKyZtcnO+CDzIHOKuY659tqGxIjn4lWfe3w?=
 =?us-ascii?Q?8M1zQ7v8E7CVGS8uaQlMTRXz/qPqX1dCBbMjqnVXvXUybFDjbHQGz7JWwg91?=
 =?us-ascii?Q?xiPCh2pJ2+w0zmGD6bizAgWog7tpywA+vyJF4ZaVspjR108dvBRGqMVHyVcE?=
 =?us-ascii?Q?h5nAOGVhjwZQNDvSCI6k6DEN8xjgVa+vAZ/QJrIWxV4PbKZX1N4Kypj/lkmy?=
 =?us-ascii?Q?4x3CNTx9r23Mx2y9hJcb5/GfeQGI559h4VD0peur07GWMGbDUgxaar3/IJVb?=
 =?us-ascii?Q?+rCd6W9TjJ0q9ooyaq0T5/NYmjnR12PDOlV8rvT8WZfQgYd2thwPqJuORaps?=
 =?us-ascii?Q?F/IC/HzSqA2yTUJzrReIX7P8oOaQR1HfGmUCe9esIP05Tsi0AsGwguPA3Von?=
 =?us-ascii?Q?RCX0wcOApGkOBanrf4OQqYxJS5AeEJiR5J30D6tT/BFJvZKabh/L6ZGp8Cv7?=
 =?us-ascii?Q?Gv2S/pln9f+Zrgkwn0ry2gGuD7hifNSBBYO6VxC+pGKvtGW8xebo28veKUih?=
 =?us-ascii?Q?e4887bKVUKexidTHD05w+95gWMhKyph6roNGD7ASMUl68uRexNRYo8r2r+PS?=
 =?us-ascii?Q?Dnrv+Mb0z3kBU5V91I3FpXsu7JOoC9jebnshtgAOKHNo9KBJxaOG5a1CMMy+?=
 =?us-ascii?Q?GXs8IgaSM1zn4nm2VWuCIl52Ju7+IyZxkASg5obOvq8N4pT6o5poSR+71hwx?=
 =?us-ascii?Q?SsZdW68rmMdxkGlY1EGQTnLrGZ9IkRYokIqB9p9uoCGEKiy8HRafqDAjoCqP?=
 =?us-ascii?Q?jqfY1LJ8+oUDgynOk7dG+60cUmuuJhvoqHBzfxhZkIgQScuV9G+R5xeId9zs?=
 =?us-ascii?Q?d8wbIsTl6k79oXa+DAnfXAjpwkEVrOaWxkHAyaWHXzr2Nglhlgf5L8+Aodw0?=
 =?us-ascii?Q?OnPAAzwpdAt06f602mY8Sn2aaCtJ3CCTSojnWnebgGf2WSaIfYJCZ4IT9Y4r?=
 =?us-ascii?Q?FJNki988u6HGLGF9R2neO1P3QC7Uwfc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d8d04e-92c3-404b-1e2e-08dea06faa5d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:04:19.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr1hBHFbFAUWD4Z9+Uj2AbtKjySRxLdc+ElgTqb3E8gk69yBwzDiQwczc1kc0/qA5UnVN4aKMZpL7pbgb7gQb3S2S/s4e+1Cm2IaSepFFZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2812
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235721

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69652 [1].

[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D44b=
79abd0fa12e7947252eb4c6e5d16ed6033e01

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-69652.patch    | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 8a92807f30..8768451303 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,6 @@ SRC_URI =3D "\
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..c0c7c99c2a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,41 @@
+From 5a2f57ab03067f6622c19983e1e31207bd2293a6 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+(cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2462e6540a7..0d88ea94619 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+ 	      break;
+ 	    }
+=20
+-	  debug_info *debug_info_p =3D ((debug_information
+-				       && unit < alloc_num_debug_info_entries)
+-				      ? debug_information + unit : NULL);
++	  debug_info *debug_info_p =3D NULL;
++	  if (debug_information
++	      && num_debug_info_entries !=3D DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p =3D debug_information + unit;
+=20
+ 	  assert (!debug_info_p
+ 		  || (debug_info_p->num_loc_offsets
+--=20
+2.35.6
+
--=20
2.34.1


