Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E9AC4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:45:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.129132.1671093950150936066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yub38l1l;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t2so6148572ply.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vcb0IljHuNGtoTs5WEVGN7N0/VKiTHDOwnW/iH98r3s=;
        b=Yub38l1lP6Z9auJhhxyU1n/AA8yo8K8XMfaESIrsIB2sCG9GfAbXwVVKc5PaCsUiip
         NSNt8vlhWqW2dE9OOE9ZOooB+VS7lBgupvY8h0SmDXVmNDWx5RUTWjbFqVNqhIunlpPx
         5CTdlMR04RDcKOaut7MfInqbjVVyfIErXIwc+1jTWPZw4RHGmorM8znzfRFZkvtHvDTb
         BGPcdWv8PQQgoaYeGg9IyMIJSFgk9iDn8kbFayHHJcfRffqiQztAWLgqEpxZFFRLVYcy
         5XaHirkkI1JHku69DEOiazaa6FW0dAHVWIIwY6O0SMQmq+C3VUDXWnzpInz/vM9+6SCD
         ANgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vcb0IljHuNGtoTs5WEVGN7N0/VKiTHDOwnW/iH98r3s=;
        b=53OeVsvfbmpgJZvu798BwJ4Lt88SSjovXGifv3Xp+kkRrc5JIO6frN6RnIFVCi9Q6J
         W35cCX1s0tgFusKWDXI8B5UWO6OvtAulTaDxixJ48IDRCnwuDoXJdrsUMa0G+GZqdH6d
         ISpICJ4vyWFdtgB1rEDrnGIH8GN5OTA7QAB5dGoRrHN7O49U7smFp4GKDJ5TgkaKFjRr
         yQSYCqjK08+qqvR6WSt6tp5tkpj9zCW3X4Kh2VM6RJR6BN1jNU4QHor0ERO3T2juzXMI
         fWk3kFMeUpXprk4XnWgcx3qxYXtZ7s7ewU2NxyksnF4Pjn6/tEytnslyDnZRJpq3upNN
         oG9Q==
X-Gm-Message-State: ANoB5pmQPX3/9HiKYC+Lx9iG/zuaeabyF/WA8yYz0Ji2c3/oDzgYkkxe
	6dBGjbH/+CY9Nm8jRXC9IIMARrQRfd8=
X-Google-Smtp-Source: AA0mqf4/aNiDqgZQrm/qWIPPFPgK4CJpsmLQDSL28lr+q276QhbETmiGAzTzUuvYb7HI1mfocvACjw==
X-Received: by 2002:a17:902:8343:b0:186:95c9:ddc9 with SMTP id z3-20020a170902834300b0018695c9ddc9mr32891240pln.55.1671093949173;
        Thu, 15 Dec 2022 00:45:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 02/11] pseudo: Remove 64bit time_t flags
Date: Thu, 15 Dec 2022 00:45:37 -0800
Message-Id: <20221215084546.125368-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174564

pseudo traps syscalls and has intimate knowledge of them
and does not really depend on glibc interfaces to kernel

flags are added via TARGET_CC_ARCH therefore move the remove
operation from TARGET_CPPFLAGS to TARGET_CC_ARCH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8bb8993439..1a708066f7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -22,7 +22,7 @@ PV = "1.9.0+git${SRCPV}"
 # aliased due to this e.g. open/open64 and it will complain about duplicate definitions
 # pseudo on 32bit systems is not much of use anyway and these features are not of much
 # use for it.
-TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+TARGET_CC_ARCH:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64"
 
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.39.0


