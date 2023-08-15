Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADE9C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 09:52:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.130912.1692093111712886726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 02:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hK9iEjT7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fea0640d88so12979355e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692093110; x=1692697910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84P/mtDSDnX/VjR6ZR4LHh8P71yy7C9xiUdhRFi2sjk=;
        b=hK9iEjT7/ZD3EPjEYhY8GJyYr6lYojPZbqTSMeG2OAnSVyFmbYNVuJF3etnRttrq4g
         EJh2/n33zLvb4j3+BzzHTZIrUukO4lCJvaPCiMhUQ4r+On/kXtgrfSiVIE2IRPUzqXiV
         55ybhhuRV0Gs7K6LBMHrw/oGLPgzfavGiF5LdhJ37X1x5IbxEDCZw1IPzF3Xm1zkrfG9
         sEagOWsdqfO9qS8EI1uWMsomUYcpZtEG3THIiexX+ixkkI/zpEUUoZIvbOgmhxijUesT
         Lea9QyCxFIST9Ar5uHQhRSyWHpQqRIywJVr1wMzuuIZQnTBQ7EjH30w1IdXlarqr4+LG
         o5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692093110; x=1692697910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84P/mtDSDnX/VjR6ZR4LHh8P71yy7C9xiUdhRFi2sjk=;
        b=V5182eNTJMsmm571+gUPJ4OJEtSU4WFlapYmWYzqVYF/307dSE07u3chySg6ADWVsk
         9ZpM9dGnosJafXVUf+e6UMnGnxTaEOUX4t9MobMHkYVxpWyFyHE0MfGyIxCjVGPVh4PO
         FR/QBZArVVR3Tjwk7lCqhDewTCPtOIa6QngTMxBaryxKW7vguPXH91C3ZcCzQZPuCebe
         GCyRQDJETw9F1w66RyofACh3j5OZYHuVMdygtMc2c7uGSd+8N+rN5P9oTFvh+NrcmCJy
         WMbyr3x2ABRCXb8Fej4HUze1J82PMbeGRLzU0jWb94Xyt6bp2cgKNpRGDNC97cPIbAK+
         o92A==
X-Gm-Message-State: AOJu0YwHSQqM6aMEz/iyROWqGsU/F/h10Yuynw5PGfrPp2maXna6Li64
	Wsi0nyM9J1sKU/5pJDxzCGilImXFCNc=
X-Google-Smtp-Source: AGHT+IEJsmjXK66f++37HriMpdYH7JC1SeKVFCrN/43YjIeN5wSbGIsRapuKa6QgKO/pRkTWCTvpyQ==
X-Received: by 2002:a5d:6d51:0:b0:317:dd94:ed38 with SMTP id k17-20020a5d6d51000000b00317dd94ed38mr8040770wri.42.1692093109505;
        Tue, 15 Aug 2023 02:51:49 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm17243434wru.96.2023.08.15.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:51:49 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 1/1] dmidecode: fixup for CVE-2023-30630
Date: Tue, 15 Aug 2023 11:50:51 +0200
Message-ID: <20230815095122.188614-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815095122.188614-1-adrian.freihofer@siemens.com>
References: <20230815095122.188614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186055

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
well.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../dmidecode/CVE-2023-30630_1.patch          | 397 +++++++++---------
 .../dmidecode/CVE-2023-30630_2.patch          | 229 +++++++---
 .../dmidecode/CVE-2023-30630_3.patch          | 122 +++---
 .../dmidecode/CVE-2023-30630_4.patch          | 174 +++-----
 .../dmidecode/CVE-2023-30630_5.patch          | 138 ++++++
 5 files changed, 631 insertions(+), 429 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_5.patch

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
index 53480d6299..bf93fbc13c 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
@@ -1,237 +1,236 @@
-From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 2001
+From ee6db10dd70b8fdc7a93cffd7cf5bc7a28f9d3d7 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
-Date: Tue, 27 Jun 2023 09:40:23 +0000
-Subject: [PATCH] dmidecode: Write the whole dump file at once
+Date: Mon, 20 Feb 2023 14:53:21 +0100
+Subject: [PATCH 1/5] dmidecode: Split table fetching from decoding
 
-When option --dump-bin is used, write the whole dump file at once,
-instead of opening and closing the file separately for the table
-and then for the entry point.
+Clean up function dmi_table so that it does only one thing:
+* dmi_table() is renamed to dmi_table_get(). It now retrieves the
+  DMI table, but does not process it any longer.
+* Decoding or dumping the table is now done in smbios3_decode(),
+  smbios_decode() and legacy_decode().
+No functional change.
 
