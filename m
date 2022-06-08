Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F840CCA47F
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.7377.1654699626723584240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EwJzqqxd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id f9so7366441plg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ucxOTDh8wKkzHwYS/ZuQdFx1I6eukvBs5YC/4CCSkCg=;
        b=EwJzqqxdDfibEmhhVgkn2y+6vUGIfdqGTffTYibxOgEaV7QpFoeFlgQXYrRxsYSH77
         X7oUot2/rINW4igxBzGZtzvCSdWHVX1DXSAJnRHTZZPDL1PR/JFRSb9gENF0mRmMWa30
         zsYeWL1GeW6OJfGYHXFXiOCJEhayTQCwyboLupjIfFhB3RwasFXSngIEs+125plXBOp8
         ax4ER3CpXN04HCeHw0KaIms6H3trTq8V7Mxl3Cjf2Z/RSRy3/vG7q71CYWu24GqZ2Bor
         FVxIUYVpTlivHCTGsmZDZL/NK73rYtAZlu/ZxQsh5J95oqxaUWPt+U/OgWyJd1EgMZp3
         +nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ucxOTDh8wKkzHwYS/ZuQdFx1I6eukvBs5YC/4CCSkCg=;
        b=olzq/vTG6gcM77ec3w0661UaalxygDHS/b33/FyC3g0CGYdy/gAOsIAcdp1LHulHyl
         uDTfWmuQj1adCCCl2fzwygs+SESZDRX9gyUW9jVo3CtVJgu1SvUVv46AL7bv99Aplwa/
         MQKQElbYYmMEI41Olr1IZLzReFibnMf2+6/Lw506qHka8wpsgPecX17u2di2baWwe8Rd
         TzBIUedUGMsAiNdCwOvH4OzQh7q32kcfUGaMsGFBmIfgkn+uc2T5X+mRWEQdmSFiPgWs
         wTvI8l3s3Yg1tZrEkLNGwonmA9cTOEXu3c6BFb3n2ZUFr5uqcrWVapPFa9vJGjJfclgC
         lwyg==
X-Gm-Message-State: AOAM532HJi46doLKfzH8dYPDqP2e0mJ4A7MsDHWbjv4w+Cq53tQYERrk
	2s+nMExTelmVvUJKjp5sfB4Bl3h/GHTqSDxO
X-Google-Smtp-Source: 
 ABdhPJwJduGCnNIiFwj9qQLY/MxCMZmedea5kpU7VEAh8d/KxNRYYQ8xdSmNSFnf2DN4glfieyBalw==
X-Received: by 2002:a17:903:1104:b0:168:98a5:4ec6 with SMTP id
 n4-20020a170903110400b0016898a54ec6mr2777729plh.162.1654699625643;
        Wed, 08 Jun 2022 07:47:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] e2fsprogs: CVE-2022-1304 out-of-bounds
 read/write via crafted filesystem
Date: Wed,  8 Jun 2022 04:46:28 -1000
Message-Id: 
 <b4f9ba859ed1fe5e1d42258fee1dd2e8e85e7eba.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166739

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git
MR: 117430
Type: Security Fix
Disposition: Backport from https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76
ChangeID: e6db00c6e8375a2e869fd2e4ead61ca9149eb8fa
Description:
          CVE-2022-1304 e2fsprogs: out-of-bounds read/write via crafted filesystem.
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../e2fsprogs/e2fsprogs/CVE-2022-1304.patch   | 42 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
new file mode 100644
index 0000000000..34e2567b25
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
@@ -0,0 +1,42 @@
+From a66071ed6a0d1fa666d22dcb78fa6fcb3bf22df3 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 27 May 2022 14:01:50 +0530
+Subject: [PATCH] CVE-2022-1304
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76]
+CVE: CVE-2022-1304
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
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


