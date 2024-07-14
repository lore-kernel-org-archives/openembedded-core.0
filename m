Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEADEC3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.15283.1720960768315851698
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rm/iGQ7o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fb70169c23so26604025ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960767; x=1721565567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkzvB8wFEALeE36XX96kf/pqo71dwAYifBx0Mg1J200=;
        b=Rm/iGQ7okEFWxDIouCJi3UeQ8Qr9NJunob0efGWo9B+3sTrNZtVGrpJdcs8OAU/q4v
         qcagpKsIUrg+IDSRQiVlmoz1UbsIkIfmiM1RjLIjhzo/qxzH7k0bqgcYYe+cMmZW7hMl
         kOpF0ZIwtKKd8rlAFIxA0X5gyTdyUUZDhw8RTA3FkrRVjjU4FbvpzvyAyE2kM5Xgjyq+
         L/uRGqratmujOR1BF7m14IUQtVWBXPIA/cnIF7CWYEou24nVYcookd+rArtUFMm7wSsm
         57Ff5A5WfeFCRNF9WZdSXuMSt+7e1YG+UQO4L5oyV9eAtcfTajolmh25ylWrkBlOg2Yp
         bYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960767; x=1721565567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkzvB8wFEALeE36XX96kf/pqo71dwAYifBx0Mg1J200=;
        b=QZtPpWhRbM5HAZr1EDnuRtiYFrX8UZ/WvdAD/YgmXwxZ7ApdqWgib8mTYBwgP0JzA9
         qlUCcE2TDfxXkx58bjchau8RQ3WGm4pWhSWFb75M0WO7RIsANflcTEYFehX8KmpgIRPh
         57gSl1iZWpcjc7yxqHoJWnJuEOrYYuSAMZ35WL7axlgPHoSV3iZlxjA+Pb4XVzL5yAcH
         SIBAsHzYj1Uz85yKYJ4NOJcPu1Epevd7mtKiw6Mob7VMf9zC7IUI8w+c4sGhYiEgDUil
         jdtKP6wG6j8Na6M1JfTmqqkmkcBHvnjT73NE29kTtvZularZp5gNeCe1V0ve3NM4V3rm
         u5LQ==
X-Gm-Message-State: AOJu0YyNZynYAMpKZX0+AXrtg+smFmzCZdDDMZ9U7xCf65UMemv9nGqF
	S0pVz0fY2N/P2mKFD+zI8ZHEKOH+S33AAM4E6Db2D8J1CLmEgJRHPde0MzxHQBfpj/K+izz6tbE
	zRiA=
X-Google-Smtp-Source: AGHT+IF9mFnup+pZXFgNs9pQvjgojOy6NJhHvvc1P2FcE9+bHa9Ns9bwruRIuDOBgiKs7gNA2Nv2bg==
X-Received: by 2002:a17:902:b688:b0:1fb:7958:ab3a with SMTP id d9443c01a7336-1fbb6ec56d1mr92292595ad.58.1720960767540;
        Sun, 14 Jul 2024 05:39:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/27] linux-yocto: Enable team net driver
Date: Sun, 14 Jul 2024 05:38:40 -0700
Message-Id: <35be70c8c7f4044b5ad3cbb8ed32a6c648a5ac65.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201870

From: Khem Raj <raj.khem@gmail.com>

Its needed to run libteam ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7cd8e04b23b562746665577174799d42ded45d93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ca7c4e978a..62c0f0ab36 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -64,6 +64,8 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+# libteam ptests from meta-oe needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-- 
2.34.1


