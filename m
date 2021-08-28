Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web12.193.1630174485878649801
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b8r8gWTz;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id b4so10869302ilr.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ld9SxrpubTuCLeTvNg8q0UFuiXkX76VxEOPU6wVTrow=;
        b=b8r8gWTzLtEc4fSjVfADUQ7TmGoHbJosQklFPS66N1ZCyhNSX/Zo6iVsAcbzipPIo6
         /BFtJiftQiKLhJP7zpJzuB586Clrhe0q2lMwdnyibv+2XnrfS3hJq4aq58eUeRlEy8Fo
         SUjFbfzXWm0RomRelAmrDcVPQDr+uOCSMf8Gqgi65tOKJX4B9HWoJq/VbYJjPx71Ysr5
         YvJa60/ZY2gyJkdJ8xd3dw4g00BjBwWs/e+0v/x+dkG4alNkWbQ13LiuA1ISmBs06aEU
         PLchffefWMWj1aayMSMDnpkhgqLVApFJUkQ64qAQ0GcZyXHpBd0jBt9qIga5xQ6BY5Q5
         oE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ld9SxrpubTuCLeTvNg8q0UFuiXkX76VxEOPU6wVTrow=;
        b=DQLzKuAJITWpIVskkRePB/qUtVOhZVYzlre37rlEZCIyA2x1VmxqShzqE3rQHMHG8O
         l/HaGGYQroT1kc/q1wIXwl0qC6RfMSp/EfWhaKUUhDv/Ra+fXr8m21OOJsW1xHUUy0af
         6RpKlS40t/h9/u2KAqEdKIugLcMvX/RVIlu4zdYiqkRN/5zdL7eaQND6NjgZW3vrsrJB
         yVwrb6JTD4scgr7+QFDGHA1J0J3inYN29AlpfZFMxcxxVBdzxLe3JkE361ujnfHFIQAn
         fReywJox4pFxtKRH3Jl9W71PB4TZpA5ZEz8/LY8+Y8LAmyygbry4astaxMr6BmxWVbHK
         O0eQ==
X-Gm-Message-State: AOAM5320Yn40/CPP/jJgrrEn6x5tEd6EniKykxXAEkni8yPhH2LjwbDI
	h4BTkXr44awvdizJLYMEu6+J61oSWMi58MSC
X-Google-Smtp-Source: ABdhPJzxQCt4PGMkxd7UF9b2AdrEeatxDPPVz5cPhh49TYy5nKlKDhFPcZXjzW6XuVZnXU4Mi0cSKA==
X-Received: by 2002:a05:6e02:dcc:: with SMTP id l12mr10777076ilj.20.1630174484884;
        Sat, 28 Aug 2021 11:14:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/36] qemurunner.py: print output from runqemu/qemu-system in stop()
Date: Sat, 28 Aug 2021 08:11:21 -1000
Message-Id: <1732290d4d2147bd9ffd76deaf90650519a6ad3d.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is done when starting up qemu has failed, but is not done
when qemu started ok, but fails later in QMP communication.

Output from runqemu does contain valuable information to find out
why, so rather than fix all the QMP fails to include it, let's just
print it in stop().

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e2bf68e4401db747484c2c8ba0f77500b1d2d49)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 79db2cc247..a9efb849d9 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -435,6 +435,8 @@ class QemuRunner:
             if self.runqemu.poll() is None:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
+            if not self.runqemu.stdout.closed:
+                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
             self.runqemu_exited = True
-- 
2.25.1

