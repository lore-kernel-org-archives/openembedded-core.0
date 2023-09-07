Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285EDEC874B
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:01:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20245.1694109680789479193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 11:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mkDrskJ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76143b9adb=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387EfguZ023346
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 11:01:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=MM0X6
	8rasC7voOxPcEifmqjdPPqZHByjMCod6tj2lQM=; b=mkDrskJ5vSO14Flxy5jcj
	Uei6AgddUwHiuMq2VWabfM+J8mEopuCleijD80tcdEzcfFBVS4Uwg8lKP6pueTfO
	MR3m/5C5Hgg55o+kW7BBwXJyCW0qBONYfj6KtuwjnOCkyUWyOHQ8MbSzd9x6phvR
	E/jU52XeZ1Bmo1GkdE+w/O55SFQztsnGR6vJ6zI9wNHWtTnaNc5f4nQYJl2Tyofz
	sak/oZ9U9sPo6/BflBfNUSPsgAIrSRWjbR5um/niWnwesvFz+lv+yHZu6ZO7XwUR
	GO3rsiDAE7WZ4T7aIi1kYwqKm493Wtd9wv+S1KKNiExSWIOxAW77uHGNsyiuEfwa
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b04rr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:01:20 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 11:01:16 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] flac: fix CVE-2020-22219
Date: Thu, 7 Sep 2023 18:00:56 +0000
Message-ID: <20230907180056.183789-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: qyFYF82bdYGJrb7KwpOOj30KiPCPJIuZ
X-Proofpoint-GUID: qyFYF82bdYGJrb7KwpOOj30KiPCPJIuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 18:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187393

Buffer Overflow vulnerability in function bitwriter_grow_ in flac before
1.4.0 allows remote attackers to run arbitrary code via crafted input to
the encoder.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
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
2.40.0


