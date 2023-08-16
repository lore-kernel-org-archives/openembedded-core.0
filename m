Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E8EC04A94
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 11:02:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.157876.1692183741178739538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 04:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WFoH6dkc;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-317c3ac7339so5444257f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692183739; x=1692788539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYjhRc2tq8lk/XWPrSKriQop2PplribXMdy/yFFTiQs=;
        b=WFoH6dkclXDLY5hnpADguMydHIbababq8Sog4RtaPtWtf9ffZx3xa502SwYaw7xHux
         LBXcRBzkbeNXYVko1gpU39QMONVCrf27PPGkbZ/dv5r/rrww+7jSkr3ArnMOncx1yWaR
         TnRgnYmomp4Ugg8Gp8c8mkT3BTCaYY52PovC3NBDMBzMsFxjgIS31qJLzXpLssX1UQG6
         SJrqB5sfmWhSYFzFSRkEvSiRG0iUOpdfpjsywoSPNjxRkQ9TMKy79pCQtvO8Gi6bKpST
         ccD1zmv7jMr4jiDOIBeacnqmnaRLRbjy0tK3IogYeAtrkkFlSKivDjJxCVOPWNMnkJ+Z
         rVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692183739; x=1692788539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYjhRc2tq8lk/XWPrSKriQop2PplribXMdy/yFFTiQs=;
        b=UeZEeAlsLlxIlQOV3q5X6XfzH6RVLU71F4iZ5mGG/8emxejl2cvrq+UjM0IO0bYHRW
         9OhBy0GjHL3a5+QbHRKJENTyEl6QemzhbexFHJi75t9J5Du+NxtMVLtuRIClAYNkASfR
         yNchGraKKQbFa14cGrMCPhCToI+UtfHGQb41S+S2/9gfIamBhRpXzMs6SALKl16iQqNQ
         sI/OVv8Wtew96g0jmiorbtZnNxtcb91WbF5o1vI1bXCYXxAyGXE+dx56PHDsRjoN1MTU
         4FlKso/QMdKvR25f9ylVsxTDgpmTyZFBqMdlVfblWQfuICvUYRdBWYJ+oxl0R4mHHcCd
         miXg==
X-Gm-Message-State: AOJu0YzTknRfMaRwXf63AHizVn5sS/VxcD1eJl1H9P7pKVRzW3egpP3O
	hMD4psu0HYWbCUwK8l/Ws5EpKhhlR9o=
X-Google-Smtp-Source: AGHT+IGBbcOMBpAn71ZucxaUk9NYCAT6Cb4r60KK8pjdDWKoxfA2kSiJjLm8DPDTPcYgXLdHWrQZKw==
X-Received: by 2002:adf:e390:0:b0:314:370f:e92c with SMTP id e16-20020adfe390000000b00314370fe92cmr1493084wrm.67.1692183738975;
        Wed, 16 Aug 2023 04:02:18 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a5d4a0c000000b00317e9c05d35sm21039589wrq.85.2023.08.16.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 04:02:18 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH v2 1/1] dmidecode: fixup for CVE-2023-30630
Date: Wed, 16 Aug 2023 12:58:20 +0200
Message-ID: <20230816110211.79747-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816110211.79747-1-adrian.freihofer@siemens.com>
References: <20230816110211.79747-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 11:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186131

The previous CVE-2023-30630_1.patch picked only the patch
"dmidecode: Write the whole dump file at once" d8cfbc808f.
But there was a refactoring which does not allow to cherry-pick it fast
forward. Resolving this conflict was not correctly done. The patch was:

+    u32 len;
+    u8 *table;
...
-    if (!(opt.flags & FLAG_QUIET))
-        pr_comment("Writing %d bytes to %s.", crafted[0x05],
-                   opt.dumpfile);
-    write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
+    dmi_table_dump(crafted, crafted[0x05], table, len);

