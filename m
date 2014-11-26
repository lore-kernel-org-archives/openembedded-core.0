Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A6ECB7210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:34 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so3141647pad.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/ehRaxdW7GyFKa85X8dNfrgOVfFLkBR9ambp+7KVrBQ=;
	b=P1scTzFTzY2TVfWw5/4bwzBrICbYGflxI938LryxusXgrDkN3iwJ5MdLYVWS3+HWz6
	iLwsBG5cZmniZ0kitxsL1YrCZE9m3BIPjWVIC6U1AKKcMNZBqj19HK182d8fqg/95hTr
	VK4G9sXDRxApLHtT1x3tqw2DD5Xsxjsqs++cZrLT7UYH0uiE8AJXTHjVDszKocbKt8tD
	n5K9Gphy21YRRbU98Ep+65ISCJnCSp5tPAhV9A8eRKWynCg+sdJntcQh5A1R7LQLT3Pm
	N2s+JSd9bRjjtF3b2qziJTKsdJKE5KF8doDiWyIzSvRpXvcOEvr7+U/Toa7AJlAqmikM
	gefg==
X-Received: by 10.70.10.195 with SMTP id k3mr54117634pdb.41.1417018955571;
	Wed, 26 Nov 2014 08:22:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:10 -0800
Message-Id: <327d3668184eaf78ddf0d205a517fa094218dfaf.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Subject: [PATCH 06/11] babeltrace: Backport fix for unaligned integer
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:34 -0000

From: Saul Wold <sgw@linux.intel.com>

