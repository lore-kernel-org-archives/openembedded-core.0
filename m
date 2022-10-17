Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA4AC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 14:06:13 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.41270.1666015564784537788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 07:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XKqZRjhh;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id l22so16206851edj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8hYEYiJZdY4Q3FH9jRgUiP32HKW/4Da2U6Yy82kz5I=;
        b=XKqZRjhhcGrZRkt3FUrvIQizZ6qCvLDYVnXJPj0Ta13gKjqhHtdacvGh6rmXVOwrA+
         7TzRL4akL9B7OEGaujqSIbJTGfNIxNgu34ZUUUYbHHaICzY1yupczCpJMgMAWauqBLK7
         9ywFE2ZcsAR6VZV08LCqnDGGWf2FC93cbWPwRjEA7L6hGeHtbjNjhj0i8d4cG2byvsWS
         QXVoPFk4FHWMxRTvtrViUecKtG/f/gloMYurg+yQ8bnLUP21FWcmX8K8HpzWBQOU10RL
         Se0osnECuiuf3Fp0MliNpNekSTGtUGtwbvVzzKhTks/5w0xKv0e3oAifV2U8oI4Y8Veh
         wfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8hYEYiJZdY4Q3FH9jRgUiP32HKW/4Da2U6Yy82kz5I=;
        b=VvrFX3Jw4m1EPBGms9F0pOv9/Ug5xI3/LvjuYRcC/qHZ8Bskm+VdxnGrAW+9PvuT2g
         kYzU29fNWGubaPbg8nOMyFTkUpi2yjonO1Ymk3IaiQ9H8S42RpVA/MQhAugYC2BZLjGM
         j+fGXsQDzZMOu4q7tvo9Y/bJ3SrfniD5RgwJcccXef34mtS7tGicPPQvHO726i8FaN0O
         aZx4741omywljTGDRjfMmx/KBsD6J9Z5m3XLjAge2/NyoLdhBc3Ix4wSZd/hx0DyfzrF
         WoffPK8K1Vsmpp2lR0lRDh6+qBggaj+8zR38GsHQfOH0I0d5AAEkcHU714JVE02gVdI0
         78qQ==
X-Gm-Message-State: ACrzQf0nkpO2O/ALFMdW3kgc48mWDTZIB8tNRPlIyThfU1cLBspaX6pr
	6pWaNXmSquqk0tXvj+uZg5XPHj5PnViBaA==
X-Google-Smtp-Source: AMsMyM4Y5jj3+22OoDgqBgPXnE7R47ZtBIdIa1alwa8Xi6SVq0rArJFQ7faynvdvrGph+KmZMle4AQ==
X-Received: by 2002:aa7:cc13:0:b0:453:52dc:1bbf with SMTP id q19-20020aa7cc13000000b0045352dc1bbfmr10667399edt.30.1666015562817;
        Mon, 17 Oct 2022 07:06:02 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906311700b00771cb506149sm6229750ejx.59.2022.10.17.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 07:06:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in do_unpack
Date: Mon, 17 Oct 2022 16:05:58 +0200
Message-Id: <20221017140558.632766-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 14:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171912

* we don't need other_lib/ios/Debug-iphoneos/libSDL2.a from
  https://github.com/KhronosGroup/KTX-Software.git so we can explicitly
  disable LFS here to avoid do_unpack error, bitbake will then use
  GIT_LFS_SKIP_SMUDGE=1 to override smudge setting in gitconfig,
  otherwise we would need bitbake patch to fetch LFS objects from the
  submodules as well

* do_fetch won't fetch LFS objects without explicitly requesting lfs in SRC_URI
  then do_unpack might run git smudge when enabled in .gitconfig (or /etc/gitconfig) with:

[filter "lfs"]
       smudge = git-lfs smudge -- %f
       process = git-lfs filter-process
       required = true
       clean = git-lfs clean -- %f

  and do_unpack fails as in:
  http://errors.yoctoproject.org/Errors/Details/672888/

The default /etc/gitconfig in ubuntu has this added automatically by
git-lfs postinst:

  root@ljama:~# rm /etc/gitconfig
  root@ljama:~# git lfs install --skip-repo --system
  Git LFS initialized.
  root@ljama:~# cat /etc/gitconfig
  [filter "lfs"]
        clean = git-lfs clean -- %f
        smudge = git-lfs smudge -- %f
        process = git-lfs filter-process
        required = true
  root@ljama:~# cat /var/lib/dpkg/info/git-lfs.postinst

  set -e

  # Set up /etc/gitconfig for git-lfs. The --skip-repo option prevents failure if
  # / is a Git repository with existing non-git-lfs hooks.

  git lfs install --skip-repo --system > /dev/null 2>&1

according to
https://changelogs.ubuntu.com/changelogs/pool/universe/g/git-lfs/git-lfs_3.0.2-1/changelog
it was added in:

git-lfs (2.6.0-1) unstable; urgency=medium

  * New upstream release
  * Bump standards version to 4.2.1
  * Add postinst/prerm to set up/remove git-lfs gitconfig

FWIW: vulkan-samples still fail to build with DEBUG_BUILD enabled:
http://errors.yoctoproject.org/Errors/Details/672892/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 332411b312..d0b3458e1b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            file://0001-Qualify-move-as-std-move.patch;patchdir=third_party/spirv-cross \
-- 
2.38.0


