Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C21C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:59:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9298.1784195941061774578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 02:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gE7UXJqW;
 spf=pass (domain: est.tech, ip: 52.101.66.28, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqGMJDMX6mmXwDujNhL1fTJdZET1oXKEX8tPxJvHcY+ZlJO6s2f3l5O8JS4p36FeN3+ejCgQ3Lc9iuraGbiSu3agbuGMjIRZPi7ahez492wMcTceTaY0g31nq0I67kcgmYE8nR3rds51a1XhEXEE8vdHUjSI5Fn2XCMO/gHYmImKjRRtHC+YHqJPUn5KXwdHH80fUgLMUv1zfzvEmbUtvzP7ENQerovELVia4rCcu8IYR7Et/OusQsWYjh9m4FGcyB/4W3Z1cCZgBMZBMMQE67ubWmrfG9nqf4w8d2h9Kx2ffh9mJYs7eEEX7JBPSc5ymfw47KSH0kkeuOGp44By1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ue/o2Ol6M3HQ1/5Ki4+/QRbETEnp6Hc5nYsbPdnisMY=;
 b=P/82KnASKp4Pu6VgtHDWE66m8NaqL+ZCmDShox8Y5zjj93rMThH2aTwVSq0ctc+wB/FeS2ybetW6+E+gIXrBiI7PBwRPctYqbQj7UHeTpgpjuuwXGKzFb46H0FWQzeHRQUstWRTehG/7/fVXqqJiYZWCNtzEoE8W+wh3LENUkniE6ANJ4kzl5MH+otJHgPmv7Z1kSoIQJENxtDvsZmTlfzymOImEU0FggAyOUwaCtBf9QV7pNCc7x2OqI6ZLZJKAcDZJ/dZl6HY2xp72yhW7zn7DIV3MDPSrVrq9k93xR3D9eC03256zvvjNeziRR65mzJYVAaVoSQW66nim2hNeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ue/o2Ol6M3HQ1/5Ki4+/QRbETEnp6Hc5nYsbPdnisMY=;
 b=gE7UXJqWTOE8KtJxMzoN9fioPdYetk0YQIpJZoYEOhTHa8MezDfHk91zsUxBVWfGvwLV6o2BGNS777wsCC15wrfd8FD5JBayQpsImnMc6wJR8evEsKYYCOf8khfDwiSOWEfxrDQHBnawiWWwwAKL72rUbD+SQEMQkeDYRqWtWteBP46YZgsM1IV8lKR/HHIvlYTfdWWQDimCzqkuvJd99d9cZAFjh/efpthG1umeIBEDUCFVV0OsKVHa993VUCMDKQflRqva3mBPXPzPJgzxTQ8DznqpGB6Z3zsg86mtKQOivLPpWR7scH+//La0o4sRryKmwiWeJr/qszpHzam1rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AS4P189MB1919.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Thu, 16 Jul
 2026 09:58:57 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0245.003; Thu, 16 Jul 2026
 09:58:56 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] binutils: fix CVE-2025-69645
