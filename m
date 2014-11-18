Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 43F97718EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 00:18:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 17 Nov 2014 16:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,406,1413270000"; d="scan'208";a="638616757"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.72])
	by orsmga002.jf.intel.com with ESMTP; 17 Nov 2014 16:18:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 16:18:34 -0800
Message-Id: <1416269914-31204-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH][Dizzy Only] babeltrace: Backport fix for unaligned integer
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
X-List-Received-Date: Tue, 18 Nov 2014 00:18:49 -0000


[YOCTO #6464]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
This is addressed via a package update in master so this is Dizzy only

Sau!

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
1.8.3.1


