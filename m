Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52743F9EDD0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:35:29 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82088.1776863030238721383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mlSiR2j/;
 spf=pass (domain: est.tech, ip: 40.107.162.70, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaHi75YnYB2VcEOCgFKGSzZlQjq4cB/bQ0JlIe51tx1hDM20l9HPgWdJXIExQHA63oyfS3H8p+GOvf59N6shIfS8QF77lDjqnCakKz8Kyf7/u5edDNPf/hAYjGYKY3DLatE8wTqD1GfyGarCpiHyDmtgA7xWhp6E7KwME+FFLm28AiEO8eU/ZH5GeKsXg7xmXpvKTl3L5txqssXoOxCVGwgV6gB0i026DigksMj+9HFZhLLHlt1DqGe48XIc0cNCXPVe2zdEAGnXtYwsSA3dDjYcbuHtjQenojy++uguHr2c6YxpXkkS1OEVTVNeJ4d3D70T+KhHTgwoYiYAxn1Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG+sFQf/PdZYIyeXpOZswVDNaIkIaL0Yx+nfcXUwgjs=;
 b=GJQJHEvo43urZxMXGMnACxxvd8sDuNtC7EcqwQttHPpkO439BlQGKwK+qc3bxkLV7l/w/GW2HRYuahZvhLjXKLcUC5GK97QKl0WVbJqlzj9ANgS0k9J8bqPsnLWXAHJOv16KNdrTJMHCsFW3vmvLv6WXTiL/VZRUvQ84/6DgStq9AZevLXHfApsg8QpGNIw6gFr4m38SETb4QxeXsgkn6VaqRnTIvE1xKkE1QmUqjAnh3OLnL+/5FhUyebq5PYgbLxWB6Lv98XjY6s7TXBtrWLLmQ7ZLG+x2fDYZXjMCLhddyBRX3AeuprfJr9kgcKnDzz6HUIOiOmC92BKhmf9Yuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG+sFQf/PdZYIyeXpOZswVDNaIkIaL0Yx+nfcXUwgjs=;
 b=mlSiR2j/Tdthlv1B9g/I8D/uDFvEPfg6Utxx3JSJMSaRL7MiAJFyHfsWgSkJbdMChZgoTItTAsVxMXPGuPcZdZYEWhjb80TpFpGp5+D5oTsDFODspb4b0pdSdBQVfVRekFB4b2pP5Plu1PFu7+2y4zGl5xXxjWHrd/zYbZ7SaDjFCgdjniwkGIWcR4GMNM6Y+ivQGVY+22JXZ5AoEPvb7FOXfh6+j0EpWCa41sQNAg/VARSbTs1Pp0Qu10yY26cRgw4phL+bKYROJg+J0yzSHZ+d5kX1V8YAF6IVr8xxZOI2uVkTqncOuKHHa0myFopZLixdbAM5jlHzSsQRc/H6ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2812.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 13:03:47 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:03:46 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648
Date: Wed, 22 Apr 2026 15:03:39 +0200
Message-ID: <20260422130342.386379-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2812:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f79f7c2-3b6a-4cc7-8fbb-08dea06f96f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Z+YKHhLtfq4ZV1IaPEG9pgk+bNGLnlHOK/HVgweHrpUmLLYE6YMZFwMpPaqmt08W4fW8KoCMxpPf840RRwzZe6VwJjyxcpMnLAonIYRbcYCZkabGXnQtVpZnb0sTyLH1z9iXNgfAbUznkMS77R9ujxCnkIEHKGlpAaiTpMTk78Abpu4TfAw/ihRbeNQI8xa4fcMmzqTa6+grLEDeA1AvOQubjMUNHe04/DV4ZhacYax8DUXfAN6cs73Ajc+x3XL9TGdb9ah8Gk6B1IbKgTJ6QnTTizABP5vCh1YlakGMYSmZIm1GUL5zQka1gMJI7hF6ySMFuJgctp2toHlIcPfc2Te3ZcU4DHI6EL2YRvGULKhRdO4a6pSCwS2/2dWT5tWx9PX3LU781Xhp2aSyN9Ysoo62mKHXQUGvAkjjhJSVhy4QTefNKaJhJ9Q88e/Tpuw4cEH1FxdGpRuMi09LcJodp/5LYf1PZZ+ehRWOqAc28BV65+bX0dQ0s+1p8jJaaUk+wnsSAHZafg68SHRq7LjuM/uQyFAioY23J+2GAvzIUJwXZ8KpLAjWpld62uOb0KohTi17HrD23rqXnoFoWWQveLNV1jMuRNDqcMQp4cNgAq+uS0UVR1ODKqeHds575Rb3RccdotwtYN91dQELKj+szzANwWu05jILwoUNQBpRHaxFrbeiF7GgcOF3yodA6LNT13RhUtR3IdDnSEaaBGVvRw5IDf+7V2bK0QMw3hd/KmI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9vG35cOnMabnAakxwcsif9cI61wnuWYATw0I5k5M0VY0LUVPItaAv92V+bkh?=
 =?us-ascii?Q?YUU/o+0hCI7rLdjwsSYNosUY0s3MTen5eGiK9rVPt1ZkWi4BJFeByStLXJuT?=
 =?us-ascii?Q?qgLBSCgyM6QudnpqR5PUrEW43ZfC77xLJ2SWoAgkjIJcX3FtmC4zIbEUczhd?=
 =?us-ascii?Q?NbqCDQWhfch5RsM09iNzUJL1yig481Gmzd2XFhTdHLX7R2CliyqWruEDZg2Z?=
 =?us-ascii?Q?zFbgx/ERNKhwGqvgICYj2NlEDRJPmBzYJH/2NvtkSePexOM32AAkAYtmyDnA?=
 =?us-ascii?Q?Ir/FejchW2RfoI4yHA4sU0dJjL+dvVIuanztuD/zYdl7hMEDmiBZJJBmluPl?=
 =?us-ascii?Q?OaPtoBrWadNfUUOIteKvCPFtkUJ9lFBhw3dSF8nX7GhJD2Pv6h1lk5B2UUKu?=
 =?us-ascii?Q?G5Cbkh/jUpVDSP1KT90wkliZvtON/+hPAZ92AQRPUtYtEa8g1/vHgZmHNzix?=
 =?us-ascii?Q?rNExqjfufIzolnoV6mJsweh66rShor0i02s81cPzCZZZweAAm3uLaMYSSgJ+?=
 =?us-ascii?Q?m9KV5Ow4aRAW3lnRhyOmPujVPHtv/PV0WCvVhXGaKuY8MW/i6Rg5hUKB7Mw6?=
 =?us-ascii?Q?PMsg1w3+DzWmXD/tqcYrY+svJiIQiOVhbq0GlZhyO+S+vuK1B1HoocDjOEMp?=
 =?us-ascii?Q?gM+S5u9oNQlyYWQQzYTfx7ntAnGAR2sEEASg18e5kRGiwaaxEV4HQE6/cPfU?=
 =?us-ascii?Q?lHGZolx125bD+aVHN+8pn777OvuU39M2dkYmjD3ziI2ICGMjyXdXYr7CzrsS?=
 =?us-ascii?Q?jZbbCpZorw8b4HDjNiiKYk6x4LfKfGj0hzvQVMMbhYK8nEmVjjhTePjIQSHc?=
 =?us-ascii?Q?E1mWp4r+uLizYyGCqPRmx6jmgXIrv50HF4OQpxyX8f/zeOHS4+6ue7wEZeTs?=
 =?us-ascii?Q?HR89PGFkDiGDTMkS35IXBlWLnf3wthyFayEZZ2MU7rntzbMTWSmX9kDJDpVS?=
 =?us-ascii?Q?4Zd5jbOJVStfN3BYVWojZujPpSTqxIVVC7SG5433SF09HdDGbWu81Af5DMgY?=
 =?us-ascii?Q?Kg4MyWR1QhIFomdXeTTBhVBIvwsoci2VOvi/beg2VP25PV4190pBFWTMDpVW?=
 =?us-ascii?Q?5fpWMGFdqkhkcEX4cA5PEuzsRuHGJVHRWwRtuaavCSox8Op3q/whkDyKdX+G?=
 =?us-ascii?Q?tews5GSoGCxd03/twR/7iXtEqw3+0NYeRJcoeQSz/enyO7ZSuwgUoX3vw7Rq?=
 =?us-ascii?Q?wuRhZ7KPBE4l6R8ESebVvdSXpy9nPgYRhNoqoKKmvub71pywIvP4g4xYiSXZ?=
 =?us-ascii?Q?kjzutEd5I6Ep5HN0qaOCSELkpzXIDLZqVvOFA/qY067qUEZD1eHwF0fm208Y?=
 =?us-ascii?Q?87dhoJhi/mHoGWvklwVlTHTKrE+cCwMGXgmlsP8Gw5m15UQNOrxm5g/u54C9?=
 =?us-ascii?Q?RsjnLDNg2OD3ApQkFcGxFwWbNeDWo4r++32rp1T2w3r7NcOCN0tGnh5WTNuQ?=
 =?us-ascii?Q?qU88lkZKt1umvKDbMVUN4zwgG2nL6cCBR1K1TFJmWj6Z3W0PtRnynKhFfoFU?=
 =?us-ascii?Q?gLA/bH8sTVeo+tW5ukAcFNyPMbbNrDXaiuzVqcFu1TUFxqxkMnTzxRe8HXef?=
 =?us-ascii?Q?OzDMRwzMFwQ5VZgFc2+fjc26hahcYjhP/i4n7YNS+g77NVGQOvo7SfzIUTmZ?=
 =?us-ascii?Q?pyKXgzwI7sTeEyriZEOAv5pvA7A7r2sQTG8kTKgm66MxGbK0hRwoI3fnfVEz?=
 =?us-ascii?Q?c9Cj1SWbFNQ47hP9OLE7/UvEaiIX+o8Ve32DZK4G6Z0SHFTHj8eWIqa6nJ79?=
 =?us-ascii?Q?SxZZKoromDhsVWZaIfgVip0TzZGoD/o=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f79f7c2-3b6a-4cc7-8fbb-08dea06f96f1
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:03:46.8766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0YC6ud8VYWMugfD3z5V1ejolBDpbOD3mSlKyRd0+i7toB0egUTfItpfK7TNnpT+SoWVnIlQqA20R2bRXmCokXr3jQTF+g7Suzw7cSG5kZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2812
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235723

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69648 [1].

[1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704a0=
0cbac5e85c2bedd363357b5bf6fcee33

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-69648.patch    | 190 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index a337a3e850..6c1f9dc870 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -72,5 +72,6 @@ SRC_URI =3D "\
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
+     file://CVE-2025-69648.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
new file mode 100644
index 0000000000..e04d7ed6c2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -0,0 +1,190 @@
+From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 22 Nov 2025 09:22:10 +1030
+Subject: [PATCH] PR 33638, debug_rnglists output
+
+The fuzzed testcase in this PR continuously outputs an error about
+the debug_rnglists header.  Fixed by taking notice of the error and
+stopping output.  The patch also limits the length in all cases, not
+just when a relocation is present, and limits the offset entry count
+read from the header.  I removed the warning and the test for relocs
+because the code can't work reliably with unresolved relocs in the
+length field.
+
+	PR 33638
+	* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
+	"inital_length" to plain "length".  Verify length is large
+	enough to read header.  Limit length to rest of section.
+	Similarly limit offset_entry_count.
+	(display_debug_ranges): Check display_debug_rnglists_unit_header
+	return status.  Stop output on error.
+
+CVE: CVE-2025-69648
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
+
+(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
+ 1 file changed, 34 insertions(+), 33 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index f4bcb677761..b4fb56351ec 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * start,
+   return start;
+ }
+=20
+-static int
++static bool
+ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+ 				    uint64_t *              unit_offset,
+ 				    unsigned char *         poffset_size)
+@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_sec=
tion *  section,
+   uint64_t        start_offset =3D *unit_offset;
+   unsigned char * p =3D section->start + start_offset;
+   unsigned char * finish =3D section->start + section->size;
+-  uint64_t        initial_length;
++  unsigned char * hdr;
++  uint64_t        length;
+   unsigned char   segment_selector_size;
+   unsigned int    offset_entry_count;
+   unsigned int    i;
+@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
+   unsigned char   offset_size;
+=20
+   /* Get and check the length of the block.  */
+-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
+=20
+-  if (initial_length =3D=3D 0xffffffff)
++  if (length =3D=3D 0xffffffff)
+     {
+       /* This section is 64-bit DWARF 3.  */
+-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
+       *poffset_size =3D offset_size =3D 8;
+     }
+   else
+     *poffset_size =3D offset_size =3D 4;
+=20
+-  if (initial_length > (size_t) (finish - p))
+-    {
+-      /* If the length field has a relocation against it, then we should
+-	 not complain if it is inaccurate (and probably negative).
+-	 It is copied from .debug_line handling code.  */
+-      if (reloc_at (section, (p - section->start) - offset_size))
+-	initial_length =3D finish - p;
+-      else
+-	{
+-	  warn (_("The length field (%#" PRIx64
+-		  ") in the debug_rnglists header is wrong"
+-		  " - the section is too small\n"),
+-		initial_length);
+-	  return 0;
+-	}
+-    }
+-
+-  /* Report the next unit offset to the caller.  */
+-  *unit_offset =3D (p - section->start) + initial_length;
++  if (length < 8)
++    return false;
+=20
+   /* Get the other fields in the header.  */
++  hdr =3D p;
+   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
+   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
+   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
+   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
+=20
+   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
+-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
++  printf (_("  Length:          %#" PRIx64 "\n"), length);
+   printf (_("  DWARF version:   %u\n"), version);
+   printf (_("  Address size:    %u\n"), address_size);
+   printf (_("  Segment size:    %u\n"), segment_selector_size);
+   printf (_("  Offset entries:  %u\n"), offset_entry_count);
+=20
++  if (length > (size_t) (finish - hdr))
++    length =3D finish - hdr;
++
++  /* Report the next unit offset to the caller.  */
++  *unit_offset =3D (hdr - section->start) + length;
++
+   /* Check the fields.  */
+   if (segment_selector_size !=3D 0)
+     {
+       warn (_("The %s section contains "
+ 	      "unsupported segment selector size: %d.\n"),
+ 	    section->name, segment_selector_size);
+-      return 0;
++      return false;
+     }
+=20
+   if (version < 5)
+     {
+       warn (_("Only DWARF version 5+ debug_rnglists info "
+ 	      "is currently supported.\n"));
+-      return 0;
++      return false;
+     }
+=20
++  uint64_t max_off_count =3D (length - 8) / offset_size;
++  if (offset_entry_count > max_off_count)
++    offset_entry_count =3D max_off_count;
+   if (offset_entry_count !=3D 0)
+     {
+       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start);
+@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_sec=
tion *  section,
+ 	}
+     }
+=20
+-  return 1;
++  return true;
+ }
+=20
+ static bool
+@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *section,
+   uint64_t last_offset =3D 0;
+   uint64_t next_rnglists_cu_offset =3D 0;
+   unsigned char offset_size;
++  bool ok_header =3D true;
+=20
+   if (bytes =3D=3D 0)
+     {
+@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *section=
,
+       /* If we've moved on to the next compile unit in the rnglists secti=
on - dump the unit header(s).  */
+       if (is_rnglists && next_rnglists_cu_offset < offset)
+ 	{
+-	  while (next_rnglists_cu_offset < offset)
+-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_offse=
t, &offset_size);
++	  while (ok_header && next_rnglists_cu_offset < offset)
++	    ok_header =3D display_debug_rnglists_unit_header (section,
++							    &next_rnglists_cu_offset,
++							    &offset_size);
++	  if (!ok_header)
++	    break;
+ 	  printf (_("    Offset   Begin    End\n"));
+ 	}
+=20
+@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *sectio=
n,
+     }
+=20
+   /* Display trailing empty (or unreferenced) compile units, if any.  */
+-  if (is_rnglists)
++  if (is_rnglists && ok_header)
+     while (next_rnglists_cu_offset < section->size)
+-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_offs=
et, &offset_size);
+-
++      if (!display_debug_rnglists_unit_header (section,
++					       &next_rnglists_cu_offset,
++					       &offset_size))
++	break;
+   putchar ('\n');
+=20
+   free (range_entries);
+--=20
+2.35.6
+
--=20
2.34.1


