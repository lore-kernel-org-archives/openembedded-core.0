Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 367 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 12 Dec 2015 02:17:35 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id EDB9E6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 02:17:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D925020BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 21:11:27 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 11 Dec 2015 21:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=fb56w+zXVBeHzf2GUft5ALWQQc
	c=; b=gP71sTM69fMCRDnxzlkRU07o3vZCEuerjZb2m4pWwm0kyJn1VOMhuz3hjg
	Koso4jsohV619nUoflnDhe/HqqdmvkO87hx/MuYvix3mGXwMWqZIkX/Wfa0s/O0M
	oy8KA5cBxLOlptmPhVFnCVdEpAZjPVKvNZwBKB5MAilf02LoY=
X-Sasl-enc: EEY/Djjh1jZCk4T5CR0kmjdWzh+rBIQQRhiyVclJcmWN 1449886287
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4CCACC013FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 21:11:27 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Dec 2015 04:11:20 +0200
Message-Id: <1449886280-32729-1-git-send-email-tanuk@iki.fi>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] libsndfile1: 1.0.25 -> 1.0.26
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
X-List-Received-Date: Sat, 12 Dec 2015 02:17:36 -0000

Main points from the release announcement:

  * Fix for CVE-2014-9496, SD2 buffer read overflow.
  * Fix for CVE-2014-9756, file_io.c divide by zero.
  * Fix for CVE-2015-7805, AIFF heap write overflow.
  * Add support for ALAC encoder in a CAF container.
  * Add support for Cart chunks in WAV files.
  * Minor bug fixes and improvements.

All patches we had are included in the new release.

Dropped PR from the recipe.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch | 211 ---------------------
 ...c-Fix-two-potential-buffer-read-overflows.patch |  49 -----
 .../files/libsndfile-fix-CVE-2014-9756.patch       |  24 ---
 .../libsndfile/libsndfile1_1.0.25.bb               |  34 ----
 .../libsndfile/libsndfile1_1.0.26.bb               |  29 +++
 5 files changed, 29 insertions(+), 318 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb

