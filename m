Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECFDC5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.8806.1748619622140824839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2MK5MIW8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2349f096605so26500465ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619621; x=1749224421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsjulOhSvTsLkZTyojqxgT+inFu6FmoAgxQHF+OiG5g=;
        b=2MK5MIW8B0O0Tjk0GgSN6FbgS6CPODx/9JwfgTjrNsryWwOMzOz0My36SzEiNvHokc
         ciR3hGxPFqut6Ub3Ixwek1OV4qpBhgBHszCrM7pYgHF7vGjEVOtcqDuUwXC+0dC13N5V
         hPk4zJxLWhGQ/9jPyMk8XFhcepJnE/+s8HKHCZDAgsm4uDKkMWW99iK0lsbiT3jctIsg
         O8HBnbnifiJSCIfgoZvO/6eiB5XBwEOlg2qB3I8tU9EVZc4M3S+svBF6Bp/I03xmlje8
         BD+SqmDV+unpdy09krWNMPBZSxL0RZzY2N7rQa6q7yaPHgtIFUPqL3066U/r3f37pIAJ
         8zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619621; x=1749224421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsjulOhSvTsLkZTyojqxgT+inFu6FmoAgxQHF+OiG5g=;
        b=R22sJ4UOI5oUCoiwpEVmt6OykuniYHSdqbu1tyd1W6TextD1iCRUC7J5lSx+bLL6JE
         7MZo48xaArCOiH05pcrCkYRnbGUMFoarZ+3e8FWX7IMoICtlbXA2ckomRnFidHCJy3Ox
         V2F+g4b/MJZ8BBnXFRET9ZyZE1pBD48tKa2oQPwFcYPcCl7FTPJmeHQVaAeyGC1775OX
         JGOxNpIXLTesySzrDHfUq2IcRikv/4wCHdpAM9nl+2RRAyriHpx7lKvGX2B2nNDO5vyK
         YplAxuS9Rma81ncmnYnKMC67+xEbDbKcAOAmj3NVevIuAUgV33mYgkfTdoNMbyzWA1m7
         of4Q==
X-Gm-Message-State: AOJu0YwOCS9bVjFdDG45eVZeVFJ0C2zkpbR5H+LREOheJDejkcSjtRYr
	yDmLlxaf2xEeiHDbJ8OojFaag+hZDWltrmR1hg9WaoKRsobvzOhHktZ2DGX2fI/WDh+dfZLErCE
	TLVOn
X-Gm-Gg: ASbGncvyuWgsqhJskGSKrKxmS4Qi6O+uEk92d+jhwKOivOCzRo0wAR+d5xwybJyCIp0
	XXQYcA4Nms6wHZHbDsV/AbT/N4iD5+MOJLJw3YWACyjQxcjx53JkbOYgol0rqUw9p1YwZqYVEu0
	ZyVvg0c8Wt5R4kOcVmNAcV5EXmdTgH1vjzv43PvpgwLmQbU5pPNq8HUiBj2ZJ51JZpsa0HJFDsR
	qYASojN1/N8FQWqcA0E044ToXkS663JNvMghxeJB7BcOayU6DkMwKlr0nMBKHFX/Si9TZ9Tixhc
	4GEfBNAv7iGcxX0QoMsCh1nEDH3G9eOJ0AW7kWIZ5tE=
X-Google-Smtp-Source: AGHT+IGwmUzZNu7sh2bMzepB5gJ9/CCdCHkwbolxL2VCnLytoO+Ds5c4fHtPtoW18BzAcjxQv9BYOQ==
X-Received: by 2002:a17:903:234d:b0:234:a992:96ea with SMTP id d9443c01a7336-23529b4ae4emr61561515ad.43.1748619621219;
        Fri, 30 May 2025 08:40:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] nfs-utils: don't use signals to shut down nfs server.
Date: Fri, 30 May 2025 08:39:53 -0700
Message-ID: <415e73d53e5342f3f6ff6acd521ded2df3fbca1f.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217520

From: NeilBrown <neilb@suse.de>

Since Linux v2.4 it has been possible to stop all NFS server by running

   rpc.nfsd 0

i.e.  by requesting that zero threads be running.  This is preferred as
it doesn't risk killing some other process which happens to be called
"nfsd".

Since Linux v6.6 - and other stable kernels to which

  Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
  signalled.")

has been backported - sending a signal no longer works to stop nfs server
threads.

This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
server threads.

Signed-off-by: NeilBrown <neil@brown.name>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b09ad289a36)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 0f5747cc6d..4d78312929 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -66,34 +66,14 @@ start_nfsd(){
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
-delay_nfsd(){
-	for delay in 0 1 2 3 4 5 6 7 8 9 
-	do
-		if pidof nfsd >/dev/null
-		then
-			echo -n .
-			sleep 1
-		else
-			return 0
-		fi
-	done
-	return 1
-}
 stop_nfsd(){
-	# WARNING: this kills any process with the executable
-	# name 'nfsd'.
 	echo -n 'stopping nfsd: '
-	start-stop-daemon --stop --quiet --signal 1 --name nfsd
-	if delay_nfsd || {
-		echo failed
-		echo ' using signal 9: '
-		start-stop-daemon --stop --quiet --signal 9 --name nfsd
-		delay_nfsd
-	}
+	$NFS_NFSD 0
+	if pidof nfsd
 	then
-		echo done
-	else
 		echo failed
+	else
+		echo done
 	fi
 }
 
-- 
2.43.0


