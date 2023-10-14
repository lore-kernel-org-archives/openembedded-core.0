Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CE5CDB47E
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 00:28:44 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.100])
 by mx.groups.io with SMTP id smtpd.web10.54241.1697243316905677820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 17:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=GctU1cQT;
 spf=pass (domain: ni.com, ip: 40.107.236.100, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbTrTdgAsAJ08tOrr3ILUDGahO6zKdb/bEGXTkG1L22EIpYKdRidfr0BFhTicIe2v/8rroHE3TaBe6+bnHa4PpK/+T6l6Q2kVDZQly5x6hFUFXlNS5tGvliKhkX+jreY+wcA0nZg+G92IvD9m1/79fYmfmCQOHU/vP9REoYR//UX+bv1S5TyYgCS58K7hHn0aanTUjcsBKHU168+6wR/rAP68V50yVCdADmcwav1nG0Phh7m92e5kowwcfbvt3QbLFUpbDbxMobq8bbSj8iJDoXAXlWP/TchPwHScI0uU2FC3G9LeT8jWJbksh874OP73Xh9A5+Jr+XndTzf0JAMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EdTODD2ilS14lzST0bOSgOl7O5r6pWXOrzWp7mUkhs=;
 b=QhIl7IvEZvsO6ubT2++ngyfriDiJhHrg4bE+KLuGDH+LibJeydQxvUIpmBsgfRj3J3Ru3b8wceb7rY7jZf+U6hAktty3bie0mQUvCju5ztpHwx9uL/QQkluBZvGh4apUwZ5frO9Dzqa+2PqoIB4+3J3KoYpjvB5gB5BFYD7rnOFDBuRd6nBIEDeZsl6s/pk4FfZ34lFnEQz5y9QorA8HPOM0W5MY21WWj5UUGmyaY4wJkqKYboiYkdB1DRaOAMNJHvZSu/nHXFe9JnfgN2r14CjGq7oS9M17sT5LBCKz+cuKca6J9ZT2u8npwHiU7irPvbiI6Xk6qQvtw8vynkdo1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EdTODD2ilS14lzST0bOSgOl7O5r6pWXOrzWp7mUkhs=;
 b=GctU1cQTYufeYic/n+O57oDpWssSPT8d5frEpqc6yf6b5jC3KCLpVnPTb6eXeeVyi8zGncgHRMzrWJWs653X6jT+N9K+9k+B9enHIH0E5/C3Xc7YX/fw3gYE40JFs7LUrkztvAC6BdufyJhXZSefFw1l4/O21YSY1q42A8c4cUk=
Received: from MN2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:208:120::42)
 by MW6PR04MB8820.namprd04.prod.outlook.com (2603:10b6:303:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Sat, 14 Oct
 2023 00:28:33 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:120:cafe::59) by MN2PR10CA0029.outlook.office365.com
 (2603:10b6:208:120::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.27 via Frontend
 Transport; Sat, 14 Oct 2023 00:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 00:28:30 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 13 Oct 2023 19:28:30 -0500
Received: from cvadrevu-p620.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 13 Oct 2023 19:28:30
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH 2/5] binutils: Fix CVE-2022-47695
Date: Fri, 13 Oct 2023 19:27:17 -0500
Message-ID: <20231014002720.491416-2-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
References: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|MW6PR04MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 393c67ca-95f8-448c-61cf-08dbcc4c7e13
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k6stA/7MLO+JGLTXJ7QQAvZBn5mWUyzROeVmfURLN50sdz2uiv2OT4S+k4bfTDoI346siH3e8a9jlpblqK9Dx2NeeYgwcFJKvnVjI3mIsOMxsIXM2jY8L9QrA62VuoQ6q64s0f8nVuLOtxtBrutkJTfj3F5Ltsfy9l+XjCWOfqKwxdASxmRgCODdcDU22DVlQMNZzNt3WvBPVhzE2rdn7FHtUHaWtSMfrZ73UdUfGHjseQb8ayZTVV4Yd215m2AeMFTJsE1+libdqMk8vz6LCTRGnYhp+J5EcI89AlbeFNnb+EcKp+TN9A/tQCyATvDyvV97PTuvi/N/Wi79XbC48kTvtDDzSjVTdSIAXNw0XbK0qMQ+BHYX1EhQUKxLS1zus7efZ8N1HDtV7Uq/zxSA3Hv3UywtsKpQQlGecyZNe7+G5Jv/l1KX2nrc4FtB6eNnQA5Zw42GdX19tenn79gw1GTCXkNBemT5pW3f7cIniCM3FEnj5xC3qLsOhS4MsYGYiBPqmZzHyMrLv6ATMMzKRXDV/+scTXektQ32LXUHzeXtCWB9HiiYQun11dlKucvoIjP2XdE8qkU3g8PwLuvCReejX0KJ1y01l02JT9xSwOFOnvzhgTTzuvIEZQ+qv36NOhBflLb1mc/oq/TGrTUM8m2wX5lx4Xn5Rj1TPuuM8LdSb+5pc6CFxz9nUlw2EbKl/cdAJDqT5vHwAaWQy1z6hJ2G2ldyzwKTIzLQOp/SYSke1h+Eqg4PheQ2so5dMWE3
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(82310400011)(451199024)(64100799003)(186009)(40470700004)(46966006)(36840700001)(1076003)(44832011)(2616005)(40480700001)(36756003)(478600001)(36860700001)(82740400003)(81166007)(356005)(40460700003)(83380400001)(6666004)(47076005)(336012)(4326008)(2906002)(316002)(86362001)(8676002)(41300700001)(26005)(70586007)(5660300002)(6916009)(70206006)(8936002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:28:30.6431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 393c67ca-95f8-448c-61cf-08dbcc4c7e13
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR04MB8820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 00:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189106

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D3d3af4ba39e892b1c544d667ca241846bc3df386]

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0031-CVE-2022-47695.patch        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-4=
7695.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipe=
s-devtools/binutils/binutils-2.38.inc
index 7c5d8f79ec6..89d8fdeba85 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -60,5 +60,6 @@ SRC_URI =3D "\
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
      file://0030-CVE-2022-44840.patch \
