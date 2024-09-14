Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699ADC02197
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 14:07:18 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.95986.1726322833825624168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 07:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NPPX9zhs;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-824ee14f7bfso109333039f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726322832; x=1726927632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDMHBciWSiqQzhDGp6hZoI1SmxvpIKrVWFq9OdZyZEA=;
        b=NPPX9zhs5vdFzX1Q12qvwc2YBgl9gKLbQ+4t/2N4Z3J6DohgFX82hJ0omSB2cXgx/s
         av7JM3qE/nB9dHRxTMLzVOnwGANDl5P5tQWTaGcJ9siUAwBBe1ZELVlqQp2W2C6qoCOw
         TMc86Hi+UOZl/vdJjSXCWQ2ksyIzvnubQPP93Vbq8L4qmVa8gZYVVdW//6ed2Fpi3U5S
         Y2rKxQba+2xOLM7fIr9V/1PNK+wkiBIdlr61h3LYGuyRdHe6YA4JIP7W6NcBfl83HYy8
         fRhMaGVYjaDhJhMhTeKFXbjochwnr4Gt+ktkTjcO85IT+WNQXBjqHJDDn/Kd8Ys9Vp/w
         qJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726322832; x=1726927632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDMHBciWSiqQzhDGp6hZoI1SmxvpIKrVWFq9OdZyZEA=;
        b=SLKY3Vo0PTlXSu/I4vojLj5zbfwbyIU471QeZVSGKdXjBwwButa/foLDAFnap7jovR
         VdNBDoRW4aX/ZdNR+wD7L2S7uaAAjbUG/pyof3m5dlJI9xdfqTnpShwxrz+vUCLAp/3O
         NkW5o2LuzbNNeO+9eIDf5PBsFdu0KSnYuvtHUJxYWx1w67Ko/yHwVQk6zNEMZBwun9oK
         JQRKIO0t84J7rTyGQDM87Gxa2PmREEbCS0Fo5WyjawWISs3aYJNJZyATcJndQSrSKrV0
         FWOVJdGsBb7Ot8qC161vIKtJodd18X9ej8XbFlqwR2rbgQnrBieDs837JhQWJnnDIoiU
         cmhQ==
X-Gm-Message-State: AOJu0YwlBK9mEmLBpxWrEFBsnIj5O23zto4LTVDw2o73MPG6WtUA5Cm8
	fkanvbIHJjzPhHDDsur20kXXLHfqMCKxZyfUGukvNsWNrc0qh0PRgLN4760U
X-Google-Smtp-Source: AGHT+IF003cWsbK3SGyclHsEwOeVtew5cfkZLvHHbcB/JXPJxa8SszpuAhLtpsrbXE9aCxJwedC7Vg==
X-Received: by 2002:a05:6e02:1605:b0:3a0:986e:e112 with SMTP id e9e14a558f8ab-3a0986ee358mr13133745ab.23.1726322832099;
        Sat, 14 Sep 2024 07:07:12 -0700 (PDT)
Received: from rehoboam.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a092e1b77bsm4494795ab.45.2024.09.14.07.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:07:10 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] udev-extraconf: Add collect flag to mount
Date: Sat, 14 Sep 2024 09:05:15 -0500
Message-ID: <20240914140706.7770-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 14:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204492

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
index b7e86dbc0e..a87619b181 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -83,7 +83,7 @@ automount_systemd() {
         ;;
     esac
 
-    if ! $MOUNT --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
+    if ! $MOUNT --collect --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
     then
         #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"$MOUNT_BASE/$name\" failed!"
         rm_dir "$MOUNT_BASE/$name"
-- 
2.43.0