Date: Thu, 16 Jul 2026 11:58:54 +0200
Message-ID: <20260716095854.65840-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AS4P189MB1919:EE_
X-MS-Office365-Filtering-Correlation-Id: 8934445a-dec4-40f5-e3a4-08dee320d9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	NEBq5ieCDffkRJC3yUy0Z4bW9Te1tB1UE22Ya0enugtreIY1XnPzsYfUfFcpj84YKgpmT07NIrUNoIuJA9zDmOsILBDtjTTApIhuRXMjwkbEiG0M7MwFWRbt6MizLRwNmROKFhmtNnI38dbhgHMLDRoVTXaVRaaBwxxXcmbjuSU/0HgX6fQKwHVL44+qDueUB7M3m6zTDvuA+mWAYIUmZTu6WmskMF8zFfmUXvBOoQLPHiP/tTiPjU8qtRZtdCiNxKAjbbrnjhpIOkKqaqRlkFs4JzNRZAysnOsCto0QFtRwHgXa9mUwdFsOn0zHy3MCpH+5ftaBWTfXqzGHM9z8J2vkiPVjKBiKZhM69Fg3EST0rrb+IXpPxnqeQG4ZME0KF2VLhhAkhIrTxx9o95KywJmMGe0YEYSwrxc0lZjlycoF3GiGTAjUbLJGZJQGWnocdDObQRHlxvYXwcKlrcq7gL0nLrOl+fFKkHLcNp/wFBMr92nkRWQYxS8mSq4hKfSjGHRKNZYwDcn4BCARnqguApCot+xRrxeGw/qmBXp5Hv4PZmj9uF80QqmKE5ytJHgyxUz03MqXGXkZlCAKcbJfDjn/Y7wonnAOKbK8jRAYFKw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WxVgeTbqHYtLoXvN+A+xAbidvlf5znrmfq3zfHN9ilNPG1cRSno9y/fde34n?=
 =?us-ascii?Q?ICr7XiBX/vXqRCeOxAzye1mgjJnod5doHpzYfHAmYydp6wk6zwsMIuYlnv39?=
 =?us-ascii?Q?UCFV1Krntk9B7DbcoA1I+JjoZrLVIMTZa2je7eNSck1+flieeRnXwSqIEFvC?=
 =?us-ascii?Q?+upiqYO6a0OppOqIkgpmnHdlYv0Y1L+fHS+etV/x/WnQL09u6JB8whBdfCUK?=
 =?us-ascii?Q?7TLKq+5naHzvn9SdmQJDel91NiLkUVtNL5P5ZdIer+wKYCb2Zdaw8OINDyWO?=
 =?us-ascii?Q?v77y4Lw2qmLB4hE5mA1JEN5Ok9Cc8dNOdwO0Xkj1m2XhZytMctk5FFXNVw6L?=
 =?us-ascii?Q?ak/7bOCSRB8agh8hlrFqld2XEEHT/an5q5q0DWcH/FhEDAHdYG5g8ITTpdH+?=
 =?us-ascii?Q?yMjAPSRszIT5IpFLtYsqjlIZxLYLH0aZJncZe6f7vDT2DMq2A8qmnuaxuVTP?=
 =?us-ascii?Q?ihdzhTrVuXswRvJA+aCmET64zZ+PXSxRuRzJ7/YzKTvcTXao++N5RnkA8Lh4?=
 =?us-ascii?Q?6ZPW2A1Sk0XY8POoKikUJqbD5fJHAS4pOfZpatb2HnH/Wa7eeYUddZGw+6lA?=
 =?us-ascii?Q?l5lWE4m9/DHg1owf5MzNy6RoeYJ2PgIYZ3oszkmJjdA/S6iG0bxvPG4MoPRe?=
 =?us-ascii?Q?bi3XyOPw99mLyzaU3dzT7z+bpD13bMbk78wtWEELph1GTl5W+L7W+mebqnW0?=
 =?us-ascii?Q?HvRBBXPY85pNYJuBSavsRqgg8uXyS2u3Y/RReQ5ZfND4i0yHgWYsqwqzXaJO?=
 =?us-ascii?Q?xtuQy1JRR45FUtZGCp+K87qFAUH5drDBRPtH6w12JEZtwiF0TIDLvqQVyY9p?=
 =?us-ascii?Q?Dqlf+27FK/h6DfzeuYZnW4oaXt3Y5oZzVuhYH/ppHBnzWAHfAXF/J3qgNz3b?=
 =?us-ascii?Q?+TM+5JUdWOWx6c203f3mo/2NEM44wwIOFl/W5mLX7MJBebRVJA5epbd8ybXi?=
 =?us-ascii?Q?dNBYnIv31Fm+c2pkm7sJ/huWdqiGcKZ6uiHRU98NUOBH2YUc5K3ZJaXcLuOF?=
 =?us-ascii?Q?iu+XRbW4dwTe/H1mygyiXUNhi2mgIBLxm3C85g96NCn9FKEVPWdp8ei9nlB3?=
 =?us-ascii?Q?tqxeYxbUVdvk9VFaJmcYk5Q2FZmHNLT0KyK0NIn4yLoO/fsLoZ0Q6Zp0UGNL?=
 =?us-ascii?Q?93jUoV9PwTG530QqRTxKTpOYETufK0Lv+lQOHK3tDijq0e1VkXlRqJFg/Uob?=
 =?us-ascii?Q?ZWrpwXjzCW43kkckRu5SHcbRstpfV5hP0H+lXBlsbT8HVIkiCrO7IgtVgrQq?=
 =?us-ascii?Q?U4i+0kI5L8xXXkzNBTWGFKe777bdKwjMzTBZxcX5QGlMGZswxOH2qu8J8skE?=
 =?us-ascii?Q?I2cotQH2zpFq9NihhGZz4UVxrb++c5SJM5Xq8uIaRwO1eYEWPUTSYnY6lBjP?=
 =?us-ascii?Q?h6ZepAh4GZritTbaz07nO7iYW1+IGQX/BkFfuwhBGFrXNeFakqcsI+xSdJXp?=
 =?us-ascii?Q?T+JIQf9b1PCkg71eWo4y+VgNao4IS1MJYuZtB2zd4IFO/G6PDbWizkiBC6m1?=
 =?us-ascii?Q?P7OwhecDiO/0V27JXYcy2ofKePNIniN7eKUGEw8feV2lzJuSO9rdQpSxxttf?=
 =?us-ascii?Q?5hw5TZh17hmQ9niUSxfXJ7jHe83XiA9fruDrZotArRLr1SU79+jl7fZ5CF8M?=
 =?us-ascii?Q?ab6KF3v9NUTqIOYlE4wbcSA+62HN81jFC6wvUNGmtS9TAxW3XDfm686OVsT9?=
 =?us-ascii?Q?+PfspLztoqbeoc0J2vYxxVfT5U0j/31bM3AKs1yJ5uBirnW93Tu1qc6JFEWW?=
 =?us-ascii?Q?CXwk+TINgQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8934445a-dec4-40f5-e3a4-08dee320d9f1
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 09:58:56.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pasRypriVYabtbrqkxEF0tm4IwOKITxgRWtErjIcr+rmg38/3gH+wiOnEMediVqmLL0yB08JzAswJOZzpoJ2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1919
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 09:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241075

