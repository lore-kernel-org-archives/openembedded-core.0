Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEB1CD98E2
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71816.1781274400612204407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s3M8okF9;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so801620f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274399; x=1781879199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0l2p8A6n1NaPggTuVk1CRG8TBotFpX1AApPCUUg8e8=;
        b=s3M8okF9cK53XDNM8rBeyLe5OtWF1j5IYg0/vI1EEZnfVpH4orb4LfN+VZmxNAjGdN
         LWE1xkqKC7/5JKwTXfYx+5Iqa7KUqNu/Uf2ycfW9AQAi2pr+GKxcNFKLtzQWVCq+OCDB
         UcV8ovQvWsV0pYkmqvtIpJldqBD973/aYyxUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274399; x=1781879199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0l2p8A6n1NaPggTuVk1CRG8TBotFpX1AApPCUUg8e8=;
        b=P27vAnnx4ePIA0Wh9dx8NyphCcz/0wKtxVNNkt0AvoI6r+bo3ZPw5aMC6HiizAtnRr
         Da2lPugshUSp27R9+UVK+wWd0f4repHclDPetVgGzb2N8+4oNYS+S2HVYAqxiygzUB6J
         3Bo358wDwcHo11hjafgqKyvFXP7jOKqqCISuu3e6yHziPPrN/wFkB/Cek2qF80D4TX68
         +zhV80K5p9Berv6oxTe2Lh+3mc4HW+1uu8DeCfQJnEkEGtQogQb2plbGc9fhMsQVsTGE
         1+IhrtkKq6yqzLHDAlRc3tutOjtaySsCfM92iu0ATYMnz3fRC2vgRGlm2wl6MPzh00Tv
         Z9Vw==
X-Gm-Message-State: AOJu0YyHXH7DhB5eUPG9mm8A2w0kl4FtopdxRmiBHiFGV1w1uknodGAv
	OcVjo0TEJB6sMkxdLey2pUDyurOWrKUS2kUeU9A1kQ0p/PFo8nBXwR7Tcx6SIkxJw5sMgUrVnjf
	Vykf7ow==
X-Gm-Gg: Acq92OFXgXNVGn8wqvJdw4vWip/erhVMQEkW9GeBxPDiejYraewErl1AnnG4Fc9yNgA
	0gGqtADu14xnTYXueX6hI4+oqNEo3NU0CHE5MypJajUwG/CVuAv9aefAP6AIEpIT7zYsbyZBSA1
	CU5gusKlGQqakBKpyPwtmrQxEYonEQqGArYqZrDXYLNJoUj4s54AzKNfcGv3AfwJ3KYHe1C3tZF
	/Y53iePqfbUJKMdy9DzLQFGryDDjLccBnFynVde1LaXlkLg7r51/WmnJsYsvTHesb+RyM4Jlwjs
	gn4cm0Dkk8/LklThBopPXvJ/SilLL+Az2Km1V3d4MBOI9vxa+vhXLvfil67yAtKPkAateigSDhm
	Z/W7TPgWomJharJTP1NZwtUPbW824ZJZ2bX8tlVF5TX5Q74NUJQyV9A1hIv6RnDoihgl/vBwD6d
	b856hKYVOBSRffPp1I/HnatWE=
X-Received: by 2002:a05:6000:2087:b0:452:6aaf:76cb with SMTP id ffacd0b85a97d-4606da57b8fmr4283795f8f.1.1781274398702;
        Fri, 12 Jun 2026 07:26:38 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:38 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 04/21] xz: Fix CVE-2026-34743
Date: Fri, 12 Jun 2026 16:25:54 +0200
Message-ID: <6c72dc8a05546ab625d6a853ca6eb58f980bf249.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238626

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as 5.4.x upstream backport of [2] mentioned in Debian report in [3].

[1] https://github.com/tukaani-project/xz/commit/8538443d08591693a8c61f3a03656650f39c7c32
[2] https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87
[3] https://security-tracker.debian.org/tracker/CVE-2026-34743

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 .../xz/xz/CVE-2026-34743.patch                | 68 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.4.7.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2026-34743.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2026-34743.patch b/meta/recipes-extended/xz/xz/CVE-2026-34743.patch
new file mode 100644
index 0000000000..f890851cb2
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2026-34743.patch
@@ -0,0 +1,68 @@
+From ae7abca7c721c73bb4aadf41a82a720a842a4364 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-34743
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/8538443d08591693a8c61f3a03656650f39c7c32]
+
+Reported-by: GitHub user christos-spearbit
+(cherry picked from commit c8c22869e780ff57c96b46939c3d79ff99395f87)
+(cherry picked from commit 8538443d08591693a8c61f3a03656650f39c7c32)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/liblzma/common/index.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
+index 8a35f439..dae7cab5 100644
+--- a/src/liblzma/common/index.c
++++ b/src/liblzma/common/index.c
+@@ -434,6 +434,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
+ 	if (records > PREALLOC_MAX)
+ 		records = PREALLOC_MAX;
+ 
++	// If index_decoder.c calls us with records == 0, it's decoding
++	// an Index that has no Records. In that case the decoder won't call
++	// lzma_index_append() at all, and i->prealloc isn't used during
++	// the Index decoding either.
++	//
++	// Normally the first lzma_index_append() call from the Index decoder
++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
++	// lzma_index_append() isn't called and the resetting of prealloc
++	// won't occur either. Thus, if records == 0, use the default value
++	// INDEX_GROUP_SIZE instead.
++	//
++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
++	// didn't have this check and could set i->prealloc = 0, which would
++	// result in a buffer overflow if the application called
++	// lzma_index_append() after decoding an empty Index. Appending
++	// Records after decoding an Index is a rare thing to do, but
++	// it is supposed to work.
++	if (records == 0)
++		records = INDEX_GROUP_SIZE;
++
+ 	i->prealloc = (size_t)(records);
+ 	return;
+ }
+@@ -686,6 +706,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
+ 		++g->last;
+ 	} else {
+ 		// We need to allocate a new group.
++		assert(i->prealloc > 0);
+ 		g = lzma_alloc(sizeof(index_group)
+ 				+ i->prealloc * sizeof(index_record),
+ 				allocator);
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/xz/xz_5.4.7.bb b/meta/recipes-extended/xz/xz_5.4.7.bb
index 30a4c8e88c..72759edea0 100644
--- a/meta/recipes-extended/xz/xz_5.4.7.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${P
            file://CVE-2025-31115-02.patch \
            file://CVE-2025-31115-03.patch \
            file://CVE-2025-31115-04.patch \
+           file://CVE-2026-34743.patch \
           "
 SRC_URI[sha256sum] = "8db6664c48ca07908b92baedcfe7f3ba23f49ef2476864518ab5db6723836e71"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.53.0