It looks like the variables len and table have been added without
initialization.
Now this problem is solved by applying the previous refactoring as
well. Patch 1 gets replaced by Patch 1a and Patch 1b. Patch 2..4 are
rebased without changes.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../dmidecode/CVE-2023-30630_1a.patch         | 236 ++++++++++++++++++
 ...-30630_1.patch => CVE-2023-30630_1b.patch} | 126 ++++------
 .../dmidecode/CVE-2023-30630_2.patch          |  11 +-
 .../dmidecode/CVE-2023-30630_3.patch          |  60 ++---
 .../dmidecode/CVE-2023-30630_4.patch          | 149 +++++------
 .../dmidecode/dmidecode_3.3.bb                |   3 +-
 6 files changed, 394 insertions(+), 191 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
 rename meta/recipes-devtools/dmidecode/dmidecode/{CVE-2023-30630_1.patch => CVE-2023-30630_1b.patch} (63%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
new file mode 100644
index 0000000000..bf93fbc13c
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
@@ -0,0 +1,236 @@
+From ee6db10dd70b8fdc7a93cffd7cf5bc7a28f9d3d7 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 20 Feb 2023 14:53:21 +0100
+Subject: [PATCH 1/5] dmidecode: Split table fetching from decoding
+
+Clean up function dmi_table so that it does only one thing:
+* dmi_table() is renamed to dmi_table_get(). It now retrieves the
+  DMI table, but does not process it any longer.
+* Decoding or dumping the table is now done in smbios3_decode(),
+  smbios_decode() and legacy_decode().
+No functional change.
+
+A side effect of this change is that writing the header and body of
+dump files is now done in a single location. This is required to
+further consolidate the writing of dump files.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=39b2dd7b6ab719b920e96ed832cfb4bdd664e808]
+
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
+---
+ dmidecode.c | 86 ++++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 62 insertions(+), 24 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index cd2b5c9..b082c03 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5247,8 +5247,9 @@ static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 flags)
+ 	}
+ }
+ 
+-static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+-		      u32 flags)
++/* Allocates a buffer for the table, must be freed by the caller */
++static u8 *dmi_table_get(off_t base, u32 *len, u16 num, u32 ver,
++			 const char *devmem, u32 flags)
+ {
+ 	u8 *buf;
+ 
+@@ -5267,7 +5268,7 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+ 		{
+ 			if (num)
+ 				pr_info("%u structures occupying %u bytes.",
+-					num, len);
++					num, *len);
+ 			if (!(opt.flags & FLAG_FROM_DUMP))
+ 				pr_info("Table at 0x%08llX.",
+ 					(unsigned long long)base);
+@@ -5285,19 +5286,19 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+ 		 * would be the result of the kernel truncating the table on
+ 		 * parse error.
+ 		 */
+-		size_t size = len;
++		size_t size = *len;
+ 		buf = read_file(flags & FLAG_NO_FILE_OFFSET ? 0 : base,
+ 			&size, devmem);
+-		if (!(opt.flags & FLAG_QUIET) && num && size != (size_t)len)
++		if (!(opt.flags & FLAG_QUIET) && num && size != (size_t)*len)
+ 		{
+ 			fprintf(stderr, "Wrong DMI structures length: %u bytes "
+ 				"announced, only %lu bytes available.\n",
+-				len, (unsigned long)size);
++				*len, (unsigned long)size);
+ 		}
+-		len = size;
++		*len = size;
+ 	}
+ 	else
+-		buf = mem_chunk(base, len, devmem);
++		buf = mem_chunk(base, *len, devmem);
+ 
+ 	if (buf == NULL)
+ 	{
+@@ -5307,15 +5308,9 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+ 			fprintf(stderr,
+ 				"Try compiling dmidecode with -DUSE_MMAP.\n");
+ #endif
+-		return;
+ 	}
+ 
+-	if (opt.flags & FLAG_DUMP_BIN)
+-		dmi_table_dump(buf, len);
+-	else
+-		dmi_table_decode(buf, len, num, ver >> 8, flags);
+-
+-	free(buf);
++	return buf;
+ }
+ 
+ 
+@@ -5350,8 +5345,9 @@ static void overwrite_smbios3_address(u8 *buf)
+ 
+ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ {
+-	u32 ver;
++	u32 ver, len;
+ 	u64 offset;
++	u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
+ 	if (buf[0x06] > 0x20)
+@@ -5377,8 +5373,12 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 		return 0;
+ 	}
+ 
+-	dmi_table(((off_t)offset.h << 32) | offset.l,
+-		  DWORD(buf + 0x0C), 0, ver, devmem, flags | FLAG_STOP_AT_EOT);
++	/* Maximum length, may get trimmed */
++	len = DWORD(buf + 0x0C);
++	table = dmi_table_get(((off_t)offset.h << 32) | offset.l, &len, 0, ver,
++			      devmem, flags | FLAG_STOP_AT_EOT);
++	if (table == NULL)
++		return 1;
+ 
+ 	if (opt.flags & FLAG_DUMP_BIN)
+ 	{
+@@ -5387,18 +5387,28 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_smbios3_address(crafted);
+ 
++		dmi_table_dump(table, len);
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			pr_comment("Writing %d bytes to %s.", crafted[0x06],
+ 				   opt.dumpfile);
+ 		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
+ 	}
++	else
++	{
++		dmi_table_decode(table, len, 0, ver >> 8,
++				 flags | FLAG_STOP_AT_EOT);
++	}
++
++	free(table);
+ 
+ 	return 1;
+ }
+ 
+ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ {
+-	u16 ver;
++	u16 ver, num;
++	u32 len;
++	u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
+ 	if (buf[0x05] > 0x20)
+@@ -5438,8 +5448,13 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
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
+@@ -5448,27 +5463,43 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_dmi_address(crafted + 0x10);
+ 
++		dmi_table_dump(table, len);
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			pr_comment("Writing %d bytes to %s.", crafted[0x05],
+ 				   opt.dumpfile);
+ 		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
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
++	u32 len;
++	u8 *table;
++
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
+@@ -5477,11 +5508,18 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 16);
+ 		overwrite_dmi_address(crafted);
+ 
++		dmi_table_dump(table, len);
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			pr_comment("Writing %d bytes to %s.", 0x0F,
+ 				   opt.dumpfile);
+ 		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
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
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
similarity index 63%
rename from meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
rename to meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
index 53480d6299..e03bda05e4 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
@@ -1,7 +1,7 @@
-From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 2001
+From d362549bce92ac22860cda8cad4532c1a3fe6928 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
-Date: Tue, 27 Jun 2023 09:40:23 +0000
-Subject: [PATCH] dmidecode: Write the whole dump file at once
+Date: Mon, 20 Feb 2023 14:53:25 +0100
+Subject: [PATCH 2/5] dmidecode: Write the whole dump file at once
 
 When option --dump-bin is used, write the whole dump file at once,
 instead of opening and closing the file separately for the table