Binutils objdump contains a denial-of-service vulnerability when processing
a crafted binary with malformed DWARF debug information. A logic error in
the handling of DWARF compilation units can result in an invalid offset_siz=
e
value being used inside byte_get_little_endian, leading to an abort (SIGABR=
T).
A local attacker can trigger the crash by supplying a malicious input file.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-69645.patch    | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69645.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 7e83f72632..8f775f20e7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,6 @@ SRC_URI =3D "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69645.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch
new file mode 100644
index 0000000000..78d2d62a50
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch
@@ -0,0 +1,135 @@
+From 3fe207e0625a76c8cba932e435762bfb5f544131 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 30 Nov 2025 12:51:54 +1030
+Subject: [PATCH] PR 33637, abort in byte_get
+
+When DWARF5 support was added to binutils in commit 77145576fadc,
+the loop over CUs in process_debug_info set do_types when finding a
+DW_UT_type unit, in order to process the signature and type offset
+entries.  Unfortunately that broke debug_information/debug_info_p
+handling, which previously was allocated and initialised for each unit
+in .debug_info.  debug_info_p was NULL when processing a DWARF4
+.debug_types section.  After the 77145576fadc change it was possible
+for debug_infp_p to be non-NULL but point to zeroed data, in
+particular a zeroed offset_size.  A zero for offset_size led to the
+byte_get_little_endian abort triggered by the fuzzer testcase.
+
+I haven't investigated whether there is any need for a valid
+offset_size when processing a non-fuzzed DWARF4 .debug_types section.
+Presumably we'd have found that out in the last 6 years if that was
+the case.  We don't want to change debug_information[] for
+.debug_types!
+
+	PR 33637
+	* dwarf.c (process_debug_info): Don't change DO_TYPES flag bit
+	depending on cu_unit_type.  Instead test cu_unit_type along
+	with DO_TYPES to handle signature and type_offset for a type
+	unit.  Move find_cu_tu_set_v2 call a little later.
+
+CVE: CVE-2025-69645
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3Dcdb728d4da6184631989b192f1022c219dea7677]
+
+Note:
+  Backported patch differs from upstream as commit
+  1f7e70ddd2c49dd5442b8873dd6ef29b0a10fdc3 is not cherry-picked
+  just to introduce `do_flags` instead of the separate `do_type`
+  and `do_loc` booleans for it to apply cleanly.
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ binutils/dwarf.c | 18 ++++++------------
+ 1 file changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 615e051b2bf..836872f1b26 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -3865,8 +3865,6 @@ process_debug_info (struct dwarf_section * section,
+=20
+       SAFE_BYTE_GET_AND_INC (compunit.cu_version, hdrptr, 2, end_cu);
+=20
+-      this_set =3D find_cu_tu_set_v2 (cu_offset, do_types);
+-
+       if (compunit.cu_version < 5)
+ 	{
+ 	  compunit.cu_unit_type =3D DW_UT_compile;
+@@ -3876,8 +3874,6 @@ process_debug_info (struct dwarf_section * section,
+       else
+ 	{
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_unit_type, hdrptr, 1, end_cu);
+-	  do_types =3D (compunit.cu_unit_type =3D=3D DW_UT_type);
+-
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_pointer_size, hdrptr, 1, end_cu);
+ 	}
+=20
+@@ -3891,6 +3887,7 @@ process_debug_info (struct dwarf_section * section,
+ 	  SAFE_BYTE_GET_AND_INC (dwo_id, hdrptr, 8, end_cu);
+ 	}
+=20
++      this_set =3D find_cu_tu_set_v2 (cu_offset, do_types);
+       if (this_set =3D=3D NULL)
+ 	{
+ 	  abbrev_base =3D 0;
+@@ -3947,8 +3944,6 @@ process_debug_info (struct dwarf_section * section,
+=20
+       SAFE_BYTE_GET_AND_INC (compunit.cu_version, hdrptr, 2, end_cu);
+=20
+-      this_set =3D find_cu_tu_set_v2 (cu_offset, do_types);
+-
+       if (compunit.cu_version < 5)
+ 	{
+ 	  compunit.cu_unit_type =3D DW_UT_compile;
+@@ -3958,13 +3953,12 @@ process_debug_info (struct dwarf_section * section=
,
+       else
+ 	{
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_unit_type, hdrptr, 1, end_cu);
+-	  do_types =3D (compunit.cu_unit_type =3D=3D DW_UT_type);
+-
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_pointer_size, hdrptr, 1, end_cu);
+ 	}
+=20
+       SAFE_BYTE_GET_AND_INC (compunit.cu_abbrev_offset, hdrptr, offset_si=
ze, end_cu);
+=20
++      this_set =3D find_cu_tu_set_v2 (cu_offset, do_types);
+       if (this_set =3D=3D NULL)
+ 	{
+ 	  abbrev_base =3D 0;
+@@ -3996,7 +3990,7 @@ process_debug_info (struct dwarf_section * section,
+ 	  compunit.cu_pointer_size =3D offset_size;
+ 	}
+=20
+-      if (do_types)
++      if (do_types || compunit.cu_unit_type =3D=3D DW_UT_type)
+ 	{
+ 	  SAFE_BYTE_GET_AND_INC (signature, hdrptr, 8, end_cu);
+ 	  SAFE_BYTE_GET_AND_INC (type_offset, hdrptr, offset_size, end_cu);
+@@ -4011,7 +4005,7 @@ process_debug_info (struct dwarf_section * section,
+       if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+ 	  && num_debug_info_entries =3D=3D 0
+ 	  && alloc_num_debug_info_entries > unit
+-	  && ! do_types)
++	  && !do_types)
+ 	{
+ 	  free_debug_information (&debug_information[unit]);
+ 	  memset (&debug_information[unit], 0, sizeof (*debug_information));
+@@ -4042,7 +4036,7 @@ process_debug_info (struct dwarf_section * section,
+ 	  printf (_("   Abbrev Offset: %#" PRIx64 "\n"),
+ 		  compunit.cu_abbrev_offset);
+ 	  printf (_("   Pointer Size:  %d\n"), compunit.cu_pointer_size);
+-	  if (do_types)
++	  if (do_types || compunit.cu_unit_type =3D=3D DW_UT_type)
+ 	    {
+ 	      printf (_("   Signature:     %#" PRIx64 "\n"), signature);
+ 	      printf (_("   Type Offset:   %#" PRIx64 "\n"), type_offset);
+@@ -4319,7 +4313,7 @@ process_debug_info (struct dwarf_section * section,
+      we need to process .debug_loc and .debug_ranges sections.  */
+   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+       && num_debug_info_entries =3D=3D 0
+-      && ! do_types)
++      && !do_types)
+     {
+       if (num_units > alloc_num_debug_info_entries)
+ 	num_debug_info_entries =3D alloc_num_debug_info_entries;
+--=20
+2.34.1
+
--=20
2.34.1


