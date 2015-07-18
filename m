Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3A27610C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:46 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so31931364pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VgwolD7XN6ioMpKAeDyiv8aknUf3/X+PjMiRkAVktxA=;
	b=LWe/wNediRqiUs2x5AHdWHhn8sO5+s/WiVdG00t3QME4Pj7FdmngeBoUfQfJbeburd
	7fSEX9YNFnnfDerLdWCy+SdCpLovXzhTMBdiVHoQjDsk5Jp/qdW/n9umAGfrcrpeOH7O
	pn2XYeWCT9nAJKMFVx6l/FGXR8y35+IbeBO0rNag+eOFB2Pw6B1J7Nir9e1iA0lDbuJY
	3qqBhzvOmj01LIblCVTG663/xNoHho7q16njvf3WWQA1LU5vxub6frwCcFni3eyfeCis
	MpzmJGi9od5V8vCPN0dOHCkxzD6SbuWH9nPo0JwM72tT4D/r1+BhrQnAaQLNUISGOBpn
	TdEQ==
X-Received: by 10.66.185.134 with SMTP id fc6mr13470008pac.54.1437232606737;
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	fe10sm14626261pdb.59.2015.07.18.08.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:45 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 97A71FC12F1; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:16 -0700
Message-Id: <59934439108e4d016c95e13d78e3d981b5c227bc.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 09/25] libsndfile: Security Advisory - libsndfile - CVE-2014-9496
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:49 -0000

From: Yue Tao <Yue.Tao@windriver.com>

Backport two commits from libsndfile upstream to fix a segfault and
two potential buffer overflows.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch | 211 +++++++++++++++++++++
 ...c-Fix-two-potential-buffer-read-overflows.patch |  49 +++++
 .../libsndfile/libsndfile1_1.0.25.bb               |   5 +-
 3 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch

