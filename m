Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6B071A3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:21:05 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v8BEL6xG029839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:21:06 +0200
Received: from dev.sbt.siemens.com ([139.22.42.84])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v8BEL6qe008728;
	Mon, 11 Sep 2017 16:21:06 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 54A13BD68C;
	Mon, 11 Sep 2017 16:20:52 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Sep 2017 16:20:37 +0200
Message-Id: <1505139637-22304-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libarchive: fix bug929 and CVE-2017-14166
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
X-List-Received-Date: Mon, 11 Sep 2017 14:21:07 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libarchive/libarchive/CVE-2017-14166.patch     | 37 +++++++++++++++++++++
 .../libarchive/libarchive/bug929.patch             | 38 ++++++++++++++++++++++
 .../libarchive/libarchive_3.3.2.bb                 |  2 ++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/bug929.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch
new file mode 100644
index 0000000..e85fec4
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch
@@ -0,0 +1,37 @@
+libarchive-3.3.2: Fix CVE-2017-14166
+
+[No upstream tracking] -- https://github.com/libarchive/libarchive/pull/935
+
+archive_read_support_format_xar: heap-based buffer overflow in xml_data
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/fa7438a0ff4033e4741c807394a9af6207940d71]
+CVE: CVE-2017-14166
+Bug: 935
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/libarchive/archive_read_support_format_xar.c b/libarchive/archive_read_support_format_xar.c
+index 7a22beb..93eeacc 100644
+--- a/libarchive/archive_read_support_format_xar.c
++++ b/libarchive/archive_read_support_format_xar.c
+@@ -1040,6 +1040,9 @@ atol10(const char *p, size_t char_cnt)
+ 	uint64_t l;
+ 	int digit;
+ 
++	if (char_cnt == 0)
++		return (0);
++
+ 	l = 0;
+ 	digit = *p - '0';
+ 	while (digit >= 0 && digit < 10  && char_cnt-- > 0) {
+@@ -1054,7 +1057,10 @@ atol8(const char *p, size_t char_cnt)
+ {
+ 	int64_t l;
+ 	int digit;
+-        
++
++	if (char_cnt == 0)
++		return (0);
++
+ 	l = 0;
+ 	while (char_cnt-- > 0) {
+ 		if (*p >= '0' && *p <= '7')
diff --git a/meta/recipes-extended/libarchive/libarchive/bug929.patch b/meta/recipes-extended/libarchive/libarchive/bug929.patch
new file mode 100644
index 0000000..2f3254c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/bug929.patch
@@ -0,0 +1,38 @@
+libarchive-3.3.2: Fix bug929
+
+[No upstream tracking] -- https://github.com/libarchive/libarchive/pull/929
+
+archive_read_support_format_cpio: header_newc(): Avoid overflow when reading corrupt
+cpio archive
+
+A cpio "newc" archive with a namelength of "FFFFFFFF", if read on a
+system with a 32-bit size_t, would result in namelength + name_pad
+overflowing 32 bits and libarchive attempting to copy 2^32-1 bytes
+from a 2-byte buffer, with appropriately hilarious results.
+
+Check for this overflow and fail; there's no legitimate reason for a
+cpio archive to contain a file with a name over 4 billion characters
+in length.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bac4659e0b970990e7e3f3a3d239294e96311630]
+Bug: 929
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/libarchive/archive_read_support_format_cpio.c b/libarchive/archive_read_support_format_cpio.c
+index ad9f782..1faa64d 100644
+--- a/libarchive/archive_read_support_format_cpio.c
++++ b/libarchive/archive_read_support_format_cpio.c
+@@ -633,6 +633,13 @@ header_newc(struct archive_read *a, struct cpio *cpio,
+ 	/* Pad name to 2 more than a multiple of 4. */
+ 	*name_pad = (2 - *namelength) & 3;
+ 
++	/* Make sure that the padded name length fits into size_t. */
++	if ((size_t)(*namelength + *name_pad) < *namelength) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++		    "cpio archive has invalid namelength");
++		return (ARCHIVE_FATAL);
++	}
++
+ 	/*
+ 	 * Note: entry_bytes_remaining is at least 64 bits and
+ 	 * therefore guaranteed to be big enough for a 33-bit file
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 5c3895e..9e4588f 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://bug929.patch \
+           file://CVE-2017-14166.patch \
           "
 
 SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
-- 
2.1.4


