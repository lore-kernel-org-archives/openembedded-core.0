Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E9DC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:47:34 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157006.1783360052640219169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jCZ3qPTp;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3999; q=dns/txt;
  s=iport01; t=1783360052; x=1784569652;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HaTgndWN80SFi2FYDpJ7FJxQdDUjggqhWG3+8oGnTlA=;
  b=jCZ3qPTpeDPwHxO8xD86vh+qwVrTdR2b1zjJOzPTcZNGeMHF9yQ1lVkp
   MmspGAfpG52EcnxxGnlJ+Ld7xKYRlPikzIe86Kv9FWwLAwAPJOMr0FvtJ
   R9SWX5KAB5nYnxbyldjKsdmLc7zDl0iDtrkaVBAWaaQ1CPSepJupBrXA4
   03I69RAxRBKaZ3ctsrA+LCCY+nskrVVBfdiO/Uy39l/zD2KzuYL0i9yoJ
   /OPtmirB7e1MP6ilIN+bLdbjfAHGVqwrJl/56TOJ2cw/V/5ReP+tBEo9w
   dDc9/ulOOYJUGJxS3vT55Eq1XeZftM8cJX0HtAOHkSUvRH/7dk9mo8JEF
   A==;
X-CSE-ConnectionGUID: rBy/a/xNSdqPazCBSDviQw==
X-CSE-MsgGUID: 7pcNI1zvQuW+2+yDq7tD8A==
X-IPAS-Result: =?us-ascii?q?A0BEAgAC6Utq/47/Ja1aglmCV3RfQkkDlCeCIYEWilGSN?=
 =?us-ascii?q?4F+DwEBAQ84GQQBAZJVAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBLQsBcgMBAk8LIyGDAgGCOgM2AgERBrlvgXkzgQGDWgUJA?=
 =?us-ascii?q?kNQ2EkNglYBBQYUAYE4hT+CfIUjWxgBhHwnGxuBcoEVgTuBOHaBBYEaQgECA?=
 =?us-ascii?q?RiICwSCIoEMgVqPRkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgWuBAoR5Ix8DOX+BMHVKeS2BAxIeCoFSgSoDCxgNSBEsNxQbBD5uB4x8F?=
 =?us-ascii?q?w+CPQGBDQEHIgIigVsvpXagHnEKKIN1jCGPPoV8GjOEBJQXklGZCI4KhAmSR?=
 =?us-ascii?q?4RogWg8gUcLB3AVgyJTGQ+OOINrgX+DFMlHJDUCCQMvAQEHAgcOAwuBaJF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:vBi426PSYxg/+vbvrR30lsFynXyQoLVcMsEvi/4bfWQNrUorhGMDn
 zFKCGDVP/bcYzagctB2b96y/B4H6Jbdn4JmS3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6g2AsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+9EHQY/ep0+wepuOWhc3
 tYjBC4MVw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNnwsYDUXUrsTIIkjkPqtjHn2WzZZs1mS46Ew5gA/ySQsiOWxbIGPI4XiqcN9wV6Tg
 EOf7XrAHy5Zbp+O5SPa7l78r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:RzArAaoR/8qduSMoFBpIl1waV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90cu7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3ADewBEmuZ+zPA5pQ4zLja2RgS6Is/WGyaxTDABXS?=
 =?us-ascii?q?0EF5gWpa/cnOO+Zp7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ai23Luwyd42+Phma5yOYbA/W5e5WaqPu2A2YsyIc?=
 =?us-ascii?q?YgtS7dnYzKhuE0yibEqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,151,1779148800"; 
   d="scan'208";a="505443211"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 17:47:31 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 93EED180007CB
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 17:47:31 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 3BD5ECB6A93; Mon,  6 Jul 2026 10:47:31 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Mon,  6 Jul 2026 10:46:52 -0700
Message-ID: <20260706174652.4053594-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240336

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], which addresses two out-of-bounds
read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The changes
shown in [2] are referenced by [3] and [4].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=bfd/xcofflink.c;h=1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=fde21c9f9583baff05e72e390e6bb896d02f9d43;hb=c2bf7de1eb77a91d7a3c86d56408bf57de540faf;hpb=d7f532cb3a46527
[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3441
[4] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3442

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3441
https://nvd.nist.gov/vuln/detail/CVE-2026-3442
https://www.suse.com/security/cve/CVE-2026-3441.html
https://www.suse.com/security/cve/CVE-2026-3442.html

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 4948e9b576..6d8f37f78b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -39,4 +39,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://CVE-2026-4647.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 0000000000..be63bb295c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,51 @@
+From be1339394f1b64ba8b5d4f55343522cbea26131b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Feb 2026 13:16:40 +1030
+Subject: [PATCH] xcofflink buffer overflows
+
+This fixes two fuzzed object file out-of-bounds accesses.
+
+	* xcofflink.c (xcoff_link_add_symbols): Properly bounds check
+	XTY_LD x_scnlen index.  Sanity check r_symndx before using it
+	to index sym hashes.
+
+CVE: CVE-2026-3441 CVE-2026-3442
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf]
+
+(cherry picked from commit c2bf7de1eb77a91d7a3c86d56408bf57de540faf)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ bfd/xcofflink.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 691acc854ae..e1716262871 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1908,12 +1908,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
+ 	     cause the XTY_LD to not follow the XTY_SD symbol. */
+ 	  {
+-	    bool bad;
+-
+-	    bad = false;
+-	    if (aux.x_csect.x_scnlen.u64
+-		>= (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
+-	      bad = true;
++	    bool bad = (aux.x_csect.x_scnlen.u64
++			>= ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
++			    / symesz));
+ 	    if (! bad)
+ 	      {
+ 		section = xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
+@@ -2279,6 +2276,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 		 functions imported from dynamic objects.  */
+ 	      if (info->output_bfd->xvec == abfd->xvec
+ 		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+ 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+ 		{
+ 		  struct xcoff_link_hash_entry *h;
+-- 
+2.51.0
+
-- 
2.51.0


