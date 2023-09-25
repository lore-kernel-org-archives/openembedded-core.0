Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BA4CE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 14:01:12 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.62143.1695650464758144098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 07:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=In1J2XKN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C08B760008;
	Mon, 25 Sep 2023 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695650462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZK9ULFtRBr/ww+0NPiWMGuckLgmyrUQ8jMMp0aFQ1Cw=;
	b=In1J2XKNoqwYlqyM0pjLNaNfEuwefyYryoQzYpxABUNJUqHUQ/b6xHMVmr81+FOTvgXI5T
	ATtkDnOYIV2gAMw9HWTk3oWon9xAKOvb00EQcge9Zn+J/jaI4JRLNWuJ5gnr6Yvcl/7DQN
	xXjkBv5GJiXJaEQexs62mPel7j0x+tbUzYgPTFsOuZjWKUYvExaGDJzeudArpfItQDkgET
	4m08dZESgOiXJKuxej9QmtgiHxdE4KyDqY/8q1gW8LaFcDXt3bfDB0fvhIoe1Ebzf4UGQa
	hRYTb5s/Yh5IjXcIbb74lR4bdwrhnJZF7Gnh1hhZsd/QHxd9CLMd/EIc2rnZrA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Meenali Gupta <meenali.gupta@windriver.com>
Subject: [dunfell][PATCH v2] flac: fix CVE-2020-22219
Date: Mon, 25 Sep 2023 16:00:53 +0200
Message-Id: <20230925140053.15413-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAOSpxdZ2rP2EtWgaW9P9OFzQ0Z2SzLZBjYYq2buz4Q9n8n-qww@mail.gmail.com>
References: <CAOSpxdZ2rP2EtWgaW9P9OFzQ0Z2SzLZBjYYq2buz4Q9n8n-qww@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 14:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188191

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Buffer Overflow vulnerability in function bitwriter_grow_ in flac before
1.4.0 allows remote attackers to run arbitrary code via crafted input to
the encoder.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
Changes in V2:
- include the patch this time!
---
 .../flac/files/CVE-2020-22219.patch           | 197 ++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-multimedia/flac/files/CVE-2020-22219.patch

