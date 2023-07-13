Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A3FEB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 06:37:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2727.1689230213730307787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 23:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RW0H9kkK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65586af348=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36D6XjL3017300
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 06:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=5ejAG
	LGWrqy+Yi1/8bPZgC8gcErQalX2W7BSPFN+/nE=; b=RW0H9kkK9lAZF+Nz8/o1T
	vf+08s4WGrEXF8tuYCeh4CMmVsoUy5aMwbzOVH/LzWTulr7Uom6dJ01Fe64OxeI0
	BFpMWFZvxumHNXA9afm4UjzYWQA8NrP4oTeUt86B9OdzrxuZxZkJ67RpEBYH1P0y
	eneEYSKDuEqLHB/3ixuKlfjJAzxJzvuNWAnuchJ4VYJy5QAxeQF4jGAwV29c5JOB
	QIecFw5WBb2DDQbCvnzR4zmGdQkz1FPsIhPn4tDg7LdbO4h/9d96ZpkKJp4+9W83
	aYokI1hwtYEBtDa6JMP9Igvdl1cKXpi++b5+vsVuvZ+pWN8iT4Y14crZDjPHbld2
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpw0wmcxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 06:36:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 23:36:49 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] dmidecode: fix CVE-2023-30630
Date: Thu, 13 Jul 2023 06:36:10 +0000
Message-ID: <20230713063610.2508489-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: zTqOSuoDGFidzECdZ3_Be-EBdeouKvQy
X-Proofpoint-GUID: zTqOSuoDGFidzECdZ3_Be-EBdeouKvQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_03,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307130057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 06:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184233

Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
This has security relevance because, for example, execution of
Dmidecode via Sudo is plausible.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-30630
https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00016.html
https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00017.html

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
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
2.40.0


