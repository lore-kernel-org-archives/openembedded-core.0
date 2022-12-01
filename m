Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6276BC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:02 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.44789.1669904881118116803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ejmtLS0D;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so5379391pjc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MfgLMQx6sxlNpksWYDzqVlaXx7ZGNHMC/RqByZqe6w=;
        b=ejmtLS0DMq2GKru8dY5EXhzIjedFjDNRG0gaSoeJTGMxoMHYbhvX/27Q4xWMSjIY0t
         g0TpK4iXzi1nmg5EWUsSw70/rWPpaIoPsLFIkuomh+wTO2BQaeszXYCCDruXy5rDtT/3
         4kCdpAuIVllfpPVN2/C2ZA4+/UV8fTUEmCsjrStrvgALSCXuK2YLapMraVaa3mMpDsLd
         NQcFuUkDGpXJKB25hSI3dTFv78kaG7jUDFnn0Rj7iosBs3HYsCggkdlIylmdjQ9BBvCn
         HWP1naoCpX0FnL5thwPqbxyw1QyXl5ltj/82heq6TfN8UH5t1qTKwa6qBnnMCn0CHS10
         ndXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MfgLMQx6sxlNpksWYDzqVlaXx7ZGNHMC/RqByZqe6w=;
        b=f5/q7Xohuu5ED4pPbUI8XsKMDWR6D/0MhQTfmyk+P72U24th5RyPG4ZsLyKF1X/Sft
         wB/7SH4E2gjmXnM3YqHlcJPChlTGEBdiyXStBUPUVpGxupAYT9fITZnUiJ+ZhX+HCfOZ
         DBmLv+P9SXZoR/EMXgJ+mRrz+PkNcIswBZatlTYcf3mGiXYvWXmqm3PPxZo1OPbhzOrv
         cR9S4/1PJxTGbzIdy1vsn4X6nrrhzJ5qpg9WLySZOztBpyf1c3xih2USk4qy5v6hPxof
         33H0GqFBQWbudNZPrw8nltE0qemcZc6SRXAkOkeIsy2zV11te2zu0Fs3D+y/2Y/icq0+
         m3AA==
X-Gm-Message-State: ANoB5pkjx5NYZLkh1GIXYDoeB7tTK59m1k/SNyRZoHQdhH5AHaAtrS34
	CI6Z2Ecsw7kgx00loWh775AyIkbOAbeoo9D3lH4=
X-Google-Smtp-Source: AA0mqf7ffmvk1w3k4fXk7DLWaNGmJh3xuhwHEzUZ7Avyh5xKUD4JUOTOuv6n8uGZL67VZiJSVS7HCQ==
X-Received: by 2002:a17:902:c186:b0:189:7644:c46d with SMTP id d6-20020a170902c18600b001897644c46dmr26721074pld.155.1669904880138;
        Thu, 01 Dec 2022 06:28:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/23] kern-tools: integrate ZFS speedup patch
Date: Thu,  1 Dec 2022 04:27:10 -1000
Message-Id: <a592314318509e6367a7625caf88837480570fcd.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174102

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


