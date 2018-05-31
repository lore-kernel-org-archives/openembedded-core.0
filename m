Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 80DC774E88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 06:15:54 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w4V6FtKe025722
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:15:55 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w4V6Ftiq014650;
	Thu, 31 May 2018 08:15:55 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B85BA9550DC;
	Thu, 31 May 2018 08:15:54 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 08:15:51 +0200
Message-Id: <20180531061551.10780-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530144852.25539-1-andrej.valek@siemens.com>
References: <20180530144852.25539-1-andrej.valek@siemens.com>
Subject: [PATCH v2] busybox: Fix zlma segfaults
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
X-List-Received-Date: Thu, 31 May 2018 06:15:56 -0000

- fix multiple lzma segmentation faults
- patch includes multiple fixing commits
- test-cases have been removed due to binary data

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../busybox/busybox-fix-unlzma-segfaults.patch     | 106 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb        |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch b/meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch
new file mode 100644
index 0000000000..5215da74a5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch
@@ -0,0 +1,106 @@
+busybox-1.27.2: Fix zlma segfaults
+
+[No upstream tracking] -- https://bugs.busybox.net/show_bug.cgi?id=10871
+
+libarchive: check buffer index in lzma_decompress
+
+With specific defconfig busybox fails to check zip fileheader magic
+(archival/unzip.c) and uses (archival/libarchive/decompress_unlzma.c)
+for decompression which leads to segmentation fault. It prevents accessing into
+buffer, which is smaller than pos index. Patch includes multiple segmentation
+fault fixes.
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=a36986bb80289c1cd8d15a557e49207c9a42946b]
+bug: 10436 10871
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchive/decompress_unlzma.c
+index a904087..29eee2a 100644
+--- a/archival/libarchive/decompress_unlzma.c
++++ b/archival/libarchive/decompress_unlzma.c
+@@ -11,6 +11,14 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
++
++#if 0
++# define dbg(...) bb_error_msg(__VA_ARGS__)
++#else
++# define dbg(...) ((void)0)
++#endif
++
++
+ #if ENABLE_FEATURE_LZMA_FAST
+ #  define speed_inline ALWAYS_INLINE
+ #  define size_inline
+@@ -217,6 +225,7 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 	rc_t *rc;
+ 	int i;
+ 	uint8_t *buffer;
++	uint32_t buffer_size;
+ 	uint8_t previous_byte = 0;
+ 	size_t buffer_pos = 0, global_pos = 0;
+ 	int len = 0;
+@@ -246,7 +255,8 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 	if (header.dict_size == 0)
+ 		header.dict_size++;
+ 
+-	buffer = xmalloc(MIN(header.dst_size, header.dict_size));
++	buffer_size = MIN(header.dst_size, header.dict_size);
++	buffer = xmalloc(buffer_size);
+ 
+ 	{
+ 		int num_probs;
+@@ -341,8 +351,12 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 						state = state < LZMA_NUM_LIT_STATES ? 9 : 11;
+ 
+ 						pos = buffer_pos - rep0;
+-						if ((int32_t)pos < 0)
++						if ((int32_t)pos < 0) {
+ 							pos += header.dict_size;
++							/* see unzip_bad_lzma_2.zip: */
++							if (pos >= buffer_size)
++								goto bad;
++						}
+ 						previous_byte = buffer[pos];
+ 						goto one_byte1;
+ #else
+@@ -417,6 +431,10 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 						for (; num_bits2 != LZMA_NUM_ALIGN_BITS; num_bits2--)
+ 							rep0 = (rep0 << 1) | rc_direct_bit(rc);
+ 						rep0 <<= LZMA_NUM_ALIGN_BITS;
++						if ((int32_t)rep0 < 0) {
++							dbg("%d rep0:%d", __LINE__, rep0);
++							goto bad;
++						}
+ 						prob3 = p + LZMA_ALIGN;
+ 					}
+ 					i2 = 1;
+@@ -450,8 +468,12 @@ unpack_lzma_stream(transformer_state_t *xstate)
+  IF_NOT_FEATURE_LZMA_FAST(string:)
+ 			do {
+ 				uint32_t pos = buffer_pos - rep0;
+-				if ((int32_t)pos < 0)
++				if ((int32_t)pos < 0) {
+ 					pos += header.dict_size;
++					/* more stringent test (see unzip_bad_lzma_1.zip): */
++					if (pos >= buffer_size)
++						goto bad;
++				}
+ 				previous_byte = buffer[pos];
+  IF_NOT_FEATURE_LZMA_FAST(one_byte2:)
+ 				buffer[buffer_pos++] = previous_byte;
+@@ -478,6 +500,12 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 		IF_DESKTOP(total_written += buffer_pos;)
+ 		if (transformer_write(xstate, buffer, buffer_pos) != (ssize_t)buffer_pos) {
+  bad:
++			/* One of our users, bbunpack(), expects _us_ to emit
++			 * the error message (since it's the best place to give
++			 * potentially more detailed information).
++			 * Do not fail silently.
++			 */
++			bb_error_msg("corrupted data");
+ 			total_written = -1; /* failure */
+ 		}
+ 		rc_free(rc);
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 36a6342aaf..9f0393505a 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2011-5325.patch \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
+           file://busybox-fix-unlzma-segfaults.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.11.0


