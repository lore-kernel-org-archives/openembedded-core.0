Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D458F5A8AA
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:08:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1310.1776712075893373664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ojwisC1A;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5655E25DE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99A313F915
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776712075; bh=h2byWhp4LNsLvZon33ohA33bS+Efji/ajkucKC6TVpU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ojwisC1A8M5YKb63mkV0QAqTVir6eXFGmbu4rO+Ih5wHhctZO6FiAXKX0KJh8Hyni
	 QdXZDRFkKWLDDQR0hzY4mo6Gj4ryYzUFaQrDF/+oLVzh0ewMDB8AMHIchOnqijzVuN
	 bphjOMdCq/QQPsdyu100d6JGYoo3E7wptHc0ft/Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] xz: fix CVE-2026-34743
Date: Mon, 20 Apr 2026 20:07:48 +0100
Message-ID: <20260420190749.1280090-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420190749.1280090-1-ross.burton@arm.com>
References: <20260420190749.1280090-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 19:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235585

Backport a fix from upstream to resolve CVE-2026-34743:

  Prior to version 5.8.3, if lzma_index_decoder() was used to decode an
  Index that contained no Records, the resulting lzma_index was left in
  a state where where a subsequent lzma_index_append() would allocate
  too little memory, and a buffer overflow would occur.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...buffer-overflow-in-lzma_index_append.patch | 66 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.8.2.bb          |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer=
-overflow-in-lzma_index_append.patch

diff --git a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overfl=
ow-in-lzma_index_append.patch b/meta/recipes-extended/xz/xz/0001-liblzma-=
Fix-a-buffer-overflow-in-lzma_index_append.patch
new file mode 100644
index 00000000000..d3918233eab
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-l=
zma_index_append.patch
@@ -0,0 +1,66 @@
+From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Sun, 29 Mar 2026 19:11:21 +0300
+Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
+
+If lzma_index_decoder() was used to decode an Index that contained no
+Records, the resulting lzma_index had an invalid internal "prealloc"
+value. If lzma_index_append() was called on this lzma_index, too
+little memory would be allocated and a buffer overflow would occur.
+
+While this combination of the API functions is meant to work, in the
+real-world apps this call sequence is rare or might not exist at all.
+
+This bug is older than xz 5.0.0, so all stable releases are affected.
+
+Reported-by: GitHub user christos-spearbit
+
+CVE: CVE-2026-34743
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/=
c8c22869e780ff57c96b46939c3d79ff99395f87]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/liblzma/common/index.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
+index 6add6a68..c4aadb9b 100644
+--- a/src/liblzma/common/index.c
++++ b/src/liblzma/common/index.c
+@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records=
)
+ 	if (records > PREALLOC_MAX)
+ 		records =3D PREALLOC_MAX;
+=20
++	// If index_decoder.c calls us with records =3D=3D 0, it's decoding
++	// an Index that has no Records. In that case the decoder won't call
++	// lzma_index_append() at all, and i->prealloc isn't used during
++	// the Index decoding either.
++	//
++	// Normally the first lzma_index_append() call from the Index decoder
++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
++	// lzma_index_append() isn't called and the resetting of prealloc
++	// won't occur either. Thus, if records =3D=3D 0, use the default valu=
e
++	// INDEX_GROUP_SIZE instead.
++	//
++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <=3D 5.8=
.2
++	// didn't have this check and could set i->prealloc =3D 0, which would
++	// result in a buffer overflow if the application called
++	// lzma_index_append() after decoding an empty Index. Appending
++	// Records after decoding an Index is a rare thing to do, but
++	// it is supposed to work.
++	if (records =3D=3D 0)
++		records =3D INDEX_GROUP_SIZE;
++
+ 	i->prealloc =3D (size_t)(records);
+ 	return;
+ }
+@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocato=
r *allocator,
+ 		++g->last;
+ 	} else {
+ 		// We need to allocate a new group.
++		assert(i->prealloc > 0);
+ 		g =3D lzma_alloc(sizeof(index_group)
+ 				+ i->prealloc * sizeof(index_record),
+ 				allocator);
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended=
/xz/xz_5.8.2.bb
index 7ada44d9f58..15eaa7a52f8 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.2.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd38d562f6112=
174de93a9677682231b2 \
                     "
=20
 SRC_URI =3D "https://github.com/tukaani-project/xz/releases/download/v${=
PV}/xz-${PV}.tar.gz \
+           file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_appen=
d.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] =3D "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd0=
1f70f9e7ce58a8f1"
--=20
2.43.0


