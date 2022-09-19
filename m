Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE72C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:48 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.20602.1663597726584204706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eoW8i7Y9;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id d17so19790225qko.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gv3MNitk1QE8DRklncsW9aXgEFv/BKUv4/6YHuL0yBw=;
        b=eoW8i7Y9pXo24iinopr+ysyOLKkGBE7HcrRQcXdSfGCAYkwKbMzHR8iNjSXoePNkJN
         0vGAGnWZYOUvU663JZE5lajXEKJrP+GYPgPeHQBIx39lTRQv/Gv7InJQBWHbPWLYWlUd
         i84EgYN8/NoiMzL34H1o7OgYWdqV4O1tnlIi4r+M5TqqRrxonU5+l5UiwLUD/s/MxmYZ
         wxgRG+Sc9zRjWftACW8xW3GHE8RZODYyCWlQ/rNRI3Avoq33enV/ttTqjjKbvvN6frXe
         PtxrQHhwcRoOtXp903kbyfLvUILnt0c9PmlPG/7z/tm1rSnnPWkJLELejl5T1BqleLS1
         krrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gv3MNitk1QE8DRklncsW9aXgEFv/BKUv4/6YHuL0yBw=;
        b=KLp3X4smlIKrbvsViDO6ve43kGESkT1NPscp0byvWihki0Nkb1BLqBmHaZWI1aep5Z
         m+hi1JCcUhxdhlKtg1+mLHGNabwM7ibwxuiSyO/pSnQcGIPpuyw9L24UoMlcoSpSgISX
         z9xMGG/MySqje90Y8w18IobgTKjU8a6yPN4lKcpkfBTpoUB5xDVkOu+xdYvGV0wOZP6C
         5fawNrCAgQwkDCnfC2HKJxB3QV2HJswez9zd2Oz58omWSEdC6PLfzqco8PVRzoS99w48
         s6LyjfeY+cxxgkuaAMhioV2FxPlmr6APO64Lg15gVMZaVFOh9CdcKcMlFyEGqLhBBrb6
         UKxw==
X-Gm-Message-State: ACrzQf1GislaAWznFRTfauhcnPu9lt2CqPMjVXy6yVBG3/1PRHWrUpUD
	vxFO72YOjptjezmy26kEQQZBpK8Wgi0=
X-Google-Smtp-Source: 
 AMsMyM7p7z6AQLgBDTs6bgxvQj0MGyvAymUUc8XiiolzLJBO1G+0P8UjOEpt56NauV3GMrQULjWoag==
X-Received: by 2002:a05:620a:1724:b0:6ce:9bb6:404b with SMTP id
 az36-20020a05620a172400b006ce9bb6404bmr13279746qkb.539.1663597725585;
        Mon, 19 Sep 2022 07:28:45 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] kern-tools: fix queue processing in relative TOPDIR
 configurations
Date: Mon, 19 Sep 2022 10:28:30 -0400
Message-Id: 
 <78ed9d2a9349ad9db6d98bf8f5c76a332e025bf4.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170868

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As reported by Peter Hoyes, in some very specific configurations
the processing done by the kern-tools results in errors. This is
due to the bad creation of relative paths to patches and configuration.

This is fixed by the following kern-tools commit (based on a similar
suggestion by Peter):

    spp: ensure that relocations and patch paths are absolute

    If include directories (locations of layers) have relative
    components, and the path to a patch doesn't share that relative
    location, the detection of a common prefix can fail.

    When the common prefix is incorrectly specified, it can be the
    entire path to a patch. This results in everything being removed
    and subtle errors (as this shouldn't happen).

    By ensuring that both the relocation directories and patch path
    are absolute, we can avoid this issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 11613ab3b6..e065c3e74f 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "f70b1d52f4706a263ae22e2c61039ccd875e97b6"
+SRCREV = "9320c2a1aaa085e94abd15ede0d93ffdab578e9d"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.19.1


