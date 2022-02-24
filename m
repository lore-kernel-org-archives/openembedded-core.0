Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A35BC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:12:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.11547.1645715537862177386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUrITNC0;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so2269029pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=zy4/MdtdyQ8F7C6X1z3I1XHvGhnYnE0bDJKiuiouRLY=;
        b=aUrITNC0RY6hMRYu3KKtcsL1AqRS5UubzO3TORwRZCxwv9KkFtH8rf+8Wu7Y9KqxRV
         HhN9sK8aYNQrmj+3BgrcPBeceQrBfJnLXPZUEfoZ4Q6rnnUicNwEuqGgIobWmYCwg6Xj
         1AidxEdu/zdTn8HNPhV6byp3yohqD6ZsmyYRj1sFR9nqmJ7vrnJ8exH1KLbFmxu17hx8
         nDDu5+uVuWtLdbsBbQ+vSnkdyd4AdOrS41YbNHkP/WO1W0EbutnFsRj6mmt3JjtAs3Pl
         BSC8GaV96qo6qLiqM1Tdf48v3NcM9agc5GGOoh7p1Ba0d8wI2oimMBTKLjixcDKYuEFX
         ecSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zy4/MdtdyQ8F7C6X1z3I1XHvGhnYnE0bDJKiuiouRLY=;
        b=02kQF6+mE0csTz71WY+7PKLovMmaNHC7vjEdFDwd44XheofHfOQwUDmivBBqBSjpwn
         Hku7EGbrW/kRl+N+szFHfmIfFWCbBYXW5/555Az2fJHmRvFTC2u/FQbfXkayAW+1D+yq
         q5pde9/IxJWzrn7oU/+U1tVuVtT0ciNN42lC7M+amoFwB3XlIQhSsC04NCtyOItyzeFD
         aH1KJo3rz6PcHNP0HvmIKJPv1+VFHrnZV02caEktkmNoXVnJ5U9qRFTh/Zu/j0l31kvo
         QTy9yiUS8PLcKy35DN5rcn19wljLxSJZXgDKQr7gNNRrQOByRQIOeOKvmYtboqaBK9a6
         ZZAQ==
X-Gm-Message-State: AOAM531JJ12JKaw6N9bQpYtnwR1up132xjBLKZQOh13SgJR/scv1UR6m
	tQnpSE3mG4EebdoJLNFGaQpwysHb2Wg=
X-Google-Smtp-Source: 
 ABdhPJyXLkm2aQ2Pw3xPb5yYAs0hdJb+squE4kyWGlfUL2aDy41/ou880olG45ep70wXODfpGxSzRg==
X-Received: by 2002:a17:902:e882:b0:14f:f310:4ec7 with SMTP id
 w2-20020a170902e88200b0014ff3104ec7mr2882259plg.17.1645715536558;
        Thu, 24 Feb 2022 07:12:16 -0800 (PST)
Received: from localhost.localdomain ([182.70.49.59])
        by smtp.gmail.com with ESMTPSA id
 12-20020a17090a01cc00b001bc1e04842fsm6705484pjd.26.2022.02.24.07.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:12:16 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][dunfell][PATCH] libarchive: Fix for CVE-2021-36976
Date: Thu, 24 Feb 2022 20:41:59 +0530
Message-Id: <20220224151159.21106-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162320

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2021-36976

CVE-2021-36976 fix are provided by below mentioned pull request.
1) https://github.com/libarchive/libarchive/pull/1491
2) https://github.com/libarchive/libarchive/pull/1492
3) https://github.com/libarchive/libarchive/pull/1493

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
---
 .../libarchive/CVE-2021-36976-1.patch         | 321 ++++++++++++++++++
 .../libarchive/CVE-2021-36976-2.patch         | 121 +++++++
 .../libarchive/CVE-2021-36976-3.patch         |  93 +++++
 .../libarchive/libarchive_3.4.2.bb            |   6 +-
 4 files changed, 540 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-2.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-3.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-1.patch
