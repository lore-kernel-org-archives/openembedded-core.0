Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FE4C78853
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.18450.1726839581624180201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y/Nw35yR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71798661a52so1639463b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839581; x=1727444381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBExsiEe4YWWmFe8wZidS1x9VrnOys/4FFkzmDhWdbk=;
        b=Y/Nw35yRDbWTvFTyEgduDi5B+WKQhNa2PwjLod/FQYvRdFG/fQho1W5wPt/sj8O92I
         xbygv3LbSgx17Ogl7QsnnxlYD7x0GrZfJiOJguI3BRN05AAWeSgIxwQAcnnkY1zSBlCA
         /DjRaYrY3uBcMYRAcipcB66GU2mnKmf1nVrJsYZV/vPStIAHf6PgUI9t1dSbJX0942Ch
         LZAqFT4VwN0IpmtPNfsWWL0OBCdw0Snajxm90r1v0DOUG/R0OLaN1L/7vXhFS3C5AJlp
         ppJXdnWfLo3Y4isLsVIdDjORhxvelVi8uL0yDl1ovEqvOExVfAOFgoiPsWl1IH+Wxvci
         ZcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839581; x=1727444381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBExsiEe4YWWmFe8wZidS1x9VrnOys/4FFkzmDhWdbk=;
        b=PdDgZIHull2+GrlMkZaFMvF4TOi1zVSAUOSxpcM1OEOgHJdBrkL4pA3n/uZ2BAU2iC
         PJof9jLf29qCFvIev/5wH+mOD/9Q7xKI4AmDefDyQRgUp3mANhRsQKg0t6EnS/hahp5o
         nl41IXPC6oUZfFVAEeHsffxqfuaVhacb6PtjyYAvI0tH2AV1hoqUSXjVSXvLrtiQGS+0
         bN4nyqeCy/6eieUXmRon20/sAdmjBqIRGG8XyIjJcRrHzTyIyiYlI6LYdS0q82y+HO0U
         sA6LNj+id2F7ZWsSHciXLFb73iVhmVCYCc1NmL5P6QI6y9WEX7IJgpIc9tma3L1oA1Zx
         HuMg==
X-Gm-Message-State: AOJu0YxsxNPFNxY30UqHLea3c7q6ztFPiflkcaqVjWSM0pJPCWlCc1AZ
	WVm2Jw70Q/Sf22Gmlk3POXAsIa0AWPZvwYhV1N7/bvtbeFdokMtdlryrZUyZ1Blp0kTqnZzDxNW
	a
X-Google-Smtp-Source: AGHT+IEAY5rJK04oXDWPzC1A1chnhD8nxN11+BlK5kujaCmY8pjgp6IXVtSA40c+3JAZ8Oi6ygyf7g==
X-Received: by 2002:a05:6a00:810a:b0:719:110e:fc8f with SMTP id d2e1a72fcca58-7198e2436camr8887718b3a.1.1726839580832;
        Fri, 20 Sep 2024 06:39:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/16] udev-extraconf: Add collect flag to mount
Date: Fri, 20 Sep 2024 06:39:10 -0700
Message-Id: <33de458b758c2fe430b515ff419dd200ea97ca0b.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204751

From: Colin McAllister <colinmca242@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


