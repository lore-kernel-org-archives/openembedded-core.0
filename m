Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21535C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:59 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.104.1667835447313012338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yMMos7Gr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id b185so10967394pfb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrWpIvijR+AFUC0LXm5l7sUahbNBrtJCQ1tUaAVC93w=;
        b=yMMos7GrCpROme0z1ourQRghu7U+/qf8g17tX1L7MqUhewFIxECe/F+l3zYTbz9Vzv
         eAVr6aaUbJ4YmNnmCL7vS6j5AmRxkMiVJtIfnNEzq6t4RWLJmbA6QL2EoYDXhTbRD+o9
         0QDRPckR4lrPiguzPBL2nwLBs+rqmuC+AvLWykrhOcrxs+XFgVYPhRcVnUseEmKngwwD
         VbWi4PWho62IapWWjo/FICpWHTJcV9XtTeD/K0TZW5NYas5zbd8EZjrIGye29M1TCfo+
         R4zxUbqi5RKmQ7QBtLRKoO+FGb4DFIdPQHew4lDtiGQHc+Zu5wi4IIHmG9RbC5jZo9NY
         sSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrWpIvijR+AFUC0LXm5l7sUahbNBrtJCQ1tUaAVC93w=;
        b=TvgEndpIlJ9oyrb2/TTGu09rJVW6hQ7Z9Aru4SG4/QJwDf+72qF1s6TbRgEOh81mTv
         nJawwkwKAmw6+/NBnL5fkdlo08/1TmSQMVmq7FgoMgL99sDF8PJiTmpJQEsl23gIBOmD
         KmQ12OhQ0+3X4qzQhqDpx07XjP5+44n2c5Q7e7BJEAV1TkHAnrIFAyt68s51oIPvHtzC
         KYMAhD7Yz1K7oFaIZwjykZ4vhO1mwGSB4AgOHYdmRCL5c1UHQdxyaJ9mmMs5vsVJhP2G
         XmNF2fhpOIsu+mQu2i+pMcODdkKmMkMffyhoIJLUzRMWL4CnQaSuGlDNSgkqzXLeXDhd
         bg8g==
X-Gm-Message-State: ACrzQf1ZYoWxW2WfORjAGOexmgBOGa8y30w3kkWQj/gg17DIgBVfVLxw
	ALXDuSXbxudUXTwgMbkNjX+/KnYq+DJhfiHA
X-Google-Smtp-Source: AMsMyM44Mx4DqP9h3mykiYZj6U2w7B9SrTyrYz8X5ZWFvNF+eZKxcnzUZOZhCltW+JuBPIVlRDG6UA==
X-Received: by 2002:aa7:8607:0:b0:53b:13b5:2b6a with SMTP id p7-20020aa78607000000b0053b13b52b6amr51282063pfn.52.1667835446370;
        Mon, 07 Nov 2022 07:37:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/25] vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in do_unpack
Date: Mon,  7 Nov 2022 05:36:35 -1000
Message-Id: <ef035d9f49c9c974e24709e7824c661e92d819c0.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172915

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b45b1f5dba02a626b7e9040d45198bd17dce4c99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 53c7254ce7..3ad16490ce 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            "
-- 
2.25.1


