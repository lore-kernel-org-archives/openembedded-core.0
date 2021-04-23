Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.10327.1619186436680542538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kA4RauHf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso1312482pjn.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BEJs2p8GUvstoapJDiKRASVqlQ/xi4jo/caYKmiydX4=;
        b=kA4RauHfA6ZY06NykQ53ILgdLsYcSK74xAAnrTcXOU6OwK5UebqtdgRMVuFqUXP28P
         Q7Gfn78aowQiiimdC5Z7K2p4hieny4kFDLN/vCYevIP+hDjnsmQ1pkokcl1eoE2arAV5
         nR0+YhsOMrWXyHvnJpzH9x8BxtjBE0spWnMp5y1dI5ty0ap8fEgXHrvQWpm6B93WYe4+
         ZB6fOzI7v08piC6KgChwDuv4T/mQjeJjNs/7GMq9WKk+gVa7Zi2E7B1ZGQNM8ueGHufl
         ALc4lTtQv5nU5DyGYuSglljH4qe41cFf9FHP4yzqGna1QuwxAJ6fuRbHmUIq67goHSpm
         fjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BEJs2p8GUvstoapJDiKRASVqlQ/xi4jo/caYKmiydX4=;
        b=UzYRI0bIkcY3Ps3rXNMYFM6Z0QWjp4qSbZenBM2j9KoK9q2zpwdbl2AcF7CQnFmPAn
         4jEvOYbHJuwYxh/cNI5k65AU/M11Di9Jcw+a2v/IHUzAMHRAdBp4roD5rt1mU7idFVYw
         dFlbPeaEXu283sedJ7+QDO4AooN3qu2HIr/F5DRuEyGFnMZrr3ixSeZkFWFL5ia7Bak6
         N/yAHbecQWteYcjJIRaiJ1P4nZuAzVhC9k79fen/YsswElhWHw5CTg5eqHGRibWzqdv2
         rJQnBGXj7QEdKbk/46+rYDv5zxuRmUrswEpBibcG+i7wkJ+V1QCC8h43Ku1bSP9ZRgMQ
         qObg==
X-Gm-Message-State: AOAM532Ok93SZxBXPeTmf7ep8UILANP4wYj9C7spMGh1baXuLLqBV+qL
	59HqRxmqjkM0lF+iyux919vBcPd0aYeM+HZxQMU=
X-Google-Smtp-Source: ABdhPJwPoin3Ud37MQDU11tuWmj1sHZTAln/NCMaB5ZbsXbdkY2ig5DFc84acA14s5eHYN3DTX5c5g==
X-Received: by 2002:a17:90b:1b07:: with SMTP id nu7mr5938237pjb.170.1619186435796;
        Fri, 23 Apr 2021 07:00:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/19] parselogs: ignore floppy error on qemu-system-x86 at boot stage
Date: Fri, 23 Apr 2021 03:58:56 -1000
Message-Id: <982236ed40f7e1fb912d52155495286fa1ca4757.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yanfei Xu <yanfei.xu@windriver.com>

We can disable floppy drive by BIOS on a hardware, but an empty floppy
drive is connected by default on qemu-system-x86. Linux usually detect
the device and modprode the matched floppy.ko at the boot stage. Due to
we don't specify a floppy deivce in qemu boot arguments, then the errors
about floppy reading comes out.

It is harmless and normal, so we could ignore this error message on
qemux86.

Seen if kernel-modules is included in the image which pulls in the
relavent kernel module.

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01402.html

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3359f23ee9351c70997d5e0a17d17d1e47d59623)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index a1791b5cca..f703927660 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -88,6 +88,8 @@ qemux86_common = [
     'tsc: HPET/PMTIMER calibration failed',
     "modeset(0): Failed to initialize the DRI2 extension",
     "glamor initialization failed",
+    "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
+    "floppy: error",
 ] + common_errors
 
 ignore_errors = {
-- 
2.25.1

