Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC91C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:57 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.21313.1691683547097127906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bVvqK9CI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686f38692b3so938601b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683546; x=1692288346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8VABI0kYTxPoKSd15PBnttz62M80Bdkeu/XSZoHJt0=;
        b=bVvqK9CIyKRbvSz85854QvSlfwKtVCWB1lN4DnL0YCxcqdUQForqDeaSgtCiMpxNPn
         zVplFaIDFY/PHSSWsVKTTZ71VfT+MWB1GNHTLwaQ1iv102HhErIvXFARxhooJwVHOOt5
         sudiylT7gj0r+oNI37OdgR8wIqzkZLWpPveczWph62CdrrDysn8dPZkgi8gTqGRUM0c5
         wYFhlXTeaX16ej3BmVNnnrA789NM/euRPL8LftU/rfwLGQhXgcAU5qK91TKIvM0KfYkk
         t99wKZIO0pVdozit9xK6nP+WKWQ2UdbFD/L2dtk8gwA8Rk91afNQk5eQzw0Y00XigN0F
         /YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683546; x=1692288346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8VABI0kYTxPoKSd15PBnttz62M80Bdkeu/XSZoHJt0=;
        b=Qnoeck8AGt/MWYUKZo8RqjxtYZzUBpfB3oDC0Me9NyExVZeBupocV7a3tx0Httgg3t
         vV5UeT2sPUojny+xoiTEaB1oJ+qAobh/UkCV0X9+9GNcDauwLhUbmxNvpRv+WwEyP3eb
         rNC7wBZ8Ty+ro/puVjj+/iMm/Ez5x3Ebt32q7PTVJlWuhOWR0SbxUSZuJNX1S4M4B/A6
         PwR5CaSkfEjnUwNqgqpQ2ksjsde/jCXGg81dq0K+ansBVt+b3A1Us9An5321dbWFCsPj
         tROq3toC88laQavJIvYYFiG04HsrZdyUG43h4HgIYlyBdzJuEJ8Q4Be/0EfMeyAwvcnG
         v+8A==
X-Gm-Message-State: AOJu0YzBMiQb82epY0M/k2/Fi83KLJ9wCPWRnFDNog+IkmLEeY9Z8BVf
	l5B9Sruy7QvqYQYhUF4BHxbmhkpQaBrMDVX2zuw=
X-Google-Smtp-Source: AGHT+IEfqampmg6edsd1Zky/kx3lrIOKMMe+zs47SCyoVXNWFcLdLPxN6qfKS/ltazBpCBDf7F378g==
X-Received: by 2002:a05:6a20:3d14:b0:140:98b2:899b with SMTP id y20-20020a056a203d1400b0014098b2899bmr3832897pzi.59.1691683546016;
        Thu, 10 Aug 2023 09:05:46 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 28/37] mdadm: add util-linux-blockdev ptest dependency
Date: Thu, 10 Aug 2023 06:04:27 -1000
Message-Id: <dd359520c5e7fd76a127333114217d6d6cd74880.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185790

From: Ovidiu Panait <ovidiu.panait@windriver.com>

07revert-inplace test logs contain the following:
func.sh: line 335: /sbin/blockdev: No such file or directory

Add the missing util-linux-blockdev dependency.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a15cd04f528d137d428a572f15d1ec5ebbbd81f0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 50d9548747..fa50325f1f 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -107,7 +107,14 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    e2fsprogs-mke2fs \
+    util-linux-lsblk \
+    util-linux-losetup \
+    util-linux-blockdev \
+    strace \
+"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.34.1


