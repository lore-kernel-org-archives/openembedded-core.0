Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C3FCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:22:30 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.120509.1697458939534694903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 05:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=nw+WU/yf;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=o2JPKuO9XMOBx371VEFxcznRrvUO89hV3kRz3pM3/NY=; b=nw+WU/yfpWKAcl2XrFNUQBWKh2
	eLn8rwOirmvBozz6ZB3zuYnseR4t4ag04ZwqZ6GtODivcJGQ0QX65/zBGD3Yxnh0b2KmJA11SXHg4
	pOo7j/7i5reEVNyFGWRHEYLPqHBfYsQvbNAgPySERF10VLOGLd0f0KRLUHfSr7mrFyxrdfSAJcj2Z
	TIeqzNn7XHxKYnCi1hXpEYp3dxaztV9tepHRbDyt9UtP6jTVcAY2X1cNs8vNTaFHEl2oH+4pkLoDl
	EOEP4e9jazW8Igjge7R4xPRMfat37SsOEsQ7B2GOHRYiFrMIRygFTi0Z7OhoT7W5FI1sGnsNdfp+n
	9h1Tmm1g==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qsMbv-000BpQ-8e; Mon, 16 Oct 2023 14:22:15 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qsMbu-000BhA-VB; Mon, 16 Oct 2023 14:22:15 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk,
	adrian.freihofer@gmail.com,
	steve@sakoman.com
Subject: [OE-core][mickledore][PATCH] dmidecode: fixup for CVE-2023-30630
Date: Mon, 16 Oct 2023 14:21:58 +0200
Message-ID: <20231016122201.291696-1-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27063/Mon Oct 16 10:02:17 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189291

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

This is basically the same patch as in kirkstone:
ea069a94a2 dmidecode: fixup for CVE-2023-30630

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 .../dmidecode/CVE-2023-30630_1a.patch         | 236 ++++++++++++++++++
 .../dmidecode/CVE-2023-30630_1b.patch         | 197 +++++++++++++++
 .../dmidecode/CVE-2023-30630_2.patch          |   8 +-
 .../dmidecode/CVE-2023-30630_3.patch          |  55 ++--
 .../dmidecode/CVE-2023-30630_4.patch          | 143 +++++------
 .../dmidecode/dmidecode_3.4.bb                |   3 +-
 6 files changed, 539 insertions(+), 103 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch

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
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
new file mode 100644
index 0000000000..e03bda05e4
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1b.patch
@@ -0,0 +1,197 @@
+From d362549bce92ac22860cda8cad4532c1a3fe6928 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 20 Feb 2023 14:53:25 +0100
+Subject: [PATCH 2/5] dmidecode: Write the whole dump file at once
+
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
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
+
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
+---
+ dmidecode.c | 69 +++++++++++++++++++++++++++++++++++++++--------------
+ util.c      | 40 -------------------------------
+ util.h      |  1 -
+ 3 files changed, 51 insertions(+), 59 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index b082c03..a80a140 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5130,11 +5130,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
+ 	}
+ }
+ 
+-static void dmi_table_dump(const u8 *buf, u32 len)
++static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
++			  u32 table_len)
+ {
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
++	{
++		fprintf(stderr, "%s: ", opt.dumpfile);
++		perror("fclose");
++		return -1;
++	}
++
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
+ 	{
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
+ 	}
+ 	else
+ 	{
+@@ -5508,11 +5545,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 16);
+ 		overwrite_dmi_address(crafted);
+ 
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
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
index dcc87d2326..971c8c0126 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
@@ -29,18 +29,18 @@ index 5477309..98f9692 100644
 @@ -60,6 +60,7 @@
   *    https://www.dmtf.org/sites/default/files/DSP0270_1.0.1.pdf
   */
-
+ 
 +#include <fcntl.h>
  #include <stdio.h>
  #include <string.h>
  #include <strings.h>
 @@ -5430,13 +5431,22 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
  static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
-			  u32 table_len)
+ 			  u32 table_len)
  {
 +	int fd;
-	FILE *f;
-
+ 	FILE *f;
+ 
 -	f = fopen(opt.dumpfile, "wb");
 +	fd = open(opt.dumpfile, O_WRONLY|O_CREAT|O_EXCL, 0666);
 +	if (fd == -1)
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
index 01d0d1f867..5a6994065e 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
@@ -27,26 +27,26 @@ Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
  1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index 98f9692..b4dbc9d 100644
+index d339577..1ecdf85 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
-@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
-		pr_comment("dmidecode %s", VERSION);
-
-	/* Read from dump if so instructed */
+@@ -6031,17 +6031,25 @@ int main(int argc, char * const argv[])
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
@@ -54,16 +54,17 @@ index 98f9692..b4dbc9d 100644
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
+@@ -6065,7 +6073,6 @@ int main(int argc, char * const argv[])
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
+2.42.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
index 5fa72b4f9b..a3c5af2f1c 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
@@ -33,105 +33,106 @@ Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/dmidecode.c b/dmidecode.c
-index b4dbc9d..870d94e 100644
+index 1ecdf85..640c079 100644
 --- a/dmidecode.c
 +++ b/dmidecode.c
 @@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
-	buf[0x17] = 0;
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
+@@ -5793,14 +5793,14 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
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
+@@ -6052,12 +6052,12 @@ int main(int argc, char * const argv[])
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
+@@ -6080,12 +6080,12 @@ int main(int argc, char * const argv[])
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
+@@ -6122,12 +6122,12 @@ int main(int argc, char * const argv[])
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
+@@ -6148,7 +6148,7 @@ int main(int argc, char * const argv[])
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
+@@ -6161,7 +6161,7 @@ int main(int argc, char * const argv[])
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
+2.42.0
+
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
index 4d5255df64..cdc628a4ea 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
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
2.42.0


