Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.4550.1588176722093344963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qA0bMRxG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id s20so999214plp.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tPgjDJvAzoPYtUCVG7afMENFTM9/1VBBLPFOoY72kSQ=;
        b=qA0bMRxG1rWTo0V9uZ8B1PJeQ7CUaeqeAmaf2l1Q4cRND0QaKiUMmxmyGn5Q+of2Lk
         J2+n/vhIkHnEOIXw+dYSIrc5aFnJTUZ+NaJeNdiFcmxRYxK8f/NBeBkipafDLpPX2VDj
         E+w3qBskJ6ZdvcSJzPxJOCq9T9b9Qdteb96madLGmsjEtlNAIkTXeJrc8rekVFZbt5KC
         Pn/rv8d57gPc5AEkZ8Hr3hkyJLC/WSQ8IHnUOHmBsj4+WPovh9rxumAzVeQywxUMdZxf
         jDm4oO2qEvn8wO2zLI/AoiqTwEd0f+OiLov2+rwWjm+FUZjyZHYP68KGerUmU5Gqxmpa
         pHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tPgjDJvAzoPYtUCVG7afMENFTM9/1VBBLPFOoY72kSQ=;
        b=jrnboTDMkfcghXjahMKG/C9t01gNpE6XENdahhTOh7yZVW/ZoA7vGZ12qDyYRw9CKn
         2fT4u1MF06iOW/Ag61VPPThT+jvd1h1aDR9AvWI6L6etRResW9eSIrMNzRIAcIhLNrE+
         iT5FFCVFqtpjaMQWc+rLUlAAKCrrqcjMlHHMu1ymUzHpnO9OgyFAB2NgF9YXuZenyQ6n
         EjMFlvR0LyPkQAYzMgYEnLLcZmn7zO7gmpmgUsFjl7SftMyxbWxdGXOjoMWWLou0Feov
         HjDhsELx3rWoha9eTLj7rcAx9HoZvEGwKxguo/L0QPpfHuF5RA7HGc/K5pUQP2XA//jL
         BQQQ==
X-Gm-Message-State: AGi0PuYk3YDyAOrhhQrv1gPo6NcfXZn2dkCv3X2GR+2QB1kjPHfIhY/D
	lyH5BwwcIomgx/z7Ird+TvVFWREf9QUP8A==
X-Google-Smtp-Source: APiQypKvXrnfmyKC5nEWDseiqN4ApLjqo8UurySP6ivX/mX2/GpjRCMotfGwdG6XdtGgjNBloFFXjA==
X-Received: by 2002:a17:90a:8b:: with SMTP id a11mr4029313pja.163.1588176721014;
        Wed, 29 Apr 2020 09:12:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:12:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/16] parselogs.py: ignore pulseaudio startup warning messages
Date: Wed, 29 Apr 2020 06:11:00 -1000
Message-Id: <14d2e822d82c9f1aff50c6e260be8068df8bd022.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

If set default syslog to rsyslog, we can see below messages
in user.log,

[pulseaudio] authkey.c: Failed to open cookie file
[pulseaudio] authkey.c: Failed to load authentication key

They are only warnings when cookie file is not found. And
PulseAudio will create it if it doesn't exist.

refer:
https://wiki.archlinux.org/index.php/PulseAudio/Configuration
https://lists.freedesktop.org/archives/pulseaudio-discuss/2014-December/022719.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f94387c8bc..a1791b5cca 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -58,7 +58,9 @@ common_errors = [
     "Failed to rename network interface",
     "Failed to process device, ignoring: Device or resource busy",
     "Cannot find a map file",
-    "[rdrand]: Initialization Failed"
+    "[rdrand]: Initialization Failed",
+    "[pulseaudio] authkey.c: Failed to open cookie file",
+    "[pulseaudio] authkey.c: Failed to load authentication key",
     ]
 
 video_related = [
-- 
2.17.1