-As the file writing function is no longer generic, it gets moved
-from util.c to dmidecode.c.
-
-One minor functional change resulting from the new implementation is
-that the entry point is written first now, so the messages printed
-are swapped.
+A side effect of this change is that writing the header and body of
+dump files is now done in a single location. This is required to
+further consolidate the writing of dump files.
 
 Signed-off-by: Jean Delvare <jdelvare@suse.de>
 Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
 
 CVE: CVE-2023-30630
 
-Reference: https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808
-
-Upstream-Status: Backport [https://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=39b2dd7b6ab719b920e96ed832cfb4bdd664e808]
 
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
 ---
- dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------
- util.c      | 40 ---------------------------
- util.h      |  1 -
- 3 files changed, 58 insertions(+), 62 deletions(-)
+ dmidecode.c | 86 ++++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 62 insertions(+), 24 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index 9aeff91..5477309 100644
+index cd2b5c9..b082c03 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
-	}
+@@ -5247,8 +5247,9 @@ static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 flags)
+ 	}
  }
-
--static void dmi_table_dump(const u8 *buf, u32 len)
-+static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
-+			  u32 table_len)
+ 
+-static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+-		      u32 flags)
++/* Allocates a buffer for the table, must be freed by the caller */
++static u8 *dmi_table_get(off_t base, u32 *len, u16 num, u32 ver,
++			 const char *devmem, u32 flags)
  {
-+	FILE *f;
-+
-+	f = fopen(opt.dumpfile, "wb");
-+	if (!f)
-+	{
-+		fprintf(stderr, "%s: ", opt.dumpfile);
-+		perror("fopen");
-+		return -1;
-+	}
-+
-+	if (!(opt.flags & FLAG_QUIET))
-+		pr_comment("Writing %d bytes to %s.", ep_len, opt.dumpfile);
-+	if (fwrite(ep, ep_len, 1, f) != 1)
-+	{
-+		fprintf(stderr, "%s: ", opt.dumpfile);
-+		perror("fwrite");
-+		goto err_close;
-+	}
-+
-+	if (fseek(f, 32, SEEK_SET) != 0)
-+	{
-+		fprintf(stderr, "%s: ", opt.dumpfile);
-+		perror("fseek");
-+		goto err_close;
-+	}
-+
-	if (!(opt.flags & FLAG_QUIET))
--		pr_comment("Writing %d bytes to %s.", len, opt.dumpfile);
--	write_dump(32, len, buf, opt.dumpfile, 0);
-+		pr_comment("Writing %d bytes to %s.", table_len, opt.dumpfile);
-+	if (fwrite(table, table_len, 1, f) != 1)
-+	{
-+		fprintf(stderr, "%s: ", opt.dumpfile);
-+		perror("fwrite");
-+		goto err_close;
-+	}
-+
-+	if (fclose(f))
-+	{
-+		fprintf(stderr, "%s: ", opt.dumpfile);
-+		perror("fclose");
-+		return -1;
-+	}
-+
-+	return 0;
-+
-+err_close:
-+	fclose(f);
-+	return -1;
- }
-
- static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 flags)
-@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
-		return;
-	}
-
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
 -	if (opt.flags & FLAG_DUMP_BIN)
 -		dmi_table_dump(buf, len);
 -	else
 -		dmi_table_decode(buf, len, num, ver >> 8, flags);
 -
-	free(buf);
+-	free(buf);
++	return buf;
  }
-
-@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
-
+ 
+ 
+@@ -5350,8 +5345,9 @@ static void overwrite_smbios3_address(u8 *buf)
+ 
  static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
  {
 -	u32 ver;
 +	u32 ver, len;
-	u64 offset;
+ 	u64 offset;
 +	u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
-	if (buf[0x06] > 0x20)
-@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
-		memcpy(crafted, buf, 32);
-		overwrite_smbios3_address(crafted);
-
--		if (!(opt.flags & FLAG_QUIET))
--			pr_comment("Writing %d bytes to %s.", crafted[0x06],
--				   opt.dumpfile);
--		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
-+		dmi_table_dump(crafted, crafted[0x06], table, len);
-	}
-
-	return 1;
-@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
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
  static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
  {
-	u16 ver;
+-	u16 ver;
++	u16 ver, num;
 +	u32 len;
-+        u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
-	if (buf[0x05] > 0x20)
-@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
-		memcpy(crafted, buf, 32);
-		overwrite_dmi_address(crafted + 0x10);
-
--		if (!(opt.flags & FLAG_QUIET))
--			pr_comment("Writing %d bytes to %s.", crafted[0x05],
--				   opt.dumpfile);
--		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
-+		dmi_table_dump(crafted, crafted[0x05], table, len);
-	}
-
-	return 1;
-@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
-
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
  static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
  {
++	u16 ver, num;
 +	u32 len;
 +	u8 *table;
 +
-	if (!checksum(buf, 0x0F))
-		return 0;
-
-@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
-		memcpy(crafted, buf, 16);
-		overwrite_dmi_address(crafted);
-
--		if (!(opt.flags & FLAG_QUIET))
--			pr_comment("Writing %d bytes to %s.", 0x0F,
--				   opt.dumpfile);
--		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
-+		dmi_table_dump(crafted, 0x0F, table, len);
-	}
-
-	return 1;
-diff --git a/util.c b/util.c
-index 04aaadd..1547096 100644
---- a/util.c
-+++ b/util.c
-@@ -259,46 +259,6 @@ out:
-	return p;
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
  }