diff --git a/meta/recipes-multimedia/flac/files/CVE-2020-22219.patch b/meta/recipes-multimedia/flac/files/CVE-2020-22219.patch
new file mode 100644
index 0000000000..e042872dc0
--- /dev/null
+++ b/meta/recipes-multimedia/flac/files/CVE-2020-22219.patch
@@ -0,0 +1,197 @@
+From 579ff6922089cbbbd179619e40e622e279bd719f Mon Sep 17 00:00:00 2001
+From: Martijn van Beurden <mvanb1@gmail.com>
+Date: Wed, 3 Aug 2022 13:52:19 +0200
+Subject: [PATCH] flac: Add and use _nofree variants of safe_realloc functions
+
+Parts of the code use realloc like
+
+x = safe_realloc(x, somesize);
+
+when this is the case, the safe_realloc variant used must free the
+old memory block in case it fails, otherwise it will leak. However,
+there are also instances in the code where handling is different:
+
+if (0 == (x = safe_realloc(y, somesize)))
+    return false
+
+in this case, y should not be freed, as y is not set to NULL we
+could encounter double frees. Here the safe_realloc_nofree
+functions are used.
+
+Upstream-Status: Backport [https://github.com/xiph/flac/commit/21fe95ee828b0b9b944f6aa0bb02d24fbb981815]
+CVE: CVE-2020-22219
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ include/share/alloc.h         | 41 +++++++++++++++++++++++++++++++----
+ src/flac/encode.c             |  4 ++--
+ src/flac/foreign_metadata.c   |  2 +-
+ src/libFLAC/bitwriter.c       |  2 +-
+ src/libFLAC/metadata_object.c |  2 +-
+ src/plugin_common/tags.c      |  2 +-
+ src/share/utf8/iconvert.c     |  2 +-
+ 7 files changed, 44 insertions(+), 11 deletions(-)
+
+diff --git a/include/share/alloc.h b/include/share/alloc.h
+index 914de9b..55bdd1d 100644
+--- a/include/share/alloc.h
++++ b/include/share/alloc.h
+@@ -161,17 +161,30 @@ static inline void *safe_realloc_(void *ptr, size_t size)
+		free(oldptr);
+	return newptr;
+ }
+-static inline void *safe_realloc_add_2op_(void *ptr, size_t size1, size_t size2)
++static inline void *safe_realloc_nofree_add_2op_(void *ptr, size_t size1, size_t size2)
++{
++	size2 += size1;
++	if(size2 < size1)
++		return 0;
++	return realloc(ptr, size2);
++}
++
++static inline void *safe_realloc_add_3op_(void *ptr, size_t size1, size_t size2, size_t size3)
+ {
+	size2 += size1;
+	if(size2 < size1) {
+		free(ptr);
+		return 0;
+	}
+-	return realloc(ptr, size2);
++	size3 += size2;
++	if(size3 < size2) {
++		free(ptr);
++		return 0;
++	}
++	return safe_realloc_(ptr, size3);
+ }
+
+-static inline void *safe_realloc_add_3op_(void *ptr, size_t size1, size_t size2, size_t size3)
++static inline void *safe_realloc_nofree_add_3op_(void *ptr, size_t size1, size_t size2, size_t size3)
+ {
+	size2 += size1;
+	if(size2 < size1)
+@@ -182,7 +195,7 @@ static inline void *safe_realloc_add_3op_(void *ptr, size_t size1, size_t size2,
+	return realloc(ptr, size3);
+ }
+
+-static inline void *safe_realloc_add_4op_(void *ptr, size_t size1, size_t size2, size_t size3, size_t size4)
++static inline void *safe_realloc_nofree_add_4op_(void *ptr, size_t size1, size_t size2, size_t size3, size_t size4)
+ {
+	size2 += size1;
+	if(size2 < size1)
+@@ -205,6 +218,15 @@ static inline void *safe_realloc_mul_2op_(void *ptr, size_t size1, size_t size2)
+	return safe_realloc_(ptr, size1*size2);
+ }
+
++static inline void *safe_realloc_nofree_mul_2op_(void *ptr, size_t size1, size_t size2)
++{
++	if(!size1 || !size2)
++		return realloc(ptr, 0); /* preserve POSIX realloc(ptr, 0) semantics */
++	if(size1 > SIZE_MAX / size2)
++		return 0;
++	return realloc(ptr, size1*size2);
++}
++
+ /* size1 * (size2 + size3) */
+ static inline void *safe_realloc_muladd2_(void *ptr, size_t size1, size_t size2, size_t size3)
+ {
+@@ -216,4 +238,15 @@ static inline void *safe_realloc_muladd2_(void *ptr, size_t size1, size_t size2,
+	return safe_realloc_mul_2op_(ptr, size1, size2);
+ }
+
++/* size1 * (size2 + size3) */
++static inline void *safe_realloc_nofree_muladd2_(void *ptr, size_t size1, size_t size2, size_t size3)
++{
++	if(!size1 || (!size2 && !size3))
++		return realloc(ptr, 0); /* preserve POSIX realloc(ptr, 0) semantics */
++	size2 += size3;
++	if(size2 < size3)
++		return 0;
++	return safe_realloc_nofree_mul_2op_(ptr, size1, size2);
++}
++
+ #endif
+diff --git a/src/flac/encode.c b/src/flac/encode.c
+index a9b907f..f87250c 100644
+--- a/src/flac/encode.c
++++ b/src/flac/encode.c
+@@ -1743,10 +1743,10 @@ static void static_metadata_clear(static_metadata_t *m)
+ static FLAC__bool static_metadata_append(static_metadata_t *m, FLAC__StreamMetadata *d, FLAC__bool needs_delete)
+ {
+	void *x;
+-	if(0 == (x = safe_realloc_muladd2_(m->metadata, sizeof(*m->metadata), /*times (*/m->num_metadata, /*+*/1/*)*/)))
++	if(0 == (x = safe_realloc_nofree_muladd2_(m->metadata, sizeof(*m->metadata), /*times (*/m->num_metadata, /*+*/1/*)*/)))
+		return false;
+	m->metadata = (FLAC__StreamMetadata**)x;
+-	if(0 == (x = safe_realloc_muladd2_(m->needs_delete, sizeof(*m->needs_delete), /*times (*/m->num_metadata, /*+*/1/*)*/)))
++	if(0 == (x = safe_realloc_nofree_muladd2_(m->needs_delete, sizeof(*m->needs_delete), /*times (*/m->num_metadata, /*+*/1/*)*/)))
+		return false;
+	m->needs_delete = (FLAC__bool*)x;
+	m->metadata[m->num_metadata] = d;
+diff --git a/src/flac/foreign_metadata.c b/src/flac/foreign_metadata.c
+index 9ad9c18..fdfb3cf 100644
+--- a/src/flac/foreign_metadata.c
++++ b/src/flac/foreign_metadata.c
+@@ -75,7 +75,7 @@ static FLAC__bool copy_data_(FILE *fin, FILE *fout, size_t size, const char **er
+
+ static FLAC__bool append_block_(foreign_metadata_t *fm, FLAC__off_t offset, FLAC__uint32 size, const char **error)
+ {
+-	foreign_block_t *fb = safe_realloc_muladd2_(fm->blocks, sizeof(foreign_block_t), /*times (*/fm->num_blocks, /*+*/1/*)*/);
++	foreign_block_t *fb = safe_realloc_nofree_muladd2_(fm->blocks, sizeof(foreign_block_t), /*times (*/fm->num_blocks, /*+*/1/*)*/);
+	if(fb) {
+		fb[fm->num_blocks].offset = offset;
+		fb[fm->num_blocks].size = size;
+diff --git a/src/libFLAC/bitwriter.c b/src/libFLAC/bitwriter.c
+index 6e86585..a510b0d 100644
+--- a/src/libFLAC/bitwriter.c
++++ b/src/libFLAC/bitwriter.c
+@@ -124,7 +124,7 @@ FLAC__bool bitwriter_grow_(FLAC__BitWriter *bw, uint32_t bits_to_add)
+	FLAC__ASSERT(new_capacity > bw->capacity);
+	FLAC__ASSERT(new_capacity >= bw->words + ((bw->bits + bits_to_add + FLAC__BITS_PER_WORD - 1) / FLAC__BITS_PER_WORD));
+
+-	new_buffer = safe_realloc_mul_2op_(bw->buffer, sizeof(bwword), /*times*/new_capacity);
++	new_buffer = safe_realloc_nofree_mul_2op_(bw->buffer, sizeof(bwword), /*times*/new_capacity);
+	if(new_buffer == 0)
+		return false;
+	bw->buffer = new_buffer;
+diff --git a/src/libFLAC/metadata_object.c b/src/libFLAC/metadata_object.c
+index de8e513..aef65be 100644
+--- a/src/libFLAC/metadata_object.c
++++ b/src/libFLAC/metadata_object.c
+@@ -98,7 +98,7 @@ static FLAC__bool free_copy_bytes_(FLAC__byte **to, const FLAC__byte *from, uint
+ /* realloc() failure leaves entry unchanged */
+ static FLAC__bool ensure_null_terminated_(FLAC__byte **entry, uint32_t length)
+ {
+-	FLAC__byte *x = safe_realloc_add_2op_(*entry, length, /*+*/1);
++	FLAC__byte *x = safe_realloc_nofree_add_2op_(*entry, length, /*+*/1);
+	if (x != NULL) {
+		x[length] = '\0';
+		*entry = x;
+diff --git a/src/plugin_common/tags.c b/src/plugin_common/tags.c
+index ae440c5..dfa10d3 100644
+--- a/src/plugin_common/tags.c
++++ b/src/plugin_common/tags.c
+@@ -317,7 +317,7 @@ FLAC__bool FLAC_plugin__tags_add_tag_utf8(FLAC__StreamMetadata *tags, const char
+		const size_t value_len = strlen(value);
+		const size_t separator_len = strlen(separator);
+		FLAC__byte *new_entry;
+-		if(0 == (new_entry = safe_realloc_add_4op_(entry->entry, entry->length, /*+*/value_len, /*+*/separator_len, /*+*/1)))
++		if(0 == (new_entry = safe_realloc_nofree_add_4op_(entry->entry, entry->length, /*+*/value_len, /*+*/separator_len, /*+*/1)))
+			return false;
+		memcpy(new_entry+entry->length, separator, separator_len);
+		entry->length += separator_len;
+diff --git a/src/share/utf8/iconvert.c b/src/share/utf8/iconvert.c
+index 8ab53c1..876c06e 100644
+--- a/src/share/utf8/iconvert.c
++++ b/src/share/utf8/iconvert.c
+@@ -149,7 +149,7 @@ int iconvert(const char *fromcode, const char *tocode,
+       iconv_close(cd1);
+       return ret;
+     }
+-    newbuf = safe_realloc_add_2op_(utfbuf, (ob - utfbuf), /*+*/1);
++    newbuf = safe_realloc_nofree_add_2op_(utfbuf, (ob - utfbuf), /*+*/1);
+     if (!newbuf)
+       goto fail;
+     ob = (ob - utfbuf) + newbuf;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index cb6692aedf..ca04f36d1a 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2020-22219.patch \
 "
 
 SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
-- 
2.34.1


