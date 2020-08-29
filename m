Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.4724.1598670549930846990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 20:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=JVo1ZGeB;
 spf=pass (domain: emacinc.com, ip: 209.85.166.171, mailfrom: mgloff@emacinc.com)
Received: by mail-il1-f171.google.com with SMTP id m1so2314713ilj.10
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 20:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CsKJisaK1oRGDQ+cYoy2B6Jxv9kNQHaQzdrD9eYXCE=;
        b=JVo1ZGeB1uD3FVQd9P4gQRQuOQLI3jO1+gpXMYNtM0C6RjFOPg4zIU7E+5kod6fCrG
         7Po6jf8AQc0iDQ8O7o8qjaVkUSZ/VBZwNkzol7oF3ptfFjHvZZL3mk5CG29ZJVlo7oUz
         DL459vYVEjT9OB1tlY6r2zxhQIk6idgEal/PFjZUQBEOFOK638megfKxlmw7aL6FRtG+
         hWi3PiVz3152JwNoGXpJYi5rZ3FKYq+vuMtXRV1AD8uHRmLn1mXaEu0dFr519XQGe/q2
         qWcnyXVdRrR2J/uLp4tufn30F0LmTrTxNcJm1+rtgPhprh4dcQa0/85oyBheBUmJ1YtD
         9UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CsKJisaK1oRGDQ+cYoy2B6Jxv9kNQHaQzdrD9eYXCE=;
        b=k/vGXMLQWTFxFVxZtoFnmT893Sy5unuzvQ7r56PuuudgHUnpYJjQV+XBYg/gp1STKW
         nrEfaCWHsJeu3GJSkUZyXFa+p/mBbOv1TN5LSV9mQAt4ZA5eHQFp8n3DVji3ax7Fokhd
         n3D72G6IA4WJANYZlq10WXHJ1ab6m2uMycAM+hX9yvms1mGF08hNfpegy3gi8ajp5O4l
         Q7CxvFkcQN1Cyn/oP+ymGVgSKFnpd8fCUJBF8MY8eFVnYbZtun5SErnIJMf6nRGqwQZm
         BGRppODQVi6pgQw94MajAV/WwtBN5i3WExw3FfCYB9PYuwQz8Dyfr1/3xau2Idjx8xgC
         DlZg==
X-Gm-Message-State: AOAM5311UjAlU710e51HJSp8BRcdaN+hrQXsKJZenrl4LVVXz8CDqRDm
	MvO9AfbBSJQRkKTeFTQ+haaWK+j8coCHLw==
X-Google-Smtp-Source: ABdhPJwDjqmFeGPKE1oKBLxB4McK0SIkZjd5BRQsSXU/xEupNQWcvu64fpoayBANNZz5cGjUHarlsA==
X-Received: by 2002:a92:d342:: with SMTP id a2mr1543195ilh.16.1598670549006;
        Fri, 28 Aug 2020 20:09:09 -0700 (PDT)
Return-Path: <mgloff@emacinc.com>
Received: from Shuttle.mediacom.info ([2604:2d80:9f80:9700:dbc1:b947:539f:e0])
        by smtp.gmail.com with ESMTPSA id b14sm685785ill.30.2020.08.28.20.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 20:09:08 -0700 (PDT)
From: "Michael Gloff" <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Gloff <mgloff@emacinc.com>
Subject: [OE-core][PATCH] sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo
Date: Fri, 28 Aug 2020 22:09:01 -0500
Message-Id: <20200829030901.488431-1-mgloff@emacinc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psplash expects the fifo to be in /run or specified
by PSPLASH_FIFO_DIR. This patch allows psplash to
quit normally. Also, fix the work around of using
echo directly into the fifo and use psplash-write.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 7ca41ae1ae..fd1fdd26ba 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -26,11 +26,8 @@ startup_progress() {
         progress=$progress_size
     fi
     #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
-    #if type psplash-write >/dev/null 2>&1; then
-    #    TMPDIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
-    #fi
-    if [ -e /mnt/.psplash/psplash_fifo ]; then
-        echo "PROGRESS $progress" > /mnt/.psplash/psplash_fifo
+    if type psplash-write >/dev/null 2>&1; then
+        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
     fi
 }
 
@@ -176,7 +173,7 @@ startup() {
 #Uncomment to cause psplash to exit manually, otherwise it exits when it sees a VC switch
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
-        TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
+        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
     	umount -l /mnt/.psplash
     fi
 fi
-- 
2.28.0

