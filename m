Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C27C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 05:52:06 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web10.5717.1691128320299915622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 22:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=iHv9HW4Z;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=17570; q=dns/txt;
  s=iport; t=1691128320; x=1692337920;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZxJ9DONS7PNymAQ74eI24BdaAWkhwBLrC+yzUoP051E=;
  b=iHv9HW4Zzzjxr9Ne1Do01rx+TugxJgrlFDtFyqto0o30WNTapO8Uyaa3
   c6UXjWclXbMNDvyv0GcnLVbruSJCMHjSYEe7ewoks0w7HpS39cU30zcOy
   eryfLG/JA0CIQSEAWuTvAA8XPy0FPrFlutprB0ran+012QuHtWK91HUVH
   o=;
X-IronPort-AV: E=Sophos;i="6.01,254,1684800000"; 
   d="scan'208";a="96787344"
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 05:51:59 +0000
Received: from sjc-ads-8077.cisco.com (sjc-ads-8077.cisco.com [171.68.208.115])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 3745pwaW004339
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Aug 2023 05:51:59 GMT
Received: by sjc-ads-8077.cisco.com (Postfix, from userid 1820939)
	id 83901CC1251; Thu,  3 Aug 2023 22:51:58 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, xe-linux-external@cisco.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [dunfell] [PATCH] dmidecode 3.2: Fix CVE-2023-30630
Date: Thu,  3 Aug 2023 22:51:01 -0700
Message-Id: <20230804055101.183290-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.208.115, sjc-ads-8077.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 05:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185505