+-- 
+2.41.0
 
--int write_dump(size_t base, size_t len, const void *data, const char *dumpfile, int add)
--{
--	FILE *f;
--
--	f = fopen(dumpfile, add ? "r+b" : "wb");
--	if (!f)
--	{
--		fprintf(stderr, "%s: ", dumpfile);
--		perror("fopen");
--		return -1;
--	}
--
--	if (fseek(f, base, SEEK_SET) != 0)
--	{
--		fprintf(stderr, "%s: ", dumpfile);
--		perror("fseek");
--		goto err_close;
--	}
--
--	if (fwrite(data, len, 1, f) != 1)
--	{
--		fprintf(stderr, "%s: ", dumpfile);
--		perror("fwrite");
--		goto err_close;
--	}
--
--	if (fclose(f))
--	{
--		fprintf(stderr, "%s: ", dumpfile);
--		perror("fclose");
--		return -1;
--	}
--
--	return 0;
--
--err_close:
--	fclose(f);
--	return -1;
--}
--
- /* Returns end - start + 1, assuming start < end */
- u64 u64_range(u64 start, u64 end)
- {
-diff --git a/util.h b/util.h
-index 3094cf8..ef24eb9 100644
---- a/util.h
-+++ b/util.h
-@@ -27,5 +27,4 @@
- int checksum(const u8 *buf, size_t len);
- void *read_file(off_t base, size_t *len, const char *filename);
- void *mem_chunk(off_t base, size_t len, const char *devmem);
--int write_dump(size_t base, size_t len, const void *data, const char *dumpfile, int add);
- u64 u64_range(u64 start, u64 end);
---
-2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
index 9f53a205ac..e03bda05e4 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
@@ -1,80 +1,197 @@
-From 47101389dd52b50123a3ec59fed4d2021752e489 Mon Sep 17 00:00:00 2001
+From d362549bce92ac22860cda8cad4532c1a3fe6928 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
-Date: Tue, 27 Jun 2023 10:03:53 +0000
-Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing file
+Date: Mon, 20 Feb 2023 14:53:25 +0100
+Subject: [PATCH 2/5] dmidecode: Write the whole dump file at once
 
-Make sure that the file passed to option --dump-bin does not already
-exist. In practice, it is rather unlikely that an honest user would
-want to overwrite an existing dump file, while this possibility
-could be used by a rogue user to corrupt a system file.
+When option --dump-bin is used, write the whole dump file at once,
+instead of opening and closing the file separately for the table
+and then for the entry point.
+
+As the file writing function is no longer generic, it gets moved
+from util.c to dmidecode.c.
+
+One minor functional change resulting from the new implementation is
+that the entry point is written first now, so the messages printed
+are swapped.
 
 Signed-off-by: Jean Delvare <jdelvare@suse.de>
 Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
 
 CVE: CVE-2023-30630
 
-Upstream-Status: Backport
-[https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
 
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
 ---
- dmidecode.c     | 14 ++++++++++++--
- man/dmidecode.8 |  3 ++-
- 2 files changed, 14 insertions(+), 3 deletions(-)
+ dmidecode.c | 69 +++++++++++++++++++++++++++++++++++++++--------------
+ util.c      | 40 -------------------------------
+ util.h      |  1 -
+ 3 files changed, 51 insertions(+), 59 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index ae461de..6446040 100644
+index b082c03..a80a140 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -60,6 +60,7 @@
-  *    https://www.dmtf.org/sites/default/files/DSP0270_1.0.1.pdf
-  */
+@@ -5130,11 +5130,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
+ 	}
+ }
  
