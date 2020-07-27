Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.57885.1595862635157945350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Me6Zer1F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id w17so8137221ply.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TcnHpwm5hb6AHEuusFYJpcm0DZ+l9wDlmikLMphSpig=;
        b=Me6Zer1FvVRjP4l6xBz+28a4abMBJ6xewIlTAZFv/3dmltV8qMw19tJfvaaMZrbkte
         h8LmtR6K3URCmsurR3dxD/KxRkKA3v4Pt6w/LzG+U7I1kuCG+1t8bwerJayFUUkKS/86
         +9TGN5rcEHh3P0thXk410o3kcRTGbk9SBExfEhdkC9OOYMNPl1IGKCkIUW47J7zNH0e/
         ADHfUloc41t9hQhqt3+canR5OW6rUq2TusWm/zQ9WMxm1sDepwPE2dMR1EdJobnbFpjp
         +3hAeb1zkAfCfQ2rUIslyGfFMLiKeMnS3+H04r+CizdFq3y4YB3out55VsEGMKlUfM3s
         AkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TcnHpwm5hb6AHEuusFYJpcm0DZ+l9wDlmikLMphSpig=;
        b=orcE3lc875WgwjyyZbRYgm6r7E46JmVnV8/5+UNg45RZ7OUD+Bw/FaAieqTaJu2bci
         uZQpv0Ue20uxXp+zanMVkXwe3Mkyd3fOk6+YMbQotnn6VcD7A+k9PxSKIzlsFGCSxcSe
         wOPWJwGZYep83jNOKyyTiYsAetxdayj4n4cr28FN4pMUb1LTEsy8UlpkE6nzklD88KEW
         t42FuUp9VbmZqtYcKRp/CRJEZJCoIO/Mv0n5L5H0bFXAc7chLsvgH1pdOLB/kFlUNiso
         IIGAkXC6X+YoXDce/PUklXO8Womq1xHsIbyH38SBwgRlxMlWGImaSJaL/4NSWu8/J0UU
         JquQ==
X-Gm-Message-State: AOAM530pBUpAdk9sPsoOrBZE4ajHZF3Bvv92LJ93Xyvog+MyEVGnxDVT
	4RPkfxW9W/4gQqpOEbZBLstkmpJh8pg=
X-Google-Smtp-Source: ABdhPJy0WC7n6Or+AhLX9U39F/XoH8jilS2dMpOfH6LkL4+kmIsiDI2uEtFWQyohMWgNffgV21rcog==
X-Received: by 2002:a17:90a:1c97:: with SMTP id t23mr12345436pjt.216.1595862634160;
        Mon, 27 Jul 2020 08:10:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/18] oeqa/qemurunner: Add priority/nice information for running processes
Date: Mon, 27 Jul 2020 05:09:48 -1000
Message-Id: <693dc285164eb6cc88cc7174238fd59f0393b5c3.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing failures due to system load. In theory we've set process
nice levels which should compensate for this. Add debugging so we can
find out if they're being correctly applied.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e4e345bba8216b9b5623682206a7dae7cad261c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py     | 2 +-
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 01cbf52b8b..519aa9aa1e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -264,7 +264,7 @@ class QemuRunner:
                 % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + str(qemu_pid))))
 
             # Dump all processes to help us to figure out what is going on...
-            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
+            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
             self.logger.debug("Running processes:\n%s" % processes)
             self._dump_host()
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 364005bd2d..5c92941c0a 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -138,7 +138,7 @@ class QemuTinyRunner(QemuRunner):
         #
         # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
         #
-        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
+        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command'], stdout=subprocess.PIPE).communicate()[0]
         processes = ps.decode("utf-8").split('\n')
         nfields = len(processes[0].split()) - 1
         pids = {}
-- 
2.17.1

