Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFB8C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 12:28:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.132955.1692102497238078611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 05:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=iag7DbyF;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692102497; x=1723638497;
  h=from:to:subject:date:message-id:in-reply-to:references;
  bh=1FOqSxm2DHJAHKd6ooD8qV3XsUlhOWxzJWMhXG3sCg4=;
  b=iag7DbyFhuQ02mN0I1Ia/kSR0Vue9HnipwZ6uzle0fCmU8Aj8qny4VDe
   vOj7O7hIdFEa4dvm2d4a4U1XiygNf5WQ2vSYaY1zJXghjdNWMY+ytCAIc
   6hlVivMkdo2mYKGWvHhghZG+tqhMn9wxLkj0/ATmhccHgeU8DBWVsTnxS
   57DHTnCEvf6kVVYOEQKmlqzNYw5aJ1tcANLWDnxID+dy0XBIkwuuKHGN9
   wbrfmQ8Pufv71fqwAME0zNzYS4wIiYdSyH5ruvkC/r8GsC46xi3PtvQHe
   YW/2QtdFhu52EUS+spJvwAyfNmkLbUqgNxGn5DEIPpYkIN++ozZeeVkXF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362415264"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="362415264"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 05:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727371714"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="727371714"
Received: from kjlau-ilbpg12.png.intel.com ([10.88.229.12])
  by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 05:28:15 -0700
From: karn.jye.lau@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH v2] dmidecode: Fix decode functions
Date: Tue, 15 Aug 2023 20:26:13 +0800
Message-Id: <20230815122613.21386-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <186057>
References: <186057>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 12:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186059

From: "Lau, Karn Jye" <karn.jye.lau@intel.com>

Recent cve fixed broke smbios and legacy decode features.
Backported upstream changes to fix smbios3_decode, smbios_decode
and legacy_decode functions on dmidecode v3.3 to read and decode
system information corectly.

Reference:https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808

Signed-off-by: Lau, Karn Jye <karn.jye.lau@intel.com>
---
 .../0002-dmidecode-Fix-decode-functions.patch | 206 ++++++++++++++++++
 .../dmidecode/dmidecode_3.3.bb                |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/0002-dmidecode-Fix-decode-functions.patch

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0002-dmidecode-Fix-decode-functions.patch b/meta/recipes-devtools/dmidecode/dmidecode/0002-dmidecode-Fix-decode-functions.patch
new file mode 100644
index 0000000000..7a8d9e68fa
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/0002-dmidecode-Fix-decode-functions.patch
@@ -0,0 +1,206 @@
+From e85d9f9587c1c794b82a8d896bb1c70584b22252 Mon Sep 17 00:00:00 2001
+From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
+Date: Tue, 15 Aug 2023 13:50:27 +0800
+Subject: [PATCH] dmidecode: Fix decode functions.
+
+Added upstream changes to fix smbios3_decode,
+smbios_decode and legacy_decode.
+
+Upstream-Status: Backport
+Reference:https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808
+
+Signed-off-by: Lau, Karn Jye <karn.jye.lau@intel.com>
+---
+ dmidecode.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 106 insertions(+), 9 deletions(-)
+ mode change 100644 => 100755 dmidecode.c
+
+diff --git a/dmidecode.c b/dmidecode.c
+old mode 100644
+new mode 100755
+index f826f6c..413b716
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
+@@ -5428,8 +5494,10 @@ static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags
+ 		return 0;
+ 	}
+ 
+-	dmi_table(((off_t)offset.h << 32) | offset.l,
+-		  DWORD(buf + 0x0C), 0, ver, devmem, flags | FLAG_STOP_AT_EOT);
++	/* Maximum length, may get trimmed */
++	len = DWORD(buf + 0x0C);
++
++    table = dmi_table_get(((off_t)offset.h << 32) | offset.l, &len, 0, ver,devmem, flags | FLAG_STOP_AT_EOT);
+ 
+ 	if (opt.flags & FLAG_DUMP_BIN)
+ 	{
+@@ -5440,15 +5508,21 @@ static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags
+ 
+ 		dmi_table_dump(crafted, crafted[0x06], table, len);
+ 	}
++	else
++    {
++       dmi_table_decode(table, len, 0, ver >> 8,flags | FLAG_STOP_AT_EOT);
++    }
++
++    free(table);
+ 
+ 	return 1;
+ }
+ 
+ static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ {
+-	u16 ver;
++	u16 ver, num;
+ 	u32 len;
+-        u8 *table;
++    u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
+         if (buf[0x05] > buf_len)
+@@ -5488,8 +5562,13 @@ static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ 		pr_info("SMBIOS %u.%u present.",
+ 			ver >> 8, ver & 0xFF);
+ 
+-	dmi_table(DWORD(buf + 0x18), WORD(buf + 0x16), WORD(buf + 0x1C),
+-		ver << 8, devmem, flags);
++	/* Maximum length, may get trimmed */
++	len = WORD(buf + 0x16);
++	num = WORD(buf + 0x1C);
++	table = dmi_table_get(DWORD(buf + 0x18), &len, num, ver << 8,
++			      devmem, flags);
++	if (table == NULL)
++		return 1;
+ 
+ 	if (opt.flags & FLAG_DUMP_BIN)
+ 	{
+@@ -5500,25 +5579,37 @@ static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ 
+ 		dmi_table_dump(crafted, crafted[0x05], table, len);
+ 	}
++	else
++	{
++		dmi_table_decode(table, len, num, ver, flags);
++	}
++
++	free(table);
+ 
+ 	return 1;
+ }
+ 
+ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ {
++	u16 ver, num;
+ 	u32 len;
+ 	u8 *table;
+ 
+ 	if (!checksum(buf, 0x0F))
+ 		return 0;
+ 
++	ver = ((buf[0x0E] & 0xF0) << 4) + (buf[0x0E] & 0x0F);
+ 	if (!(opt.flags & FLAG_QUIET))
+ 		pr_info("Legacy DMI %u.%u present.",
+ 			buf[0x0E] >> 4, buf[0x0E] & 0x0F);
+ 
+-	dmi_table(DWORD(buf + 0x08), WORD(buf + 0x06), WORD(buf + 0x0C),
+-		((buf[0x0E] & 0xF0) << 12) + ((buf[0x0E] & 0x0F) << 8),
+-		devmem, flags);
++	/* Maximum length, may get trimmed */
++	len = WORD(buf + 0x06);
++	num = WORD(buf + 0x0C);
++	table = dmi_table_get(DWORD(buf + 0x08), &len, num, ver << 8,
++			      devmem, flags);
++	if (table == NULL)
++		return 1;
+ 
+ 	if (opt.flags & FLAG_DUMP_BIN)
+ 	{
+@@ -5529,6 +5620,12 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 
+ 		dmi_table_dump(crafted, 0x0F, table, len);
+ 	}
++	else
++	{
++		dmi_table_decode(table, len, num, ver, flags);
++	}
++
++	free(table);
+ 
+ 	return 1;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index b99c2ea99d..bd526120d5 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
            file://CVE-2023-30630_2.patch \
            file://CVE-2023-30630_3.patch \
            file://CVE-2023-30630_4.patch \
+           file://0002-dmidecode-Fix-decode-functions.patch \
            "
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
-- 
2.34.1


