Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.11768.1608743196066854369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 09:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8LA+aVp;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id c14so11733780qtn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 09:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xZxf4tEQPZ3dfUl50VOwMx0etXhgd/BkDFkVCxGTV9U=;
        b=q8LA+aVpONPBNZm8XsfW99rcqXT5j3GegbTtdnq/u+oudymLYvRihPY2pWW/QxVvSn
         aES/I1C6DD+EePQe1Dmd31l8b6Pemzrala2pkONVwEMaUNNPUZtWmSj3iMO6lfOXQl7I
         SKRe3pw04SUVJj7/heTAfESpcdidGcBvDHk69bHSIT9ow4UNVQDGNB9za3wErI2Yymog
         ju9xvv54s+qRgpHgZeLwMFXSN3p2MRQAJlvicXaENXDLMe0kVu2S2UmsBBGoyVv9CP6E
         V2QieoH+iChKI29SvFYuUToz+w8Zn/VlETXutfwUl9Ey9AhHYEoTVlRLMgA1eoGTXxPA
         T0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZxf4tEQPZ3dfUl50VOwMx0etXhgd/BkDFkVCxGTV9U=;
        b=R9+jwWgNtwVCsTAarfAbZ6v8TTN07P9TRxim8AayGY5DvlVyxHwiJ5I+C/PDUhGIZt
         h77NcayJmBoLIyUyZhUP3+hDdffhFeF6dnIWG2nvoE035/U0edr598jrPd4cmXTM9sSJ
         t46XlRMdpRaCZn3hFi6+cQk0vedEM9I42CcSix3kgicn8vahbsItq72ThOlXtVCrE6AP
         2YULy5bJZFYHxLsjx0kvB6CiRnOEGYLidY3RRnSqyc6shDe1fbx6qCHoSmB6K5w2ocPp
         HCx2ueCrcbFbV8W6eFp7r2/5oJWd3p+MeRT8Jicdg1FgrFFMPnWtsDH1DtvbVB/61tV/
         qJIw==
X-Gm-Message-State: AOAM533lIoKtFNducqh4YO3TwkImoezN7w4TzNpSoCaWuX87ZXE5LYqq
	ANPPX8PjUqx+y3YW45eRfJj45BhBXbRuQg==
X-Google-Smtp-Source: ABdhPJxKS7Z2+qXB8yitTRtslPAqrgUBZiFa/N1yFnEutSpvXOJ21fAi7aDBrAE9mWkP66qn9DZfUA==
X-Received: by 2002:ac8:6f04:: with SMTP id g4mr26399226qtv.122.1608743194966;
        Wed, 23 Dec 2020 09:06:34 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id r8sm15172613qtj.94.2020.12.23.09.06.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 09:06:34 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 3/3] sysvinit/rc: improved progress messages
Date: Wed, 23 Dec 2020 12:06:21 -0500
Message-Id: <20201223170621.35727-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20201223170621.35727-1-twoerner@gmail.com>
References: <20201223170621.35727-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I noticed that the progress text messages were always a system behind; i.e. if
the current boot script was "networking" the message would indicate the
previous script and would say "networking" next.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 61946e56eb..15ff660965 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -28,7 +28,6 @@ startup_progress() {
     fi
     #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
     if type psplash-write >/dev/null 2>&1; then
-        psplash-write "MSG $(basename $1 .sh | cut -c 4-)" || true
         psplash-write "PROGRESS $progress" || true
     fi
 }
@@ -55,7 +54,7 @@ startup() {
 		"$@"
 		;;
   esac
-  startup_progress "$1"
+  startup_progress
 }
 
   # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
@@ -161,6 +160,7 @@ startup() {
 			#
 			[ -f $previous_start ] && [ ! -f $stop ] && continue
 		fi
+		psplash-write "MSG $(basename $i .sh | cut -c 4-)"
 		case "$runlevel" in
 			0|6)
 				startup $i stop
-- 
2.30.0.rc0

