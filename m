Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1589BCD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 14:42:31 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30702.1780324945651903441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 07:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=epipArbE;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3533; q=dns/txt;
  s=iport01; t=1780324945; x=1781534545;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1FUB7AgGYTKucVbkv28VWePXXaHjNsBCzIu9D+a/bzQ=;
  b=epipArbEAa4s7KUcRDXp9zlJZ5iw2ybKHL5GawSueMGaGKTN+HXO6k9B
   B7D5dssf/zQZR6zXXZG1dc9ZaEvy2KFmcoG8ObWXXSAulDYU+Qzw14oDi
   M1t0RXdK0CjWj2tvU349BDNMtfERNiw3a6QA0N2A+TR4WeFCWjJSolQKb
   IyQ8px5p8qk3oZ8JuQsxay93ZqsSkpPpsW3ZR9Vx05z6TI5dJ4XGDHgGQ
   Gagp3v88YHr7StOsFOVcWeVdGpGoXQj3kFMqNWdtRL+VCUxBWEaNuNCw/
   sUwk56tPnN1nGKwywyU8EEkmdUvQfObWTx66hPVRJ1NvOM5STztDurotS
   Q==;
X-CSE-ConnectionGUID: rw/irwJVTaqkr3z9UJxsWw==
X-CSE-MsgGUID: GnUA/bWuT8q29oNFcdcA/w==
X-IPAS-Result: =?us-ascii?q?A0BCAgDwmB1q/5H/Ja1aHgEBCxIMggULgldyX0JJA6Ivk?=
 =?us-ascii?q?jeCDQEBAQ9EDQQBAZI6AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBLQsBRiwDAQJPCyMhgwIBgjoDNgIBEbQ1gXkzgQGDWgUJA?=
 =?us-ascii?q?kPZGA2CUwEFBhQBBYEzhT+CeoUjWxgBhHsnNoFygRWDaIEFgRpCBBiBDYZ9B?=
 =?us-ascii?q?IIigQyBXR6NOUhEAwkGAgICDy0GA1ksAVUTDQoLBwWBZgM1EioVbiIQHYEjP?=
 =?us-ascii?q?heBCxsHBYFKMIElaoEChRgjHwM5gReBf4ErSAMLGA1IESw3FBsEPm4Hix8XD?=
 =?us-ascii?q?4IzgQ4BK4FNX5M1kkGgHXEHK4N0jCGPPoV8GjOqa5kGjgmECZJGhGiBaDyBW?=
 =?us-ascii?q?XCDN1MZD444iH7FOCQ1AgkDLwEBBwIHDgMLgWiQAIF9AQE?=
IronPort-Data: A9a23:HO+Uka319gcklm2G7vbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzJTy
 jZKWWzSa6veamakLdkkaYzgpx4OusfUyYRmGgds3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AsazpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFl5xPJcH2NhLCHhN7
 6cKeQ0vfgu8mLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWh/+1nXnncDRwo1OOrq1x6G/WpOB0+OS9b4GKIYfSHq25mG63o
 F/vuG7GHy1KLYbOzhyr+X6nr6jQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:FqaZKKGyaMTs1oY+pLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:Y2KH727VpU+iZDQ/wNss7lFTG9o6UEPhxW7TORSqWFtLWKaqVgrF
X-Talos-MUID: 9a23:Qk0nrQj65qFtIbx2KspEIcMpG8FVyuOkN10xwYxc6s6iGyd8MB7ak2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="487373303"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 14:42:24 +0000
Received: from sjc-ads-096.cisco.com (sjc-ads-096.cisco.com [171.71.190.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 8371C180001C6;
	Mon,  1 Jun 2026 14:42:24 +0000 (GMT)
Received: by sjc-ads-096.cisco.com (Postfix, from userid 1839047)
	id 23E5BC6E6C7; Mon,  1 Jun 2026 07:42:24 -0700 (PDT)
From: Shubham@cisco.com, Pushpkar@cisco.com, -X@cisco.com,
	spushpka@cisco.com (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [OE-core] [Scarthgap] [PATCH] binutils: Fix CVE-2026-6846
Date: Mon,  1 Jun 2026 07:41:50 -0700
Message-ID: <20260601144151.24448-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-096.cisco.com [171.71.190.26];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.71.190.26, sjc-ads-096.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 14:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237837

From: Shubham Pushpkar <spushpka@cisco.com>

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