@@ -19,25 +19,23 @@ Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
 
 CVE: CVE-2023-30630
 
-Reference: https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
 
-Upstream-Status: Backport [https://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
 ---
- dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------
- util.c      | 40 ---------------------------
+ dmidecode.c | 69 +++++++++++++++++++++++++++++++++++++++--------------
+ util.c      | 40 -------------------------------
  util.h      |  1 -
- 3 files changed, 58 insertions(+), 62 deletions(-)
+ 3 files changed, 51 insertions(+), 59 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index 9aeff91..5477309 100644
+index b082c03..a80a140 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
-	}
+@@ -5130,11 +5130,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
+ 	}
  }
-
+ 
 -static void dmi_table_dump(const u8 *buf, u32 len)
 +static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
 +			  u32 table_len)
@@ -68,7 +66,7 @@ index 9aeff91..5477309 100644
 +		goto err_close;
 +	}
 +
-	if (!(opt.flags & FLAG_QUIET))
+ 	if (!(opt.flags & FLAG_QUIET))
 -		pr_comment("Writing %d bytes to %s.", len, opt.dumpfile);
 -	write_dump(32, len, buf, opt.dumpfile, 0);
 +		pr_comment("Writing %d bytes to %s.", table_len, opt.dumpfile);
@@ -92,94 +90,55 @@ index 9aeff91..5477309 100644
 +	fclose(f);
 +	return -1;
  }
-
+ 
  static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 flags)