-+#include <fcntl.h>
- #include <stdio.h>
- #include <string.h>
- #include <strings.h>
-@@ -5133,13 +5134,22 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
- static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
- 			  u32 table_len)
+-static void dmi_table_dump(const u8 *buf, u32 len)
++static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
++			  u32 table_len)
  {
-+	int fd;
- 	FILE *f;
- 
--	f = fopen(opt.dumpfile, "wb");
-+	fd = open(opt.dumpfile, O_WRONLY|O_CREAT|O_EXCL, 0666);
-+	if (fd == -1)
++	FILE *f;
++
++	f = fopen(opt.dumpfile, "wb");
++	if (!f)
++	{
++		fprintf(stderr, "%s: ", opt.dumpfile);
++		perror("fopen");
++		return -1;
++	}
++
++	if (!(opt.flags & FLAG_QUIET))
++		pr_comment("Writing %d bytes to %s.", ep_len, opt.dumpfile);
++	if (fwrite(ep, ep_len, 1, f) != 1)
++	{
++		fprintf(stderr, "%s: ", opt.dumpfile);
++		perror("fwrite");
++		goto err_close;
++	}
++
++	if (fseek(f, 32, SEEK_SET) != 0)
++	{
++		fprintf(stderr, "%s: ", opt.dumpfile);
++		perror("fseek");
++		goto err_close;
++	}
++
+ 	if (!(opt.flags & FLAG_QUIET))
+-		pr_comment("Writing %d bytes to %s.", len, opt.dumpfile);
+-	write_dump(32, len, buf, opt.dumpfile, 0);
++		pr_comment("Writing %d bytes to %s.", table_len, opt.dumpfile);
++	if (fwrite(table, table_len, 1, f) != 1)
++	{
++		fprintf(stderr, "%s: ", opt.dumpfile);
++		perror("fwrite");
++		goto err_close;
++	}
++
++	if (fclose(f))
 +	{
 +		fprintf(stderr, "%s: ", opt.dumpfile);
-+		perror("open");
++		perror("fclose");
 +		return -1;
 +	}
 +
-+	f = fdopen(fd, "wb");
- 	if (!f)
++	return 0;
++
++err_close:
++	fclose(f);
++	return -1;
+ }
+ 
+ static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 flags)
+@@ -5387,11 +5432,7 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_smbios3_address(crafted);
+ 
+-		dmi_table_dump(table, len);
+-		if (!(opt.flags & FLAG_QUIET))
+-			pr_comment("Writing %d bytes to %s.", crafted[0x06],
+-				   opt.dumpfile);
+-		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x06], table, len);
+ 	}
+ 	else
  	{
- 		fprintf(stderr, "%s: ", opt.dumpfile);
--		perror("fopen");
-+		perror("fdopen");
- 		return -1;
+@@ -5463,11 +5504,7 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_dmi_address(crafted + 0x10);
+ 
+-		dmi_table_dump(table, len);
+-		if (!(opt.flags & FLAG_QUIET))
+-			pr_comment("Writing %d bytes to %s.", crafted[0x05],
+-				   opt.dumpfile);
+-		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x05], table, len);
  	}
+ 	else
+ 	{
+@@ -5508,11 +5545,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 16);
+ 		overwrite_dmi_address(crafted);
  