diff --git a/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch b/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
new file mode 100644
index 0000000..cd48710
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
@@ -0,0 +1,211 @@
+From 9341e9c6e70cd3ad76c901c3cf052d4cb52fd827 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Thu, 27 Jun 2013 18:04:03 +1000
+Subject: [PATCH] src/sd2.c : Fix segfault in SD2 RSRC parser.
+
+(Upstream commit 9341e9c6e70cd3ad76c901c3cf052d4cb52fd827)
+
+A specially crafted resource fork for an SD2 file can cause
+the SD2 RSRC parser to read data from outside a dynamically
+defined buffer. The data that is read is converted into a
+short or int and used during further processing.
+
+Since no write occurs, this is unlikely to be exploitable.
+
+Bug reported by The Mayhem Team from Cylab, Carnegie Mellon
+Univeristy. Paper is:
+http://users.ece.cmu.edu/~arebert/papers/mayhem-oakland-12.pdf
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ src/sd2.c |   93 ++++++++++++++++++++++++++++++++++++-------------------------
+ 1 file changed, 55 insertions(+), 38 deletions(-)
+
+diff --git a/src/sd2.c b/src/sd2.c
+index 35ce36b..6be150c 100644
+--- a/src/sd2.c
++++ b/src/sd2.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 2001-2011 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 2001-2013 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2004 Paavo Jumppanen
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -371,44 +371,61 @@ sd2_write_rsrc_fork (SF_PRIVATE *psf, int UNUSED (calc_length))
+ */
+ 
+ static inline int
+-read_char (const unsigned char * data, int offset)
+-{	return data [offset] ;
+-} /* read_char */
++read_rsrc_char (const SD2_RSRC *prsrc, int offset)
++{	const unsigned char * data = prsrc->rsrc_data ;
++	if (offset < 0 || offset >= prsrc->rsrc_len)
++		return 0 ;
++	return data [offset] ;
++} /* read_rsrc_char */
+ 
+ static inline int
+-read_short (const unsigned char * data, int offset)
+-{	return (data [offset] << 8) + data [offset + 1] ;
+-} /* read_short */
++read_rsrc_short (const SD2_RSRC *prsrc, int offset)
++{	const unsigned char * data = prsrc->rsrc_data ;
++	if (offset < 0 || offset + 1 >= prsrc->rsrc_len)
++		return 0 ;
++	return (data [offset] << 8) + data [offset + 1] ;
++} /* read_rsrc_short */
+ 
+ static inline int
+-read_int (const unsigned char * data, int offset)
+-{	return (data [offset] << 24) + (data [offset + 1] << 16) + (data [offset + 2] << 8) + data [offset + 3] ;
+-} /* read_int */
++read_rsrc_int (const SD2_RSRC *prsrc, int offset)
++{	const unsigned char * data = prsrc->rsrc_data ;
++	if (offset < 0 || offset + 3 >= prsrc->rsrc_len)
++		return 0 ;
++	return (data [offset] << 24) + (data [offset + 1] << 16) + (data [offset + 2] << 8) + data [offset + 3] ;
++} /* read_rsrc_int */
+ 
+ static inline int
+-read_marker (const unsigned char * data, int offset)
+-{
++read_rsrc_marker (const SD2_RSRC *prsrc, int offset)
++{	const unsigned char * data = prsrc->rsrc_data ;
++
++	if (offset < 0 || offset + 3 >= prsrc->rsrc_len)
++		return 0 ;
++
+ 	if (CPU_IS_BIG_ENDIAN)
+ 		return (data [offset] << 24) + (data [offset + 1] << 16) + (data [offset + 2] << 8) + data [offset + 3] ;
+-	else if (CPU_IS_LITTLE_ENDIAN)
++	if (CPU_IS_LITTLE_ENDIAN)
+ 		return data [offset] + (data [offset + 1] << 8) + (data [offset + 2] << 16) + (data [offset + 3] << 24) ;
+-	else
+-		return 0x666 ;
+-} /* read_marker */
++
++	return 0 ;
++} /* read_rsrc_marker */
+ 
+ static void
+-read_str (const unsigned char * data, int offset, char * buffer, int buffer_len)
+-{	int k ;
++read_rsrc_str (const SD2_RSRC *prsrc, int offset, char * buffer, int buffer_len)
++{	const unsigned char * data = prsrc->rsrc_data ;
++	int k ;
+ 
+ 	memset (buffer, 0, buffer_len) ;
+ 
++	if (offset < 0 || offset + buffer_len >= prsrc->rsrc_len)
++		return ;
++
+ 	for (k = 0 ; k < buffer_len - 1 ; k++)
+ 	{	if (psf_isprint (data [offset + k]) == 0)
+ 			return ;
+ 		buffer [k] = data [offset + k] ;
+ 		} ;
+ 	return ;
+-} /* read_str */
++} /* read_rsrc_str */
+ 
+ static int
+ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+@@ -435,17 +452,17 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+ 	/* Reset the header storage because we have changed to the rsrcdes. */
+ 	psf->headindex = psf->headend = rsrc.rsrc_len ;
+ 
+-	rsrc.data_offset = read_int (rsrc.rsrc_data, 0) ;
+-	rsrc.map_offset = read_int (rsrc.rsrc_data, 4) ;
+-	rsrc.data_length = read_int (rsrc.rsrc_data, 8) ;
+-	rsrc.map_length = read_int (rsrc.rsrc_data, 12) ;
++	rsrc.data_offset = read_rsrc_int (&rsrc, 0) ;
++	rsrc.map_offset = read_rsrc_int (&rsrc, 4) ;
++	rsrc.data_length = read_rsrc_int (&rsrc, 8) ;
++	rsrc.map_length = read_rsrc_int (&rsrc, 12) ;
+ 
+ 	if (rsrc.data_offset == 0x51607 && rsrc.map_offset == 0x20000)
+ 	{	psf_log_printf (psf, "Trying offset of 0x52 bytes.\n") ;
+-		rsrc.data_offset = read_int (rsrc.rsrc_data, 0x52 + 0) + 0x52 ;
+-		rsrc.map_offset = read_int (rsrc.rsrc_data, 0x52 + 4) + 0x52 ;
+-		rsrc.data_length = read_int (rsrc.rsrc_data, 0x52 + 8) ;
+-		rsrc.map_length = read_int (rsrc.rsrc_data, 0x52 + 12) ;
++		rsrc.data_offset = read_rsrc_int (&rsrc, 0x52 + 0) + 0x52 ;
++		rsrc.map_offset = read_rsrc_int (&rsrc, 0x52 + 4) + 0x52 ;
++		rsrc.data_length = read_rsrc_int (&rsrc, 0x52 + 8) ;
++		rsrc.map_length = read_rsrc_int (&rsrc, 0x52 + 12) ;
+ 		} ;
+ 
+ 	psf_log_printf (psf, "  data offset : 0x%04X\n  map  offset : 0x%04X\n"
+@@ -488,7 +505,7 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+ 		goto parse_rsrc_fork_cleanup ;
+ 		} ;
+ 
+-	rsrc.string_offset = rsrc.map_offset + read_short (rsrc.rsrc_data, rsrc.map_offset + 26) ;
++	rsrc.string_offset = rsrc.map_offset + read_rsrc_short (&rsrc, rsrc.map_offset + 26) ;
+ 	if (rsrc.string_offset > rsrc.rsrc_len)
+ 	{	psf_log_printf (psf, "Bad string offset (%d).\n", rsrc.string_offset) ;
+ 		error = SFE_SD2_BAD_RSRC ;
+@@ -497,7 +514,7 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+ 
+ 	rsrc.type_offset = rsrc.map_offset + 30 ;
+ 
+-	rsrc.type_count = read_short (rsrc.rsrc_data, rsrc.map_offset + 28) + 1 ;
++	rsrc.type_count = read_rsrc_short (&rsrc, rsrc.map_offset + 28) + 1 ;
+ 	if (rsrc.type_count < 1)
+ 	{	psf_log_printf (psf, "Bad type count.\n") ;
+ 		error = SFE_SD2_BAD_RSRC ;
+@@ -513,11 +530,11 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+ 
+ 	rsrc.str_index = -1 ;
+ 	for (k = 0 ; k < rsrc.type_count ; k ++)
+-	{	marker = read_marker (rsrc.rsrc_data, rsrc.type_offset + k * 8) ;
++	{	marker = read_rsrc_marker (&rsrc, rsrc.type_offset + k * 8) ;
+ 
+ 		if (marker == STR_MARKER)
+ 		{	rsrc.str_index = k ;
+-			rsrc.str_count = read_short (rsrc.rsrc_data, rsrc.type_offset + k * 8 + 4) + 1 ;
++			rsrc.str_count = read_rsrc_short (&rsrc, rsrc.type_offset + k * 8 + 4) + 1 ;
+ 			error = parse_str_rsrc (psf, &rsrc) ;
+ 			goto parse_rsrc_fork_cleanup ;
+ 			} ;
+@@ -549,26 +566,26 @@ parse_str_rsrc (SF_PRIVATE *psf, SD2_RSRC * rsrc)
+ 	for (k = 0 ; data_offset + data_len < rsrc->rsrc_len ; k++)
+ 	{	int slen ;
+ 
+-		slen = read_char (rsrc->rsrc_data, str_offset) ;
+-		read_str (rsrc->rsrc_data, str_offset + 1, name, SF_MIN (SIGNED_SIZEOF (name), slen + 1)) ;
++		slen = read_rsrc_char (rsrc, str_offset) ;
++		read_rsrc_str (rsrc, str_offset + 1, name, SF_MIN (SIGNED_SIZEOF (name), slen + 1)) ;
+ 		str_offset += slen + 1 ;
+ 
+-		rsrc_id = read_short (rsrc->rsrc_data, rsrc->item_offset + k * 12) ;
++		rsrc_id = read_rsrc_short (rsrc, rsrc->item_offset + k * 12) ;
+ 
+-		data_offset = rsrc->data_offset + read_int (rsrc->rsrc_data, rsrc->item_offset + k * 12 + 4) ;
++		data_offset = rsrc->data_offset + read_rsrc_int (rsrc, rsrc->item_offset + k * 12 + 4) ;
+ 		if (data_offset < 0 || data_offset > rsrc->rsrc_len)
+ 		{	psf_log_printf (psf, "Exiting parser on data offset of %d.\n", data_offset) ;
+ 			break ;
+ 			} ;
+ 
+-		data_len = read_int (rsrc->rsrc_data, data_offset) ;
++		data_len = read_rsrc_int (rsrc, data_offset) ;
+ 		if (data_len < 0 || data_len > rsrc->rsrc_len)
+ 		{	psf_log_printf (psf, "Exiting parser on data length of %d.\n", data_len) ;
+ 			break ;
+ 			} ;
+ 
+-		slen = read_char (rsrc->rsrc_data, data_offset + 4) ;
+-		read_str (rsrc->rsrc_data, data_offset + 5, value, SF_MIN (SIGNED_SIZEOF (value), slen + 1)) ;
++		slen = read_rsrc_char (rsrc, data_offset + 4) ;
++		read_rsrc_str (rsrc, data_offset + 5, value, SF_MIN (SIGNED_SIZEOF (value), slen + 1)) ;
+ 
+ 		psf_log_printf (psf, "  0x%04x     %4d     %4d     %3d    '%s'\n", data_offset, rsrc_id, data_len, slen, value) ;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch b/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
new file mode 100644
index 0000000..fa6473d
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
@@ -0,0 +1,49 @@
+From dbe14f00030af5d3577f4cabbf9861db59e9c378 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Thu, 25 Dec 2014 19:23:12 +1100
+Subject: [PATCH] src/sd2.c : Fix two potential buffer read overflows.
+
+(Upstream commit dbe14f00030af5d3577f4cabbf9861db59e9c378)
+
+Closes: https://github.com/erikd/libsndfile/issues/93
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ src/sd2.c |   12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/sd2.c b/src/sd2.c
+index 0b4e5af..a70a1f1 100644
+--- a/src/sd2.c
++++ b/src/sd2.c
+@@ -517,6 +517,11 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+ 
+ 	rsrc.type_offset = rsrc.map_offset + 30 ;
+ 
++	if (rsrc.map_offset + 28 > rsrc.rsrc_len)
++	{	psf_log_printf (psf, "Bad map offset.\n") ;
++		goto parse_rsrc_fork_cleanup ;
++		} ;
++
+ 	rsrc.type_count = read_rsrc_short (&rsrc, rsrc.map_offset + 28) + 1 ;
+ 	if (rsrc.type_count < 1)
+ 	{	psf_log_printf (psf, "Bad type count.\n") ;
+@@ -533,7 +538,12 @@ sd2_parse_rsrc_fork (SF_PRIVATE *psf)
+ 
+ 	rsrc.str_index = -1 ;
+ 	for (k = 0 ; k < rsrc.type_count ; k ++)
+-	{	marker = read_rsrc_marker (&rsrc, rsrc.type_offset + k * 8) ;
++	{	if (rsrc.type_offset + k * 8 > rsrc.rsrc_len)
++		{	psf_log_printf (psf, "Bad rsrc marker.\n") ;
++			goto parse_rsrc_fork_cleanup ;
++			} ;
++
++		marker = read_rsrc_marker (&rsrc, rsrc.type_offset + k * 8) ;
+ 
+ 		if (marker == STR_MARKER)
+ 		{	rsrc.str_index = k ;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index 9246298..3e02f4e 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -6,7 +6,10 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
 PR = "r2"
 
-SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
+SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
+           file://0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch \
+           file://0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch \
+"
 
 SRC_URI[md5sum] = "e2b7bb637e01022c7d20f95f9c3990a2"
 SRC_URI[sha256sum] = "59016dbd326abe7e2366ded5c344c853829bebfd1702ef26a07ef662d6aa4882"
-- 
1.9.1