-@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
-		return;
-	}
-
--	if (opt.flags & FLAG_DUMP_BIN)
--		dmi_table_dump(buf, len);
--	else
--		dmi_table_decode(buf, len, num, ver >> 8, flags);
--
-	free(buf);
- }
-
-@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
-
- static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
- {
--	u32 ver;
-+	u32 ver, len;
-	u64 offset;
-+	u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
-	if (buf[0x06] > 0x20)
-@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
-		memcpy(crafted, buf, 32);
-		overwrite_smbios3_address(crafted);
-
+@@ -5387,11 +5432,7 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_smbios3_address(crafted);
+ 
+-		dmi_table_dump(table, len);
 -		if (!(opt.flags & FLAG_QUIET))
 -			pr_comment("Writing %d bytes to %s.", crafted[0x06],
 -				   opt.dumpfile);
 -		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
 +		dmi_table_dump(crafted, crafted[0x06], table, len);
-	}
-
-	return 1;
-@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
- static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
- {
-	u16 ver;
-+	u32 len;
-+        u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
-	if (buf[0x05] > 0x20)
-@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
-		memcpy(crafted, buf, 32);
-		overwrite_dmi_address(crafted + 0x10);
-
+ 	}
+ 	else
+ 	{
+@@ -5463,11 +5504,7 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_dmi_address(crafted + 0x10);
+ 
+-		dmi_table_dump(table, len);
 -		if (!(opt.flags & FLAG_QUIET))
 -			pr_comment("Writing %d bytes to %s.", crafted[0x05],
 -				   opt.dumpfile);
 -		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
 +		dmi_table_dump(crafted, crafted[0x05], table, len);
-	}
-
-	return 1;
-@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
-
- static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
- {
-+	u32 len;
-+	u8 *table;
-+
-	if (!checksum(buf, 0x0F))
-		return 0;
-
-@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
-		memcpy(crafted, buf, 16);
-		overwrite_dmi_address(crafted);
-
+ 	}
+ 	else
+ 	{
+@@ -5508,11 +5545,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 16);
+ 		overwrite_dmi_address(crafted);
+ 
+-		dmi_table_dump(table, len);
 -		if (!(opt.flags & FLAG_QUIET))
 -			pr_comment("Writing %d bytes to %s.", 0x0F,
 -				   opt.dumpfile);
 -		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
 +		dmi_table_dump(crafted, 0x0F, table, len);
-	}
-
-	return 1;
+ 	}
+ 	else
+ 	{
 diff --git a/util.c b/util.c
 index 04aaadd..1547096 100644
 --- a/util.c
 +++ b/util.c
 @@ -259,46 +259,6 @@ out:
-	return p;
+ 	return p;
  }
