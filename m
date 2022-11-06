Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0216C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:11 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.16537.1667744283307729554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TE1pls+x;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id o7so8369263pjj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0N/nflX+zxOqwxAMQ3kecOAeFzqt+FjkXccqgypqlo=;
        b=TE1pls+x0dqxK5HadFHcF4YJqUD9tgRid8Uvt0fHpKzJJdLUtbaHd9Ia/MG3Krhetm
         UOhSstsuR8aOgHdSwh8ljzOkmBaaH/0MG9Pb7S+o6BR4y5mXzv98fWwUROTE4tc+W7Uv
         a4tHo7guMyTnMhQ5szzR4z+AHtzS540VckX+Y6bwEI15IStAZq/phzUVltkJO3A3YxUL
         nXHoHfSXFzWh1hrCUcUK3pmsQlyFseO72hVnuYfsbKo3BvU2bHP8DalL0tSU6gEDsCgo
         E4G67I1xl0LuEh8vexWQvH1lWQqkuEvw9s5PN9ZCwdrZW3NxpL0xxyXKmCvU2N2f6YRJ
         Rt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0N/nflX+zxOqwxAMQ3kecOAeFzqt+FjkXccqgypqlo=;
        b=l4Xizdl0ejOQa0krqs+aMA9lbDOfzg9lFykSfNRwfvEZXWjhNBrBC7QdpDnTppOuep
         hfrYjGbBVtqb7KSBx8O/I0vJMjUQbuMQIjYOkDd4DV/a1L6p0E0unMKMBKFobcidWNin
         U7rI5o1+yI9jTjZnuve5tLe9hTluZHucLWE83WW6Czm7IQvN4SqqGKKnANySdGc7kVHI
         LW/mRR3Gt8uhAaG9r5V6SBbqj1SM8lKbf5LMW7plCp2jW26oeY37Jr1GECc2KQdyOH17
         HFS3CNGMQzi6lYBef+vDR5rHh+GXgZdaLEFQsmbCcEkLO9I4BzOPQf5HTzwhGpMHt86s
         622Q==
X-Gm-Message-State: ACrzQf2qlJz94lvxr4SZ/+TLUBbEOE67WO7h6atIBlEnwQsG8A50hHk1
	ZEuzhGTRZCrHpeOcnuiaMloMJFm7LTCdFmzh
X-Google-Smtp-Source: AMsMyM5Fa/ZdskNRqlasr4z5muRzc/4JbOeDEi5RlyHo68+ik8Llld1C+nfqR7Wv0OO4/ol62es2rA==
X-Received: by 2002:a17:902:ce0d:b0:178:bd1e:e8da with SMTP id k13-20020a170902ce0d00b00178bd1ee8damr46325687plg.103.1667744282369;
        Sun, 06 Nov 2022 06:18:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/34] vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in do_unpack
Date: Sun,  6 Nov 2022 04:16:59 -1000
Message-Id: <58f93fcc5364880f11f1d86e0a5a6c5712f6ca6a.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172784

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
2.25.1