-diff --git a/man/dmidecode.8 b/man/dmidecode.8
-index 64dc7e7..d5b7f01 100644
---- a/man/dmidecode.8
-+++ b/man/dmidecode.8
-@@ -1,4 +1,4 @@
--.TH DMIDECODE 8 "January 2019" "dmidecode"
-+.TH DMIDECODE 8 "February 2023" "dmidecode"
- .\"
- .SH NAME
- dmidecode \- \s-1DMI\s0 table decoder
-@@ -132,6 +132,7 @@ hexadecimal and \s-1ASCII\s0. This option is mainly useful for debugging.
- Do not decode the entries, instead dump the DMI data to a file in binary
- form. The generated file is suitable to pass to \fB--from-dump\fR
- later.
-+\fIFILE\fP must not exist.
- .TP
- .BR "  " "  " "--from-dump FILE"
- Read the DMI data from a binary file previously generated using 
+-		dmi_table_dump(table, len);
+-		if (!(opt.flags & FLAG_QUIET))
+-			pr_comment("Writing %d bytes to %s.", 0x0F,
+-				   opt.dumpfile);
+-		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, 0x0F, table, len);
+ 	}
+ 	else
+ 	{
+diff --git a/util.c b/util.c
+index 04aaadd..1547096 100644
+--- a/util.c
++++ b/util.c
+@@ -259,46 +259,6 @@ out:
+ 	return p;
+ }
+ 
+-int write_dump(size_t base, size_t len, const void *data, const char *dumpfile, int add)
+-{
+-	FILE *f;
+-
+-	f = fopen(dumpfile, add ? "r+b" : "wb");
+-	if (!f)
+-	{
+-		fprintf(stderr, "%s: ", dumpfile);
+-		perror("fopen");
+-		return -1;
+-	}
+-
+-	if (fseek(f, base, SEEK_SET) != 0)
+-	{
+-		fprintf(stderr, "%s: ", dumpfile);
+-		perror("fseek");
+-		goto err_close;
+-	}
+-
+-	if (fwrite(data, len, 1, f) != 1)
+-	{
+-		fprintf(stderr, "%s: ", dumpfile);
+-		perror("fwrite");
+-		goto err_close;
+-	}
+-
+-	if (fclose(f))
+-	{
+-		fprintf(stderr, "%s: ", dumpfile);
+-		perror("fclose");
+-		return -1;
+-	}
+-
+-	return 0;
+-
+-err_close:
+-	fclose(f);
+-	return -1;
+-}
+-
+ /* Returns end - start + 1, assuming start < end */
+ u64 u64_range(u64 start, u64 end)
+ {
+diff --git a/util.h b/util.h
+index 3094cf8..ef24eb9 100644
+--- a/util.h
++++ b/util.h
+@@ -27,5 +27,4 @@
+ int checksum(const u8 *buf, size_t len);
+ void *read_file(off_t base, size_t *len, const char *filename);
+ void *mem_chunk(off_t base, size_t len, const char *devmem);
+-int write_dump(size_t base, size_t len, const void *data, const char *dumpfile, int add);
+ u64 u64_range(u64 start, u64 end);
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
index 01d0d1f867..37167a9c4f 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
@@ -1,69 +1,83 @@
-From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
+From 2d26f187c734635d072d24ea401255b84f03f4c4 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
-Date: Tue, 27 Jun 2023 10:25:50 +0000
-Subject: [PATCH] Consistently use read_file() when reading from a dump file
+Date: Tue, 27 Jun 2023 10:03:53 +0000
+Subject: [PATCH 3/5] dmidecode: Do not let --dump-bin overwrite an existing
+ file
 
-Use read_file() instead of mem_chunk() to read the entry point from a
-dump file. This is faster, and consistent with how we then read the
-actual DMI table from that dump file.
-
-This made no functional difference so far, which is why it went
-unnoticed for years. But now that a file type check was added to the
-mem_chunk() function, we must stop using it to read from regular
-files.
-
-This will again allow root to use the --from-dump option.
+Make sure that the file passed to option --dump-bin does not already
+exist. In practice, it is rather unlikely that an honest user would
+want to overwrite an existing dump file, while this possibility
+could be used by a rogue user to corrupt a system file.
 
 Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Tested-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
 
 CVE: CVE-2023-30630
 
-Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=c76ddda0ba0aa99a55945e3290095c2ec493c892]
+Upstream-Status: Backport
+[https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2]
 
 Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
 ---
