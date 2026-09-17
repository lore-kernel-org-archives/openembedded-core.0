Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE50C982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 08:27:00 +0000 (UTC)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34723.1789633611282096705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 01:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q/lQQyly;
 spf=pass (domain: gmail.com, ip: 74.125.229.204, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76462aae9so348781e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633609; x=1790238409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1L2chlVEyaguijJTitVF12qmGigcg9wAPJM2X0ldHnU=;
        b=Q/lQQylywAJvTPKxHrSRdT7XTs7AnlTcmu/2VX/sPhMbn8Ycw4ghzUWWz3mrWeIjdB
         MyZ9mzepzzOHEj11bHHGJYyreOmb1Xwocb28BFESIaSto+vZY8ipq1rKAcEPv1ycPqFF
         O5TzEBp31vJbnu67m2X1WsOpZCkZbCc+lcvP4al67Xjtv5q9rjlT6YE57jmMpmOdAKmh
         tXwRucBBrFbatX5IlquF857IUUlaOgCnfOHsA/jb5gvOyvnUtYzWwKYdvqXqdyMfrA74
         v3+VJy4xQ+Ycq4qpfDf454CNUO0jGBC6oMR+8K2Xd0+aLi6lg6jruEpDMNzERFzn/HQ4
         dgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633609; x=1790238409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L2chlVEyaguijJTitVF12qmGigcg9wAPJM2X0ldHnU=;
        b=QeaeS4Re8kDP55zZ30twgA1Wzvf5gE5X+18Ge7vlpANnbB6FmFuD5u3H/wR5iV4Hrl
         8sz3ZkECk/DJV+jnP5DdnyYb/bj2nax+KYq6xSOI6HTCkv8+Z91u7gjcKX4qgXyryB/h
         4w9lgy1jrIu+2A0XFKlvc7iFJxsXWLzk8wSGh+KZB/D0ZyGroXm5QO83Q3U+BOHtPNHC
         Oj61l6LkmAFVSJ2+n3PbqagUXYyR1KwdnkPXrXlLM5mVEramOjRvyQFpQWyDEKMoDGlj
         TSFS2Rtjsgd5n7jyOdtaUJhS9+3G6dqOB5eQgJ6jhx7dqxKq2kkXCPV5R3BKRsEjm+si
         2yqg==
X-Gm-Message-State: AFuF++mdcMWauvC4hkPXlWSIucZaJpM4T4SaD3QssqfLYyvNTg4ygfd5
	cGdquRtIo8iu0gZ7b7EuzzHe4u2UktKnh+FvlmZXTkl27wU/EglmxQjvUeMKEg==
X-Gm-Gg: AYBFou1WTNMN+9o90o+v9XXQN4f/37XMyx4JRPC+H1pgKHb+UrAMhq8KMDEOSmk4bX0
	rgq1frq0UHPSkXyZKTaBcz2flGY+DESN+WvnfbE3HWaxIFSUAgVwM3+7TF3o5zFQXvlH3dea8ol
	PX7r1lDmDeCdorowS+lQeq0Sa0H90S5kSbN9LF0XEhc5H55kdtX3dc4uhWq/2jTRvl63MlL6YBE
	stN3M5d9n/4kWYXzGB5YLSPupWTMGBBMuuuOENvBiEumFRxYH5sG91pyGTuQRhl8dLXJrsCxq39
	fC4zIBeX7zBD8v93CTW2/2Y9QSWxgPIr2TwnxIIfux3IazUivVHUxo8zCLZctZZr4bxBy1kNrd2
	GeNvU2XbYiAbNW+YiqDhusc2i3fhL28zhGmctjGzCstQXSWNhZioZhPxJcSEgeZqrqJHBcuQBEV
	mbzfnzmhEhobC08ziSvnoZkgT6dSF+7JX/QYwtqX9f4QmxEo79lzPj3KTu8pYSfgaGKWMpCv9bL
	LPo67W+R0X1Rx8Z0FKQUaumMnV+5EWdp74Feww8tgQl3xhLtGaY+aRon4zKgNfhcs98XM965DK5
	OI5O2L8AB3I=
X-Received: by 2002:a05:6512:3d02:b0:5b6:1a7c:32 with SMTP id 2adb3069b0e04-5b8b6656a6cmr1655139e87.53.1789633608641;
        Thu, 17 Sep 2026 01:26:48 -0700 (PDT)
Received: from localhost.localdomain ([176.40.225.86])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b5789c31sm1632161e87.9.2026.09.17.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:48 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] rm_work: Keep do_populate_lic_deploy stamps
Date: Thu, 17 Sep 2026 11:26:32 +0300
Message-ID: <20260917082632.1006708-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246046

Fixes [YOCTO #14946]

rm_work removes the do_populate_lic_deploy stamp of an image and the
task runs again on every build. Because IMAGE_NAME contains DATETIME,
it writes image_license.manifest to a new directory and moves the
IMAGE_LINK_NAME symlink there. license.manifest and package.manifest
are written by do_rootfs, which does not run again, so they are missing
from the new directory.

do_populate_lic_deploy does not use WORKDIR, so keep its stamp like the
other image task stamps.

Rebuild of core-image-minimal with INHERIT += "rm_work":

Before:
NOTE: Tasks Summary: Attempted 6025 tasks of which 6021 didn't need to be rerun and all succeeded.
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917071112/image_license.manifest
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917071112/license.manifest
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917071112/package.manifest
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917074853/image_license.manifest

After:
NOTE: Tasks Summary: Attempted 6025 tasks of which 6025 didn't need to be rerun and all succeeded.
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917075639/image_license.manifest
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917075639/license.manifest
./licenses/qemux86_64/core-image-minimal-qemux86-64.rootfs-20260917075639/package.manifest

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 52ecfafb72..7cb8a325b2 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -77,7 +77,7 @@ do_rm_work () {
                 # Promote do_image_qa stamps to setscene versions (ahead of *do_image* below)
                 mv $i `echo $i | sed -e "s#do_image_qa#do_image_qa_setscene#"`
                 ;;
-            *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
+            *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_populate_lic_deploy*|*do_build*)
                 ;;
             *do_addto_recipe_sysroot*)
                 # Preserve recipe-sysroot-native if do_addto_recipe_sysroot has been used
-- 
2.43.0