new file mode 100644
index 0000000000..fca53fc9b6
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-1.patch
@@ -0,0 +1,321 @@
+From 05ebb55896d10a9737dad9ae0303f7f45489ba6f Mon Sep 17 00:00:00 2001
+From: Grzegorz Antoniak <ga@anadoxin.org>
+Date: Sat, 13 Feb 2021 09:08:13 +0100
+Subject: [PATCH] RAR5 reader: fixed out of bounds read in some files
+
+Added more range checks in the bit stream reading functions
+(read_bits_16 and read_bits_32) in order to better guard against out of
+memory reads.
+
+This commit contains a test with OSSFuzz sample #30448.
+
+Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/libarchive/plain/debian/patches/CVE-2021-36976-1.patch?h=applied/3.4.3-2ubuntu0.1]
+CVE: CVE-2021-36976
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ Makefile.am                                   |   1 +
+ libarchive/archive_read_support_format_rar5.c | 108 ++++++++++--------
+ libarchive/test/test_read_format_rar5.c       |  16 +++
+ ...r5_decode_number_out_of_bounds_read.rar.uu |  10 ++
+ 4 files changed, 89 insertions(+), 46 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_rar5_decode_number_out_of_bounds_read.rar.uu
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -883,6 +883,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_arm_filter_on_window_boundary.rar.uu \
+ 	libarchive/test/test_read_format_rar5_different_winsize_on_merge.rar.uu \
+ 	libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu \
++	libarchive/test/test_read_format_rar5_decode_number_out_of_bounds_read.rar.uu \
+ 	libarchive/test/test_read_format_raw.bufr.uu \
+ 	libarchive/test/test_read_format_raw.data.gz.uu \
+ 	libarchive/test/test_read_format_raw.data.Z.uu \
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -1012,7 +1012,16 @@ static int read_var_sized(struct archive
+ 	return ret;
+ }
+ 
+-static int read_bits_32(struct rar5* rar, const uint8_t* p, uint32_t* value) {
++static int read_bits_32(struct archive_read* a, struct rar5* rar,
++	const uint8_t* p, uint32_t* value)
++{
++	if(rar->bits.in_addr >= rar->cstate.cur_block_size) {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_PROGRAMMER,
++			"Premature end of stream during extraction of data (#1)");
++		return ARCHIVE_FATAL;
++	}
++
+ 	uint32_t bits = ((uint32_t) p[rar->bits.in_addr]) << 24;
+ 	bits |= p[rar->bits.in_addr + 1] << 16;
+ 	bits |= p[rar->bits.in_addr + 2] << 8;
+@@ -1023,7 +1032,16 @@ static int read_bits_32(struct rar5* rar
+ 	return ARCHIVE_OK;
+ }
+ 
+-static int read_bits_16(struct rar5* rar, const uint8_t* p, uint16_t* value) {
++static int read_bits_16(struct archive_read* a, struct rar5* rar,
++	const uint8_t* p, uint16_t* value)
++{
++	if(rar->bits.in_addr >= rar->cstate.cur_block_size) {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_PROGRAMMER,
++			"Premature end of stream during extraction of data (#2)");
++		return ARCHIVE_FATAL;
++	}
++
+ 	int bits = (int) ((uint32_t) p[rar->bits.in_addr]) << 16;
+ 	bits |= (int) p[rar->bits.in_addr + 1] << 8;
+ 	bits |= (int) p[rar->bits.in_addr + 2];
+@@ -1039,8 +1057,8 @@ static void skip_bits(struct rar5* rar,
+ }
+ 
+ /* n = up to 16 */
+-static int read_consume_bits(struct rar5* rar, const uint8_t* p, int n,
+-    int* value)
++static int read_consume_bits(struct archive_read* a, struct rar5* rar,
++	const uint8_t* p, int n, int* value)
+ {
+ 	uint16_t v;
+ 	int ret, num;
+@@ -1051,7 +1069,7 @@ static int read_consume_bits(struct rar5
+ 		return ARCHIVE_FATAL;
+ 	}
+ 
+-	ret = read_bits_16(rar, p, &v);
++	ret = read_bits_16(a, rar, p, &v);
+ 	if(ret != ARCHIVE_OK)
+ 		return ret;
+ 
+@@ -2425,13 +2443,13 @@ static int create_decode_tables(uint8_t*
+ static int decode_number(struct archive_read* a, struct decode_table* table,
+     const uint8_t* p, uint16_t* num)
+ {
+-	int i, bits, dist;
++	int i, bits, dist, ret;
+ 	uint16_t bitfield;
+ 	uint32_t pos;
+ 	struct rar5* rar = get_context(a);
+ 
+-	if(ARCHIVE_OK != read_bits_16(rar, p, &bitfield)) {
+-		return ARCHIVE_EOF;
++	if(ARCHIVE_OK != (ret = read_bits_16(a, rar, p, &bitfield))) {
++		return ret;
+ 	}
+ 
+ 	bitfield &= 0xfffe;
+@@ -2537,14 +2555,6 @@ static int parse_tables(struct archive_r
+ 	for(i = 0; i < HUFF_TABLE_SIZE;) {
+ 		uint16_t num;
+ 
+-		if((rar->bits.in_addr + 6) >= rar->cstate.cur_block_size) {
+-			/* Truncated data, can't continue. */
+-			archive_set_error(&a->archive,
+-			    ARCHIVE_ERRNO_FILE_FORMAT,
+-			    "Truncated data in huffman tables (#2)");
+-			return ARCHIVE_FATAL;
+-		}
+-
+ 		ret = decode_number(a, &rar->cstate.bd, p, &num);
+ 		if(ret != ARCHIVE_OK) {
+ 			archive_set_error(&a->archive,
+@@ -2561,8 +2571,8 @@ static int parse_tables(struct archive_r
+ 			/* 16..17: repeat previous code */
+ 			uint16_t n;
+ 
+-			if(ARCHIVE_OK != read_bits_16(rar, p, &n))
+-				return ARCHIVE_EOF;
++			if(ARCHIVE_OK != (ret = read_bits_16(a, rar, p, &n)))
++				return ret;
+ 
+ 			if(num == 16) {
+ 				n >>= 13;
+@@ -2590,8 +2600,8 @@ static int parse_tables(struct archive_r
+ 			/* other codes: fill with zeroes `n` times */
+ 			uint16_t n;
+ 
+-			if(ARCHIVE_OK != read_bits_16(rar, p, &n))
+-				return ARCHIVE_EOF;
++			if(ARCHIVE_OK != (ret = read_bits_16(a, rar, p, &n)))
++				return ret;
+ 
+ 			if(num == 18) {
+ 				n >>= 13;
+@@ -2707,22 +2717,22 @@ static int parse_block_header(struct arc
+ }
+ 
+ /* Convenience function used during filter processing. */
+-static int parse_filter_data(struct rar5* rar, const uint8_t* p,
+-    uint32_t* filter_data)
++static int parse_filter_data(struct archive_read* a, struct rar5* rar,
++	const uint8_t* p, uint32_t* filter_data)
+ {
+-	int i, bytes;
++	int i, bytes, ret;
+ 	uint32_t data = 0;
+ 
+-	if(ARCHIVE_OK != read_consume_bits(rar, p, 2, &bytes))
+-		return ARCHIVE_EOF;
++	if(ARCHIVE_OK != (ret = read_consume_bits(a, rar, p, 2, &bytes)))
++		return ret;
+ 
+ 	bytes++;
+ 
+ 	for(i = 0; i < bytes; i++) {
+ 		uint16_t byte;
+ 
+-		if(ARCHIVE_OK != read_bits_16(rar, p, &byte)) {
+-			return ARCHIVE_EOF;
++		if(ARCHIVE_OK != (ret = read_bits_16(a, rar, p, &byte))) {
++			return ret;
+ 		}
+ 
+ 		/* Cast to uint32_t will ensure the shift operation will not
+@@ -2765,16 +2775,17 @@ static int parse_filter(struct archive_r
+ 	uint16_t filter_type;
+ 	struct filter_info* filt = NULL;
+ 	struct rar5* rar = get_context(ar);
++	int ret;
+ 
+ 	/* Read the parameters from the input stream. */
+-	if(ARCHIVE_OK != parse_filter_data(rar, p, &block_start))
+-		return ARCHIVE_EOF;
++	if(ARCHIVE_OK != (ret = parse_filter_data(ar, rar, p, &block_start)))
++		return ret;
+ 
+-	if(ARCHIVE_OK != parse_filter_data(rar, p, &block_length))
+-		return ARCHIVE_EOF;
++	if(ARCHIVE_OK != (ret = parse_filter_data(ar, rar, p, &block_length)))
++		return ret;
+ 
+-	if(ARCHIVE_OK != read_bits_16(rar, p, &filter_type))
+-		return ARCHIVE_EOF;
++	if(ARCHIVE_OK != (ret = read_bits_16(ar, rar, p, &filter_type)))
++		return ret;
+ 
+ 	filter_type >>= 13;
+ 	skip_bits(rar, 3);
+@@ -2814,8 +2825,8 @@ static int parse_filter(struct archive_r
+ 	if(filter_type == FILTER_DELTA) {
+ 		int channels;
+ 
+-		if(ARCHIVE_OK != read_consume_bits(rar, p, 5, &channels))
+-			return ARCHIVE_EOF;
++		if(ARCHIVE_OK != (ret = read_consume_bits(ar, rar, p, 5, &channels)))
++			return ret;
+ 
+ 		filt->channels = channels + 1;
+ 	}
+@@ -2823,10 +2834,11 @@ static int parse_filter(struct archive_r
+ 	return ARCHIVE_OK;
+ }
+ 
+-static int decode_code_length(struct rar5* rar, const uint8_t* p,
+-    uint16_t code)
++static int decode_code_length(struct archive_read* a, struct rar5* rar,
++	const uint8_t* p, uint16_t code)
+ {
+ 	int lbits, length = 2;
++
+ 	if(code < 8) {
+ 		lbits = 0;
+ 		length += code;
+@@ -2838,7 +2850,7 @@ static int decode_code_length(struct rar
+ 	if(lbits > 0) {
+ 		int add;
+ 
+-		if(ARCHIVE_OK != read_consume_bits(rar, p, lbits, &add))
++		if(ARCHIVE_OK != read_consume_bits(a, rar, p, lbits, &add))
+ 			return -1;
+ 
+ 		length += add;
+@@ -2933,7 +2945,7 @@ static int do_uncompress_block(struct ar
+ 			continue;
+ 		} else if(num >= 262) {
+ 			uint16_t dist_slot;
+-			int len = decode_code_length(rar, p, num - 262),
++			int len = decode_code_length(a, rar, p, num - 262),
+ 				dbits,
+ 				dist = 1;
+ 
+@@ -2975,12 +2987,12 @@ static int do_uncompress_block(struct ar
+ 					uint16_t low_dist;
+ 
+ 					if(dbits > 4) {
+-						if(ARCHIVE_OK != read_bits_32(
+-						    rar, p, &add)) {
++						if(ARCHIVE_OK != (ret = read_bits_32(
++						    a, rar, p, &add))) {
+ 							/* Return EOF if we
+ 							 * can't read more
+ 							 * data. */
+-							return ARCHIVE_EOF;
++							return ret;
+ 						}
+ 
+ 						skip_bits(rar, dbits - 4);
+@@ -3015,11 +3027,11 @@ static int do_uncompress_block(struct ar
+ 					/* dbits is one of [0,1,2,3] */
+ 					int add;
+ 
+-					if(ARCHIVE_OK != read_consume_bits(rar,
+-					     p, dbits, &add)) {
++					if(ARCHIVE_OK != (ret = read_consume_bits(a, rar,
++					     p, dbits, &add))) {
+ 						/* Return EOF if we can't read
+ 						 * more data. */
+-						return ARCHIVE_EOF;
++						return ret;
+ 					}
+ 
+ 					dist += add;
+@@ -3076,7 +3088,11 @@ static int do_uncompress_block(struct ar
+ 				return ARCHIVE_FATAL;
+ 			}
+ 
+-			len = decode_code_length(rar, p, len_slot);
++			len = decode_code_length(a, rar, p, len_slot);
++			if (len == -1) {
++				return ARCHIVE_FATAL;
++			}
++
+ 			rar->cstate.last_len = len;
+ 
+ 			if(ARCHIVE_OK != copy_string(a, len, dist))
+--- a/libarchive/test/test_read_format_rar5.c
++++ b/libarchive/test/test_read_format_rar5.c
+@@ -1271,3 +1271,20 @@ DEFINE_TEST(test_read_format_rar5_block_
+ 
+ 	EPILOGUE();
+ }
++
++DEFINE_TEST(test_read_format_rar5_decode_number_out_of_bounds_read)
++{
++	/* oss fuzz 30448 */
++
++	char buf[4096];
++	PROLOGUE("test_read_format_rar5_decode_number_out_of_bounds_read.rar");
++
++	/* Return codes of those calls are ignored, because this sample file
++	 * is invalid. However, the unpacker shouldn't produce any SIGSEGV
++	 * errors during processing. */
++
++	(void) archive_read_next_header(a, &ae);
++	while(0 < archive_read_data(a, buf, sizeof(buf))) {}
++
++	EPILOGUE();
++}
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_decode_number_out_of_bounds_read.rar.uu
+@@ -0,0 +1,10 @@
++begin 644 test_read_format_rar5_decode_number_out_of_bounds_read.rar
++M4F%R(1H'`0!3@"KT`P+G(@(0("`@@`L!!"`@("`@(($D_[BJ2"!::7!)210V
++M+0#ZF#)Q!`+>YPW_("`@("``_R````````````````````````````!__P``
++M``````!T72`@/EW_(/\@("`@("`@("`@("`@("`@("`@("`@("`@(/\@("`@
++M("`@("#_("`@("`@("`@("`@("`@("`@("`@("`@("#_("`@("`@("`@_R`@
++M("`@("`@("`@("`@("`@("`@("`@("`@_R`@("`@("`@(/\@("`@("`@("`@
++M("`@("`@("`@("`@("`@(/\@("`@("`@("#_("`@("`@("`@("`@("`@("`@
++E("`@("`@("#_("`@("`@("`@_R`@("`@("`@("`@("`@("`@(```
++`
++end
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-2.patch
new file mode 100644
index 0000000000..b5da44ec7b
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-2.patch
@@ -0,0 +1,121 @@
+From 17f4e83c0f0fc3bacf4b2bbacb01f987bb5aff5f Mon Sep 17 00:00:00 2001
+From: Grzegorz Antoniak <ga@anadoxin.org>
+Date: Fri, 12 Feb 2021 20:18:31 +0100
+Subject: [PATCH] RAR5 reader: fix invalid memory access in some files
+
+RAR5 reader uses several variables to manage the window buffer during
+extraction: the buffer itself (`window_buf`), the current size of the
+window buffer (`window_size`), and a helper variable (`window_mask`)
+that is used to constrain read and write offsets to the window buffer.
+
+Some specially crafted files can force the unpacker to update the
+`window_mask` variable to a value that is out of sync with current
+buffer size. If the `window_mask` will be bigger than the actual buffer
+size, then an invalid access operation can happen (SIGSEGV).
+
+This commit ensures that if the `window_size` and `window_mask` will be
+changed, the window buffer will be reallocated to the proper size, so no
+invalid memory operation should be possible.
+
+This commit contains a test file from OSSFuzz #30442.
+
+Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/libarchive/plain/debian/patches/CVE-2021-36976-2.patch?h=applied/3.4.3-2ubuntu0.1]
+CVE: CVE-2021-36976
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ Makefile.am                                   |  1 +
+ libarchive/archive_read_support_format_rar5.c | 27 ++++++++++++++-----
+ libarchive/test/test_read_format_rar5.c       | 17 ++++++++++++
+ ...mat_rar5_window_buf_and_size_desync.rar.uu | 11 ++++++++
+ 4 files changed, 50 insertions(+), 6 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_rar5_window_buf_and_size_desync.rar.uu
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -884,6 +884,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_different_winsize_on_merge.rar.uu \
+ 	libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu \
+ 	libarchive/test/test_read_format_rar5_decode_number_out_of_bounds_read.rar.uu \
++	libarchive/test/test_read_format_rar5_window_buf_and_size_desync.rar.uu \
+ 	libarchive/test/test_read_format_raw.bufr.uu \
+ 	libarchive/test/test_read_format_raw.data.gz.uu \
+ 	libarchive/test/test_read_format_raw.data.Z.uu \
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -1730,14 +1730,29 @@ static int process_head_file(struct arch
+ 		}
+ 	}
+ 
+-	/* If we're currently switching volumes, ignore the new definition of
+-	 * window_size. */
+-	if(rar->cstate.switch_multivolume == 0) {
+-		/* Values up to 64M should fit into ssize_t on every
+-		 * architecture. */
+-		rar->cstate.window_size = (ssize_t) window_size;
++	if(rar->cstate.window_size < (ssize_t) window_size &&
++	    rar->cstate.window_buf)
++	{
++		/* If window_buf has been allocated before, reallocate it, so
++		 * that its size will match new window_size. */
++
++		uint8_t* new_window_buf =
++			realloc(rar->cstate.window_buf, window_size);
++
++		if(!new_window_buf) {
++			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
++				"Not enough memory when trying to realloc the window "
++				"buffer.");
++			return ARCHIVE_FATAL;
++		}
++
++		rar->cstate.window_buf = new_window_buf;
+ 	}
+ 
++	/* Values up to 64M should fit into ssize_t on every
++	 * architecture. */
++	rar->cstate.window_size = (ssize_t) window_size;
++
+ 	if(rar->file.solid > 0 && rar->file.solid_window_size == 0) {
+ 		/* Solid files have to have the same window_size across
+ 		   whole archive. Remember the window_size parameter
+--- a/libarchive/test/test_read_format_rar5.c
++++ b/libarchive/test/test_read_format_rar5.c
+@@ -1206,6 +1206,23 @@ DEFINE_TEST(test_read_format_rar5_differ
+ 	EPILOGUE();
+ }
+ 
++DEFINE_TEST(test_read_format_rar5_window_buf_and_size_desync)
++{
++	/* oss fuzz 30442 */
++
++	char buf[4096];
++	PROLOGUE("test_read_format_rar5_window_buf_and_size_desync.rar");
++
++	/* Return codes of those calls are ignored, because this sample file
++	 * is invalid. However, the unpacker shouldn't produce any SIGSEGV
++	 * errors during processing. */
++
++	(void) archive_read_next_header(a, &ae);
++	while(0 < archive_read_data(a, buf, 46)) {}
++
++	EPILOGUE();
++}
++
+ DEFINE_TEST(test_read_format_rar5_arm_filter_on_window_boundary)
+ {
+ 	char buf[4096];
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_window_buf_and_size_desync.rar.uu
+@@ -0,0 +1,11 @@
++begin 644 test_read_format_rar5_window_buf_and_size_desync.rar
++M4F%R(1H'`0`]/-[E`@$`_P$`1#[Z5P("`PL``BXB"?\`!(@B@0`)6.-AF?_1
++M^0DI&0GG(F%R(0<:)`!3@"KT`P+G(@O_X[\``#&``(?!!0$$[:L``$.M*E)A
++M<B$`O<\>P0";/P1%``A*2DI*2DYQ<6TN9'%*2DI*2DI*``!D<F--``````"Z
++MNC*ZNKJZNFYO=&%I;+JZNKJZNKJZOKJZ.KJZNKJZNKKZU@4%````0$!`0$!`
++M0$!`0$!`0$!`0$#_________/T#`0$!`0$!`-UM`0$!`0$!`0$!`0$!`0$!`
++M0$!`0'!,J+:O!IZ-WN4'@`!3*F0`````````````````````````````````
++M``````````````#T`P)287(A&@<!`%.`*O0#`N<B`_,F@`'[__\``(`4`01S
++J'`/H/O\H@?\D`#O9GIZ>GN<B"_]%``(``&1RGIZ>GIZ>8_^>GE/_``!.
++`
++end
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-3.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-3.patch
new file mode 100644
index 0000000000..0e1549f229
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-3.patch
@@ -0,0 +1,93 @@
+From 313bcd7ac547f7cc25945831f63507420c0874d7 Mon Sep 17 00:00:00 2001
+From: Grzegorz Antoniak <ga@anadoxin.org>
+Date: Sat, 13 Feb 2021 10:13:22 +0100
+Subject: [PATCH] RAR5 reader: add more checks for invalid extraction
+ parameters
+
+Some specially crafted files declare invalid extraction parameters that
+can confuse the RAR5 reader.
+
+One of the arguments is the declared window size parameter that the
+archive file can declare for each file stored in the archive. Some
+crafted files declare window size equal to 0, which is clearly wrong.
+
+This commit adds additional safety checks decreasing the tolerance of
+the RAR5 format.
+
+This commit also contains OSSFuzz sample #30459.
+---
+ Makefile.am                                   |  1 +
+ libarchive/archive_read_support_format_rar5.c | 10 ++++++++++
+ libarchive/test/test_read_format_rar5.c       | 19 +++++++++++++++++++
+ ...t_rar5_bad_window_sz_in_mltarc_file.rar.uu |  7 +++++++
+ 4 files changed, 37 insertions(+)
+ create mode 100644 libarchive/test/test_read_format_rar5_bad_window_sz_in_mltarc_file.rar.uu
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/pull/1493/commits/313bcd7ac547f7cc25945831f63507420c0874d7]
+CVE: CVE-2021-36976
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+--- libarchive-3.4.2.orig/Makefile.am
++++ libarchive-3.4.2/Makefile.am
+@@ -882,6 +882,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_block_size_is_too_small.rar.uu \
+ 	libarchive/test/test_read_format_rar5_decode_number_out_of_bounds_read.rar.uu \
+ 	libarchive/test/test_read_format_rar5_window_buf_and_size_desync.rar.uu \
++	libarchive/test/test_read_format_rar5_bad_window_sz_in_mltarc_file.rar.uu \
+ 	libarchive/test/test_read_format_raw.bufr.uu \
+ 	libarchive/test/test_read_format_raw.data.gz.uu \
+ 	libarchive/test/test_read_format_raw.data.Z.uu \
+--- libarchive-3.4.2.orig/libarchive/archive_read_support_format_rar5.c
++++ libarchive-3.4.2/libarchive/archive_read_support_format_rar5.c
+@@ -3637,6 +3637,16 @@ static int do_uncompress_file(struct arc
+ 		rar->cstate.initialized = 1;
+ 	}
+ 
++	/* Don't allow extraction if window_size is invalid. */
++	if(rar->cstate.window_size == 0) {
++		archive_set_error(&a->archive,
++			ARCHIVE_ERRNO_FILE_FORMAT,
++			"Invalid window size declaration in this file");
++
++		/* This should never happen in valid files. */
++		return ARCHIVE_FATAL;
++	}
++
+ 	if(rar->cstate.all_filters_applied == 1) {
+ 		/* We use while(1) here, but standard case allows for just 1
+ 		 * iteration. The loop will iterate if process_block() didn't
+--- libarchive-3.4.2.orig/libarchive/test/test_read_format_rar5.c
++++ libarchive-3.4.2/libarchive/test/test_read_format_rar5.c
+@@ -1305,3 +1305,22 @@ DEFINE_TEST(test_read_format_rar5_decode
+ 
+ 	EPILOGUE();
+ }
++
++DEFINE_TEST(test_read_format_rar5_bad_window_size_in_multiarchive_file)
++{
++	/* oss fuzz 30459 */
++
++	char buf[4096];
++	PROLOGUE("test_read_format_rar5_bad_window_sz_in_mltarc_file.rar");
++
++	/* This file is damaged, so those functions should return failure.
++	 * Additionally, SIGSEGV shouldn't be raised during execution
++	 * of those functions. */
++
++	(void) archive_read_next_header(a, &ae);
++	while(0 < archive_read_data(a, buf, sizeof(buf))) {}
++	(void) archive_read_next_header(a, &ae);
++	while(0 < archive_read_data(a, buf, sizeof(buf))) {}
++
++	EPILOGUE();
++}
+--- /dev/null
++++ libarchive-3.4.2/libarchive/test/test_read_format_rar5_bad_window_sz_in_mltarc_file.rar.uu
+@@ -0,0 +1,7 @@
++begin 644 test_read_format_rar5_bad_window_size_in_multiarchive_file.rar
++M4F%R(1H'`0`]/-[E`@$`_R`@1#[Z5P("`PL`("`@@"(`"?\@("#___\@("`@
++M("`@("`@("`@4X`J]`,"YR(#$($@("`@``$@("`@@<L0("`@("`@("`@("`@
++M("`@(""LCTJA`P$%`B`@`2!3@"KT`P+G(@,@("`@_P,!!B`@(/___R`@(('+
++5$"`OX2`@[.SL[.S_("`@("`@("`@
++`
++end
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 0ab40fc096..b7426a1be8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -32,7 +32,11 @@ PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://CVE-2021-36976-1.patch \
+           file://CVE-2021-36976-2.patch \
+           file://CVE-2021-36976-3.patch \
+"
 
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
 SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
-- 
2.17.1