-
+ 
 -int write_dump(size_t base, size_t len, const void *data, const char *dumpfile, int add)
 -{
 -	FILE *f;
@@ -233,5 +192,6 @@ index 3094cf8..ef24eb9 100644
  void *mem_chunk(off_t base, size_t len, const char *devmem);
 -int write_dump(size_t base, size_t len, const void *data, const char *dumpfile, int add);
  u64 u64_range(u64 start, u64 end);
---
-2.35.5
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
index 9f53a205ac..37167a9c4f 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
@@ -1,7 +1,8 @@
-From 47101389dd52b50123a3ec59fed4d2021752e489 Mon Sep 17 00:00:00 2001
+From 2d26f187c734635d072d24ea401255b84f03f4c4 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
 Date: Tue, 27 Jun 2023 10:03:53 +0000
-Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing file
+Subject: [PATCH 3/5] dmidecode: Do not let --dump-bin overwrite an existing
+ file
 
 Make sure that the file passed to option --dump-bin does not already
 exist. In practice, it is rather unlikely that an honest user would
@@ -17,14 +18,13 @@ Upstream-Status: Backport
 [https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2]
 
 Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
-
 ---
  dmidecode.c     | 14 ++++++++++++--
  man/dmidecode.8 |  3 ++-
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index ae461de..6446040 100644
+index a80a140..32a77cc 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
 @@ -60,6 +60,7 @@
@@ -78,3 +78,6 @@ index 64dc7e7..d5b7f01 100644
  .TP
  .BR "  " "  " "--from-dump FILE"
  Read the DMI data from a binary file previously generated using 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
index 01d0d1f867..181092a3fd 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
@@ -1,7 +1,8 @@
-From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
+From ac881f801b92b57fd8daac65fb16fff6d84fd366 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
 Date: Tue, 27 Jun 2023 10:25:50 +0000
-Subject: [PATCH] Consistently use read_file() when reading from a dump file
+Subject: [PATCH 4/5] Consistently use read_file() when reading from a dump
+ file
 
 Use read_file() instead of mem_chunk() to read the entry point from a
 dump file. This is faster, and consistent with how we then read the
@@ -27,26 +28,26 @@ Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
  1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index 98f9692..b4dbc9d 100644
+index 32a77cc..9a691e0 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
-		pr_comment("dmidecode %s", VERSION);
-
-	/* Read from dump if so instructed */
+@@ -5693,17 +5693,25 @@ int main(int argc, char * const argv[])
+ 		pr_comment("dmidecode %s", VERSION);
+ 
+ 	/* Read from dump if so instructed */
 +        size = 0x20;
-	if (opt.flags & FLAG_FROM_DUMP)
-	{
-		if (!(opt.flags & FLAG_QUIET))
-			pr_info("Reading SMBIOS/DMI data from file %s.",
-				opt.dumpfile);
+ 	if (opt.flags & FLAG_FROM_DUMP)
+ 	{
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			pr_info("Reading SMBIOS/DMI data from file %s.",
+ 				opt.dumpfile);
 -		if ((buf = mem_chunk(0, 0x20, opt.dumpfile)) == NULL)
 +                if ((buf = read_file(0, &size, opt.dumpfile)) == NULL)
-		{
-			ret = 1;
-			goto exit_free;
-		}
-
+ 		{
+ 			ret = 1;
+ 			goto exit_free;
+ 		}
+ 
 +                /* Truncated entry point can't be processed */
 +                if (size < 0x20)
 +                {
@@ -54,16 +55,17 @@ index 98f9692..b4dbc9d 100644
 +                        goto done;
 +                }
 +
-		if (memcmp(buf, "_SM3_", 5) == 0)
-		{
-			if (smbios3_decode(buf, opt.dumpfile, 0))
-@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
-	 * contain one of several types of entry points, so read enough for
-	 * the largest one, then determine what type it contains.
-	 */
+ 		if (memcmp(buf, "_SM3_", 5) == 0)
+ 		{
+ 			if (smbios3_decode(buf, opt.dumpfile, 0))
+@@ -5727,7 +5735,6 @@ int main(int argc, char * const argv[])
+ 	 * contain one of several types of entry points, so read enough for
+ 	 * the largest one, then determine what type it contains.
+ 	 */
 -	size = 0x20;
-	if (!(opt.flags & FLAG_NO_SYSFS)
-	 && (buf = read_file(0, &size, SYS_ENTRY_FILE)) != NULL)
-	{
---
-2.40.0
+ 	if (!(opt.flags & FLAG_NO_SYSFS)
+ 	 && (buf = read_file(0, &size, SYS_ENTRY_FILE)) != NULL)
+ 	{
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
index 5fa72b4f9b..b7d7f4ff96 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
@@ -1,7 +1,7 @@
-From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
+From 2fb126eef436389a2dc48d4225b4a9888b0625a8 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
 Date: Tue, 27 Jun 2023 10:58:11 +0000
-Subject: [PATCH] Don't read beyond sysfs entry point buffer
+Subject: [PATCH 5/5] Don't read beyond sysfs entry point buffer
 
 Functions smbios_decode() and smbios3_decode() include a check
 against buffer overrun. This check assumes that the buffer length is
@@ -33,105 +33,106 @@ Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index b4dbc9d..870d94e 100644
+index 9a691e0..e725801 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
-	buf[0x17] = 0;
+@@ -5398,14 +5398,14 @@ static void overwrite_smbios3_address(u8 *buf)
+ 	buf[0x17] = 0;
  }
-
+ 
 -static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
 +static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
  {
-	u32 ver, len;
-	u64 offset;
-	u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
+ 	u32 ver, len;
+ 	u64 offset;
+ 	u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
 -	if (buf[0x06] > 0x20)
 +        if (buf[0x06] > buf_len)
-	{
-		fprintf(stderr,
-			"Entry point length too large (%u bytes, expected %u).\n",
-@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
-	return 1;
+ 	{
+ 		fprintf(stderr,
+ 			"Entry point length too large (%u bytes, expected %u).\n",
+@@ -5455,14 +5455,14 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 	return 1;
  }
-
+ 
 -static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
 +static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
  {
-	u16 ver;
-	u32 len;
-         u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
+ 	u16 ver, num;
+ 	u32 len;
+ 	u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
 -	if (buf[0x05] > 0x20)
 +        if (buf[0x05] > buf_len)
-	{
-		fprintf(stderr,
-			"Entry point length too large (%u bytes, expected %u).\n",
-@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
-
-		if (memcmp(buf, "_SM3_", 5) == 0)
-		{
+ 	{
+ 		fprintf(stderr,
+ 			"Entry point length too large (%u bytes, expected %u).\n",
+@@ -5714,12 +5714,12 @@ int main(int argc, char * const argv[])
+ 
+ 		if (memcmp(buf, "_SM3_", 5) == 0)
+ 		{
 -			if (smbios3_decode(buf, opt.dumpfile, 0))
 +                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
-				found++;
-		}
-		else if (memcmp(buf, "_SM_", 4) == 0)
-		{
+ 				found++;
+ 		}
+ 		else if (memcmp(buf, "_SM_", 4) == 0)
+ 		{
 -			if (smbios_decode(buf, opt.dumpfile, 0))
 +                        if (smbios_decode(buf, size, opt.dumpfile, 0))
-				found++;
-		}
-		else if (memcmp(buf, "_DMI_", 5) == 0)
-@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
-			pr_info("Getting SMBIOS data from sysfs.");
-		if (size >= 24 && memcmp(buf, "_SM3_", 5) == 0)
-		{
+ 				found++;
+ 		}
+ 		else if (memcmp(buf, "_DMI_", 5) == 0)
+@@ -5742,12 +5742,12 @@ int main(int argc, char * const argv[])
+ 			pr_info("Getting SMBIOS data from sysfs.");
+ 		if (size >= 24 && memcmp(buf, "_SM3_", 5) == 0)
+ 		{
 -			if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
 +                        if (smbios3_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
-				found++;
-		}
-		else if (size >= 31 && memcmp(buf, "_SM_", 4) == 0)
-		{
+ 				found++;
+ 		}
+ 		else if (size >= 31 && memcmp(buf, "_SM_", 4) == 0)
+ 		{
 -			if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
 +                        if (smbios_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
-				found++;
-		}
-		else if (size >= 15 && memcmp(buf, "_DMI_", 5) == 0)
-@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
-
-	if (memcmp(buf, "_SM3_", 5) == 0)
-	{
+ 				found++;
+ 		}
+ 		else if (size >= 15 && memcmp(buf, "_DMI_", 5) == 0)
+@@ -5784,12 +5784,12 @@ int main(int argc, char * const argv[])
+ 
+ 	if (memcmp(buf, "_SM3_", 5) == 0)
+ 	{
 -		if (smbios3_decode(buf, opt.devmem, 0))
 +                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
-			found++;
-	}
-	else if (memcmp(buf, "_SM_", 4) == 0)
-	{
+ 			found++;
+ 	}
+ 	else if (memcmp(buf, "_SM_", 4) == 0)
+ 	{
 -		if (smbios_decode(buf, opt.devmem, 0))
 +                if (smbios_decode(buf, 0x20, opt.devmem, 0))
-			found++;
-	}
-	goto done;
-@@ -6114,7 +6114,7 @@ memory_scan:
-	{
-		if (memcmp(buf + fp, "_SM3_", 5) == 0)
-		{
+ 			found++;
+ 	}
+ 	goto done;
+@@ -5810,7 +5810,7 @@ memory_scan:
+ 	{
+ 		if (memcmp(buf + fp, "_SM3_", 5) == 0)
+ 		{
 -			if (smbios3_decode(buf + fp, opt.devmem, 0))
 +                        if (smbios3_decode(buf + fp, 0x20, opt.devmem, 0))
-			{
-				found++;
-				goto done;
-@@ -6127,7 +6127,7 @@ memory_scan:
-	{
-		if (memcmp(buf + fp, "_SM_", 4) == 0 && fp <= 0xFFE0)
-		{
+ 			{
+ 				found++;
+ 				goto done;
+@@ -5823,7 +5823,7 @@ memory_scan:
+ 	{
+ 		if (memcmp(buf + fp, "_SM_", 4) == 0 && fp <= 0xFFE0)
+ 		{
 -			if (smbios_decode(buf + fp, opt.devmem, 0))
 +                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0))
-			{
-				found++;
-				goto done;
---
-2.35.5
+ 			{
+ 				found++;
+ 				goto done;
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index b99c2ea99d..c0f6b45313 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
            file://0001-Committing-changes-from-do_unpack_extra.patch \
-           file://CVE-2023-30630_1.patch \
+           file://CVE-2023-30630_1a.patch \
+           file://CVE-2023-30630_1b.patch \
            file://CVE-2023-30630_2.patch \
            file://CVE-2023-30630_3.patch \
            file://CVE-2023-30630_4.patch \
-- 
2.41.0


