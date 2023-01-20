Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E78C38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.82068.1674238302064157565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RUpUJo3c;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id e10so4732455pgc.9
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpv/XDBHtS8wKZqUIwlN4eLfBc+HrTl6dT8rhFOePeI=;
        b=RUpUJo3ccwzQwp45B+HwHsDA1qnKhcPObAMCegdqDsraWAEY8iCxU2UvZXma+de2Rs
         glssH5Q3ZwCYNwDg//vM4t7RpW4NYZbcAU94bbqVWWuFDtBHoA44Soy2vN2XWKUr6i9E
         A7doJ7aFHf8k0U5JEkU+qJzpAR46Dxbl0YzQi3qlsb4CWj+i5k4Qn983GKbACmBjQM1y
         5lFjgN62OzzFyQ7kZ6wCiamGVsz4K/KYaFAN3tIrVzHsaqxHENDr04d+wetXsSTyeT92
         i5Bf7KDmCZcx/jRseurJ5mJLb8Wz2OYQyKjmtKb6Iv5U4chmRGQBxx6Yv9293vh3lGul
         HXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpv/XDBHtS8wKZqUIwlN4eLfBc+HrTl6dT8rhFOePeI=;
        b=Fu9JVEBM9kn2Tlk4FSIwHJDZ0RihPGWCJzYjm+v2vMsWZqXkXm6G9gWMJ+K767VQDu
         91bA2Zj5cNqgPycPxQQ6UHjd97ECI8+zA4hZJk6n6e9RI83JJgxfLL8nPp5NiCjMGIgf
         X+Z7I4mQu/fdcyVlzac9AwQR268q1nCBo9ziLQijWldGkeScPzHkKb4qAaVpSxD3IGIJ
         M6KJpgWAJ4wkzmSw364/PlDun3ymyXpvO16N7Wnl3qxiTb89YOdt/ADB3X3ah4ewBQ56
         WbyjKLExyNHkvzmWGTeE4bBk8+IL0ryg+zeKGFB9hVgOX7/KhpToNOVqt2PPUAINsFIX
         KruQ==
X-Gm-Message-State: AFqh2kr/rdOmydSkX6NTjbtgVt8NlSXjatJvOoKPITpuse0tLh6OFvSA
	ynjq/0ffub2IrF/z02li3Ki0xkEIWpDKr018C34=
X-Google-Smtp-Source: AMrXdXvdYeoqsqALJM6tQxEccsCajV2hoca8yczSGzwxI+2A3xbJIjHBZohmupLOZQGJGlVb1oTgMA==
X-Received: by 2002:a62:1b8a:0:b0:56c:318a:f83b with SMTP id b132-20020a621b8a000000b0056c318af83bmr13009302pfb.13.1674238301161;
        Fri, 20 Jan 2023 10:11:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/41] uninative: Upgrade to 3.8.1 to include libgcc
Date: Fri, 20 Jan 2023 08:10:37 -1000
Message-Id: <5ce29be1bc64d6372e94cd11fce1711b267e127f.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176227

From: Michael Halstead <mhalstead@linuxfoundation.org>

Including libgcc solves issues with libpthread.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36eb46589fb01374d4738a2c376386c68d06aa83)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7012db441b..51c0cdee43 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.7"
+UNINATIVE_VERSION = "3.8.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
-UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
-UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
+UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
+UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
-- 
2.25.1


