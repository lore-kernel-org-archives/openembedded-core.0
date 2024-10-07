Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5222CFB424
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:29 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.44011.1728266126209000206
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FthUrXwd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e18293a5efso2641461a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266125; x=1728870925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Izn8e2VuXK8B4h3j6ENh6uAuwG36KiNcl/Tf/0vVsg=;
        b=FthUrXwdhCBvU7EkzU5NO4FrBXLqCh3fgH5Q0UdoWESqkouH715+GhXzVEB+By1Swq
         j4urhFZHdEHEMDJE242K9U8hOQC98k6T5/kmC+GJYAkg/nYH+WTfwI5+4qI03E4ogKJR
         wQbijl1LSisv7PINnHkFRC/DSrLTeKqEYSKjxbzvX8OY1fsnBAfL38h/laFuLWgq+paQ
         ZjkMi57CqZEHrP5Wy3XsMBg1MUWxaj6T93VprfYgcJi+VUsR42nu5bFNKIgm7v1TAn/L
         /KVAAn8UxMjLgTbCUuv4FDQSB2mb+TFLsqIeRyiFjxjumWNlkXPYTPjXubLlq/rvSpno
         8pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266125; x=1728870925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Izn8e2VuXK8B4h3j6ENh6uAuwG36KiNcl/Tf/0vVsg=;
        b=jkTdak6B5CfCFLESTKFdbGFzja+QD7JcXe9DX/fl4nastB4+llMxieZQ/QmtCecHSy
         cniFnWXg0c7PvUnwDuS7J0/BQYlZ/+wBpp4RZua3In7YydnhPl+eX4tKLY2qLmrh18fw
         fAyUvNVfBqPILmtlrUz/vh70dQO8DtGQESTnT4QgoDf4yczfWPQorjeVfH2XYBK6KAvd
         7JqLi/+eUWqqQn8wVPHbUS//HaPfCTbPTGANOeAdXnMKP1lBQH5fkaFQ9JMO0BfBvGow
         NePn6M96o2/e2mcSbOKT8tZdLHsK4GKJTiJ8iw39GedOpMD4aIyYqcvNJ5X46/Lv/Ens
         9KUQ==
X-Gm-Message-State: AOJu0YzVHS2ierMIZMNwimlLQSI9K2bDixY97WA5WCS4y/uBDX122WyR
	WLCZKtmDoaPH08J0MYTVP9nXxgS5JNFr82TL43eOQuGCK3yPkcY6nF/4+upSK6GTNyx1eRsgHQL
	dNE4=
X-Google-Smtp-Source: AGHT+IHWdaOOoq/XQsyLWvVbx1ewbAS3J4pKwrB7JOSt+asy1GjfaoIYm1vmzx3tQC35ZK4O2rSrHg==
X-Received: by 2002:a17:90b:17c7:b0:2e0:808f:ef9e with SMTP id 98e67ed59e1d1-2e1e631ef86mr12267177a91.26.1728266125431;
        Sun, 06 Oct 2024 18:55:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] meta-world-pkgdata: Inherit nopackages
Date: Sun,  6 Oct 2024 18:55:03 -0700
Message-Id: <5ea3ba00532265165e0d30f6d2eed568f5b5867f.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205258

From: Martin Jansa <martin.jansa@gmail.com>

Since this is a recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/meta-world-pkgdata.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 0438bf6138..954675f383 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -27,6 +27,7 @@ python do_collect_packagedata() {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 
+inherit nopackages
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
-- 
2.34.1


