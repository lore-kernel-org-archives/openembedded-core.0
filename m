Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C86CDB483
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 00:28:44 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.100])
 by mx.groups.io with SMTP id smtpd.web10.54243.1697243319637195278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 17:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=EiJI0SE6;
 spf=pass (domain: ni.com, ip: 40.107.236.100, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL6cmki+2HmXCzUYPncJXnjVHCr8C1WPUOulXE7J4R3mutMlKI36hqtvZYueypZdomGj60jxjmyvgHUD4k+ogVW21FVOItRriZQiHLB6tgbdA4EoAEi7uhY1kjbhyz40zd8eL98Hpv9zgKljbNhV0punkALjsznkD4NX/l3jkPdIKBDEocS55pbVftynN7KADIErYXUa62WUoAB0xa+Jxu31QyrFQr+XL3rL4quRBmhXPxicEqaedxsousclGbWunlKZVW5ZB3j462E7biftDMHyhynwA1e/+BowV4Pr0WHoK4JujuHZuX90N64Uw53dLJzZe3mOMug77BuMrcMjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Srnm/I2rP4nB9qOsVpOcvGTXUlX0s9/dh/2qTiWmIs=;
 b=dXXtij4QzmnAtSW1M2WVGOMoHRnuxfVMYPljLfZ3S/Z0x6mgvuVswoQQ4fxaKBp6dvqb5kry59x9yIoR7bXZpvXZVnQZcjF3OSq7EtbGhtlEOVwo7Lhq353I4/MPVX5eqX8igrypMZeWoS6e74X/QkbB7FG34Erffk9YIcYptki2Y6aHfNZi19WbEamwovF8l9yyT04ap3MkIrdA2KuuOqSqdYJdJz7Pfqkd+7MUJbAIP/7KcnpkSJoOC9BwyWbfBWpeO1tZWXjGbD05f5MErqo5qn0Kgy8uWUdqt54se5Bh9CudgYMK6kxTTvCaPOsIlcygj7lOxXkVAUcHA3nOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Srnm/I2rP4nB9qOsVpOcvGTXUlX0s9/dh/2qTiWmIs=;
 b=EiJI0SE6ORXlAXuFLnlkERrbReti9HepGaL6sUXTJ5PDC48rKabepTehcEzxNUwS6jFrVx4Y2C5aXKGHcTKKsNj6DOj30KHgGdviy+XkJFD+WlllUc2VPWlgHC05+oy8b0WM7alPlLD59dLaENm96goGlUVpqd6DOknoHo9omLc=
Received: from MN2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:208:120::30)
 by CH3PR04MB8972.namprd04.prod.outlook.com (2603:10b6:610:1a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30; Sat, 14 Oct
 2023 00:28:36 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:120:cafe::13) by MN2PR10CA0017.outlook.office365.com
 (2603:10b6:208:120::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Sat, 14 Oct 2023 00:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 00:28:33 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 13 Oct 2023 19:28:31 -0500
Received: from cvadrevu-p620.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 13 Oct 2023 19:28:31
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH 3/5] binutils: Fix CVE-2022-45703
Date: Fri, 13 Oct 2023 19:27:18 -0500
Message-ID: <20231014002720.491416-3-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
References: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|CH3PR04MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 47009cef-899f-45b6-d574-08dbcc4c7fed
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qg1i5cH8NV1EuhlCOeusV7Mz7MQkoipzSla37e1+4xykH15kE+HKLCG/2wx7goFO8nYG6cClb1Dz33mhXdB/SPMPHXXqOBg4DCoknNVTMNYvOZtsgAHS4U9XPBVDrY6NuL9t43VGNz+018ffdgHJh4y3v8imNcMEn+2S0kWddft53LqA9YNzvsEnOrctQUmpNZkX00y0Tcbwh/XrMIIthWv1tuUTfkDwS5CS4FE+rOnkEFhOR/ivvkVAlHbufEKGJKeq3PCwz1PDng1oXzuNmD0XVggHZ5UHrNK9bab6/gag0sVSixKn+eln7V96h3U/FBKIy5v6O5CoTLnxlCv5JhtWSfsfxEq52r+5q7XWojylH8gcGHdZziAnMQCceGx4sgC8B8vBxBtqfu3gk1A5FnrUbMBTDWXvuUbVMbvTzRSY+vl+QPO0gkOfmGn49r/XDfvR+y6T2TA+/nGO7eWlg1Da+0N6G2IRqYXjKB6wNMx2ldRoxJ0uILxF6wtHJJ7kbEP2oIkYBl106NZ8IkdbpRZfI0E4sfj4ivbUS3COShRBh7KFYO3f3VQxXeqQFfXGEuCARILbefZf2xeeHT73REZwzTEvBsSqd6M4AsbJLqKkHQ6XK6m9M7tzLcTFL2bBTHt3gitU350ZzIH45veWQfQ91hcGxNR6aoe1s/3H9UjjvYh5gvPCH3UCpmCXnQVSmJzr4A7+8eEilRRG8UrWVKEyKr/h+WVAuX92v/rIQpz8otPJ3SLXIUOsouNHAAau
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(47076005)(36860700001)(478600001)(40460700003)(26005)(2616005)(8676002)(336012)(83380400001)(40480700001)(2906002)(86362001)(44832011)(41300700001)(8936002)(5660300002)(4326008)(81166007)(6666004)(966005)(70206006)(316002)(36756003)(6916009)(70586007)(356005)(82740400003)(1076003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:28:33.7837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47009cef-899f-45b6-d574-08dbcc4c7fed
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 00:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189107

Upstream-Status: Backport following
  * https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D244=
e19c79111eed017ee38ab1d44fb2a6cd1b636
  * https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D69b=
fd1759db41c8d369f9dcc98a135c5a5d97299

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/0032-CVE-2022-45703-1.patch      | 146 ++++++++++++++++++
 .../binutils/0032-CVE-2022-45703-2.patch      |  31 ++++
 3 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0032-CVE-2022-4=
5703-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0032-CVE-2022-4=
5703-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipe=
s-devtools/binutils/binutils-2.38.inc
index 89d8fdeba85..ec5ba36d9a6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -61,5 +61,7 @@ SRC_URI =3D "\
      file://0029-CVE-2022-48065-3.patch \
      file://0030-CVE-2022-44840.patch \
      file://0031-CVE-2022-47695.patch \
+     file://0032-CVE-2022-45703-1.patch \
+     file://0032-CVE-2022-45703-2.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-45703-1.=
patch b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-45703-1.patch
new file mode 100644
index 00000000000..2289d18c61b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-45703-1.patch
@@ -0,0 +1,146 @@
+From 02c8847ad5686f77a842cdb395a41240445f90de Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 24 May 2022 09:32:14 +0930
+Subject: [PATCH] PR29169, invalid read displaying fuzzed .gdb_index
+
+	PR 29169
+	* dwarf.c (display_gdb_index): Combine sanity checks.  Calculate
+	element counts, not word counts.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D244e19c79111eed017ee38ab1d44fb2a6cd1b636]
+
+CVE: CVE-2022-45703
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ binutils/dwarf.c | 80 +++++++++++++-----------------------------------
+ 1 file changed, 22 insertions(+), 58 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2d151c60817..5e802ac78cd 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10463,7 +10463,7 @@ display_gdb_index (struct dwarf_section *section,
+   uint32_t cu_list_offset, tu_list_offset;
+   uint32_t address_table_offset, symbol_table_offset, constant_pool_offse=
t;
+   unsigned int cu_list_elements, tu_list_elements;
+-  unsigned int address_table_size, symbol_table_slots;
++  unsigned int address_table_elements, symbol_table_slots;
+   unsigned char *cu_list, *tu_list;
+   unsigned char *address_table, *symbol_table, *constant_pool;
+   unsigned int i;
+@@ -10511,48 +10511,19 @@ display_gdb_index (struct dwarf_section *section=
,
+       || tu_list_offset > section->size
+       || address_table_offset > section->size
+       || symbol_table_offset > section->size
+-      || constant_pool_offset > section->size)
++      || constant_pool_offset > section->size
++      || tu_list_offset < cu_list_offset
++      || address_table_offset < tu_list_offset
++      || symbol_table_offset < address_table_offset
++      || constant_pool_offset < symbol_table_offset)
+     {
+       warn (_("Corrupt header in the %s section.\n"), section->name);
+       return 0;
+     }
+=20
+-  /* PR 17531: file: 418d0a8a.  */
+-  if (tu_list_offset < cu_list_offset)
+-    {
+-      warn (_("TU offset (%x) is less than CU offset (%x)\n"),
+-	    tu_list_offset, cu_list_offset);
+-      return 0;
+-    }
+-
+-  cu_list_elements =3D (tu_list_offset - cu_list_offset) / 8;
+-
+-  if (address_table_offset < tu_list_offset)
+-    {
+-      warn (_("Address table offset (%x) is less than TU offset (%x)\n"),
+-	    address_table_offset, tu_list_offset);
+-      return 0;
+-    }
+-
+-  tu_list_elements =3D (address_table_offset - tu_list_offset) / 8;
+-
+-  /* PR 17531: file: 18a47d3d.  */
+-  if (symbol_table_offset < address_table_offset)
+-    {
+-      warn (_("Symbol table offset (%x) is less then Address table offset=
 (%x)\n"),
+-	    symbol_table_offset, address_table_offset);
+-      return 0;
+-    }
+-
+-  address_table_size =3D symbol_table_offset - address_table_offset;
+-
+-  if (constant_pool_offset < symbol_table_offset)
+-    {
+-      warn (_("Constant pool offset (%x) is less than symbol table offset=
 (%x)\n"),
+-	    constant_pool_offset, symbol_table_offset);
+-      return 0;
+-    }
+-
++  cu_list_elements =3D (tu_list_offset - cu_list_offset) / 16;
++  tu_list_elements =3D (address_table_offset - tu_list_offset) / 24;
++  address_table_elements =3D (symbol_table_offset - address_table_offset)=
 / 20;
+   symbol_table_slots =3D (constant_pool_offset - symbol_table_offset) / 8=
;
+=20
+   cu_list =3D start + cu_list_offset;
+@@ -10561,31 +10532,25 @@ display_gdb_index (struct dwarf_section *section=
,
+   symbol_table =3D start + symbol_table_offset;
+   constant_pool =3D start + constant_pool_offset;
+=20
+-  if (address_table_offset + address_table_size > section->size)
+-    {
+-      warn (_("Address table extends beyond end of section.\n"));
+-      return 0;
+-    }
+-
+   printf (_("\nCU table:\n"));
+-  for (i =3D 0; i < cu_list_elements; i +=3D 2)
++  for (i =3D 0; i < cu_list_elements; i++)
+     {
+-      uint64_t cu_offset =3D byte_get_little_endian (cu_list + i * 8, 8);
+-      uint64_t cu_length =3D byte_get_little_endian (cu_list + i * 8 + 8,=
 8);
++      uint64_t cu_offset =3D byte_get_little_endian (cu_list + i * 16, 8)=
;
++      uint64_t cu_length =3D byte_get_little_endian (cu_list + i * 16 + 8=
, 8);
+=20
+-      printf (_("[%3u] 0x%lx - 0x%lx\n"), i / 2,
++      printf (_("[%3u] 0x%lx - 0x%lx\n"), i,
+ 	      (unsigned long) cu_offset,
+ 	      (unsigned long) (cu_offset + cu_length - 1));
+     }
+=20
+   printf (_("\nTU table:\n"));
+-  for (i =3D 0; i < tu_list_elements; i +=3D 3)
++  for (i =3D 0; i < tu_list_elements; i++)
+     {
+-      uint64_t tu_offset =3D byte_get_little_endian (tu_list + i * 8, 8);
+-      uint64_t type_offset =3D byte_get_little_endian (tu_list + i * 8 + =
8, 8);
+-      uint64_t signature =3D byte_get_little_endian (tu_list + i * 8 + 16=
, 8);
++      uint64_t tu_offset =3D byte_get_little_endian (tu_list + i * 24, 8)=
;
++      uint64_t type_offset =3D byte_get_little_endian (tu_list + i * 24 +=
 8, 8);
++      uint64_t signature =3D byte_get_little_endian (tu_list + i * 24 + 1=
6, 8);
+=20
+-      printf (_("[%3u] 0x%lx 0x%lx "), i / 3,
++      printf (_("[%3u] 0x%lx 0x%lx "), i,
+ 	      (unsigned long) tu_offset,
+ 	      (unsigned long) type_offset);
+       print_dwarf_vma (signature, 8);
+@@ -10593,12 +10558,11 @@ display_gdb_index (struct dwarf_section *section=
,
+     }
+=20
+   printf (_("\nAddress table:\n"));
+-  for (i =3D 0; i < address_table_size && i <=3D address_table_size - (2 =
* 8 + 4);
+-       i +=3D 2 * 8 + 4)
++  for (i =3D 0; i < address_table_elements; i++)
+     {
+-      uint64_t low =3D byte_get_little_endian (address_table + i, 8);
+-      uint64_t high =3D byte_get_little_endian (address_table + i + 8, 8)=
;
+-      uint32_t cu_index =3D byte_get_little_endian (address_table + i + 1=
6, 4);
++      uint64_t low =3D byte_get_little_endian (address_table + i * 20, 8)=
;
++      uint64_t high =3D byte_get_little_endian (address_table + i * 20 + =
8, 8);
++      uint32_t cu_index =3D byte_get_little_endian (address_table + i + 2=
0 + 16, 4);
+=20
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
diff --git a/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-45703-2.=
patch b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-45703-2.patch
new file mode 100644
index 00000000000..06f1b2430af
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-45703-2.patch
@@ -0,0 +1,31 @@
+From 37a35dc3c13957a55d83350a28279a9ea4218648 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 18 Nov 2022 11:29:13 +1030
+Subject: [PATCH] PR29799 heap buffer overflow in display_gdb_index
+ dwarf.c:10548
+
+	PR 29799
+	* dwarf.c (display_gdb_index): Typo fix.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D69bfd1759db41c8d369f9dcc98a135c5a5d97299]
+
+CVE: CVE-2022-45703
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ binutils/dwarf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 5e802ac78cd..a6a33b29c80 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10562,7 +10562,7 @@ display_gdb_index (struct dwarf_section *section,
+     {
+       uint64_t low =3D byte_get_little_endian (address_table + i * 20, 8)=
;
+       uint64_t high =3D byte_get_little_endian (address_table + i * 20 + =
8, 8);
+-      uint32_t cu_index =3D byte_get_little_endian (address_table + i + 2=
0 + 16, 4);
++      uint32_t cu_index =3D byte_get_little_endian (address_table + i * 2=
0 + 16, 4);
+=20
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
--=20
2.34.1


