Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526D7C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.1199.1652811942322241732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ww7UosLW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id q7so6680524plx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1vHQf84HImx0SvsM/hi1aYL1AB1vBqeIrZ5eAbfSw38=;
        b=Ww7UosLWDCju2tqjxgce3AiYUzCFgl3dMrgfETp0bdqfKKXx22A3XAdnezLn2kUV7P
         muaI2p0equG5HXsS/fsisujb/HKc3WVcJ07gC24B8ReppH68ysrhKuyHeWl423V3/vb1
         A7FHHbsV2sxkfD+0c+OKB69pH8UzummVXfYqih9rr/r44z81Qh6TzfdRFQoaeXfkPVs4
         tZ2SvWObDkSvxjR/SUIMNz1Ywz+4+iU19vUTMZf4oLKCS/LfouPcFJeCndpc4hVHVTiS
         n0dWoR0abIL191R7m68HXmmY6vNGTCTK8p9e9xRXJHxqSNGAi2KQ53V83J2dcngqo7K2
         DP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vHQf84HImx0SvsM/hi1aYL1AB1vBqeIrZ5eAbfSw38=;
        b=ZgyOtRDE4TuVu0BYGjZLSfHdRGTZCS5RKiVMItTYPGws1HFinyBtJIidpyrKN9BGtY
         WaMhZPT3uki07WsH88b2BGeXDqmiqmaQagNMoyTjmciOvamznuTy0WIk8QnN2SPzh35D
         cqAP1cWa7cAaYdDE7+ANKZGRFqlhzwSUNCzucP05BmI8lLGxgkpWv3foWXexp8Jtndlv
         tW5S8b8tZ4/ly/IyWsQqoODD7zpUNHQBrTGhdJPxxEaoeBP6juo8Gg18QhE0oJIdk/Px
         TPkSDVMDalkNWty+EEycdIfVt3mwyY5OkXmcLfme1AwSTT5CbEtJfLZPblKaD2xQsY4T
         /mBQ==
X-Gm-Message-State: AOAM53157wXNtODJ0rXkZwAO7athaYHuVnkPWH6wb8fokjlTibPUHjFn
	oTaXqn/t7HJNzMV12tO1KXKAv2S1wxRUOuWY
X-Google-Smtp-Source: 
 ABdhPJyzcl1vgeC1iVo1tOtjsgpNXFzJk7c4Oi55HiN3HYPkX1kY5+OSNQFVT8NYbkV1gxdL9/tmUw==
X-Received: by 2002:a17:90a:94c4:b0:1df:a60b:1e29 with SMTP id
 j4-20020a17090a94c400b001dfa60b1e29mr1118214pjw.146.1652811941078;
        Tue, 17 May 2022 11:25:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/31] overlayfs: add docs about skipping QA
 check & service dependencies
Date: Tue, 17 May 2022 08:24:12 -1000
Message-Id: 
 <4611cbab3e9593937b64b6db48ef269de37c74db.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165771

From: Claudius Heine <ch@denx.de>

Add some documentation about skipping the QA check related to missing
fstab entries or mount units for base mount points where the overlayfs
is mounted from.

Also add a short paragraph about adding a systemd unit dependency to
services in recipes, so that they are started only after the overlayfs
is mounted and ready.

No functional change.

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7adc49fa6fdbdf118f74e95193e80ae7ef019e27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/overlayfs.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index 29fced2ca7..f7069edd41 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -16,10 +16,18 @@
 #
 #   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
 #
-# The class assumes you have a data.mount systemd unit defined in your
-# systemd-machine-units recipe and installed to the image.
+# Per default the class assumes you have a corresponding fstab entry or systemd
+# mount unit (data.mount in this case) for this mount point installed on the
+# image, for instance via a wks script or the systemd-machine-units recipe.
 #
-# Then you can specify writable directories on a recipe base
+# If the mount point is handled somewhere else, e.g. custom boot or preinit
+# scripts or in a initramfs, then this QA check can be skipped by adding
+# mount-configured to the related OVERLAYFS_QA_SKIP flag:
+#
+#   OVERLAYFS_QA_SKIP[data] = "mount-configured"
+#
+# To use the overlayfs, you just have to specify writable directories inside
+# their recipe:
 #
 #   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
 #
@@ -30,6 +38,10 @@
 #   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
 #   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 #
+# If your recipe deploys a systemd service, then it should require and be
+# started after the ${PN}-overlays.service to make sure that all overlays are
+# mounted beforehand.
+#
 # Note: the class does not support /etc directory itself, because systemd depends on it
 # For /etc directory use overlayfs-etc class
 
-- 
2.25.1


