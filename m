Return-Path: <yozhao@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117D1C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by mx.groups.io with SMTP id smtpd.web09.1634.1649295605043323285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 18:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=SojUGyOC;
 spf=pass (domain: flex--yozhao.bounces.google.com, ip: 209.85.128.202,
 mailfrom: 39eboygykamcb1cun1t11tyr.p1z@flex--yozhao.bounces.google.com)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-2eb8b94ad35so37012407b3.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 18:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yEUpJWiVuzxnSmd/Gz8Di2ahxCY4G1AgoeQedo33BXQ=;
        b=SojUGyOCCbRihMl4IBT/zaf8UK5Em91hKFNrxcLWgqzTgEwqbrauyE/xJxHZ2TfAri
         3EUMTtugEU3lZipI2UMHX3WUD+vJuoG/uMMfzDBNFwVnJOXK+Jl+4osI7XxEHag3WO+7
         Z+sVjnH+IkbF+xJ1cj8jHDy0eeb7wBQliFKFhzsEqa7x/DLDdqk9HsC1it1QXg9dk66P
         HrfkVWYa7rJpsnb+vDKpMNHN8a7IChBXiOSJ5Nvn7rqoEDpr0a50LMS1diB8lZkHDlYV
         OEc9JQ8AVbzhB1TeGCBzqHmZpFIUwqQTiVhIIE/aeINTcb9y3cgizG/m480UzZ+gVYpP
         tNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yEUpJWiVuzxnSmd/Gz8Di2ahxCY4G1AgoeQedo33BXQ=;
        b=GjxHd6jGkKVpWz7iE+FU4qcMT8BlPMWa2dH+bds4jOHQERh1ugBOGyURZtgfE/LvP8
         /+TZginVgQxk6Tuuxz/pGlJdU2zIeKLKxJCeVDrrtHZN4WeswFos5tkdlRjP1dTjSCzW
         VHJ7euLBGoX1ewA/2ijB6BWLI8Q6kAFBAKGqpdC2MK8RensDrkJ7TZ4N2nEnnBKXfNQQ
         BIDhf9Rr56BeepQP/0b5ro8/yC2C9Q1nCJNLph2oZZTvBw8XT+voBBFvSDPMOdpaua3N
         1GYeM3WOBGtmGADbiGL4zcinhW+/5Gaj88Rhfij09oC7eDVmsQ/5O8OfnJReaBPaYTm2
         IvRQ==
X-Gm-Message-State: AOAM531io5klOZA54nhK4q82FeA3V+Gy9tMW/hLXXIB9f/n8iU7YQi5W
	ljDIdhcD9R5+0SE4vHMuiC9voSL653Ry39Fq1O5u7HAT6wzH50Ua+6YxyFYE72bxBTNwdJ85RIe
	I+NlG7IlxR9RjCZmUxmAIHIXx+hzgMPqZgPIv4jY8dJFLjkbHx5Fia0hwi125kPznuROylGQXRY
	sfiqfd2US4lA==
X-Google-Smtp-Source: 
 ABdhPJzlp90QgTcrrBY/uRZ6h6fNiExy47o4XM8XVHqfY0fOyEARwqtDjX5ESJkNCj0LFs7CDfZtk9ZKqWU=
X-Received: from yong-dev.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:58eb])
 (user=yozhao job=sendgmr) by 2002:a25:6b0f:0:b0:633:d1a3:9dbf with SMTP id
 g15-20020a256b0f000000b00633d1a39dbfmr8710361ybc.216.1649295604040; Wed, 06
 Apr 2022 18:40:04 -0700 (PDT)
Date: Wed,  6 Apr 2022 18:39:59 -0700
Message-Id: <20220407013959.929748-1-yozhao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH] kernel_configcheck should be run for SRCTREE linux
From: Yong Zhao <yozhao@google.com>
To: openembedded-core@lists.openembedded.org
Cc: Yong Zhao <yozhao@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164095

The task is useful for a SRCTREE linux. Because it won't modify the
SRCTREE, it does not hurt to run it by default.

Signed-off-by: Yong Zhao <yozhao@google.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 scripts/lib/devtool/standard.py   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d5a8cdf29..56ba340c1b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,5 @@
 # remove tasks that modify the source tree in case externalsrc is inherited
-SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
+SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 01fb5ad96f..35cea6f320 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -949,7 +949,7 @@ def modify(args, config, basepath, workspace):
 
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configcheck"\n')
+                        'do_fetch do_unpack"\n')
                 f.write('\ndo_patch[noexec] = "1"\n')
                 f.write('\ndo_configure:append() {\n'
                         '    cp ${B}/.config ${S}/.config.baseline\n'
-- 
2.35.1.1094.g7c7d902a7c-goog


