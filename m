Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FE8C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:42 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.44778.1669904619458109599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5STDHuOg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id s196so1802891pgs.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MfgLMQx6sxlNpksWYDzqVlaXx7ZGNHMC/RqByZqe6w=;
        b=5STDHuOg5x3mpGotw/PaQMSYPyaiP+Xka37G4ejRDmtf/BKNTTqFjUnVo5dy3xDnjL
         /nC/iGFni7xb3VoJ30HS0ncZTgvkrdkTxbYEnPrW2aLvQnY81dHGKoCNKlS4qRVSzgyY
         L6pXK66gmIpNzR9BN0FEvvPuQAPfxVPICMxKOYAZyOnJSQPWaZgdOf3mlRc2aF/dS33+
         exezgkT/QiIAfiExSa17mdAN/4DQY2DZ8Uk9UmE7UOVYAX1XJKb/NWPWQNTXuI182wl2
         V4Wroo00KVf9yCBphb8GjLWUjNSxucJwpsN3JeTAkKeKAuFen6Jbvxs89ZoCy7N26kVs
         lZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MfgLMQx6sxlNpksWYDzqVlaXx7ZGNHMC/RqByZqe6w=;
        b=AvWMP0116y/NirY2QOVJWfbRdptWTlaQP74haW90zY1wf2EpjCiDoIB2FVA7GbMmxw
         uQzkUa6JoWk6U9qvKXV12cvmCTFO/X2q/5ZkhSaF/DRLG+28ULF6Afj/pxcJdJxMCuzn
         1p6MD6DVgHqtJ7OdNknzfNHolSuWEafoWOF02Gztf2jwViTwj13rzexNBW1MNfp+BVjO
         15VpNWviO2Nzc1eiQNueOoKy2j3BuBhqvERH7hJor0miJurmIWHusRUWHZFkeu5jHmb0
         9FtJrbrRacw1eZqz/NS/91EGgeLdwB9oo92q4ENydEkcCqS6HZrFvRhUH8dy9u+7Nqg1
         +RRw==
X-Gm-Message-State: ANoB5plN54OhFz+BuUQoyfBcDDWPPQIXLZ1/guPqEQ73ixMiKC2ajyix
	SVNLTcVX1AoA+vBsHztyXYud0WMp41PNZJSTZuM=
X-Google-Smtp-Source: AA0mqf7w4yszfK2rKedy/U7LycUZm+jYt08NxyPyaVXn6TLyzCFuo0vlO8Mh1vtBC1Aqf4oysQnU+A==
X-Received: by 2002:a63:f962:0:b0:477:1bb8:bbf4 with SMTP id q34-20020a63f962000000b004771bb8bbf4mr41427763pgk.19.1669904618420;
        Thu, 01 Dec 2022 06:23:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/22] kern-tools: integrate ZFS speedup patch
Date: Thu,  1 Dec 2022 04:22:45 -1000
Message-Id: <141d71c2cf8548900586893178b9097cd723ba57.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174078

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREV to integrat the following kern-tools change:

   commit 2d01f24bc78256c709728eb3f204491bce13e0e5
   Author: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
   Date:   Fri Nov 4 23:32:38 2022 +0000

       kconf_check: store some files in tmpdir

       Some file systems, like ZFS, are very slow at appending to existing
       files. Due to Copy-On-Write nature, they create a new copy of a file
       each time we do ">>" in a shell script. This becomes very noticeable
       if shell script does lots and lots of appends, like sanitize_fragment()
       function in kconf_check. On my setup, do_kernel_configcheck task takes
       literally hours to complete.

       To fix this issue, we can store sanitized_list and fragment_errors.txt
       files on tmpfs, which is extremely fast at writing. As most distros
       use tmpfs for /tmp, logical step is to use `mktemp` to create
       temporary files.

       After completing writing to temporary locations, we can move those two
       files back to ${LOGDIR}.

       Also, function 'cleanup' was added to remove temporary files in case
       of abnormal exit.

       With this patch, do_kernel_configcheck task completes in ~2 minutes on
       my setup, which is a great improvement.

       Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9d50e2606eb66019044ee176f355a84a65a1499c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 07d7daf5fb..12f1cf516e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "6a4752ebbe7d242c02b3c74a5772926edd243626"
+SRCREV = "2d01f24bc78256c709728eb3f204491bce13e0e5"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.25.1