Upstream Repository: https://git.savannah.gnu.org/git/dmidecode.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-30630
Type: Security Fix
CVE: CVE-2023-30630
Score: 7.8
Patch: https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=6ca381c1247c

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 .../CVE-2023-30630-dependent_p1.patch         | 236 ++++++++++++++++++
 .../CVE-2023-30630-dependent_p2.patch         | 198 +++++++++++++++
 .../dmidecode/dmidecode/CVE-2023-30630.patch  |  62 +++++
 .../dmidecode/dmidecode_3.2.bb                |   3 +
 4 files changed, 499 insertions(+)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p1.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p2.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630.patch

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p1.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p1.patch
new file mode 100644
index 0000000000..f1d449acbe
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p1.patch
@@ -0,0 +1,236 @@
+From 24def311c6168d0dfb7c5f0f183b72b709c49265 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 20 Feb 2023 14:53:21 +0100
+Subject: [PATCH] dmidecode: Split table fetching from decoding
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
+CVE-ID: CVE-2023-30630
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=39b2dd7b6ab7]
+
+Backport Changes:
+- In the file dmidecode.c, the commit [dd593d2] in v3.3 introduces
+  pr_info(). This is backported to printf() as per v3.2.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+(cherry picked from commit 39b2dd7b6ab719b920e96ed832cfb4bdd664e808)
+Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
+---
+ dmidecode.c | 86 ++++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 62 insertions(+), 24 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index a3e9d6c..d6eedd1 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5211,8 +5211,9 @@ static void dmi_table_decode(u8 *buf, u32 len, u16 num, u16 ver, u32 flags)
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
+@@ -5231,7 +5232,7 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+ 		{
+ 			if (num)
+ 				printf("%u structures occupying %u bytes.\n",
+-				       num, len);
++				       num, *len);
+ 			if (!(opt.flags & FLAG_FROM_DUMP))
+ 				printf("Table at 0x%08llX.\n",
+ 				       (unsigned long long)base);
+@@ -5249,19 +5250,19 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
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
+@@ -5271,15 +5272,9 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
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
+@@ -5314,8 +5309,9 @@ static void overwrite_smbios3_address(u8 *buf)
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
+@@ -5341,8 +5337,12 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
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
+@@ -5351,18 +5351,28 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_smbios3_address(crafted);
+ 
++		dmi_table_dump(table, len);
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			printf("# Writing %d bytes to %s.\n", crafted[0x06],
+ 			       opt.dumpfile);
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
+@@ -5402,8 +5412,13 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ 		printf("SMBIOS %u.%u present.\n",
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
+@@ -5412,27 +5427,43 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_dmi_address(crafted + 0x10);
+ 
++		dmi_table_dump(table, len);
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			printf("# Writing %d bytes to %s.\n", crafted[0x05],
+ 				opt.dumpfile);
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
+ 		printf("Legacy DMI %u.%u present.\n",
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
+@@ -5441,11 +5472,18 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 16);
+ 		overwrite_dmi_address(crafted);
+ 
++		dmi_table_dump(table, len);
+ 		if (!(opt.flags & FLAG_QUIET))
+ 			printf("# Writing %d bytes to %s.\n", 0x0F,
+ 				opt.dumpfile);
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
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p2.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p2.patch
new file mode 100644
index 0000000000..353c2553f5
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p2.patch
@@ -0,0 +1,198 @@
+From 58e8a07b1aef0e53af1642b30248255e53e42790 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 20 Feb 2023 14:53:25 +0100
+Subject: [PATCH] dmidecode: Write the whole dump file at once
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
+CVE: CVE-2023-30630
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=d8cfbc808f38]
+
+Backport Changes:
+- In the file dmidecode.c, the commit [2241f1d] in v3.3 introduces
+  pr_info(). This is backported to printf() as per v3.2.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+(cherry picked from commit d8cfbc808f387e87091c25e7d5b8c2bb348bb206)
+Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
+
+---
+ dmidecode.c | 69 +++++++++++++++++++++++++++++++++++++++--------------
+ util.c      | 40 -------------------------------
+ util.h      |  1 -
+ 3 files changed, 51 insertions(+), 59 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index d6eedd1..b91e53b 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5094,11 +5094,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
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
++		printf("# Writing %d bytes to %s.\n", ep_len, opt.dumpfile);
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
+-		printf("# Writing %d bytes to %s.\n", len, opt.dumpfile);
+-	write_dump(32, len, buf, opt.dumpfile, 0);
++		printf("# Writing %d bytes to %s.\n", table_len, opt.dumpfile);
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
+@@ -5351,11 +5396,7 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_smbios3_address(crafted);
+ 
+-		dmi_table_dump(table, len);
+-		if (!(opt.flags & FLAG_QUIET))
+-			printf("# Writing %d bytes to %s.\n", crafted[0x06],
+-			       opt.dumpfile);
+-		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x06], table, len);
+ 	}
+ 	else
+ 	{
+@@ -5427,11 +5468,7 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 32);
+ 		overwrite_dmi_address(crafted + 0x10);
+ 
+-		dmi_table_dump(table, len);
+-		if (!(opt.flags & FLAG_QUIET))
+-			printf("# Writing %d bytes to %s.\n", crafted[0x05],
+-				opt.dumpfile);
+-		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x05], table, len);
+ 	}
+ 	else
+ 	{
+@@ -5472,11 +5509,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ 		memcpy(crafted, buf, 16);
+ 		overwrite_dmi_address(crafted);
+ 
+-		dmi_table_dump(table, len);
+-		if (!(opt.flags & FLAG_QUIET))
+-			printf("# Writing %d bytes to %s.\n", 0x0F,
+-				opt.dumpfile);
+-		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, 0x0F, table, len);
+ 	}
+ 	else
+ 	{
+diff --git a/util.c b/util.c
+index eeffdae..2e1931c 100644
+--- a/util.c
++++ b/util.c
+@@ -247,46 +247,6 @@ out:
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
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630.patch
new file mode 100644
index 0000000000..bf4d060c8c
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630.patch
@@ -0,0 +1,62 @@
+From b7dacccff32294ea522df32a9391d0218e7600ea Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 20 Feb 2023 14:53:31 +0100
+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing file
+
+Make sure that the file passed to option --dump-bin does not already
+exist. In practice, it is rather unlikely that an honest user would
+want to overwrite an existing dump file, while this possibility
+could be used by a rogue user to corrupt a system file.
+
+CVE: CVE-2023-30630
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=6ca381c1247c]
+
+Backport Changes:
+- Ignored changes in man/dmidecode.8 file.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+(cherry picked from commit 6ca381c1247c81f74e1ca4e7706f70bdda72e6f2)
+Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
+
+---
+ dmidecode.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index b91e53b..846d9a1 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -60,6 +60,7 @@
+  *    https://www.dmtf.org/sites/default/files/DSP0270_1.0.1.pdf
+  */
+ 
++#include <fcntl.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <strings.h>
+@@ -5097,13 +5098,22 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
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
++
++	f = fdopen(fd, "wb");
+ 	if (!f)
+ 	{
+ 		fprintf(stderr, "%s: ", opt.dumpfile);
+-		perror("fopen");
++		perror("fdopen");
+ 		return -1;
+ 	}
+ 
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
index 8caffb5cc3..1e7c38dc8a 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
            file://0001-Committing-changes-from-do_unpack_extra.patch \
+           file://CVE-2023-30630-dependent_p1.patch \
+           file://CVE-2023-30630-dependent_p2.patch \
+           file://CVE-2023-30630.patch \
            "
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
-- 
2.35.6


