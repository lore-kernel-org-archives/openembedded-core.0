Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF82DEDEC63
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:31:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.13479.1694615460510401888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=21eEz//D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68fb7fb537dso3377745b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615459; x=1695220259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx5D9G+34ThfmWRWRyjBrw7rcTuzJqCr95uIqXauYhY=;
        b=21eEz//DGH1F7FNw+k+W13cRXFji4RJ5AfypGVX0tfwec62toQS0JI/Tt5q3klfc6V
         0E43v8hjbRwT3xSc4bLIQbsUmVYMCe8Lvid7h97/ABPiBtFR0usb4xTl5Xvfdi0pjdw/
         rqQfY7ABPsLDq0n8oqiUiCeCXtCsJkv9UYzgdp67fnfUgb/0C+HPsygnfDd55qGPMqiN
         Pq91qEWtA/R/GWgP989dKMRe3PqGh4EXQGSAV93R2fdIT+CP0LVqfCLzsPctxCxu0KAa
         0g+HRZgQj+3vNQUQfgvZsJS8kdEN6sDCEElnVdgchylDSG9QBzmYaQJ7sOgDITlh3C3E
         7hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615459; x=1695220259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lx5D9G+34ThfmWRWRyjBrw7rcTuzJqCr95uIqXauYhY=;
        b=LeFCGi2XQwEwSME6fYBfuz3ANQB0McLU2kasy67cTLRl/egha9gqivzuRxz1FBd3dp
         53D7XudIYocmBnQ2KR9QhWKYUmNgddD+nCzcyQgijxMlxAkXiyqPXdmJrHQ+BaAhRwGK
         fo3kgQUfpdqXcAKvX0Ff+mJDGGSR5w3x919cK+j8QoUc+GtYfC9cVz7bG97tnJuGJaQz
         hLPESVvgjS+xSbNwTPl5o1BGvcN/XRVw5lh88f1acfp/B2d4nHSQnM4AlDHGGp8/KOaw
         k8Od4KOyScLe6tAvdeQRAxr3p7T/+/jJQmFhHLLRZcMh+vFuQcHQaCzH9uVs5UKDbzZ9
         L2SQ==
X-Gm-Message-State: AOJu0YxVVVPlhYFyHDokqNTAsqz+6Z/2Cvr74KAtkbxk2HTO6hpBjaze
	4zpWqL4kEFUVk8taIvp3xJfNPzWWpdtBekbY8II=
X-Google-Smtp-Source: AGHT+IGZauNu7Uj4TMxb+jduKy1FQcr8HQSVOhLJ4Rq8lsiicJ8uQX/HI48nygT/b74TjNpySqg+CA==
X-Received: by 2002:a05:6a21:328c:b0:157:54fd:5c26 with SMTP id yt12-20020a056a21328c00b0015754fd5c26mr2908870pzb.38.1694615459263;
        Wed, 13 Sep 2023 07:30:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.30.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] flac: fix CVE-2020-22219
Date: Wed, 13 Sep 2023 04:30:37 -1000
Message-Id: <29c6287287c9f26c1d6f9fddf8d2852409bbbbec.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187600

From: Meenali Gupta <meenali.gupta@windriver.com>

Buffer Overflow vulnerability in function bitwriter_grow_ in flac before
1.4.0 allows remote attackers to run arbitrary code via crafted input to
the encoder.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../flac/files/CVE-2020-22219.patch           | 197 ++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.4.bb    |   1 +
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
diff --git a/meta/recipes-multimedia/flac/flac_1.3.4.bb b/meta/recipes-multimedia/flac/flac_1.3.4.bb
index 012da0a0a0..1a44718bba 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.4.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.4.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2020-22219.patch \
 "
 
 SRC_URI[sha256sum] = "8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737"
-- 
2.34.1


