Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED491CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 14:49:17 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.218.1780325354278847534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 07:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fQrI2a9x;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3486; q=dns/txt;
  s=iport01; t=1780325354; x=1781534954;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OTikOdya0yfhVuStipA2skdLbAIfZFH4LB+2YSwejNg=;
  b=fQrI2a9xUavuhd/EMnZqDenHsbEhr3BTmElV1gQzd394mB6VkcGvXzU3
   7dIbTgXMvsl+BA+eWlPZGBvjLnXEwhe+EVAYq7CFMUOPUCq/MbQhpxRAg
   lk5qdc5Dk3eb1pxcduipAUfoX8zCugQdni0IQ0J0H5eSYJnVLckebVl15
   tGB5yCs/2bD5JkRAoXfxgvChUHnF2Vxt9yltnNRuLOTxTyTieCeb9V+40
   e0WZTeTh7GExwC+8g8hAuLaFTznGW/rQaTNKozTB7bM++uIZNP8ww91Nt
   Ez0how8ZCOcEM3RhhV5zmHIfKbnBWiWFPzah5POqkOV23Dp0VTu7T21Bi
   w==;
X-CSE-ConnectionGUID: kKAu0UX+Q4m12/oZS4gn8Q==
X-CSE-MsgGUID: QP5D7BMgTPKUdCS0BXlsog==
X-IPAS-Result: =?us-ascii?q?A0BcAgBomh1q/4z/Ja1aHgEBCxIMggULgldyX0JJA6IvE?=
 =?us-ascii?q?JIngX4PAQEBD0QNBAEBhQaNNAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBKgsBRiwDAQJPCyMhgwIBgjoDNgIBEbQagXkzg?=
 =?us-ascii?q?QGDWgUJAkNQ2EgNb4FkAQUGFAEFgTOFP4J6hSNbGAGEeycbgUlEgRWDaIEFg?=
 =?us-ascii?q?RpCBBiBDYZ9BIMugV0ejTlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QsbBwWBSoFVaoEChRgjHwM5gReBf4ErSAMLGA1IESw3FBsEPm4Hix8XD4Izg?=
 =?us-ascii?q?Q4BK4FNX5M1kkGgHXGEJowhjz6FfBozqmuZBo4JhAmSRoRogWg8gVlNIxWDI?=
 =?us-ascii?q?lMZD444iH7FLiQ1AgkDLwEBBwIHDgMLgWiQAIF9AQE?=
IronPort-Data: A9a23:iF5kpagS5Xzdk9tnn5pcpxsCX161MREKZh0ujC45NGQN5FlHY01je
 htvDW6COv3fazeheYx1bdmz9B8DvZ7Sn4dgSFc6+Hs1Rn5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfra8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUb2c9qWVx+t
 sVELWlXKRexvL65xuKCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglHkayBDqEqWrII84nPYy0p6172F3N/9JozVFJoNxhzGz
 o7A113BXz1FHvmQ9QKmz36HvbflrSfgX41HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:rZdThqEdoHd2vOttpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:Fx1TC2NUn0orLe5DWwpO6RYpKoMcLniEljDXEXTkBmA5cejA
X-Talos-MUID: =?us-ascii?q?9a23=3AcUtAWA+JomDXtEdUDLJVY5eQf/5QvojxImUCra0?=
 =?us-ascii?q?lhsWvDnRaCzOGizviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="487970026"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 14:49:13 +0000
Received: from sjc-ads-096.cisco.com (sjc-ads-096.cisco.com [171.71.190.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 599EA180001CD;
	Mon,  1 Jun 2026 14:49:13 +0000 (GMT)
Received: by sjc-ads-096.cisco.com (Postfix, from userid 1839047)
	id F40B8C6E6C7; Mon,  1 Jun 2026 07:49:12 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [OE-core] [Scarthgap] [PATCH] binutils: Fix CVE-2026-6846
Date: Mon,  1 Jun 2026 07:49:01 -0700
Message-ID: <20260601144901.33446-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-096.cisco.com [171.71.190.26];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.71.190.26, sjc-ads-096.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 14:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237839

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7a089e0302382f4d4e077941156e1eaa68d01393
[2] https://security-tracker.debian.org/tracker/CVE-2026-6846

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2026-6846.patch     | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a865c45f4..4e5125f532 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,6 @@ SRC_URI = "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2026-6846.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
new file mode 100644
index 0000000000..8eaca87583
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
@@ -0,0 +1,57 @@
+From 2a340616f7e6591f83e85777d1d1f6108c33f5b8 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 6 Apr 2026 22:58:22 +0930
+Subject: [PATCH] PR 34049 buffer overflow in xcoff_link_add_symbols
+
+The fact that coffcode.h:coff_set_alignment_hook for rs6000 removes
+sections can result in target_index > section_count.  Thus any array
+indexed by target_index must not be sized by section_count.
+
+	PR ld/34049
+	* xcofflink.c (xcoff_link_add_symbols): Size reloc_info array
+	using max target_index.
+
+CVE: CVE-2026-6846
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a089e0302382f4d4e077941156e1eaa68d01393]
+
+(cherry picked from commit 7a089e0302382f4d4e077941156e1eaa68d01393)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ bfd/xcofflink.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 6ef9abcd8..196967ed0 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1300,6 +1300,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+   } *reloc_info = NULL;
+   bfd_size_type amt;
+   unsigned short visibility;
++  unsigned int max_target_index;
+
+   keep_syms = obj_coff_keep_syms (abfd);
+
+@@ -1363,7 +1364,19 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+      order by VMA within a given section, so we handle this by
+      scanning along the relocs as we process the csects.  We index
+      into reloc_info using the section target_index.  */
+-  amt = abfd->section_count + 1;
++  max_target_index = 0;
++  for (o = abfd->section_last; o != NULL; o = o->prev)
++    if (o->target_index != 0)
++      {
++	/* The last section added from the object file will have the
++	   highest target_index.  See coffgen.c coff_real_object_p and
++	   make_a_section_from_file.  Sections added by
++	   xcoff_link_create_extra_sections will have a zero
++	   target_index.  */
++	max_target_index = o->target_index;
++	break;
++      }
++  amt = max_target_index + 1;
+   amt *= sizeof (struct reloc_info_struct);
+   reloc_info = bfd_zmalloc (amt);
+   if (reloc_info == NULL)
+--
+2.35.6
-- 
2.44.1


