Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D8FC0219D
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 14:09:58 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.96072.1726322989589019769
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 07:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOi2ORQW;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-82aa93774ceso166706539f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726322988; x=1726927788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z7f7qfaxOgkL8vowgOO8ch3O5fdsx0z+wnrgtHYLW0=;
        b=fOi2ORQWNjoIRilDluIg6EfmYcckUo5l+zZEjDB93CBdBQUEsyYSnhWqNX7Oj5UTBd
         eePleu0BPj6+++bOFubNVmjiyOAB4UX1fx4yGp4xe/KwMvlVHTflcKbAPIqERcDI6VVM
         XZ0hVjwuoXhR+NpiSub3mb0c50pT/6npjIjhEasyOtfoU4UbSxm6Y72FM62x+ztkn0Jy
         RoiYLWTy3FfygiA2o8VhdY5I6L/Xgj83LyF/6awJF4FHXohLjNgzGr+A596slex8qhlT
         cFFg6+2oauS6UOmtroGUCGxGEewfE/vyQjXP//0n7Rr3UWW6kph4H4r0pjTZsb0gtVM7
         NB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726322988; x=1726927788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Z7f7qfaxOgkL8vowgOO8ch3O5fdsx0z+wnrgtHYLW0=;
        b=VCzyUA1B6/OaNpnRADPUCUAwkWIlAzRKRPaTuTP14GoKU7u1I4sUQkeFOGLfG1dRMZ
         mKrU8uVTzbRM7F9JbdHdrYZEAPEBOVA5EMOX5IuJ2DpGTNdMvWnT+gHTBTHW57ZIp93m
         ZtHGJJ7LrlvK/enjd4NJvpbtqoCfQrJwVQ+LZR67/WGsJWuDIQ9Zix5k5vAVGFRf14SB
         qaTuUJJxfw1GdEvJdyeDsl6KZisa2l6rv7yreAfGPQb1e4WcWKZPf6URj6SDPSyKxgFo
         VMd6z2FdCWWpTPLXiNdQQZIohd6elrIIJ7JR3qrx4xNSEO7yH732hDbzAtvK+wFjGZKO
         fBoA==
X-Gm-Message-State: AOJu0Yxg6rsdUD3jp4So/Wq3vqhHft+r8elRAK9OhbFfRshHFqucmehC
	FUwQa42A0ChzbaH8IQRfhdwaZyPN0ZHw8038g+6qzOrOCM9Uz1eavp/ghqwZ
X-Google-Smtp-Source: AGHT+IG/x+NJX13P2Vw4plkkHA4wFi2gN/qlx3omNiXTKOuw14PCRp5apNqncUIzYLm90iPPgffUww==
X-Received: by 2002:a05:6602:6281:b0:822:3d11:106b with SMTP id ca18e2360f4ac-82d1f8c45ccmr1035074439f.1.1726322987953;
        Sat, 14 Sep 2024 07:09:47 -0700 (PDT)
Received: from rehoboam.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d37ed1904dsm417230173.108.2024.09.14.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:09:46 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] udev-extraconf: Add collect flag to mount
Date: Sat, 14 Sep 2024 09:09:33 -0500
Message-ID: <20240914140943.8349-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 14:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204494

Adds extra "--collect" flag to the mount command within
automount_systemd. This is intended to fix an observed deadlock after
rapidly inserting and removing external media. This is because if the
mount command fails, the transient mount will enter a failed state. The
next time the media is inserted, automount_systemd bails because the
first consition finds that the file path for the failed transient mount
still exists. This leaves the external media unmounted and cannot be
mounted until the mount is fixed via systemctl or the device is
rebooted.

Adding "--collect" ensures that the transient mount is cleaned up after
entering a failed state, which ensures that the media can still be
mounted when it's re-inserted.

(From OE-Core rev: f0cda74d73eb8c14cd6f695f514108f1e94984a6)

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index c19e2aa68a..eb84a468be 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -98,7 +98,7 @@ automount_systemd() {
         ;;
     esac
 
-    if ! $MOUNT --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
+    if ! $MOUNT --collect --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
     then
         #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"$MOUNT_BASE/$name\" failed!"
         rm_dir "$MOUNT_BASE/$name"
-- 
2.43.0


