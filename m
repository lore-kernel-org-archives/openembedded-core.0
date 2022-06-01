Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B7AC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 05:34:13 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.4044.1654061648322665089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 22:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JYCti/bx;
 spf=pass (domain: mvista.com, ip: 209.85.216.48,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so1011563pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 22:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCzpOfqz6SHXI4L15gocPbex29TfxuiTuquB5uPZNS0=;
        b=JYCti/bxyeZuQXHavqklb9u2KuC5cSJPbvVhfdNCFUN7XUrMyBtIMLtls/w9+TB4ru
         hnEI1KP0oDljyG/UL/qbaDS5MU0dzXhjogLKyl1Ea6iJwzecvsb464csCgcRherhmh++
         UJcEONAzbUXc/cmOeDiuApZobSEYMxiUnQMbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCzpOfqz6SHXI4L15gocPbex29TfxuiTuquB5uPZNS0=;
        b=DsqBSs3ZvXDzZTKEPBf00r54kGxQ9KCwYz84cqeLBl5todI2vFON+NuHVlXYr1xTkY
         Z8LH3xZmy7bjeB4f9r1JkyTphWk3Sp3+QeEvLZhEUyTUN92HAFfUK4m1E82UXLbCgdWx
         gRCL429ZheHJ/prgxw4nTWj82bUlMZZiQLlCwBeVw2azrX5mWjcBsezovYjO4tJ+JTy0
         a2BSOWSMW1sfnVI59/And6exsV9NkYFXKTMbGAJdB30rDXfj/EpnIak/mBC4ilTXwbrr
         NZCCU/0mplKeX1f6vYET72EpOc6IAPXVV1gjS+ZZZoepJo8yU1t9f/kj1JkiLson6aKq
         TOOA==
X-Gm-Message-State: AOAM53308IM2Uc1572FvwJK+GJR3Bs+7iKhFntk4RLeJpEAFHuH/IuUj
	ByhqiZSeag6YGPWKvFuJFMK3AmkRny/vT2lt
X-Google-Smtp-Source: 
 ABdhPJxG9BI5Cx/itMLAH7tIlAq2WRG4XGp4l47KxUYf3QpNHXBpUsSQMQLjiOM65B1UZWlgXhoBVw==
X-Received: by 2002:a17:903:189:b0:163:6c22:8c9b with SMTP id
 z9-20020a170903018900b001636c228c9bmr32709196plg.95.1654061647589;
        Tue, 31 May 2022 22:34:07 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.240])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a170902f39100b00163fd24ca8csm493994ple.119.2022.05.31.22.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 22:34:07 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 01 Jun 2022 11:04:02 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] e2fsprogs: CVE-2022-1304 out-of-bounds read/write
 via crafted filesystem
Date: Wed,  1 Jun 2022 11:04:01 +0530
Message-Id: <20220601053401.8651-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 05:34:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166351

Source: https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git
MR: 117430
Type: Security Fix
Disposition: Backport from https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76
ChangeID: e6db00c6e8375a2e869fd2e4ead61ca9149eb8fa
Description:
          CVE-2022-1304 e2fsprogs: out-of-bounds read/write via crafted filesystem.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../e2fsprogs/e2fsprogs/CVE-2022-1304.patch   | 60 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
new file mode 100644
index 0000000000..74737abda7
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
@@ -0,0 +1,60 @@
+From a66071ed6a0d1fa666d22dcb78fa6fcb3bf22df3 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 27 May 2022 14:01:50 +0530
+Subject: [PATCH] CVE-2022-1304
+
+Upstream-Status: Backport from https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76
+
+libext2fs: add sanity check to extent manipulation
+It is possible to have a corrupted extent tree in such a way that a leaf
+node contains zero extents in it. Currently if that happens and we try
+to traverse the tree we can end up accessing wrong data, or possibly
+even uninitialized memory. Make sure we don't do that.
+
+Additionally make sure that we have a sane number of bytes passed to
+memmove() in ext2fs_extent_delete().
+
+Note that e2fsck is currently unable to spot and fix such corruption in
+pass1.
+
+Signed-off-by: Lukas Czerner <lczerner@redhat.com>
+Reported-by: Nils Bars <nils_bars@t-online.de>
+Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
+Addresses: CVE-2022-1304
+Addresses-Debian-Bug: #1010263
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/ext2fs/extent.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
+index ac3dbfec9..a1b1905cd 100644
+--- a/lib/ext2fs/extent.c
++++ b/lib/ext2fs/extent.c
+@@ -495,6 +495,10 @@ retry:
+ 			ext2fs_le16_to_cpu(eh->eh_entries);
+ 		newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
+ 
++		/* Make sure there is at least one extent present */
++		if (newpath->left <= 0)
++			return EXT2_ET_EXTENT_NO_DOWN;
++
+ 		if (path->left > 0) {
+ 			ix++;
+ 			newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
+@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
+ 
+ 	cp = path->curr;
+ 
++	/* Sanity check before memmove() */
++	if (path->left < 0)
++		return EXT2_ET_EXTENT_LEAF_BAD;
++
+ 	if (path->left) {
+ 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
+ 			path->left * sizeof(struct ext3_extent_idx));
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
index 3bc530e02b..3e6faf4cb8 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://mkdir_p.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
+           file://CVE-2022-1304.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.25.1


