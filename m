Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23587C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 04:18:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.2818.1654143479250183612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 21:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FZ3k6McK;
 spf=pass (domain: mvista.com, ip: 209.85.214.175,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id c2so3532005plh.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 21:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2dE0HYD9O9hbHuOG7QhjEMPsEJeZ7bplB58g8QSio2U=;
        b=FZ3k6McKr2LpX9fveJqhorvnXKpmv12G8MIc92L/CynV3zIxkUp05+cGAyIrgtgJTv
         rdxjGvJJJ6aj/UWvTdk0SeDEZV6b45YWZGQMgkKnBxDG/gRZIg3VGA5fSRM007p2/0nQ
         TUNLlx0U/f2Ty3nDsvxTH2svdmPAsg7VyclQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2dE0HYD9O9hbHuOG7QhjEMPsEJeZ7bplB58g8QSio2U=;
        b=axkiWAwnv/lsYRWD5x1DtA92YjMJsw+xljB5RzKoo9Q9X+k2MGeB+fSPsZ72VMhyZW
         vqZ/+pA/luIPxGwZsx/scK0uysostPipO9XA3gPxJ8b9P807JqbYf3dfSb3gJ6g+Tx99
         Jl28uhtjwA0bhWWt579Z6Mef0+UeaDErqyGoQF9+9+uoUnxn233ASBUsFPvSGTXsEn7j
         V0XbWMmC81KDcDsuGHt9w6/ECZFmO9jFBCLuADbq+LaWh1TRRrbEXdnCJVAg5LiohW3m
         oXlfOW4Cry16Sh0FqC9wBTomPk3kEv+PBYykDjO1j3yJwXruWYTuCZfc1Je9OIajeq4r
         b/3w==
X-Gm-Message-State: AOAM531b0b6cMQyc5r1Bv5AkqIsj3xeMHTNQxqVueJxMfI93y6ZUBbWf
	NlL7/7+jXTF/OnZXlK5wZxCkmF26z+MjsTEn
X-Google-Smtp-Source: 
 ABdhPJwzqVhzR8AFHVnV6VGmiCT0Sj3lKGek2/YUkoFbKkiP16jelMQpr85ZO7kMMtV2iwEXQHyk3A==
X-Received: by 2002:a17:90b:3b8d:b0:1e0:410d:b0f7 with SMTP id
 pc13-20020a17090b3b8d00b001e0410db0f7mr3074599pjb.165.1654143477811;
        Wed, 01 Jun 2022 21:17:57 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.228])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a17090302cc00b0015e8da1fb07sm2311049plk.127.2022.06.01.21.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 21:17:57 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 02 Jun 2022 09:47:51 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: jpuhlman@mvista.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH v2] e2fsprogs: CVE-2022-1304 out-of-bounds read/write
 via crafted filesystem
Date: Thu,  2 Jun 2022 09:47:50 +0530
Message-Id: <20220602041750.10241-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 04:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166460

Source: https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git
MR: 117430
Type: Security Fix
Disposition: Backport from https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76
ChangeID: e6db00c6e8375a2e869fd2e4ead61ca9149eb8fa
Description:
          CVE-2022-1304 e2fsprogs: out-of-bounds read/write via crafted filesystem.
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


