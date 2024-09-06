Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6FEE6FE2B
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:25:06 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.1634.1725636300564196773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wfm818Y4;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-39d4a4e4931so7158055ab.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725636299; x=1726241099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8oJhDJELy362EkxGqxoY0BZXJh1PHrDVbHP7rTWevE=;
        b=Wfm818Y43wN5Sp1KUCj0EEMcJGXUp7Qa5Gc+B9fHevaQleE8yFphNzAVM1Sg2QIrSM
         W7eB3AkoWwl6wjzO4q2ifmKnONBI3E9ypDBtGbjayp3SBIAbKUGPoWTrMYL/6eBzfhgx
         EQijEES0SLCGMf7flpqDwFZkoq2TXaTtzBpX5m9qoWOIL0b4HmecFCKvVUlHqwr4rksz
         jr0/eL6snJJ71IaPJrwHIvUGHbHZSo/HR8Fgrsu1s9FinXVgcBsmbtP86ll8tplNzGNY
         FqSR8EYARmA7OTMSEUIl52Od2id9scci7oi2jWSHx0h2MXyEeqpoBW8ymz21OGO08drR
         NaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725636299; x=1726241099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8oJhDJELy362EkxGqxoY0BZXJh1PHrDVbHP7rTWevE=;
        b=HsIoNqixwl88RBTTL0+v/vG3uHx9xWnb64+1lAHMJxfIQB/yJPt4W0a8S84EOJQyMK
         Hbj6jK/O++Yv3IfyLiSermo27L+NGmX40bYntZmoU4C8j58MKkEpoIrRJLknrMwsCFvd
         L6ut7klZQ7cuHFiXRyBp3yk8RcztAjeaL8lVJRzUbMqIZfg2KXfUIn+DINNwP7kdetmH
         6h6NGSNV3QQ02dA1mVxqNIIU8MPUkI8YnZQ/CMGq/Gxyoko6+DfvgqB6ss30pKduqHW9
         psPg4qSZLUN8ZmAO9iABjFcooumXllnVywKGP1A28Yg2abXJYkZvtVRIZy2LZ3pZIHIW
         YJhw==
X-Gm-Message-State: AOJu0YwODMLkjkvoDuNRRAjAYXj8+JYx52DIpY3Skxx8cvPRCjiysRmU
	joFzjTciFl+ZTVifanMQ9WVj6Yq9cOSRgOUFhThx53GGCqiWUygdEZTmGQ==
X-Google-Smtp-Source: AGHT+IHgjQJFjANZHk8t74kEPfwgnljkbx9pyUD2weWc78xzvKdRsYh3mYzrB8pwwE9MiD+HAz85mQ==
X-Received: by 2002:a05:6e02:148b:b0:375:deb0:4c28 with SMTP id e9e14a558f8ab-39f378ea9d6mr322892545ab.6.1725636298746;
        Fri, 06 Sep 2024 08:24:58 -0700 (PDT)
Received: from rehoboam.tailfd8bbe.ts.net ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39f3afc5f94sm48021835ab.41.2024.09.06.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 08:24:58 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH] udev-extraconf: Add collect flag to mount
Date: Fri,  6 Sep 2024 10:21:56 -0500
Message-ID: <20240906152218.9317-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204276

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

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
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


