Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 925396FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:17:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2016 02:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="12525169"
Received: from yleow-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.155.25])
	by orsmga005.jf.intel.com with ESMTP; 23 Sep 2016 02:17:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 21:17:52 +1200
Message-Id: <f1467d4b0014256a4405f97beb3ca46246fa1967.1474622251.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474622251.git.paul.eggleton@linux.intel.com>
References: <cover.1474622251.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474622251.git.paul.eggleton@linux.intel.com>
References: <cover.1474622251.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] nativesdk-qemu-helper: drop old Zaurus flash tools
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
X-List-Received-Date: Fri, 23 Sep 2016 09:17:57 -0000

These tools are relics of an earlier time when the Zaurus devices were
reference platforms - these days they are no longer needed. It seems
amazing that they survived earlier purges.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../qemu/nativesdk-qemu-helper_1.0.bb              |  11 -
 meta/recipes-devtools/qemu/qemu-helper/raw2flash.c | 370 ---------------------
 2 files changed, 381 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-helper/raw2flash.c

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 63e5fd5..943ca5f 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "file://${COREBASE}/scripts/runqemu \
            file://${COREBASE}/scripts/runqemu-extract-sdk \
            file://${COREBASE}/scripts/runqemu-export-rootfs \
            file://tunctl.c \
-           file://raw2flash.c \
           "
 
 S = "${WORKDIR}"
