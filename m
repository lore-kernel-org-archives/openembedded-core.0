Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EE1C0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.795.1689373994739213640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XvgJ+ss8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-666eb03457cso1739786b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689373993; x=1691965993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcHUgKOFD+Nrkn4OGVdt36HR7sb4s6Fkf824THmIS8k=;
        b=XvgJ+ss8Gcrsz+DwImZiqi4fmfQqypUVlvI+ilqoaG4Ok3FA20VKQvv1+vAmTws1bO
         c400uxA+SIXk6B6CSwN9JYLbK0oMMx2RqMEalrKxMelKm+norcZHeUywj/X/Ju3lqpZx
         0N8CM89qlE1R0uISoqkUMiw5vaONiOi9pIXn4RfjMcdbBDg3bARNn9X4BVChvDHZiKXB
         UXhJAh3h3ggYTnGbbgIO8dC6zsugB+tG//AvtyPOrqrseEwSwH+mAGJoal7TuJeXRbWs
         poCk11RDN9fGqAzHniDPO4VRgR9uv+1kDicvOz3iZVQUUdurwRhhoL/RAk4lQB2E7kJN
         gRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689373993; x=1691965993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcHUgKOFD+Nrkn4OGVdt36HR7sb4s6Fkf824THmIS8k=;
        b=K17muQ8xnKVvNzDPJnSUR0WWvmyJ6MzcmByTEo+lPByp1lAPUAjPAb4LuKP/iquX5l
         3hFgOoFVqIg7PDVILaEXNQ/P6xuCYl8Kiq6jAoGBXkmUT+48Ro6zFqCWwRMPXIpb9WAe
         Zjj0atrfd521+785XpV1YYCu0d2E2Fm5LYkZDDGOAzzvZXy1pI+JjTnzjJbriyz/AwnB
         vv7gZezeMyxaTED5aYPcI5se7NZ7sQug2l5UcQVBbMtkPdAH6hRxWbYPdoSyiX2QvKDi
         CuuG4GD38j9NDYgYENfGqj+AU+eAWgkJW25Ym+1aOUuAjMif+8RntmiUh3klUPUNPo6W
         eEhA==
X-Gm-Message-State: ABy/qLZM6Ivz0y6YdrDlTL7b35VFhkMGn0jfNrH9a5hkfuh7LoRoQjik
	/Ugc90rl3/wJdXfvfzVn7VKaEkOFORmzMmQ1JUU=
X-Google-Smtp-Source: APBJJlFOFa+UwW3hP/Oq/S/j/oeMVOJMbdK+4W8LaSX9uZibpKWxiZLOrhyTVygKFsCdJ0Tw4l6wiQ==
X-Received: by 2002:a17:902:d510:b0:1b8:a359:5c6f with SMTP id b16-20020a170902d51000b001b8a3595c6fmr5136349plg.35.1689373993159;
        Fri, 14 Jul 2023 15:33:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/26] dmidecode: fix CVE-2023-30630
Date: Fri, 14 Jul 2023 12:32:36 -1000
Message-Id: <f92e59a0894145a828dc9ac74bf8c7a9355e0587.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184284

From: Yogita Urade <yogita.urade@windriver.com>

Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
This has security relevance because, for example, execution of
Dmidecode via Sudo is plausible.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-30630
https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00016.html
https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00017.html

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dmidecode/CVE-2023-30630_1.patch          | 237 ++++++++++++++++++
 .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
 .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
 .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++
 .../dmidecode/dmidecode_3.4.bb                |   4 +
 5 files changed, 528 insertions(+)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
