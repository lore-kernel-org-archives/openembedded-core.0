Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE124C4452D
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2527.1784364810631161708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U/eUanGC;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475417f010dso4673948f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364809; x=1784969609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2y143cnyLyDW6bvN5q+05kqibyNPJLTQxyL+JFXpM0c=;
        b=U/eUanGCO2A/eBqjb1nRT5vbFUyk9GYfk+SrJOk1lwbgQ22ZXtiYebgcTSbbTpp2T5
         G2ErRO4YD78a/P/AOS7hJgmbEGGcy2ziA0i+J3/VwW6eajmLTeQ6NTtDJdeWfx1lJJFP
         hObuSFuF8EsUrlLkSrPOBaXb2LgYPoDNi1na4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364809; x=1784969609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2y143cnyLyDW6bvN5q+05kqibyNPJLTQxyL+JFXpM0c=;
        b=i5UJrj6G+G3JPzzcNj5ikv3FOTK80fnBJfBpmXuozgz1p00gF/hJuRy/454Lzbj4fD
         lhk5/X+FQwmKfwKiS4xdMnBMW1WhZjma21+PN+1H6i7h6o0ZjGEQiPJ4y8QRqPZC5Who
         EyFDs2Sz9kdSJYHH1mXkuHEdQ5Buo0eUlCx6uPXyvRp8ReQF/JkzknzbedhJBPVynb0C
         zFZkwFSzlsP21A6Vo+vofzMpDlvzl+twoPROpEQooWcx3UEOzMAJHqYtadkrRA1uEDkZ
         wkgcb4FW25jtt3FHrlNws73Xio2g5NWts6leYgrBo5g6PdBwcf3nMPD49qzOkOjlbIXk
         J+wg==
X-Gm-Message-State: AOJu0YwH4BpShrhbwJ0b8duORlxXHO99snN4N7M6TFcSvDuyEdKoaadL
	U4T3HVZK/PGt/kUweSdbskaw+beMtCzFLNjTH8t50T5oyX4Q2Bw7kAuuA5ctqM6sRzulljP5hPJ
	CxVxgchU=
X-Gm-Gg: AfdE7ckVk+XVc+H6qWUhABSOY2M/qVybhkqPzwOHIhP+WTaK6+WmLqJHjyDHVXyxRRA
	Yu8HgtNrpylMyaKyHOfhcXL0r2SU/tTRwRkL6Vxft+sk6jiK2Igy35SYlQaJWl1efIEvljN/lLF
	QyL2NHsqSLkPz8mk2FSOYYy7/Pbt7yw8yxzCL6rJTZUSGRmrBd1hwddIuShAcvZzshRbJNun+vB
	isBXdYqQXoFSO2slpi57P+DMwvzfTc08S4MRMi+QnyAAtSLrwktmCIfo6pGMW8hjA7nTnB6jZJF
	4VPMR2foOBJ/mgKp5FfxSx11+essw/QOptir5TJ0yj6ULuteWgX+dKA7UL8isBAd9EiLCxKrLv7
	ogioHI9bjnyfkRueXZ5BRlY9IpF2BYdg7VaJo9TVqSYRNtaeWdZrk5fj7UeiiTV0AsoOiYHMcKg
	HcVyt+FIvDJkLaDQHX3Nnhca7/1asOu+01+QtNyORlHk32dpbk5UiI7gB+Ykq/KjXosvPytpCby
	+B+OH4=
X-Received: by 2002:a05:600c:820f:b0:495:52fc:e235 with SMTP id 5b1f17b1804b1-495532489eamr14945385e9.15.1784364808785;
        Sat, 18 Jul 2026 01:53:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/17] rootfs: move tasks using image_list_installed_packages to postuninstall
Date: Sat, 18 Jul 2026 10:52:52 +0200
Message-ID: <969b05635199c164d75c8f1d73ee1d19a7f90ba1.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241250

From: Peter Marko <peter.marko@siemens.com>

Since some packages can be uninstalled, any task querying installed
packages should be run only after both installation and uninstallation
is completed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c3097962ac925538e99b17b771c541950a8b8c26)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/license_image.bbclass | 2 +-
 meta/classes/vex.bbclass                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 95e0a9ba2e0..1ecd8f88bc7 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -353,7 +353,7 @@ def get_deployed_files(man_file):
             dep_files.append(os.path.basename(f))
     return dep_files
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "write_package_manifest license_create_manifest "
 POPULATE_SDK_POST_HOST_COMMAND:prepend = "write_sdk_host_package_manifest license_create_sdk_host_manifest "
 POPULATE_SDK_POST_TARGET_COMMAND:prepend = "write_sdk_target_package_manifest license_create_sdk_target_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 4c36cab5815..71be705fc10 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -211,7 +211,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

