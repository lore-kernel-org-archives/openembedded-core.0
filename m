Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEF4CDB47E
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 00:28:34 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.119])
 by mx.groups.io with SMTP id smtpd.web10.54240.1697243312325641715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 17:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=EOSo5b0B;
 spf=pass (domain: ni.com, ip: 40.107.93.119, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIo7Am9D56j10OtswEAsoilD3XDrF2fDrgagd/n9D09ov8PNqYGS8cBcFr8AA7NO8e01Gub27qIIyufM63pifH5CQnitM8uAAiRqn8WeAFa+LO4TfkSDo59jSjQD/73KtzmVCzphmYLLLkUMorPT3KzvuJa/CDGPc/3VINX6M6k3LdkC3regUd9uI1O+H406SHwPn0NwAd/W4dlEsjdW3TURHEmCS9Oo2o/nJiHQfizQ6Pms/WZvQgKE5HCWKFWI78LRtG0oMpbtsXbmfI0/oofkC2dX/cYaeM48X9VhreYZiWBbIhjMutve3fNXCgf72P77bA5yDGJtFCFQTx/Ayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/d99uRWZ8qJBXQwho6QJt9lNosNiR2/FQZ5lacFMjk=;
 b=YuiIAwK1MpkRbBads7MFAB63M1NuDEseH9peBxtl2vb9mWiLYI7aOsrC85tN+IANItXnFJUU59HSMgsnJfKsQcWmJdMEZklkLESOsy9GDMdAdv+kbvY/BLbMww8Hx1f3OVIkDw9u1/D632JVIq91D8qdmmUhkZcNid5TR4h+69YqzGkS2smWMgCxvYqhApidK9sSOI/PtB3AnOShiQp0wdSAfcwMV/cZ2IWnve1hHNB5oND49qEftOoyNKe8FgYzA6bfyynrXvN0lTC+D2wxUiudINnBn6SnnjZbkXRgbFucIblZuExB3HI1halrj99x09l53TjejRkRqRr5ujcWog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/d99uRWZ8qJBXQwho6QJt9lNosNiR2/FQZ5lacFMjk=;
 b=EOSo5b0Bujowyf68isqlRDwwDcMuv/V3Iuy2/FAogKO/4dq9y9rWdujJtRgvME1tiyFesNtd+V+COVKYenUMJ36mg1u+ZBeifIa9kpXt4U0F0qZ7b3rEqtlpZia5D/Fbr0slrs0aXtmT60ZCF694L+Sh+Ev5Oep1AUZl5b7tO4M=
Received: from MN2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:208:239::31)
 by SJ0PR04MB7709.namprd04.prod.outlook.com (2603:10b6:a03:329::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30; Sat, 14 Oct
 2023 00:28:28 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::1e) by MN2PR08CA0026.outlook.office365.com
 (2603:10b6:208:239::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29 via Frontend
 Transport; Sat, 14 Oct 2023 00:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 00:28:26 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Fri, 13 Oct 2023 19:28:26 -0500
Received: from cvadrevu-p620.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Fri, 13 Oct 2023 19:28:26
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH 1/5] binutils: Fix CVE-2022-44840
Date: Fri, 13 Oct 2023 19:27:16 -0500
Message-ID: <20231014002720.491416-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|SJ0PR04MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8c1156-91a6-43d6-cc91-08dbcc4c7bd0
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PMdsRX/qPiPj6AGjo8Gv9F/yqbQIsPUTEsgLSpH7oeR4QLqllqSXUgLhc1+GL4WvTzHSbcFPp2YR7VNuosil5gCgCV5fgKH2c8VxH9Ndgr5sEaNbLp6D0dw5teJFMR60Qm+06/XpxMvjKqPKELWnEEymF2mHG+RMn2EH1Xqm5wEi5KLTPiw3L5P4X1ctGMjpJFzNqgjPSbvkmijArkDqnyjEybjbnlCCJwZ1Qhq7ECcru6On06DH5Ylk2GFKlWskzOj6hPivYLwbVKX0MbuPEd6bIcVHNrPJ5FN5qEhDvroNS1ESZOBUfRAGqoXPPYsH1uhZP+lWwdd+oa8YuJ22iF79WFvJnRvRV3G4UenXo7S/AdSuyXqPGX68PTK9IoCZJJKJtXzxDZXG4cbGh3Fazb8LBLkosCZWnCQClJT3TfkiA64Zrje6rx1hviXQDoaffX3pKhd1ujxNF2Pe6WYdDhX/tMzgIwtfnQaD8dAjQjxBEb4FR/5d6MYtNXZJ0OoR34hMnwMw36IzLWeLEyXCiduMY7sVAfbeKzFESbBL702A/W3Gxt/rT4Xq/6ez7c+6EBhNkkwmHMds7n04hZchilnTiai85UPfwXxNLsn8VJpSmv0qfR4wYkoEqNfmzcMeXnXtgjg+i2w2qUsDc7GhGxpWV/3SYW+XhLKNaQkNwvMnqURJfEBu3C1fFNrvxCzsWAO+G+sSgzDAC+LBy5ZYQNbfEnkD2my+doPxe1I2LYENULVrULb8K6WaM+g/VMWS
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(36840700001)(46966006)(40470700004)(82740400003)(6666004)(966005)(83380400001)(5660300002)(40480700001)(41300700001)(70586007)(478600001)(36756003)(70206006)(47076005)(356005)(81166007)(86362001)(2906002)(36860700001)(2616005)(44832011)(40460700003)(316002)(6916009)(1076003)(4326008)(8676002)(26005)(8936002)(336012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:28:26.8981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8c1156-91a6-43d6-cc91-08dbcc4c7bd0
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 00:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189105

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D28750e3b967da2207d51cbce9fc8be262817ee59]

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0030-CVE-2022-44840.patch        | 151 ++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2022-4=
4840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipe=
s-devtools/binutils/binutils-2.38.inc
index 638b1ba93de..7c5d8f79ec6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -59,5 +59,6 @@ SRC_URI =3D "\
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
+     file://0030-CVE-2022-44840.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.pa=
tch b/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
new file mode 100644
index 00000000000..43c92e56666
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
@@ -0,0 +1,151 @@
+From 56e74b51b905bf169315107a280b5c2632e13c07 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 30 Oct 2022 19:08:51 +1030
+Subject: [PATCH] Pool section entries for DWP version 1
+
+Ref: https://gcc.gnu.org/wiki/DebugFissionDWP?action=3Drecall&rev=3D3
+
+Fuzzers have found a weakness in the code stashing pool section
+entries.  With random nonsensical values in the index entries (rather
+than each index pointing to its own set distinct from other sets),
+it's possible to overflow the space allocated, losing the NULL
+terminator.  Without a terminator, find_section_in_set can run off the
+end of the shndx_pool buffer.  Fix this by scanning the pool directly.
+
+binutils/
+	* dwarf.c (add_shndx_to_cu_tu_entry): Delete range check.
+	(end_cu_tu_entry): Likewise.
+	(process_cu_tu_index): Fill shndx_pool by directly scanning
+	pool, rather than indirectly from index entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D28750e3b967da2207d51cbce9fc8be262817ee59]
+
+CVE: CVE-2022-44840
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ binutils/dwarf.c | 90 ++++++++++++++++++++++--------------------------
+ 1 file changed, 41 insertions(+), 49 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index f8fa2f68387..28b296f54dd 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10705,22 +10705,12 @@ prealloc_cu_tu_list (unsigned int nshndx)
+ static void
+ add_shndx_to_cu_tu_entry (unsigned int shndx)
+ {
+-  if (shndx_pool_used >=3D shndx_pool_size)
+-    {
+-      error (_("Internal error: out of space in the shndx pool.\n"));
+-      return;
+-    }
+   shndx_pool [shndx_pool_used++] =3D shndx;
+ }
+=20
+ static void
+ end_cu_tu_entry (void)
+ {
+-  if (shndx_pool_used >=3D shndx_pool_size)
+-    {
+-      error (_("Internal error: out of space in the shndx pool.\n"));
+-      return;
+-    }
+   shndx_pool [shndx_pool_used++] =3D 0;
+ }
+=20
+@@ -10826,53 +10816,55 @@ process_cu_tu_index (struct dwarf_section *secti=
on, int do_display)
+=20
+   if (version =3D=3D 1)
+     {
++      unsigned char *shndx_list;
++      unsigned int shndx;
++
+       if (!do_display)
+-	prealloc_cu_tu_list ((limit - ppool) / 4);
+-      for (i =3D 0; i < nslots; i++)
+ 	{
+-	  unsigned char *shndx_list;
+-	  unsigned int shndx;
+-
+-	  SAFE_BYTE_GET (signature, phash, 8, limit);
+-	  if (signature !=3D 0)
++	  prealloc_cu_tu_list ((limit - ppool) / 4);
++	  for (shndx_list =3D ppool + 4; shndx_list <=3D limit - 4; shndx_list +=
=3D 4)
+ 	    {
+-	      SAFE_BYTE_GET (j, pindex, 4, limit);
+-	      shndx_list =3D ppool + j * 4;
+-	      /* PR 17531: file: 705e010d.  */
+-	      if (shndx_list < ppool)
+-		{
+-		  warn (_("Section index pool located before start of section\n"));
+-		  return 0;
+-		}
++	      shndx =3D byte_get (shndx_list, 4);
++	      add_shndx_to_cu_tu_entry (shndx);
++	    }
++	  end_cu_tu_entry ();
++	}
++      else
++	for (i =3D 0; i < nslots; i++)
++	  {
++	    SAFE_BYTE_GET (signature, phash, 8, limit);
++	    if (signature !=3D 0)
++	      {
++		SAFE_BYTE_GET (j, pindex, 4, limit);
++		shndx_list =3D ppool + j * 4;
++		/* PR 17531: file: 705e010d.  */
++		if (shndx_list < ppool)
++		  {
++		    warn (_("Section index pool located before start of section\n"));
++		    return 0;
++		  }
+=20
+-	      if (do_display)
+ 		printf (_("  [%3d] Signature:  0x%s  Sections: "),
+ 			i, dwarf_vmatoa ("x", signature));
+-	      for (;;)
+-		{
+-		  if (shndx_list >=3D limit)
+-		    {
+-		      warn (_("Section %s too small for shndx pool\n"),
+-			    section->name);
+-		      return 0;
+-		    }
+-		  SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
+-		  if (shndx =3D=3D 0)
+-		    break;
+-		  if (do_display)
++		for (;;)
++		  {
++		    if (shndx_list >=3D limit)
++		      {
++			warn (_("Section %s too small for shndx pool\n"),
++			      section->name);
++			return 0;
++		      }
++		    SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
++		    if (shndx =3D=3D 0)
++		      break;
+ 		    printf (" %d", shndx);
+-		  else
+-		    add_shndx_to_cu_tu_entry (shndx);
+-		  shndx_list +=3D 4;
+-		}
+-	      if (do_display)
++		    shndx_list +=3D 4;
++		  }
+ 		printf ("\n");
+-	      else
+-		end_cu_tu_entry ();
+-	    }
+-	  phash +=3D 8;
+-	  pindex +=3D 4;
+-	}
++	      }
++	    phash +=3D 8;
++	    pindex +=3D 4;
++	  }
+     }
+   else if (version =3D=3D 2)
+     {
--=20
2.34.1


