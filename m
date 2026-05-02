Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D73CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9533.1777739498773606197
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gwDhvjhM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so26579885e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739497; x=1778344297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekpM4DcMsWInPnJ+baquAtzm2dYcImJz5MlUTJUcSqA=;
        b=gwDhvjhM3etGJuzKG4hKxcUF21QyuHCLVbG3Ekkn0FSNKdhsFC327dS4X3PuxwAWfp
         flMXpj1BR+bCA+bU/q3vs0TI2LWZG8CBZS4B99UK6UvInJzgyikupd6ICMxVpox1Fl+w
         9SrJE3EpLGtztTPjyPXLzOG4xSFCETzwSckVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739497; x=1778344297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ekpM4DcMsWInPnJ+baquAtzm2dYcImJz5MlUTJUcSqA=;
        b=hYG4gBLqWAxDV0SXaGxLh+8WTi4eHy9zk/zoyhiDrM4BsanaI/V/xgtYilSyQ/zT+V
         jgC8tH/5qjHy66tu8vRK/gGCn7wkdy7bO9odkA59B7G6Yzx4wFag1L9Ttx3K0DzFSqQI
         f6eeFxiFUbv0TfLWqMNQofRAs5CEOyCPlVNbBIXqEi0lEGxFNPwW+oDpfGELvxEtgOuA
         KKL8wje/U/dAHqzc0L6MWgiXynjSlmfBTU76PVWfWOTj95/cWJFAV0+tLwBoDqw+jHUX
         I9/84ajBlTl2JbAfkqsa/KyyhjPtmj+kt4dfQ9I5GD5n4LORzKzHwtbIfwQqlxkRnk7n
         jvLA==
X-Gm-Message-State: AOJu0YyK3zUFsawP+5j0vPdj4TIUp4pcEAciWizrRdL+5TvMFVS6hVSD
	0kscB+7mTrN+ID3e777p43dvPFtB58ICg7IhpW9KrYA2sWRMTUNWzQ94Ay2oLUbAls+31wLgKY1
	27Cx16nnSJ7UUNGfsEpCQ6nzwv0EkjytdrHNNMANCiAe7I+JJKLBiHCYID2j0fW6jXLPTurn0kf
	Rp8po+hhSr3eAoQ84=
X-Gm-Gg: AeBDiesaL4NJ4jFPWO0eR38zfCcrfW422dFkKiJft44kyjb6jWI9zwPNkSYywAg2E1E
	QWgDyZiW7pLstEI9RInosD0bJbAY0jYJivHt4arPLR8Yl62jsirEv402CuuppAl2N+cszbXTzGu
	bvIw8fkBjugiMQTNB9oV30HTBbmMLp08SD13lyfR/X6x9e52d3qd04QaphVVWzMrwpjo+YGikQO
	kXZ54T+C24uEzeavLWBW1q9Etx6+g5xjjqRXhy/zp97Alm1fiyP6/A3ikMC+Xj0O6UTU0pgUBA3
	0dmgaDYr07w4zXyndP7vOGwkwWeFgMpTsHLF/R6NkMFjckE5QXfu6pB18dl1c1v9nRJpJIw84q4
	ZWSB4JX7Mln8FTz1WoL2wJox52dYqkyGSaEWbMN8xhdRznXuTCEbW5wC5FzGaWkrvMyJWxMu5NM
	zfVAWId7r30fIr/+KgJaTXnKmDCfBsfZ85jMlJTevWWJHAMoo2D0KBCI2i8aUeiHY=
X-Received: by 2002:a05:600c:a404:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-48a9867710cmr45519455e9.28.1777739496709;
        Sat, 02 May 2026 09:31:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 62/62] xz: upgrade 5.8.2 -> 5.8.3
Date: Sat,  2 May 2026 17:29:22 +0100
Message-ID: <20260502162929.1377831-62-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236371

Drop backported patch

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...buffer-overflow-in-lzma_index_append.patch | 66 -------------------
 .../xz/{xz_5.8.2.bb => xz_5.8.3.bb}           |  5 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.3.bb} (94%)

diff --git a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch b/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
deleted file mode 100644
index d3918233eab..00000000000
--- a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
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
-Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/liblzma/common/index.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
-index 6add6a68..c4aadb9b 100644
---- a/src/liblzma/common/index.c
-+++ b/src/liblzma/common/index.c
-@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
- 	if (records > PREALLOC_MAX)
- 		records = PREALLOC_MAX;
- 
-+	// If index_decoder.c calls us with records == 0, it's decoding
-+	// an Index that has no Records. In that case the decoder won't call
-+	// lzma_index_append() at all, and i->prealloc isn't used during
-+	// the Index decoding either.
-+	//
-+	// Normally the first lzma_index_append() call from the Index decoder
-+	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
-+	// lzma_index_append() isn't called and the resetting of prealloc
-+	// won't occur either. Thus, if records == 0, use the default value
-+	// INDEX_GROUP_SIZE instead.
-+	//
-+	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
-+	// didn't have this check and could set i->prealloc = 0, which would
-+	// result in a buffer overflow if the application called
-+	// lzma_index_append() after decoding an empty Index. Appending
-+	// Records after decoding an Index is a rare thing to do, but
-+	// it is supposed to work.
-+	if (records == 0)
-+		records = INDEX_GROUP_SIZE;
-+
- 	i->prealloc = (size_t)(records);
- 	return;
- }
-@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
- 		++g->last;
- 	} else {
- 		// We need to allocate a new group.
-+		assert(i->prealloc > 0);
- 		g = lzma_alloc(sizeof(index_group)
- 				+ i->prealloc * sizeof(index_record),
- 				allocator);
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
similarity index 94%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.3.bb
index 15eaa7a52f8..74efe561c6b 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -26,10 +26,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
-           file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch \
            file://run-ptest \
-          "
-SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
+           "
+SRC_URI[sha256sum] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 