new file mode 100644
index 0000000000..53480d6299
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
@@ -0,0 +1,237 @@
+From  d8cfbc808f387e87091c25e7d5b8c2bb348bb206 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Tue, 27 Jun 2023 09:40:23 +0000
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
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+
+CVE: CVE-2023-30630
+
+Reference: https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e96ed832cfb4bdd664e808
+
+Upstream-Status: Backport [https://github.com/mirror/dmidecode/commit/d8cfbc808f387e87091c25e7d5b8c2bb348bb206]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dmidecode.c | 79 +++++++++++++++++++++++++++++++++++++++--------------
+ util.c      | 40 ---------------------------
+ util.h      |  1 -
+ 3 files changed, 58 insertions(+), 62 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 9aeff91..5477309 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5427,11 +5427,56 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
+	}
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
+	if (!(opt.flags & FLAG_QUIET))
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
+@@ -5648,11 +5693,6 @@ static void dmi_table(off_t base, u32 len, u16 num, u32 ver, const char *devmem,
+		return;
+	}
+
+-	if (opt.flags & FLAG_DUMP_BIN)
+-		dmi_table_dump(buf, len);
+-	else
+-		dmi_table_decode(buf, len, num, ver >> 8, flags);
+-
+	free(buf);
+ }
+
+@@ -5688,8 +5728,9 @@ static void overwrite_smbios3_address(u8 *buf)
+
+ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ {
+-	u32 ver;
++	u32 ver, len;
+	u64 offset;
++	u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+	if (buf[0x06] > 0x20)
+@@ -5725,10 +5766,7 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+		memcpy(crafted, buf, 32);
+		overwrite_smbios3_address(crafted);
+
+-		if (!(opt.flags & FLAG_QUIET))
+-			pr_comment("Writing %d bytes to %s.", crafted[0x06],
+-				   opt.dumpfile);
+-		write_dump(0, crafted[0x06], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x06], table, len);
+	}
+
+	return 1;
+@@ -5737,6 +5775,8 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+ {
+	u16 ver;
++	u32 len;
++        u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+	if (buf[0x05] > 0x20)
+@@ -5786,10 +5826,7 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+		memcpy(crafted, buf, 32);
+		overwrite_dmi_address(crafted + 0x10);
+
+-		if (!(opt.flags & FLAG_QUIET))
+-			pr_comment("Writing %d bytes to %s.", crafted[0x05],
+-				   opt.dumpfile);
+-		write_dump(0, crafted[0x05], crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, crafted[0x05], table, len);
+	}
+
+	return 1;
+@@ -5797,6 +5834,9 @@ static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
+
+ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+ {
++	u32 len;
++	u8 *table;
++
+	if (!checksum(buf, 0x0F))
+		return 0;
+
+@@ -5815,10 +5855,7 @@ static int legacy_decode(u8 *buf, const char *devmem, u32 flags)
+		memcpy(crafted, buf, 16);
+		overwrite_dmi_address(crafted);
+
+-		if (!(opt.flags & FLAG_QUIET))
+-			pr_comment("Writing %d bytes to %s.", 0x0F,
+-				   opt.dumpfile);
+-		write_dump(0, 0x0F, crafted, opt.dumpfile, 1);
++		dmi_table_dump(crafted, 0x0F, table, len);
+	}
+
+	return 1;
+diff --git a/util.c b/util.c
+index 04aaadd..1547096 100644
+--- a/util.c
++++ b/util.c
+@@ -259,46 +259,6 @@ out:
+	return p;
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
+2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
new file mode 100644
index 0000000000..dcc87d2326
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
@@ -0,0 +1,81 @@
+From 6ca381c1247c81f74e1ca4e7706f70bdda72e6f2 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Tue, 27 Jun 2023 10:03:53 +0000
+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an existing file
+
+Make sure that the file passed to option --dump-bin does not already
+exist. In practice, it is rather unlikely that an honest user would
+want to overwrite an existing dump file, while this possibility
+could be used by a rogue user to corrupt a system file.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport
+[https://github.com/mirror/dmidecode/commit/6ca381c1247c81f74e1ca4e7706f70bdda72e6f2]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dmidecode.c     | 14 ++++++++++++--
+ man/dmidecode.8 |  3 ++-
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 5477309..98f9692 100644
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
+@@ -5430,13 +5431,22 @@ static void dmi_table_string(const struct dmi_header *h, const u8 *data, u16 ver
+ static int dmi_table_dump(const u8 *ep, u32 ep_len, const u8 *table,
+			  u32 table_len)
+ {
++	int fd;
+	FILE *f;
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
+	if (!f)
+	{
+		fprintf(stderr, "%s: ", opt.dumpfile);
+-		perror("fopen");
++		perror("fdopen");
+		return -1;
+	}
+
+diff --git a/man/dmidecode.8 b/man/dmidecode.8
+index ed066b3..3a732c0 100644
+--- a/man/dmidecode.8
++++ b/man/dmidecode.8
+@@ -1,4 +1,4 @@
+-.TH DMIDECODE 8 "January 2019" "dmidecode"
++.TH DMIDECODE 8 "February 2023" "dmidecode"
+ .\"
+ .SH NAME
+ dmidecode \- \s-1DMI\s0 table decoder
+@@ -159,6 +159,7 @@ hexadecimal and \s-1ASCII\s0. This option is mainly useful for debugging.
+ Do not decode the entries, instead dump the DMI data to a file in binary
+ form. The generated file is suitable to pass to \fB--from-dump\fP
+ later.
++\fIFILE\fP must not exist.
+ .TP
+ .BR "  " "  " "--from-dump \fIFILE\fP"
+ Read the DMI data from a binary file previously generated using
+--
+2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
new file mode 100644
index 0000000000..01d0d1f867
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
@@ -0,0 +1,69 @@
+From c76ddda0ba0aa99a55945e3290095c2ec493c892 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Tue, 27 Jun 2023 10:25:50 +0000
+Subject: [PATCH] Consistently use read_file() when reading from a dump file
+
+Use read_file() instead of mem_chunk() to read the entry point from a
+dump file. This is faster, and consistent with how we then read the
+actual DMI table from that dump file.
+
+This made no functional difference so far, which is why it went
+unnoticed for years. But now that a file type check was added to the
+mem_chunk() function, we must stop using it to read from regular
+files.
+
+This will again allow root to use the --from-dump option.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Tested-by: Jerry Hoemann <jerry.hoemann@hpe.com>
+
+CVE: CVE-2023-30630
+
+Upstream-Status: Backport [https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=c76ddda0ba0aa99a55945e3290095c2ec493c892]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ dmidecode.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/dmidecode.c b/dmidecode.c
+index 98f9692..b4dbc9d 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5997,17 +5997,25 @@ int main(int argc, char * const argv[])
+		pr_comment("dmidecode %s", VERSION);
+
+	/* Read from dump if so instructed */
++        size = 0x20;
+	if (opt.flags & FLAG_FROM_DUMP)
+	{
+		if (!(opt.flags & FLAG_QUIET))
+			pr_info("Reading SMBIOS/DMI data from file %s.",
+				opt.dumpfile);
+-		if ((buf = mem_chunk(0, 0x20, opt.dumpfile)) == NULL)
++                if ((buf = read_file(0, &size, opt.dumpfile)) == NULL)
+		{
+			ret = 1;
+			goto exit_free;
+		}
+
++                /* Truncated entry point can't be processed */
++                if (size < 0x20)
++                {
++                        ret = 1;
++                        goto done;
++                }
++
+		if (memcmp(buf, "_SM3_", 5) == 0)
+		{
+			if (smbios3_decode(buf, opt.dumpfile, 0))
+@@ -6031,7 +6039,6 @@ int main(int argc, char * const argv[])
+	 * contain one of several types of entry points, so read enough for
+	 * the largest one, then determine what type it contains.
+	 */
+-	size = 0x20;
+	if (!(opt.flags & FLAG_NO_SYSFS)
+	 && (buf = read_file(0, &size, SYS_ENTRY_FILE)) != NULL)
+	{
+--
+2.40.0
diff --git a/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
new file mode 100644
index 0000000000..5fa72b4f9b
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
@@ -0,0 +1,137 @@
+From 2b83c4b898f8325313162f588765411e8e3e5561 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Tue, 27 Jun 2023 10:58:11 +0000
+Subject: [PATCH] Don't read beyond sysfs entry point buffer
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
+index b4dbc9d..870d94e 100644
+--- a/dmidecode.c
++++ b/dmidecode.c
+@@ -5736,14 +5736,14 @@ static void overwrite_smbios3_address(u8 *buf)
+	buf[0x17] = 0;
+ }
+
+-static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
++static int smbios3_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ {
+	u32 ver, len;
+	u64 offset;
+	u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+-	if (buf[0x06] > 0x20)
++        if (buf[0x06] > buf_len)
+	{
+		fprintf(stderr,
+			"Entry point length too large (%u bytes, expected %u).\n",
+@@ -5782,14 +5782,14 @@ static int smbios3_decode(u8 *buf, const char *devmem, u32 flags)
+	return 1;
+ }
+
+-static int smbios_decode(u8 *buf, const char *devmem, u32 flags)
++static int smbios_decode(u8 *buf, size_t buf_len, const char *devmem, u32 flags)
+ {
+	u16 ver;
+	u32 len;
+         u8 *table;
+
+	/* Don't let checksum run beyond the buffer */
+-	if (buf[0x05] > 0x20)
++        if (buf[0x05] > buf_len)
+	{
+		fprintf(stderr,
+			"Entry point length too large (%u bytes, expected %u).\n",
+@@ -6018,12 +6018,12 @@ int main(int argc, char * const argv[])
+
+		if (memcmp(buf, "_SM3_", 5) == 0)
+		{
+-			if (smbios3_decode(buf, opt.dumpfile, 0))
++                        if (smbios3_decode(buf, size, opt.dumpfile, 0))
+				found++;
+		}
+		else if (memcmp(buf, "_SM_", 4) == 0)
+		{
+-			if (smbios_decode(buf, opt.dumpfile, 0))
++                        if (smbios_decode(buf, size, opt.dumpfile, 0))
+				found++;
+		}
+		else if (memcmp(buf, "_DMI_", 5) == 0)
+@@ -6046,12 +6046,12 @@ int main(int argc, char * const argv[])
+			pr_info("Getting SMBIOS data from sysfs.");
+		if (size >= 24 && memcmp(buf, "_SM3_", 5) == 0)
+		{
+-			if (smbios3_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
++                        if (smbios3_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
+				found++;
+		}
+		else if (size >= 31 && memcmp(buf, "_SM_", 4) == 0)
+		{
+-			if (smbios_decode(buf, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
++                        if (smbios_decode(buf, size, SYS_TABLE_FILE, FLAG_NO_FILE_OFFSET))
+				found++;
+		}
+		else if (size >= 15 && memcmp(buf, "_DMI_", 5) == 0)
+@@ -6088,12 +6088,12 @@ int main(int argc, char * const argv[])
+
+	if (memcmp(buf, "_SM3_", 5) == 0)
+	{
+-		if (smbios3_decode(buf, opt.devmem, 0))
++                if (smbios3_decode(buf, 0x20, opt.devmem, 0))
+			found++;
+	}
+	else if (memcmp(buf, "_SM_", 4) == 0)
+	{
+-		if (smbios_decode(buf, opt.devmem, 0))
++                if (smbios_decode(buf, 0x20, opt.devmem, 0))
+			found++;
+	}
+	goto done;
+@@ -6114,7 +6114,7 @@ memory_scan:
+	{
+		if (memcmp(buf + fp, "_SM3_", 5) == 0)
+		{
+-			if (smbios3_decode(buf + fp, opt.devmem, 0))
++                        if (smbios3_decode(buf + fp, 0x20, opt.devmem, 0))
+			{
+				found++;
+				goto done;
+@@ -6127,7 +6127,7 @@ memory_scan:
+	{
+		if (memcmp(buf + fp, "_SM_", 4) == 0 && fp <= 0xFFE0)
+		{
+-			if (smbios_decode(buf + fp, opt.devmem, 0))
++                        if (smbios_decode(buf + fp, 0x20, opt.devmem, 0))
+			{
+				found++;
+				goto done;
+--
+2.35.5
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
index bc741046dd..4d5255df64 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
            file://0001-Committing-changes-from-do_unpack_extra.patch \
+           file://CVE-2023-30630_1.patch \
+           file://CVE-2023-30630_2.patch \
+           file://CVE-2023-30630_3.patch \
+           file://CVE-2023-30630_4.patch \
            "
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
-- 
2.34.1