+     file://0031-CVE-2022-47695.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.pa=
tch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch
new file mode 100644
index 00000000000..f2e9cea0273
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch
@@ -0,0 +1,58 @@
+From 2f7426b9bb2d2450b32cad3d79fab9abe3ec42bb Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 4 Dec 2022 22:15:40 +1030
+Subject: [PATCH] PR29846, segmentation fault in objdump.c compare_symbols
+
+Fixes a fuzzed object file problem where plt relocs were manipulated
+in such a way that two synthetic symbols were generated at the same
+plt location.  Won't occur in real object files.
+
+	PR 29846
+	PR 20337
+	* objdump.c (compare_symbols): Test symbol flags to exclude
+	section and synthetic symbols before attempting to check flavour.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D3d3af4ba39e892b1c544d667ca241846bc3df386]
+
+CVE: CVE-2022-47695
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ binutils/objdump.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 08a0fe521d8..21f75f4db40 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -1165,20 +1165,17 @@ compare_symbols (const void *ap, const void *bp)
+ 	return 1;
+     }
+=20
+-  if (bfd_get_flavour (bfd_asymbol_bfd (a)) =3D=3D bfd_target_elf_flavour
++  /* Sort larger size ELF symbols before smaller.  See PR20337.  */
++  bfd_vma asz =3D 0;
++  if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) =3D=3D 0
++      && bfd_get_flavour (bfd_asymbol_bfd (a)) =3D=3D bfd_target_elf_flav=
our)
++    asz =3D ((elf_symbol_type *) a)->internal_elf_sym.st_size;
++  bfd_vma bsz =3D 0;
++  if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) =3D=3D 0
+       && bfd_get_flavour (bfd_asymbol_bfd (b)) =3D=3D bfd_target_elf_flav=
our)
+-    {
+-      bfd_vma asz, bsz;
+-
+-      asz =3D 0;
+-      if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) =3D=3D 0)
+-	asz =3D ((elf_symbol_type *) a)->internal_elf_sym.st_size;
+-      bsz =3D 0;
+-      if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) =3D=3D 0)
+-	bsz =3D ((elf_symbol_type *) b)->internal_elf_sym.st_size;
+-      if (asz !=3D bsz)
+-	return asz > bsz ? -1 : 1;
+-    }
++    bsz =3D ((elf_symbol_type *) b)->internal_elf_sym.st_size;
++  if (asz !=3D bsz)
++    return asz > bsz ? -1 : 1;
+=20
+   /* Symbols that start with '.' might be section names, so sort them
+      after symbols that don't start with '.'.  */
--=20
2.34.1


