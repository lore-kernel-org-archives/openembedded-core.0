Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007D7EB64DD
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 01:50:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.58806.1691805039228224835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 18:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XHkY9eEs;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691805039; x=1723341039;
  h=from:to:subject:date:message-id;
  bh=go4wWQmUAZ4HvVndrb67boSRTUNyzgcDNnpYV3UJHS4=;
  b=XHkY9eEscJq7CiVv/Pkn4oado2K9jFe+3E8i/LlWlM573HmeGDJ+dYFK
   /wSrfNj5z8qlKH+4hDR8EsOiP7rZSAuAckK7bT2c+6/k/ZWGDElYj2UvB
   SljixcFwRFjRXWkh6WnE5wGUi8xmKUcNgmqjvxp42EKOttresNnEWPd1h
   df38ONqLaJnavcCsTLhIyDCCnW97uiqJLt4pc4Zani8D9odhVaXwSGHb8
   4bpgxLofcdM1CmfD96qHgo9EeNMKRJ4869l1g7oXv+tAoTfxSzqFamjbp
   mqo+yhHJZkOCWL7Zf5gG3GSJTanrRbz5aBgL3uOOhfXVr4m3KDrg6TgNG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361938893"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="361938893"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735943484"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="735943484"
Received: from kjlau-ilbpg12.png.intel.com ([10.88.229.12])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 18:49:12 -0700
From: karn.jye.lau@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] Fix kirkstone dmidedecode smbios3_decode
Date: Sat, 12 Aug 2023 09:47:12 +0800
Message-Id: <20230812014712.6117-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 01:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185854

From: "Lau, Karn Jye" <karn.jye.lau@intel.com>

Recent CVE fixes in kirkstone dmidecode broke it
functionality, this issue is only observed in kirkstone
version of dmidecode(v3.3).Update smbios3_decode to address
the broken functionality.

Signed-off-by: Lau, Karn Jye <karn.jye.lau@intel.com>
---
 ...mbios3_decode-in-kirkstone-dmidecode.patch | 125 ++++++++++++++++++
 .../dmidecode/dmidecode_3.3.bb                |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch b/meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch
new file mode 100644
index 0000000000..00ffb90ce2
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch
@@ -0,0 +1,125 @@
+From 8a395982d6f350d0744666cffe42c4a486656c6f Mon Sep 17 00:00:00 2001
+From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
+Date: Sat, 12 Aug 2023 08:41:58 +0800
+Subject: [PATCH 2/2] Fix smbios3_decode in kirkstone dmidecode
+
+Recent CVE fix broke dmidecode functionality,
+port upstream changes to fix smbios3_decodein
+function.
+
+Reference:https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808
+
+Signed-off-by: Lau, Karn Jye <karn.jye.lau@intel.com>
+---
+ dmidecode.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 79 insertions(+), 2 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index f826f6c..91e1a32 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -3514,6 +3514,72 @@ static const char *dmi_power_supply_range_switching(u8 code)
+ 	return out_of_spec;
+ }
+ 
++/* Allocates a buffer for the table, must be freed by the caller */
++static u8 *dmi_table_get(off_t base, u32 *len, u16 num, u32 ver,
++			 const char *devmem, u32 flags)
++{
++	u8 *buf;
++
++	if (ver > SUPPORTED_SMBIOS_VER && !(opt.flags & FLAG_QUIET))
++	{
++		pr_comment("SMBIOS implementations newer than version %u.%u.%u are not",
++			   SUPPORTED_SMBIOS_VER >> 16,
++			   (SUPPORTED_SMBIOS_VER >> 8) & 0xFF,
++			   SUPPORTED_SMBIOS_VER & 0xFF);
++		pr_comment("fully supported by this version of dmidecode.");
++	}
++
++	if (!(opt.flags & FLAG_QUIET))
++	{
++		if (opt.type == NULL)
++		{
++			if (num)
++				pr_info("%u structures occupying %u bytes.",
++					num, *len);
++			if (!(opt.flags & FLAG_FROM_DUMP))
++				pr_info("Table at 0x%08llX.",
++					(unsigned long long)base);
++		}
++		pr_sep();
++	}
++
++	if ((flags & FLAG_NO_FILE_OFFSET) || (opt.flags & FLAG_FROM_DUMP))
++	{
++		/*
++		 * When reading from sysfs or from a dump file, the file may be
++		 * shorter than announced. For SMBIOS v3 this is expcted, as we
++		 * only know the maximum table size, not the actual table size.
++		 * For older implementations (and for SMBIOS v3 too), this
++		 * would be the result of the kernel truncating the table on
++		 * parse error.
++		 */
++		size_t size = *len;
++		buf = read_file(flags & FLAG_NO_FILE_OFFSET ? 0 : base,
++			&size, devmem);
++		if (!(opt.flags & FLAG_QUIET) && num && size != (size_t)*len)
++		{
++			fprintf(stderr, "Wrong DMI structures length: %u bytes "
++				"announced, only %lu bytes available.\n",
++				*len, (unsigned long)size);
++		}
++		*len = size;
++	}
++	else
++		buf = mem_chunk(base, *len, devmem);
++
++	if (buf == NULL)
++	{
++		fprintf(stderr, "Failed to read table, sorry.\n");
++#ifndef USE_MMAP
++		if (!(flags & FLAG_NO_FILE_OFFSET))
++			fprintf(stderr,
++				"Try compiling dmidecode with -DUSE_MMAP.\n");
++#endif
++	}
++
++	return buf;
++}
++
+ /*
+  * 7.41 Additional Information (Type 40)
+  *
+@@ -5428,8 +5494,11 @@ static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags
+ 		return 0;
+ 	}
+ 
+-	dmi_table(((off_t)offset.h << 32) | offset.l,
+-		  DWORD(buf + 0x0C), 0, ver, devmem, flags | FLAG_STOP_AT_EOT);
++	/* Maximum length, may get trimmed */
++
++    len = DWORD(buf + 0x0C);
++
++    table = dmi_table_get(((off_t)offset.h << 32) | offset.l, &len, 0, ver,devmem, flags | FLAG_STOP_AT_EOT);
+ 
+ 	if (opt.flags & FLAG_DUMP_BIN)
+ 	{
+@@ -5440,6 +5509,14 @@ static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags
+ 
+ 		dmi_table_dump(crafted, crafted[0x06], table, len);
+ 	}
++	else
++    {
++        dmi_table_decode(table, len, 0, ver >> 8,flags | FLAG_STOP_AT_EOT);
++    }
++
++ 
++
++    free(table);
+ 
+ 	return 1;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index b99c2ea99d..fab7a9ec97 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
            file://0001-Committing-changes-from-do_unpack_extra.patch \
+           file://0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch \
            file://CVE-2023-30630_1.patch \
            file://CVE-2023-30630_2.patch \
            file://CVE-2023-30630_3.patch \
-- 
2.34.1