@@ -28,8 +27,6 @@ inherit nativesdk
 
 do_compile() {
 	${CC} tunctl.c -o tunctl
-	${CC} raw2flash.c -o raw2flash.spitz
-	${CC} raw2flash.c -o flash2raw.spitz -Dflash2raw
 }
 
 do_install() {
@@ -37,12 +34,4 @@ do_install() {
 	install -m 0755 ${WORKDIR}${COREBASE}/scripts/oe-* ${D}${bindir}/
 	install -m 0755 ${WORKDIR}${COREBASE}/scripts/runqemu* ${D}${bindir}/
 	install tunctl ${D}${bindir}/
-	install raw2flash.spitz ${D}${bindir}/
-	install flash2raw.spitz ${D}${bindir}/
-	ln -fs raw2flash.spitz ${D}${bindir}/raw2flash.akita
-	ln -fs raw2flash.spitz ${D}${bindir}/raw2flash.borzoi
-	ln -fs raw2flash.spitz ${D}${bindir}/raw2flash.terrier
-	ln -fs flash2raw.spitz ${D}${bindir}/flash2raw.akita
-	ln -fs flash2raw.spitz ${D}${bindir}/flash2raw.borzoi
-	ln -fs flash2raw.spitz ${D}${bindir}/flash2raw.terrier
 }
diff --git a/meta/recipes-devtools/qemu/qemu-helper/raw2flash.c b/meta/recipes-devtools/qemu/qemu-helper/raw2flash.c
deleted file mode 100644
index 19faf62..0000000
--- a/meta/recipes-devtools/qemu/qemu-helper/raw2flash.c
+++ /dev/null
@@ -1,370 +0,0 @@
-/*
- * Copyright (c) 2006 OpenedHand Ltd.
- *
- * This file is licensed under GNU GPL v2.
- */
-#include <string.h>
-#include <unistd.h>
-#include <stdint.h>
-#include <stdio.h>
-#include <sys/types.h>
-#include <stdlib.h>
-
-#define TFR(_)		_
-#define VERBOSE
-#define PBAR_LEN	40
-
-#define PARTITION_START	0x00700000
-
-static const int ecc_pos8[] = {
-	0x0, 0x1, 0x2,
-};
-
-static const int ecc_pos16[] = {
-	0x0, 0x1, 0x2, 0x3, 0x6, 0x7,
-};
-
-static const int ecc_pos64[] = {
-	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
-	0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
-	0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
-};
-
-static const int ecc_akita[] = {
-	0x05, 0x01, 0x02, 0x03, 0x06, 0x07, 0x15, 0x11,
-	0x12, 0x13, 0x16, 0x17, 0x25, 0x21, 0x22, 0x23,
-	0x26, 0x27, 0x35, 0x31, 0x32, 0x33, 0x36, 0x37,
-};
-
-struct jffs_marker_s {
-	int pos;
-	uint8_t value;
-};
-
-static const struct jffs_marker_s free_pos8[] = {
-	{ 0x03, 0xff }, { 0x04, 0xff }, { 0x06, 0x85 }, { 0x07, 0x19 },
-	{ -1 },
-};
-
-static const struct jffs_marker_s free_pos16[] = {
-	{ 0x08, 0x85 }, { 0x09, 0x19 }, { 0x0a, 0x03 }, { 0x0b, 0x20 },
-	{ 0x0c, 0x08 }, { 0x0d, 0x00 }, { 0x0e, 0x00 }, { 0x0f, 0x00 },
-	{ -1 },
-};
-
-static const struct jffs_marker_s free_pos64[] = {
-	{ 0x02, 0xff }, { 0x03, 0xff }, { 0x04, 0xff }, { 0x05, 0xff },
-	{ 0x06, 0xff }, { 0x07, 0xff }, { 0x08, 0xff }, { 0x09, 0xff },
-	{ 0x0a, 0xff }, { 0x0b, 0xff }, { 0x0c, 0xff }, { 0x0d, 0xff },
-	{ 0x0e, 0xff }, { 0x0f, 0xff }, { 0x10, 0x85 }, { 0x11, 0x19 },
-	{ 0x12, 0x03 }, { 0x13, 0x20 }, { 0x14, 0x08 }, { 0x15, 0x00 },
-	{ 0x16, 0x00 }, { 0x17, 0x00 }, { 0x18, 0xff }, { 0x19, 0xff },
-	{ 0x1a, 0xff }, { 0x1b, 0xff }, { 0x1c, 0xff }, { 0x1d, 0xff },
-	{ 0x1e, 0xff }, { 0x1f, 0xff }, { 0x20, 0xff }, { 0x21, 0xff },
-	{ 0x22, 0xff }, { 0x23, 0xff }, { 0x24, 0xff }, { 0x25, 0xff },
-	{ 0x26, 0xff }, { 0x27, 0xff },
-	{ -1 },
-};
-
-static const struct jffs_marker_s free_akita[] = {
-	{ 0x08, 0x85 }, { 0x09, 0x19 }, { 0x0a, 0x03 }, { 0x0b, 0x20 },
-	{ 0x0c, 0x08 }, { 0x0d, 0x00 }, { 0x0e, 0x00 }, { 0x0f, 0x00 },
-	{ 0x10, 0xff },
-	{ -1 },
-};
-
-#define LEN(array)	(sizeof(array) / sizeof(*array))
-
-static const struct ecc_style_s {
-	int page_size;
-	int oob_size;
-	int eccbytes;
-	int eccsize;
-	const int *eccpos;
-	int romsize;
-	const struct jffs_marker_s *freepos;
-} spitz = {
-	0x200, 0x10, 0x100, LEN(ecc_pos16), ecc_pos16, 0x01000000, free_pos16
-}, akita = {
-	0x800, 0x40, 0x100, LEN(ecc_akita), ecc_akita, 0x08000000, free_akita
-}, borzoi = {
-	0x800, 0x40, 0x100, LEN(ecc_akita), ecc_akita, 0x08000000, free_akita
-}, terrier = {
-	0x800, 0x40, 0x100, LEN(ecc_akita), ecc_akita, 0x08000000, free_akita
-};
-
-struct ecc_state_s {
-	int count;
-	uint8_t cp;
-	uint8_t lp[2];
-	const struct ecc_style_s *style;
-};
-
-#ifndef flash2raw
-/*
- * Pre-calculated 256-way 1 byte column parity.  Table borrowed from Linux.
- */
-static const uint8_t ecc_precalc_table[] = {
-	0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a,
-	0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00,
-	0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f,
-	0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,
-	0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c,
-	0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,
-	0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59,
-	0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,
-	0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33,
-	0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,
-	0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56,
-	0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,
-	0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55,
-	0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,
-	0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30,
-	0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,
-	0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30,
-	0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,
-	0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55,
-	0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,
-	0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56,
-	0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,
-	0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33,
-	0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,
-	0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59,
-	0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,
-	0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c,
-	0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,
-	0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f,
-	0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,
-	0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a,
-	0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00,
-};
-
-/* Update ECC parity count */
-static inline uint8_t ecc_digest(struct ecc_state_s *s, uint8_t sample) {
-	uint8_t idx = ecc_precalc_table[sample];
-
-	s->cp ^= idx & 0x3f;
-	if (idx & 0x40) {
-		s->lp[0] ^= ~(s->count & 0xff);
-		s->lp[1] ^= s->count & 0xff;
-	}
-	s->count ++;
-
-	return sample;
-}
-
-static void buffer_digest(struct ecc_state_s *ecc,
-		const uint8_t *buf, uint8_t *out) {
-	int i, lp_a[2];
-
-	ecc->lp[0] = 0x00;
-	ecc->lp[1] = 0x00;
-	ecc->cp = 0x00;
-	ecc->count = 0;
-	for (i = 0; i < ecc->style->eccbytes; i ++)
-		ecc_digest(ecc, buf[i]);
-
-# define BSHR(byte, from, to)	((ecc->lp[byte] >> (from - to)) & (1 << to))
-	lp_a[0] =
-		BSHR(0, 4, 0) | BSHR(0, 5, 2) |
-		BSHR(0, 6, 4) | BSHR(0, 7, 6) |
-		BSHR(1, 4, 1) | BSHR(1, 5, 3) |
-		BSHR(1, 6, 5) | BSHR(1, 7, 7);
-
-# define BSHL(byte, from, to)	((ecc->lp[byte] << (to - from)) & (1 << to))
-	lp_a[1] =
-		BSHL(0, 0, 0) | BSHL(0, 1, 2) |
-		BSHL(0, 2, 4) | BSHL(0, 3, 6) |
-		BSHL(1, 0, 1) | BSHL(1, 1, 3) |
-		BSHL(1, 2, 5) | BSHL(1, 3, 7);
-
-	out[0] = ~lp_a[1];
-	out[1] = ~lp_a[0];
-	out[2] = (~ecc->cp << 2) | 0x03;
-}
-
-static void jffs2_format(const struct ecc_state_s *ecc, uint8_t oob[]) {
-	const struct jffs_marker_s *byte;
-	for (byte = ecc->style->freepos; byte->pos >= 0; byte ++)
-		oob[byte->pos] = byte->value;
-}
-
-static void buffer_fill(const struct ecc_state_s *ecc, uint8_t buffer[],
-		int *len, int *partition, int count, uint8_t jffs_buffer[]) {
-	int ret;
-
-	switch (*partition) {
-	case 0:
-		if (count < PARTITION_START) {
-			memcpy(buffer, jffs_buffer + count,
-					ecc->style->eccbytes);
-			*len = ecc->style->eccbytes;
-			break;
-		}
-		*partition = 1;
-	case 1:
-		if (count - PARTITION_START < PARTITION_START) {
-			memcpy(buffer, jffs_buffer + count - PARTITION_START,
-					ecc->style->eccbytes);
-			*len = ecc->style->eccbytes;
-			break;
-		}
-
-		while (*len < ecc->style->eccbytes) {
-			ret = TFR(read(0, buffer + *len, 0x800 - *len));
-			if (ret <= 0)
-				break;
-			*len += ret;
-		}
-
-		if (*len == 0)
-			*partition = 2;
-		else if (*len < ecc->style->eccbytes) {
-			fprintf(stderr, "\nWarning: %i stray bytes\n", *len);
-			memset(buffer + *len, 0xff,
-					ecc->style->eccbytes - *len);
-			*len = ecc->style->eccbytes;
-			break;
-		} else
-			break;
-	case 2:
-		memset(buffer, 0xff, ecc->style->eccbytes);
-		*len = ecc->style->eccbytes;
-		break;
-	}
-}
-
-int main(int argc, char *argv[], char *envp[]) {
-	struct ecc_state_s ecc;
-	uint8_t buffer[0x1000], ecc_payload[0x40], regs[3], *jffs;
-	int ret, len, eccbyte, count, partition;
-
-	/* Check if we're called by "raw2flash.spitz" or similar */
-	len = strlen(argv[0]);
-	if (!strcasecmp(argv[0] + len - 5, "akita"))
-		ecc.style = &akita;
-	else if (!strcasecmp(argv[0] + len - 6, "borzoi"))
-		ecc.style = &borzoi;
-	else if (!strcasecmp(argv[0] + len - 7, "terrier"))
-		ecc.style = &terrier;
-	else
-		ecc.style = &spitz;
-
-# ifdef VERBOSE
-	fprintf(stderr, "[");
-# endif
-
-	/* Skip first 10 bytes */
-	TFR(read(0, buffer, 0x10));
-
-	len = 0;
-	jffs = (uint8_t *) malloc(PARTITION_START);
-	while (len < PARTITION_START) {
-		ret = TFR(read(0, jffs + len, PARTITION_START - len));
-		if (ret <= 0)
-			break;
-		len += ret;
-	}
-
-	/* Convert data from stdin */
-	partition = len = eccbyte = count = 0;
-	memset(ecc_payload, 0xff, ecc.style->oob_size);
-	jffs2_format(&ecc, ecc_payload);
-	while (count < ecc.style->romsize) {
-		buffer_fill(&ecc, buffer, &len, &partition, count, jffs);
-		buffer_digest(&ecc, buffer, regs);
-
-		ecc_payload[ecc.style->eccpos[eccbyte ++]] = regs[0];
-		ecc_payload[ecc.style->eccpos[eccbyte ++]] = regs[1];
-		ecc_payload[ecc.style->eccpos[eccbyte ++]] = regs[2];
-
-		TFR(write(1, buffer, ecc.style->eccbytes));
-		count += ecc.style->eccbytes;
-		len -= ecc.style->eccbytes;
-		memmove(buffer, buffer + ecc.style->eccbytes, len);
-
-		if (eccbyte >= ecc.style->eccsize) {
-			TFR(write(1, ecc_payload, ecc.style->oob_size));
-			eccbyte = 0;
-			memset(ecc_payload, 0xff, ecc.style->oob_size);
-			if (partition < 2)
-				jffs2_format(&ecc, ecc_payload);
-		}
-
-# ifdef VERBOSE
-		if (count * PBAR_LEN / ecc.style->romsize >
-				(count - ecc.style->eccbytes) *
-				PBAR_LEN / ecc.style->romsize)
-			fprintf(stderr, "#");
-# endif
-	}
-
-# ifdef VERBOSE
-	fprintf(stderr, "]\n");
-# endif
-	free(jffs);
-	return 0;
-}
-#else
-int main(int argc, char *argv[], char *envp[]) {
-	struct ecc_state_s ecc;
-	uint8_t buffer[0x1000];
-	int ret, len, count;
-
-	/* Check if we're called by "flash2raw.spitz" or similar */
-	len = strlen(argv[0]);
-	if (!strcasecmp(argv[0] + len - 5, "akita"))
-		ecc.style = &akita;
-	else if (!strcasecmp(argv[0] + len - 6, "borzoi"))
-		ecc.style = &borzoi;
-	else if (!strcasecmp(argv[0] + len - 7, "terrier"))
-		ecc.style = &terrier;
-	else
-		ecc.style = &spitz;
-
-# ifdef VERBOSE
-	fprintf(stderr, "[");
-# endif
-
-	/* Convert data from stdin */
-	count = 0;
-	while (count < ecc.style->romsize) {
-		len = 0;
-		while (len < ecc.style->page_size) {
-			ret = TFR(read(0, buffer + len,
-						ecc.style->page_size - len));
-			if (ret <= 0)
-				break;
-			len += ret;
-		}
-		if (len == 0)
-			break;
-		if (len < ecc.style->page_size) {
-			fprintf(stderr, "\nWarning: %i stray bytes\n", len);
-		}
-
-		TFR(write(1, buffer, ecc.style->page_size));
-
-		count += len;
-		len = 0;
-		while (len < ecc.style->oob_size) {
-			ret = TFR(read(0, buffer, ecc.style->oob_size - len));
-			if (ret <= 0)
-				break;
-			len += ret;
-		}
-
-# ifdef VERBOSE
-		if (count * PBAR_LEN / ecc.style->romsize >
-				(count - ecc.style->page_size) *
-				PBAR_LEN / ecc.style->romsize)
-			fprintf(stderr, "#");
-# endif
-	}
-
-# ifdef VERBOSE
-	fprintf(stderr, "]\n");
-# endif
-	return 0;
-}
-#endif
-- 
2.5.5