- dmidecode.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
+ dmidecode.c     | 14 ++++++++++++--
+ man/dmidecode.8 |  3 ++-
+ 2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index 98f9692..b4dbc9d 100644
+index a80a140..32a77cc 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
-		pr_comment("dmidecode %s", VERSION);
-
-	/* Read from dump if so instructed */
-+        size = 0x20;
-	if (opt.flags & FLAG_FROM_DUMP)
-	{
-		if (!(opt.flags & FLAG_QUIET))
-			pr_info("Reading SMBIOS/DMI data from file %s.",
-				opt.dumpfile);
--		if ((buf = mem_chunk(0, 0x20, opt.dumpfile)) == NULL)
-+                if ((buf = read_file(0, &size, opt.dumpfile)) == NULL)
-		{
-			ret = 1;
-			goto exit_free;
-		}
-
-+                /* Truncated entry point can't be processed */
-+                if (size < 0x20)
-+                {
-+                        ret = 1;
-+                        goto done;
-+                }
+@@ -60,6 +60,7 @@
+  *    https://www.dmtf.org/sites/default/files/DSP0270_1.0.1.pdf
+  */
+ 
++#include <fcntl.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <strings.h>
+@@ -5133,13 +5134,22 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
+ static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
+ 			  u32 table_len)
+ {
++	int fd;
+ 	FILE *f;
+ 
+-	f = fopen(opt.dumpfile, "wb");
++	fd = open(opt.dumpfile, O_WRONLY|O_CREAT|O_EXCL, 0666);
++	if (fd == -1)
++	{
++		fprintf(stderr, "%s: ", opt.dumpfile);
++		perror("open");
++		return -1;
++	}
 +
-		if (memcmp(buf, "_SM3_", 5) == 0)
-		{
-			if (smbios3_decode(buf, opt.dumpfile, 0))
-@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
-	 * contain one of several types of entry points, so read enough for
-	 * the largest one, then determine what type it contains.
-	 */
--	size = 0x20;
-	if (!(opt.flags & FLAG_NO_SYSFS)
-	 && (buf = read_file(0, &size, SYS_ENTRY_FILE)) != NULL)
-	{
---
-2.40.0
++	f = fdopen(fd, "wb");
+ 	if (!f)
+ 	{
+ 		fprintf(stderr, "%s: ", opt.dumpfile);
+-		perror("fopen");
++		perror("fdopen");
+ 		return -1;
+ 	}
+ 
+diff --git a/man/dmidecode.8 b/man/dmidecode.8
+index 64dc7e7..d5b7f01 100644
+--- a/man/dmidecode.8
++++ b/man/dmidecode.8
+@@ -1,4 +1,4 @@
+-.TH DMIDECODE 8 "January 2019" "dmidecode"
++.TH DMIDECODE 8 "February 2023" "dmidecode"
+ .\"
+ .SH NAME
+ dmidecode \- \s-1DMI\s0 table decoder
+@@ -132,6 +132,7 @@ hexadecimal and \s-1ASCII\s0. This option is mainly useful for debugging.
+ Do not decode the entries, instead dump the DMI data to a file in binary
+ form. The generated file is suitable to pass to \fB--from-dump\fR
+ later.
++\fIFILE\fP must not exist.
+ .TP
+ .BR "  " "  " "--from-dump FILE"
+ Read the DMI data from a binary file previously generated using 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
index 5fa72b4f9b..181092a3fd 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
@@ -1,137 +1,71 @@
-From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
+From ac881f801b92b57fd8daac65fb16fff6d84fd366 Mon Sep 17 00:00:00 2001
 From: Jean Delvare <jdelvare@suse.de>
-Date: Tue, 27 Jun 2023 10:58:11 +0000
-Subject: [PATCH] Don't read beyond sysfs entry point buffer
+Date: Tue, 27 Jun 2023 10:25:50 +0000
+Subject: [PATCH 4/5] Consistently use read_file() when reading from a dump
+ file
 
-Functions smbios_decode() and smbios3_decode() include a check
-against buffer overrun. This check assumes that the buffer length is
-always 32 bytes. This is true when reading from /dev/mem or from a
-dump file, however when reading from sysfs, the buffer length is the
-size of the actual sysfs attribute file, typically 31 bytes for an
-SMBIOS 2.x entry point and 24 bytes for an SMBIOS 3.x entry point.
+Use read_file() instead of mem_chunk() to read the entry point from a
+dump file. This is faster, and consistent with how we then read the
+actual DMI table from that dump file.
 
-In the unlikely event of a malformed entry point, with encoded length
-larger than expected but smaller than or equal to 32, we would hit a
-buffer overrun. So properly pass the actual buffer length as an
-argument and perform the check against it.
+This made no functional difference so far, which is why it went
+unnoticed for years. But now that a file type check was added to the
+mem_chunk() function, we must stop using it to read from regular
+files.
 
-In practice, this will never happen, because on the Linux kernel
-side, the size of the sysfs attribute file is decided from the entry
-point length field. So it is technically impossible for them not to
-match. But user-space code should not make such assumptions.
+This will again allow root to use the --from-dump option.
 
 Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Tested-by: Jerry Hoemann <jerry.hoemann@hpe.com>
 
 CVE: CVE-2023-30630
 
-Upstream-Status: Backport
-[https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=2b83c4b898f8325313162f588765411e8e3e5561]
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=c76ddda0ba0aa99a55945e3290095c2ec493c892]
 
 Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
 ---
- dmidecode.c | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
+ dmidecode.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index b4dbc9d..870d94e 100644
+index 32a77cc..9a691e0 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
-	buf[0x17] = 0;
- }
+@@ -5693,17 +5693,25 @@ int main(int argc, char * const argv[])
+ 		pr_comment("dmidecode %s", VERSION);
+ 
+ 	/* Read from dump if so instructed */
++        size = 0x20;
+ 	if (opt.flags & FLAG_FROM_DUMP)
+ 	{
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			pr_info("Reading SMBIOS/DMI data from file %s.",
+ 				opt.dumpfile);
+-		if ((buf = mem_chunk(0, 0x20, opt.dumpfile)) == NULL)
++                if ((buf = read_file(0, &size, opt.dumpfile)) == NULL)
+ 		{
+ 			ret = 1;
+ 			goto exit_free;
+ 		}
+ 
++                /* Truncated entry point can't be processed */
++                if (size < 0x20)
++                {
++                        ret = 1;
++                        goto done;
++                }
++
+ 		if (memcmp(buf, "_SM3_", 5) == 0)
+ 		{
+ 			if (smbios3_decode(buf, opt.dumpfile, 0))
+@@ -5727,7 +5735,6 @@ int main(int argc, char * const argv[])
+ 	 * contain one of several types of entry points, so read enough for
+ 	 * the largest one, then determine what type it contains.
+ 	 */
+-	size = 0x20;
+ 	if (!(opt.flags & FLAG_NO_SYSFS)
+ 	 && (buf = read_file(0, &size, SYS_ENTRY_FILE)) != NULL)
+ 	{
+-- 
+2.41.0
 
--static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
-+static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
- {
-	u32 ver, len;
-	u64 offset;
-	u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
--	if (buf[0x06] > 0x20)
-+        if (buf[0x06] > buf_len)
-	{
-		fprintf(stderr,
-			"Entry point length too large (%u bytes, expected %u).\n",
-@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
-	return 1;
- }
-
--static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
-+static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
- {
-	u16 ver;
-	u32 len;
-         u8 *table;
-
-	/* Don't let checksum run beyond the buffer */
--	if (buf[0x05] > 0x20)
-+        if (buf[0x05] > buf_len)
-	{
-		fprintf(stderr,
-			"Entry point length too large (%u bytes, expected %u).\n",
-@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
-
-		if (memcmp(buf, "_SM3_", 5) == 0)
-		{
--			if (smbios3_decode(buf, opt.dumpfile, 0))
-+                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
-				found++;
-		}
-		else if (memcmp(buf, "_SM_", 4) == 0)
-		{
--			if (smbios_decode(buf, opt.dumpfile, 0))
-+                        if (smbios_decode(buf, size, opt.dumpfile, 0))
-				found++;
-		}
-		else if (memcmp(buf, "_DMI_", 5) == 0)
-@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
-			pr_info("Getting SMBIOS data from sysfs.");
-		if (size >= 24 && memcmp(buf, "_SM3_", 5) == 0)
-		{
--			if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
-+                        if (smbios3_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
-				found++;
-		}
-		else if (size >= 31 && memcmp(buf, "_SM_", 4) == 0)
-		{
--			if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
-+                        if (smbios_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
-				found++;
-		}
-		else if (size >= 15 && memcmp(buf, "_DMI_", 5) == 0)
-@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
-
-	if (memcmp(buf, "_SM3_", 5) == 0)
-	{
--		if (smbios3_decode(buf, opt.devmem, 0))
-+                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
-			found++;
-	}
-	else if (memcmp(buf, "_SM_", 4) == 0)
-	{
--		if (smbios_decode(buf, opt.devmem, 0))
-+                if (smbios_decode(buf, 0x20, opt.devmem, 0))
-			found++;
-	}
-	goto done;
-@@ -6114,7 +6114,7 @@ memory_scan:
-	{
-		if (memcmp(buf + fp, "_SM3_", 5) == 0)
-		{
--			if (smbios3_decode(buf + fp, opt.devmem, 0))
-+                        if (smbios3_decode(buf + fp, 0x20, opt.devmem, 0))
-			{
-				found++;
-				goto done;
-@@ -6127,7 +6127,7 @@ memory_scan:
-	{
-		if (memcmp(buf + fp, "_SM_", 4) == 0 && fp <= 0xFFE0)
-		{
--			if (smbios_decode(buf + fp, opt.devmem, 0))
-+                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0))
-			{
-				found++;
-				goto done;
---
-2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_5.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_5.patch
new file mode 100644
index 0000000000..b7d7f4ff96
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_5.patch
@@ -0,0 +1,138 @@
+From 2fb126eef436389a2dc48d4225b4a9888b0625a8 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Tue, 27 Jun 2023 10:58:11 +0000
+Subject: [PATCH 5/5] Don't read beyond sysfs entry point buffer
+
+Functions smbios_decode() and smbios3_decode() include a check
+against buffer overrun. This check assumes that the buffer length is
+always 32 bytes. This is true when reading from /dev/mem or from a
+dump file, however when reading from sysfs, the buffer length is the
+size of the actual sysfs attribute file, typically 31 bytes for an
+SMBIOS 2.x entry point and 24 bytes for an SMBIOS 3.x entry point.
+
+In the unlikely event of a malformed entry point, with encoded length
+larger than expected but smaller than or equal to 32, we would hit a
+buffer overrun. So properly pass the actual buffer length as an
+argument and perform the check against it.
+
+In practice, this will never happen, because on the Linux kernel
+side, the size of the sysfs attribute file is decided from the entry
+point length field. So it is technically impossible for them not to
+match. But user-space code should not make such assumptions.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport
+[https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=2b83c4b898f8325313162f588765411e8e3e5561]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dmidecode.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 9a691e0..e725801 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5398,14 +5398,14 @@ static void overwrite_smbios3_address(u8 *buf)
+ 	buf[0x17] = 0;
+ }
+ 
+-static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
++static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ {
+ 	u32 ver, len;
+ 	u64 offset;
+ 	u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
+-	if (buf[0x06] > 0x20)
++        if (buf[0x06] > buf_len)
+ 	{
+ 		fprintf(stderr,
+ 			"Entry point length too large (%u bytes, expected %u).\n",
+@@ -5455,14 +5455,14 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 	return 1;
+ }
+ 
+-static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
++static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ {
+ 	u16 ver, num;
+ 	u32 len;
+ 	u8 *table;
+ 
+ 	/* Don't let checksum run beyond the buffer */
+-	if (buf[0x05] > 0x20)
++        if (buf[0x05] > buf_len)
+ 	{
+ 		fprintf(stderr,
+ 			"Entry point length too large (%u bytes, expected %u).\n",
+@@ -5714,12 +5714,12 @@ int main(int argc, char * const argv[])
+ 
+ 		if (memcmp(buf, "_SM3_", 5) == 0)
+ 		{
+-			if (smbios3_decode(buf, opt.dumpfile, 0))
++                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
+ 				found++;
+ 		}
+ 		else if (memcmp(buf, "_SM_", 4) == 0)
+ 		{
+-			if (smbios_decode(buf, opt.dumpfile, 0))
++                        if (smbios_decode(buf, size, opt.dumpfile, 0))
+ 				found++;
+ 		}
+ 		else if (memcmp(buf, "_DMI_", 5) == 0)
+@@ -5742,12 +5742,12 @@ int main(int argc, char * const argv[])
+ 			pr_info("Getting SMBIOS data from sysfs.");
+ 		if (size >= 24 && memcmp(buf, "_SM3_", 5) == 0)
+ 		{
+-			if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
++                        if (smbios3_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
+ 				found++;
+ 		}
+ 		else if (size >= 31 && memcmp(buf, "_SM_", 4) == 0)
+ 		{
+-			if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
++                        if (smbios_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
+ 				found++;
+ 		}
+ 		else if (size >= 15 && memcmp(buf, "_DMI_", 5) == 0)
+@@ -5784,12 +5784,12 @@ int main(int argc, char * const argv[])
+ 
+ 	if (memcmp(buf, "_SM3_", 5) == 0)
+ 	{
+-		if (smbios3_decode(buf, opt.devmem, 0))
++                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
+ 			found++;
+ 	}
+ 	else if (memcmp(buf, "_SM_", 4) == 0)
+ 	{
+-		if (smbios_decode(buf, opt.devmem, 0))
++                if (smbios_decode(buf, 0x20, opt.devmem, 0))
+ 			found++;
+ 	}
+ 	goto done;
+@@ -5810,7 +5810,7 @@ memory_scan:
+ 	{
+ 		if (memcmp(buf + fp, "_SM3_", 5) == 0)
+ 		{
+-			if (smbios3_decode(buf + fp, opt.devmem, 0))
++                        if (smbios3_decode(buf + fp, 0x20, opt.devmem, 0))
+ 			{
+ 				found++;
+ 				goto done;
+@@ -5823,7 +5823,7 @@ memory_scan:
+ 	{
+ 		if (memcmp(buf + fp, "_SM_", 4) == 0 && fp <= 0xFFE0)
+ 		{
+-			if (smbios_decode(buf + fp, opt.devmem, 0))
++                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0))
+ 			{
+ 				found++;
+ 				goto done;
+-- 
+2.41.0
+
-- 
2.41.0


