Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188CBFF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:09:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.251.1778004575191669994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 11:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FB4540C85
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 18:09:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkNXah5qldHb
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2026 18:09:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 64743407E5
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 18:09:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0E14217D372;
	Tue,  5 May 2026 14:09:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] xz: upgrade 5.8.2 -> 5.8.3
Date: Tue,  5 May 2026 14:09:33 -0400
Message-Id: <20260505180933.938257-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 18:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236523

Remove previously backported patch.

Release notes:
https://github.com/tukaani-project/xz/releases/tag/v5.8.3

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...buffer-overflow-in-lzma_index_append.patch | 66 -------------------
 .../xz/{xz_5.8.2.bb =3D> xz_5.8.3.bb}           |  3 +-
 2 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer=
-overflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb =3D> xz_5.8.3.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overfl=
ow-in-lzma_index_append.patch b/meta/recipes-extended/xz/xz/0001-liblzma-=
Fix-a-buffer-overflow-in-lzma_index_append.patch
deleted file mode 100644
index d3918233ea..0000000000
--- a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-l=
zma_index_append.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
-From: Lasse Collin <lasse.collin@tukaani.org>
-Date: Sun, 29 Mar 2026 19:11:21 +0300
-Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
-
-If lzma_index_decoder() was used to decode an Index that contained no
-Records, the resulting lzma_index had an invalid internal "prealloc"
-value. If lzma_index_append() was called on this lzma_index, too
-little memory would be allocated and a buffer overflow would occur.
-
-While this combination of the API functions is meant to work, in the
-real-world apps this call sequence is rare or might not exist at all.
-
-This bug is older than xz 5.0.0, so all stable releases are affected.
-
-Reported-by: GitHub user christos-spearbit
-
-CVE: CVE-2026-34743
-Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/=
c8c22869e780ff57c96b46939c3d79ff99395f87]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/liblzma/common/index.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
-index 6add6a68..c4aadb9b 100644
---- a/src/liblzma/common/index.c
-+++ b/src/liblzma/common/index.c
-@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records=
)
- 	if (records > PREALLOC_MAX)
- 		records =3D PREALLOC_MAX;
-=20
-+	// If index_decoder.c calls us with records =3D=3D 0, it's decoding
-+	// an Index that has no Records. In that case the decoder won't call
-+	// lzma_index_append() at all, and i->prealloc isn't used during
-+	// the Index decoding either.
-+	//
-+	// Normally the first lzma_index_append() call from the Index decoder
-+	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
-+	// lzma_index_append() isn't called and the resetting of prealloc
-+	// won't occur either. Thus, if records =3D=3D 0, use the default valu=
e
-+	// INDEX_GROUP_SIZE instead.
-+	//
-+	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <=3D 5.8=
.2
-+	// didn't have this check and could set i->prealloc =3D 0, which would
-+	// result in a buffer overflow if the application called
-+	// lzma_index_append() after decoding an empty Index. Appending
-+	// Records after decoding an Index is a rare thing to do, but
-+	// it is supposed to work.
-+	if (records =3D=3D 0)
-+		records =3D INDEX_GROUP_SIZE;
-+
- 	i->prealloc =3D (size_t)(records);
- 	return;
- }
-@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocato=
r *allocator,
- 		++g->last;
- 	} else {
- 		// We need to allocate a new group.
-+		assert(i->prealloc > 0);
- 		g =3D lzma_alloc(sizeof(index_group)
- 				+ i->prealloc * sizeof(index_record),
- 				allocator);
---=20
-2.43.0
-
diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended=
/xz/xz_5.8.3.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.3.bb
index 15eaa7a52f..94f3cfaa72 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -26,10 +26,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd38d562f611=
2174de93a9677682231b2 \
                     "
=20
 SRC_URI =3D "https://github.com/tukaani-project/xz/releases/download/v${=
PV}/xz-${PV}.tar.gz \
-           file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_appen=
d.patch \
            file://run-ptest \
           "
-SRC_URI[sha256sum] =3D "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd0=
1f70f9e7ce58a8f1"
+SRC_URI[sha256sum] =3D "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815ee=
c381c3d546b974a0"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI =3D "https://github.com/tukaani-project/xz/releases/"
=20
--=20
2.25.1