diff --git a/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch b/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
deleted file mode 100644
index cd48710..0000000
--- a/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
+++ /dev/null
@@ -1,211 +0,0 @@
-From 9341e9c6e70cd3ad76c901c3cf052d4cb52fd827 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Thu, 27 Jun 2013 18:04:03 +1000
-Subject: [PATCH] src/sd2.c : Fix segfault in SD2 RSRC parser.
-
-(Upstream commit 9341e9c6e70cd3ad76c901c3cf052d4cb52fd827)
-
-A specially crafted resource fork for an SD2 file can cause
-the SD2 RSRC parser to read data from outside a dynamically
-defined buffer. The data that is read is converted into a
-short or int and used during further processing.
-
-Since no write occurs, this is unlikely to be exploitable.
-
-Bug reported by The Mayhem Team from Cylab, Carnegie Mellon
-Univeristy. Paper is:
-http://users.ece.cmu.edu/~arebert/papers/mayhem-oakland-12.pdf
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
----
- src/sd2.c |   93 ++++++++++++++++++++++++++++++++++++-------------------------
- 1 file changed, 55 insertions(+), 38 deletions(-)
-
-diff --git a/src/sd2.c b/src/sd2.c
-index 35ce36b..6be150c 100644
---- a/src/sd2.c
-+++ b/src/sd2.c
-@@ -1,5 +1,5 @@
- /*
--** Copyright (C) 2001-2011 Erik de Castro Lopo <erikd@mega-nerd.com>
-+** Copyright (C) 2001-2013 Erik de Castro Lopo <erikd@mega-nerd.com>
- ** Copyright (C) 2004 Paavo Jumppanen
- **
- ** This program is free software; you can redistribute it and/or modify
-@@ -371,44 +371,61 @@ sd2_write_rsrc_fork (SF_PRIVATE *psf, int UNUSED (calc_length))
- */
- 
- static inline int
--read_char (const unsigned char * data, int offset)
--{	return data [offset] ;
--} /* read_char */
-+read_rsrc_char (const SD2_RSRC *prsrc, int offset)
-+{	const unsigned char * data = prsrc->rsrc_data ;
-+	if (offset < 0 || offset >= prsrc->rsrc_len)
-+		return 0 ;
-+	return data [offset] ;
-+} /* read_rsrc_char */
- 
- static inline int
--read_short (const unsigned char * data, int offset)
--{	return (data [offset] << 8) + data [offset + 1] ;
--} /* read_short */
-+read_rsrc_short (const SD2_RSRC *prsrc, int offset)
-+{	const unsigned char * data = prsrc->rsrc_data ;
-+	if (offset < 0 || offset + 1 >= prsrc->rsrc_len)
-+		return 0 ;
-+	return (data [offset] << 8) + data [offset + 1] ;
-+} /* read_rsrc_short */
- 
- static inline int
--read_int (const unsigned char * data, int offset)
--{	return (data [offset] << 24) + (data [offset + 1] << 16) + (data [offset + 2] << 8) + data [offset + 3] ;
--} /* read_int */
-+read_rsrc_int (const SD2_RSRC *prsrc, int offset)
-+{	const unsigned char * data = prsrc->rsrc_data ;
-+	if (offset < 0 || offset + 3 >= prsrc->rsrc_len)
-+		return 0 ;
-+	return (data [offset] << 24) + (data [offset + 1] << 16) + (data [offset + 2] << 8) + data [offset + 3] ;
-+} /* read_rsrc_int */
- 
- static inline int
--read_marker (const unsigned char * data, int offset)
--{
-+read_rsrc_marker (const SD2_RSRC *prsrc, int offset)
-+{	const unsigned char * data = prsrc->rsrc_data ;
-+
-+	if (offset < 0 || offset + 3 >= prsrc->rsrc_len)
-+		return 0 ;
-+
- 	if (CPU_IS_BIG_ENDIAN)
- 		return (data [offset] << 24) + (data [offset + 1] << 16) + (data [offset + 2] << 8) + data [offset + 3] ;
--	else if (CPU_IS_LITTLE_ENDIAN)
-+	if (CPU_IS_LITTLE_ENDIAN)
- 		return data [offset] + (data [offset + 1] << 8) + (data [offset + 2] << 16) + (data [offset + 3] << 24) ;
--	else
--		return 0x666 ;
--} /* read_marker */
-+
-+	return 0 ;
-+} /* read_rsrc_marker */
- 
- static void
--read_str (const unsigned char * data, int offset, char * buffer, int buffer_len)
--{	int k ;
-+read_rsrc_str (const SD2_RSRC *prsrc, int offset, char * buffer, int buffer_len)
-+{	const unsigned char * data = prsrc->rsrc_data ;
-+	int k ;
- 
- 	memset (buffer, 0, buffer_len) ;
- 
-+	if (offset < 0 || offset + buffer_len >= prsrc->rsrc_len)
-+		return ;
-+
- 	for (k = 0 ; k < buffer_len - 1 ; k++)
- 	{	if (psf_isprint (data [offset + k]) == 0)
- 			return ;
- 		buffer [k] = data [offset + k] ;
- 		} ;
- 	return ;
--} /* read_str */
-+} /* read_rsrc_str */
- 
- static int
- sd2_parse_rsrc_fork (SF_PRIVATE *psf)
-@@ -435,17 +452,17 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
- 	/* Reset the header storage because we have changed to the rsrcdes. */
- 	psf->headindex = psf->headend = rsrc.rsrc_len ;
- 
--	rsrc.data_offset = read_int (rsrc.rsrc_data, 0) ;
--	rsrc.map_offset = read_int (rsrc.rsrc_data, 4) ;
--	rsrc.data_length = read_int (rsrc.rsrc_data, 8) ;
--	rsrc.map_length = read_int (rsrc.rsrc_data, 12) ;
-+	rsrc.data_offset = read_rsrc_int (&rsrc, 0) ;
-+	rsrc.map_offset = read_rsrc_int (&rsrc, 4) ;
-+	rsrc.data_length = read_rsrc_int (&rsrc, 8) ;
-+	rsrc.map_length = read_rsrc_int (&rsrc, 12) ;
- 
- 	if (rsrc.data_offset == 0x51607 && rsrc.map_offset == 0x20000)
- 	{	psf_log_printf (psf, "Trying offset of 0x52 bytes.\n") ;
--		rsrc.data_offset = read_int (rsrc.rsrc_data, 0x52 + 0) + 0x52 ;
--		rsrc.map_offset = read_int (rsrc.rsrc_data, 0x52 + 4) + 0x52 ;
--		rsrc.data_length = read_int (rsrc.rsrc_data, 0x52 + 8) ;
--		rsrc.map_length = read_int (rsrc.rsrc_data, 0x52 + 12) ;
-+		rsrc.data_offset = read_rsrc_int (&rsrc, 0x52 + 0) + 0x52 ;
-+		rsrc.map_offset = read_rsrc_int (&rsrc, 0x52 + 4) + 0x52 ;
-+		rsrc.data_length = read_rsrc_int (&rsrc, 0x52 + 8) ;
-+		rsrc.map_length = read_rsrc_int (&rsrc, 0x52 + 12) ;
- 		} ;
- 
- 	psf_log_printf (psf, "  data offset : 0x%04X\n  map  offset : 0x%04X\n"
-@@ -488,7 +505,7 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
- 		goto parse_rsrc_fork_cleanup ;
- 		} ;
- 
--	rsrc.string_offset = rsrc.map_offset + read_short (rsrc.rsrc_data, rsrc.map_offset + 26) ;
-+	rsrc.string_offset = rsrc.map_offset + read_rsrc_short (&rsrc, rsrc.map_offset + 26) ;
- 	if (rsrc.string_offset > rsrc.rsrc_len)
- 	{	psf_log_printf (psf, "Bad string offset (%d).\n", rsrc.string_offset) ;
- 		error = SFE_SD2_BAD_RSRC ;
-@@ -497,7 +514,7 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
- 
- 	rsrc.type_offset = rsrc.map_offset + 30 ;
- 
--	rsrc.type_count = read_short (rsrc.rsrc_data, rsrc.map_offset + 28) + 1 ;
-+	rsrc.type_count = read_rsrc_short (&rsrc, rsrc.map_offset + 28) + 1 ;
- 	if (rsrc.type_count < 1)
- 	{	psf_log_printf (psf, "Bad type count.\n") ;
- 		error = SFE_SD2_BAD_RSRC ;
-@@ -513,11 +530,11 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
- 
- 	rsrc.str_index = -1 ;
- 	for (k = 0 ; k < rsrc.type_count ; k ++)
--	{	marker = read_marker (rsrc.rsrc_data, rsrc.type_offset + k * 8) ;
-+	{	marker = read_rsrc_marker (&rsrc, rsrc.type_offset + k * 8) ;
- 
- 		if (marker == STR_MARKER)
- 		{	rsrc.str_index = k ;
--			rsrc.str_count = read_short (rsrc.rsrc_data, rsrc.type_offset + k * 8 + 4) + 1 ;
-+			rsrc.str_count = read_rsrc_short (&rsrc, rsrc.type_offset + k * 8 + 4) + 1 ;
- 			error = parse_str_rsrc (psf, &rsrc) ;
- 			goto parse_rsrc_fork_cleanup ;
- 			} ;
-@@ -549,26 +566,26 @@ parse_str_rsrc (SF_PRIVATE *psf, SD2_RSRC * rsrc)
- 	for (k = 0 ; data_offset + data_len < rsrc->rsrc_len ; k++)
- 	{	int slen ;
- 
--		slen = read_char (rsrc->rsrc_data, str_offset) ;
--		read_str (rsrc->rsrc_data, str_offset + 1, name, SF_MIN (SIGNED_SIZEOF (name), slen + 1)) ;
-+		slen = read_rsrc_char (rsrc, str_offset) ;
-+		read_rsrc_str (rsrc, str_offset + 1, name, SF_MIN (SIGNED_SIZEOF (name), slen + 1)) ;
- 		str_offset += slen + 1 ;
- 
--		rsrc_id = read_short (rsrc->rsrc_data, rsrc->item_offset + k * 12) ;
-+		rsrc_id = read_rsrc_short (rsrc, rsrc->item_offset + k * 12) ;
- 
--		data_offset = rsrc->data_offset + read_int (rsrc->rsrc_data, rsrc->item_offset + k * 12 + 4) ;
-+		data_offset = rsrc->data_offset + read_rsrc_int (rsrc, rsrc->item_offset + k * 12 + 4) ;
- 		if (data_offset < 0 || data_offset > rsrc->rsrc_len)
- 		{	psf_log_printf (psf, "Exiting parser on data offset of %d.\n", data_offset) ;
- 			break ;
- 			} ;
- 
--		data_len = read_int (rsrc->rsrc_data, data_offset) ;
-+		data_len = read_rsrc_int (rsrc, data_offset) ;
- 		if (data_len < 0 || data_len > rsrc->rsrc_len)
- 		{	psf_log_printf (psf, "Exiting parser on data length of %d.\n", data_len) ;
- 			break ;
- 			} ;
- 
--		slen = read_char (rsrc->rsrc_data, data_offset + 4) ;
--		read_str (rsrc->rsrc_data, data_offset + 5, value, SF_MIN (SIGNED_SIZEOF (value), slen + 1)) ;
-+		slen = read_rsrc_char (rsrc, data_offset + 4) ;
-+		read_rsrc_str (rsrc, data_offset + 5, value, SF_MIN (SIGNED_SIZEOF (value), slen + 1)) ;
- 
- 		psf_log_printf (psf, "  0x%04x     %4d     %4d     %3d    '%s'\n", data_offset, rsrc_id, data_len, slen, value) ;
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch b/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
deleted file mode 100644
index fa6473d..0000000
--- a/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From dbe14f00030af5d3577f4cabbf9861db59e9c378 Mon Sep 17 00:00:00 2001
-From: Erik de Castro Lopo <erikd@mega-nerd.com>
-Date: Thu, 25 Dec 2014 19:23:12 +1100
-Subject: [PATCH] src/sd2.c : Fix two potential buffer read overflows.
-
-(Upstream commit dbe14f00030af5d3577f4cabbf9861db59e9c378)
-
-Closes: https://github.com/erikd/libsndfile/issues/93
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
----
- src/sd2.c |   12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/sd2.c b/src/sd2.c
-index 0b4e5af..a70a1f1 100644
---- a/src/sd2.c
-+++ b/src/sd2.c
-@@ -517,6 +517,11 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
- 
- 	rsrc.type_offset = rsrc.map_offset + 30 ;
- 
-+	if (rsrc.map_offset + 28 > rsrc.rsrc_len)
-+	{	psf_log_printf (psf, "Bad map offset.\n") ;
-+		goto parse_rsrc_fork_cleanup ;
-+		} ;
-+
- 	rsrc.type_count = read_rsrc_short (&rsrc, rsrc.map_offset + 28) + 1 ;
- 	if (rsrc.type_count < 1)
- 	{	psf_log_printf (psf, "Bad type count.\n") ;
-@@ -533,7 +538,12 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
- 
- 	rsrc.str_index = -1 ;
- 	for (k = 0 ; k < rsrc.type_count ; k ++)
--	{	marker = read_rsrc_marker (&rsrc, rsrc.type_offset + k * 8) ;
-+	{	if (rsrc.type_offset + k * 8 > rsrc.rsrc_len)
-+		{	psf_log_printf (psf, "Bad rsrc marker.\n") ;
-+			goto parse_rsrc_fork_cleanup ;
-+			} ;
-+
-+		marker = read_rsrc_marker (&rsrc, rsrc.type_offset + k * 8) ;
- 
- 		if (marker == STR_MARKER)
- 		{	rsrc.str_index = k ;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch b/meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
deleted file mode 100644
index b54b3ba..0000000
--- a/meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-src/file_io.c : Prevent potential divide-by-zero.
-
-Closes: https://github.com/erikd/libsndfile/issues/92
-
-Upstream-Status: Backport
-
-Fixes CVE-2014-9756
-
-Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur libsndfile-1.0.25-orig/src/file_io.c libsndfile-1.0.25/src/file_io.c
---- libsndfile-1.0.25-orig/src/file_io.c	2011-01-19 12:12:28.000000000 +0200
-+++ libsndfile-1.0.25/src/file_io.c	2015-11-04 15:02:04.337395618 +0200
-@@ -358,6 +358,9 @@
- {	sf_count_t total = 0 ;
- 	ssize_t	count ;
- 
-+    if (bytes == 0 || items == 0)
-+        return 0 ;
-+
- 	if (psf->virtual_io)
- 		return psf->vio.write (ptr, bytes*items, psf->vio_user_data) / bytes ;
- 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
deleted file mode 100644
index be875c2..0000000
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Audio format Conversion library"
-HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
-AUTHOR = "Erik de Castro Lopo"
-DEPENDS = "sqlite3"
-SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1"
-PR = "r2"
-
-SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
-           file://0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch \
-           file://0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch \
-           file://libsndfile-fix-CVE-2014-9756.patch \
-"
-
-SRC_URI[md5sum] = "e2b7bb637e01022c7d20f95f9c3990a2"
-SRC_URI[sha256sum] = "59016dbd326abe7e2366ded5c344c853829bebfd1702ef26a07ef662d6aa4882"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
-
-S = "${WORKDIR}/libsndfile-${PV}"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-
-EXTRA_OECONF = "--disable-external-libs"
-
-inherit autotools lib_package pkgconfig
-
-do_configure_prepend_arm() {
-	export ac_cv_sys_largefile_source=1
-	export ac_cv_sys_file_offset_bits=64
-	ac_cv_sizeof_off_t=8
-}
-
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
new file mode 100644
index 0000000..3b11568
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Audio format Conversion library"
+HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
+AUTHOR = "Erik de Castro Lopo"
+DEPENDS = "sqlite3"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1"
+
+SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ec810a0c60c08772a8a5552704b63393"
+SRC_URI[sha256sum] = "cd6520ec763d1a45573885ecb1f8e4e42505ac12180268482a44b28484a25092"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
+
+S = "${WORKDIR}/libsndfile-${PV}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+
+EXTRA_OECONF = "--disable-external-libs"
+
+inherit autotools lib_package pkgconfig
+
+do_configure_prepend_arm() {
+	export ac_cv_sys_largefile_source=1
+	export ac_cv_sys_file_offset_bits=64
+	ac_cv_sizeof_off_t=8
+}
+
-- 
2.6.2