[YOCTO #6464]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n-t-perform-unaligned-integer-read-writes.patch | 252 +++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch
new file mode 100644
index 0000000..ea0aad6
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch
@@ -0,0 +1,252 @@
+From 6a0b6cd5133db9e3c72914d4e5dd7fc792360934 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Wed, 16 Jul 2014 10:58:48 -0400
+Subject: [PATCH] Fix: don't perform unaligned integer read/writes
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+---
+ formats/ctf/types/integer.c | 108 ++++++++++++++++++++++++++++----------------
+ 1 file changed, 70 insertions(+), 38 deletions(-)
+
+diff --git a/formats/ctf/types/integer.c b/formats/ctf/types/integer.c
+index 189943e..85931be 100644
+--- a/formats/ctf/types/integer.c
++++ b/formats/ctf/types/integer.c
+@@ -62,7 +62,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			uint8_t v;
+ 
+-			v = *(const uint8_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._unsigned = v;
+ 			break;
+ 		}
+@@ -70,7 +70,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			uint16_t v;
+ 
+-			v = *(const uint16_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._unsigned =
+ 				rbo ? GUINT16_SWAP_LE_BE(v) : v;
+ 			break;
+@@ -79,7 +79,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			uint32_t v;
+ 
+-			v = *(const uint32_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._unsigned =
+ 				rbo ? GUINT32_SWAP_LE_BE(v) : v;
+ 			break;
+@@ -88,7 +88,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			uint64_t v;
+ 
+-			v = *(const uint64_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._unsigned =
+ 				rbo ? GUINT64_SWAP_LE_BE(v) : v;
+ 			break;
+@@ -102,7 +102,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			int8_t v;
+ 
+-			v = *(const int8_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._signed = v;
+ 			break;
+ 		}
+@@ -110,7 +110,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			int16_t v;
+ 
+-			v = *(const int16_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._signed =
+ 				rbo ? (int16_t) GUINT16_SWAP_LE_BE(v) : v;
+ 			break;
+@@ -119,7 +119,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			int32_t v;
+ 
+-			v = *(const int32_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._signed =
+ 				rbo ? (int32_t) GUINT32_SWAP_LE_BE(v) : v;
+ 			break;
+@@ -128,7 +128,7 @@ int _aligned_integer_read(struct bt_stream_pos *ppos,
+ 		{
+ 			int64_t v;
+ 
+-			v = *(const int64_t *) ctf_get_pos_addr(pos);
++			memcpy(&v, ctf_get_pos_addr(pos), sizeof(v));
+ 			integer_definition->value._signed =
+ 				rbo ? (int64_t) GUINT64_SWAP_LE_BE(v) : v;
+ 			break;
+@@ -163,48 +163,80 @@ int _aligned_integer_write(struct bt_stream_pos *ppos,
+ 	if (pos->dummy)
+ 		goto end;
+ 	if (!integer_declaration->signedness) {
+-		uint64_t v = integer_definition->value._unsigned;
+-
+ 		switch (integer_declaration->len) {
+-		case 8:	*(uint8_t *) ctf_get_pos_addr(pos) = (uint8_t) v;
++		case 8:
++		{
++			uint8_t v = integer_definition->value._unsigned;
++
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		case 16:
+-			*(uint16_t *) ctf_get_pos_addr(pos) = rbo ?
+-						 GUINT16_SWAP_LE_BE((uint16_t) v) :
+-						 (uint16_t) v;
++		{
++			uint16_t v = integer_definition->value._unsigned;
++
++			if (rbo)
++				v = GUINT16_SWAP_LE_BE(v);
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		case 32:
+-			*(uint32_t *) ctf_get_pos_addr(pos) = rbo ?
+-						 GUINT32_SWAP_LE_BE((uint32_t) v) :
+-						 (uint32_t) v;
++		{
++			uint32_t v = integer_definition->value._unsigned;
++
++			if (rbo)
++				v = GUINT32_SWAP_LE_BE(v);
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		case 64:
+-			*(uint64_t *) ctf_get_pos_addr(pos) = rbo ?
+-						 GUINT64_SWAP_LE_BE(v) : v;
++		{
++			uint64_t v = integer_definition->value._unsigned;
++
++			if (rbo)
++				v = GUINT64_SWAP_LE_BE(v);
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		default:
+ 			assert(0);
+ 		}
+ 	} else {
+-		int64_t v = integer_definition->value._signed;
+-
+ 		switch (integer_declaration->len) {
+-		case 8:	*(int8_t *) ctf_get_pos_addr(pos) = (int8_t) v;
++		case 8:
++		{
++			uint8_t v = integer_definition->value._signed;
++
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		case 16:
+-			*(int16_t *) ctf_get_pos_addr(pos) = rbo ?
+-						 (int16_t) GUINT16_SWAP_LE_BE((int16_t) v) :
+-						 (int16_t) v;
++		{
++			int16_t v = integer_definition->value._signed;
++
++			if (rbo)
++				v = GUINT16_SWAP_LE_BE(v);
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		case 32:
+-			*(int32_t *) ctf_get_pos_addr(pos) = rbo ?
+-						 (int32_t) GUINT32_SWAP_LE_BE((int32_t) v) :
+-						 (int32_t) v;
++		{
++			int32_t v = integer_definition->value._signed;
++
++			if (rbo)
++				v = GUINT32_SWAP_LE_BE(v);
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		case 64:
+-			*(int64_t *) ctf_get_pos_addr(pos) = rbo ?
+-						 GUINT64_SWAP_LE_BE(v) : v;
++		{
++			int64_t v = integer_definition->value._signed;
++
++			if (rbo)
++				v = GUINT64_SWAP_LE_BE(v);
++			memcpy(ctf_get_pos_addr(pos), &v, sizeof(v));
+ 			break;
++		}
+ 		default:
+ 			assert(0);
+ 		}
+@@ -237,23 +269,23 @@ int ctf_integer_read(struct bt_stream_pos *ppos, struct bt_definition *definitio
+ 	if (!integer_declaration->signedness) {
+ 		if (integer_declaration->byte_order == LITTLE_ENDIAN)
+ 			bt_bitfield_read_le(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				&integer_definition->value._unsigned);
+ 		else
+ 			bt_bitfield_read_be(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				&integer_definition->value._unsigned);
+ 	} else {
+ 		if (integer_declaration->byte_order == LITTLE_ENDIAN)
+ 			bt_bitfield_read_le(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				&integer_definition->value._signed);
+ 		else
+ 			bt_bitfield_read_be(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				&integer_definition->value._signed);
+ 	}
+@@ -286,23 +318,23 @@ int ctf_integer_write(struct bt_stream_pos *ppos, struct bt_definition *definiti
+ 	if (!integer_declaration->signedness) {
+ 		if (integer_declaration->byte_order == LITTLE_ENDIAN)
+ 			bt_bitfield_write_le(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				integer_definition->value._unsigned);
+ 		else
+ 			bt_bitfield_write_be(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				integer_definition->value._unsigned);
+ 	} else {
+ 		if (integer_declaration->byte_order == LITTLE_ENDIAN)
+ 			bt_bitfield_write_le(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				integer_definition->value._signed);
+ 		else
+ 			bt_bitfield_write_be(mmap_align_addr(pos->base_mma) +
+-					pos->mmap_base_offset, unsigned long,
++					pos->mmap_base_offset, unsigned char,
+ 				pos->offset, integer_declaration->len,
+ 				integer_definition->value._signed);
+ 	}
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
index dd9961c..1c41e25 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
@@ -16,6 +16,7 @@ PV = "1.2.1+git${SRCPV}"
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2 \
            file://0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch \
            file://Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch \
+           file://0001-Fix-don-t-perform-unaligned-integer-read-writes.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


