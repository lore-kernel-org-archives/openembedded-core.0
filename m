Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19A0C601F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 12:19:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02ECJY0W025596
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 05:19:44 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Sat, 14 Mar 2020 05:19:23 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Mar 2020 05:19:23 -0700
Message-ID: <20200314121923.78526-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [zeus][PATCH] libarchive: Fix CVE-2020-9308
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Mar 2020 12:19:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix CVE-2020-9308

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...ct-files-that-declare-invalid-header.patch | 124 ++++++++++++++++++
 .../libarchive/libarchive_3.4.0.bb            |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-RAR5-reader-reject-files-that-declare-invalid-header.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-RAR5-reader-reject-files-that-declare-invalid-header.patch b/meta/recipes-extended/libarchive/libarchive/0001-RAR5-reader-reject-files-that-declare-invalid-header.patch
new file mode 100644
index 0000000000..a84c1f1f76
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-RAR5-reader-reject-files-that-declare-invalid-header.patch
@@ -0,0 +1,124 @@
+From c1fe0a8cc8dde8ba3eae3d17e34060d2d6e4eb96 Mon Sep 17 00:00:00 2001
+From: Grzegorz Antoniak <ga@anadoxin.org>
+Date: Sun, 2 Feb 2020 08:04:41 +0100
+Subject: [PATCH] RAR5 reader: reject files that declare invalid header flags
+
+One of the fields in RAR5's base block structure is the size of the
+header. Some invalid files declare a 0 header size setting, which can
+confuse the unpacker. Minimum header size for RAR5 base blocks is 7
+bytes (4 bytes for CRC, and 3 bytes for the rest), so block size of 0
+bytes should be rejected at header parsing stage.
+
+The fix adds an error condition if header size of 0 bytes is detected.
+In this case, the unpacker will not attempt to unpack the file, as the
+header is corrupted.
+
+The commit also adds OSSFuzz #20459 sample to test further regressions
+in this area.
+
+Upstream-Status: Backport[https://github.com/libarchive/libarchive/commit/94821008d6eea81e315c5881cdf739202961040a]
+CVE: CVE-2020-9308
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ Makefile.am                                     |  1 +
+ libarchive/archive_read_support_format_rar5.c   | 17 +++++++++++++++--
+ libarchive/test/test_read_format_rar5.c         | 15 +++++++++++++++
+ ...d_format_rar5_block_size_is_too_small.rar.uu |  8 ++++++++
+ 4 files changed, 39 insertions(+), 2 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index da78b24..01abf20 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -863,6 +863,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_symlink.rar.uu \
+ 	libarchive/test/test_read_format_rar5_truncated_huff.rar.uu \
+ 	libarchive/test/test_read_format_rar5_win32.rar.uu \
++	libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu \
+ 	libarchive/test/test_read_format_raw.bufr.uu \
+ 	libarchive/test/test_read_format_raw.data.gz.uu \
+ 	libarchive/test/test_read_format_raw.data.Z.uu \
+diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/archive_read_support_format_rar5.c
+index 7c24627..f73393c 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2034,6 +2034,8 @@ static int scan_for_signature(struct archive_read* a);
+ static int process_base_block(struct archive_read* a,
+     struct archive_entry* entry)
+ {
++	const size_t SMALLEST_RAR5_BLOCK_SIZE = 3;
++
+ 	struct rar5* rar = get_context(a);
+ 	uint32_t hdr_crc, computed_crc;
+ 	size_t raw_hdr_size = 0, hdr_size_len, hdr_size;
+@@ -2057,15 +2059,26 @@ static int process_base_block(struct archive_read* a,
+ 		return ARCHIVE_EOF;
+ 	}
+ 
++	hdr_size = raw_hdr_size + hdr_size_len;
++
+ 	/* Sanity check, maximum header size for RAR5 is 2MB. */
+-	if(raw_hdr_size > (2 * 1024 * 1024)) {
++	if(hdr_size > (2 * 1024 * 1024)) {
+ 		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+ 		    "Base block header is too large");
+ 
+ 		return ARCHIVE_FATAL;
+ 	}
+ 
+-	hdr_size = raw_hdr_size + hdr_size_len;
++	/* Additional sanity checks to weed out invalid files. */
++	if(raw_hdr_size == 0 || hdr_size_len == 0 ||
++		hdr_size < SMALLEST_RAR5_BLOCK_SIZE)
++	{
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++			"Too small block encountered (%ld bytes)",
++			raw_hdr_size);
++
++		return ARCHIVE_FATAL;
++	}
+ 
+ 	/* Read the whole header data into memory, maximum memory use here is
+ 	 * 2MB. */
+diff --git a/libarchive/test/test_read_format_rar5.c b/libarchive/test/test_read_format_rar5.c
+index 1408f37..32e7ed8 100644
+--- a/libarchive/test/test_read_format_rar5.c
++++ b/libarchive/test/test_read_format_rar5.c
+@@ -1194,3 +1194,18 @@ DEFINE_TEST(test_read_format_rar5_fileattr)
+ 
+ 	EPILOGUE();
+ }
++
++DEFINE_TEST(test_read_format_rar5_block_size_is_too_small)
++{
++	char buf[4096];
++	PROLOGUE("test_read_format_rar5_block_size_is_too_small.rar");
++
++	/* This file is damaged, so those functions should return failure.
++	 * Additionally, SIGSEGV shouldn't be raised during execution
++	 * of those functions. */
++
++	assertA(archive_read_next_header(a, &ae) != ARCHIVE_OK);
++	assertA(archive_read_data(a, buf, sizeof(buf)) <= 0);
++
++	EPILOGUE();
++}
+diff --git a/libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu b/libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu
+new file mode 100644
+index 0000000..5cad219
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu
+@@ -0,0 +1,8 @@
++begin 644 test_read_format_rar5_block_size_is_too_small.rar
++M4F%R(1H'`0"-[P+2``+'(!P,("`@N`,!`B`@("`@("`@("`@("`@("#_("`@
++M("`@("`@("`@((:Q;2!4-'-^4B`!((WO`M(``O\@$/\@-R`@("`@("`@("`@
++M``X@("`@("`@____("`@("`@(/\@("`@("`@("`@("#_(+6U,2"UM;6UM[CU
++M)B`@*(0G(`!.`#D\3R``(/__(,+_````-0#_($&%*/HE=C+N`"```"```"`D
++J`)$#("#_("#__P`@__\@_R#_("`@("`@("#_("#__R`@(/__("#__R`"
++`
++end
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
index c196382b07..db45ccf654 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
@@ -33,6 +33,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2019-19221.patch \
+           file://0001-RAR5-reader-reject-files-that-declare-invalid-header.patch \
 "
 
 SRC_URI[md5sum] = "6046396255bd7cf6d0f6603a9bda39ac"
-- 
2.23.0


