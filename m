Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.61395.1600092747888763427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BxFR3G3U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id c196so12890071pfc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Dj2vZZnlR6RlBEKM+5SNCsYqMXCpTNaU84ApGGqgpPs=;
        b=BxFR3G3UJ+3yWYbBeT7iXth54ZAe8BtsxGBzQ3a+oEiPULEae8ia7/8/yYx6EaOf6h
         Z9T/2Q+9Ry5CEbQPspcEGQqM/FFKRXxkxsvDr8lGngBmb1/g6pyibn8KuHzZCo9yUUNI
         Z+MwKY8n8J1m2LzGmXhBACUz1zwUrDpYnTNJ1/tn/MDa8OqmMc1Y1MyAQpqFtHMIPP/A
         zTtTnrLfwddlVuJ9DF9NiOfteVKQZBL8WleNA+GbO8MuRSV/d0S8iY292+Y8tEx2Kkjq
         NbpiRC7oEI/PjjzEvh9v0C5nz8LLHkjIl1l0z0KWSkWX7WFKOA39X19+kCUDpkAC/fQY
         cT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Dj2vZZnlR6RlBEKM+5SNCsYqMXCpTNaU84ApGGqgpPs=;
        b=Baa+yiYN/8Zm8jrPIC8wDk+XE1luhuC4l3310AkYwVHZzW0LwyLDulShpfQxxxMpgf
         975SGaIXtMlC2Rtp6yAwuciNeRhuM2xzgU/OMT8lGvuYmHMPw4lIiKTEjrulSu8o15c1
         5w6+f0XjmDMioofe1WxMftSi4R22CqQrQp5zPilc63jN6TWolrHFQ6UuUcWo4eGZWP6I
         3jqlVzNpMdnuIYQKngjtpihPgiIRWs0OzDskF9KRuxz3i9DrgvDX/qjYcPL9GLbXZxje
         VDbn0WlnNG0BqM+hY5bIRj3MFyuEWMsArrRP3a2cT727QM/7LuyhstbfuRD5gCeD7J3K
         Vlcg==
X-Gm-Message-State: AOAM533kGPCMFpAtyXhjJoy/HMeIUnjX1HFHL8ftjLyn78n8MDZLC1eX
	5Utt2CPSsiEfa942EUJdci4n0tzVyjvd0KGVS34=
X-Google-Smtp-Source: ABdhPJyySRa/Ac/2naqY7cUs4zfxioScEBknMN3/MRjNEPNbdJj8PaDHYUXYLEh4BPXe9Jh4y0TZ5w==
X-Received: by 2002:a63:4450:: with SMTP id t16mr10975225pgk.3.1600092746966;
        Mon, 14 Sep 2020 07:12:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/24] image.bbclass: fix REPRODUCIBLE_TIMESTAMP_ROOTFS reference
Date: Mon, 14 Sep 2020 04:11:28 -1000
Message-Id: <21d7ab8ce10f6d6a56875244c09dcfebae457b22.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Matt Madison <matt@madison.systems>

Commit 97b439469a45a089431ca9c31893288c855045f4 added a fallback
mechanism for getting the rootfs timestamp. However, it uses curly
braces around the variable name, which causes bitbake resolve the
variable reference, rather than the shell, so the git timestamp
never gets used. Fix the reference to restore the intent of
making it a fallback for when there is no git timestamp to
retrieve.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fbcf2c1c255b0c61a795c032cf7b67f5db41baa8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6620a9e9c3..459d872b4a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -654,7 +654,7 @@ reproducible_final_image_task () {
     if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
             REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
-            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
+            if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
                 REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
             fi
         fi
-- 
2.17.1

