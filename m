Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34575C04E69
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:22 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.16720.1690487058211812056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gizXPkQO;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.175, mailfrom: steve@sakoman.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-34637e55d8dso5090115ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487057; x=1691091857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMOwN0UCZZrwC5VsZWrNllthg1QlNl072STvvbLHE9c=;
        b=gizXPkQOBmoDE+V06pt9eHeosFdmpc6ec6ygWKFfpez/v4MHM8TL8STeu4EZwnQ8J1
         aa9vbUETOFWbefwVPSoIRBAn921Eu8hoCOkBv75vvHkYCNbFnqnh9O4WB+ceqUKleE2+
         +JOZ9HJbKOba1U2sWdfnL2BOhQ6peFnmnOAV2vxbCe6EGfKnR2gYidbC/SUOAUgLg3tP
         OuomKu0J0hhVdUNTZ8TU5Hy7OHveNvjoNViNIt2jeNE25Yg2yJUu/dkaLM6WxF1m05x2
         G4Wozlqa3ziu1z/bSL1nyyQmG8n2PU4RWkg868VIovOvxzPOFqjqy7CphIhn6RdQz6va
         pfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487057; x=1691091857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMOwN0UCZZrwC5VsZWrNllthg1QlNl072STvvbLHE9c=;
        b=hTC/z1EodJmBxaw+Au+HwRveA4tDJBHTylp3RYW23iuAHbYMKhmD4QOTijl0kCjw5+
         sH5xkyI/KvpK2xCA6aYBVV4efV/fa3N5T6DiSj/XWA4rfdvKcfFqRwEVhj9mY0yJDoRn
         +eK9m6buh5TnjrVC1OZFBs4vgvj0z4pLI01ORu+8d4v0J10b2I4CdrvT+Uuqz/ARBrYf
         BMPCAn6C+uJFtXi+uH2LGxtdo+7T/SkZZesmgVC3KE4RZiL+VakPWTdqsp3oEC98hbxL
         9b0Me+Wcw9VVj8RYdi3PmCM9mgS5q/hUHoRbqi0muC/SN4c9n6QuT2DQMpuZzwLFB3vP
         w83Q==
X-Gm-Message-State: ABy/qLasi2nnvYbNod+Y2HUhEvh7WtFG6E6ydDMwhC9FZ1HBDB+KfsAN
	4zAwLEwuScdWkuQvwgFhwli5acDr80kpYr1A0SI=
X-Google-Smtp-Source: APBJJlE9V4b+7MsWGpF+Ej2qtgqGQAoXVcjW/tAHfRiIDiR/mliPR4IiwkKmRGnfuFmI7METC1oaIg==
X-Received: by 2002:a05:6e02:ef4:b0:348:f14f:433e with SMTP id j20-20020a056e020ef400b00348f14f433emr417449ilk.12.1690487056960;
        Thu, 27 Jul 2023 12:44:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/27] kernel-module-split add systemd modulesloaddir and modprobedir config
Date: Thu, 27 Jul 2023 09:43:30 -1000
Message-Id: <174b446b7c8167934b13ec679407093924d324e3.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184987

From: Jose Quaresma <quaresma.jose@gmail.com>

Because busybox doesn't support other path than /etc [1] we can't
change the default path unconditionally so change it only for systemd.

The modules-load.d [2] - Configure kernel modules to load at boot
should install their configuration files in /usr/lib/modules-load.d.

The modprobe.d [3] - Configuration directory for modprobe
should install their configuration files in /lib/modprobe.d

[1] https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=669c40ed8ebf480c95ce36135104e474e361a7e6#n658
[2] https://man7.org/linux/man-pages/man5/modules-load.d.5.html
[3] https://man7.org/linux/man-pages/man5/modprobe.d.5.html

[YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 075c309bd28bc8e19a82569a2e75da14fa5795dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 0e4f9a6ec3..c1208d55e0 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,8 +30,8 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
-modulesloaddir ??= "${sysconfdir}/modules-load.d"
-modprobedir ??= "${sysconfdir}/modprobe.d"
+modulesloaddir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
+modprobedir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
 
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
-- 
2.34.1


