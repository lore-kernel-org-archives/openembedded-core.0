Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCC9C48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.18148.1708013925742776131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IH8To6tG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1db640fc901so9610375ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013925; x=1708618725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNQn2rIlZFBEM3K2eXjSEsPDqb8QZTxumtsuh/0KITg=;
        b=IH8To6tGiWw1ag5CUPBp/vY1tJVylXmYRoF1lCefyT4pC8Az2Z+7S/weg4wqApSKZR
         O4EWBGebOfW07NO+Eb38rJa0UKVQ4Db217QP9WvS/IvJU48/mP07JAqnzXOoCm0D2u3G
         WpJ9rfIgAriUz44iftpREXYD98ryEOIia1q/AGG6wPgywT8UE25L62V+7C8EbDscg0a4
         ewYJD9zO23Qz7p91OrWLdyPzSyW4ZHhyko9MWXp1N6gjVRebLNC1HAS+2CsWhazgUVmP
         WwBTNwd876XxPAisfbHAznyDFZOiU+fyreGUL7ER69R5B1UU/tsS/hikWLyvoJ8mItIz
         UbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013925; x=1708618725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNQn2rIlZFBEM3K2eXjSEsPDqb8QZTxumtsuh/0KITg=;
        b=Y5HhQOrJkIJEfPs+nZ6F3ohVgmd3pRVFFPXad6cPnr+iQ5z5vfxpRI89J8LEm17Gbe
         WRolZxAlm9m/pZLccJAexj8QTyXnfnrMuDhLX12RS1AHGQWOTWNLoToWz6/053O4i4pS
         Ch4xJ9s/Uy4lXIaY4uGW2BtP3UH2tkD91o01FMYEG582lcEDWSfn2Q2V86RLBTKVCe39
         F3SNsg5KA+sjTIJQv0+gHg4ZtwhkeMQgXMPhVQM6fhjeOnEffr4Fej8/E6tOhfhS1wrN
         WTAZfbsccfTCspQXo8sNZoC5Aea4OoVYGjW8/2M8JzjS6mcbGa4tkLJfDo8TPAU22okm
         QN4w==
X-Gm-Message-State: AOJu0YwxMt+mtCG7pRt+pbF1Jv+S227gDuKEBhduDns+0eNpC8j8ZACm
	7SDxtkdmsOpkuu/Nd8AZ/yksb1KmIeQrXHH4MgbN8h5Rpe+eMezhUZGgJPdjODLsyJzg/6Hff9a
	VWrQ=
X-Google-Smtp-Source: AGHT+IFjcWPnIJnTBVONRU8KHeJfUV81h7MMTCWvvqTOgvBamTTkbehOTMXVDl4WqzZn3mbT+fOohA==
X-Received: by 2002:a17:902:70c3:b0:1d9:a2d5:a113 with SMTP id l3-20020a17090270c300b001d9a2d5a113mr2010426plt.67.1708013925097;
        Thu, 15 Feb 2024 08:18:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 18/21] udev-extraconf: fix unmount directories containing octal-escaped chars
Date: Thu, 15 Feb 2024 06:18:01 -1000
Message-Id: <c3c31248233356a04db1d5ed375b647656d80fa0.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195538

From: Jonathan GUILLOT <jonathan@joggee.fr>

USB devices are auto-mounted in a directory named like theirs labels.
Special characters like whitespace are octal-escaped in /proc/mounts
output. Using directly this output file as an argument for umount failed
and the mount directory can't be removed as still busy.
Using printf allows these special characters to be unescaped.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37f17625d931a06888388682dc2b1f5a2d298125)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index b7e86dbc0e..6cb0a9fea8 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -196,7 +196,7 @@ if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [
         logger "mount.sh/remove" "cleaning up $DEVNAME, was mounted by the auto-mounter"
         for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
         do
-                $UMOUNT $mnt
+                $UMOUNT "`printf $mnt`"
         done
         # Remove mount directory created by the auto-mounter
         # and clean up our tmp cache file
-- 
2.34.1


