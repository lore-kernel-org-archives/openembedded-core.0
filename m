Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4303C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 20:18:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.1883.1635365913484365120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 13:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P9TDdjJl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id d13so6119763wrf.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 13:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XhsAUb5ExDLKmdtU39z7R0ZWbB+OKtx/EZcDvN3qaYs=;
        b=P9TDdjJlqzOimYn/H4Y/muPClecpxsmAM7rs73di5xATmyq0g85yZn+xWV6GaA/qB5
         JP+UsSy+ahFcnHqNxIPslGlyYL0nzzHphgz/3NOaex7y8eGztUYXrwVukv+NzInU7/pV
         yOoI13FtqPCt63fhuKGvc9/Cj4ySxtAaRUVB20C6K9pkxWkj/cieVVzED5CNg8I0OeAq
         RJQeic2Vpsgo3iw8GFjQ4Xa/w6DrpyClGJnareuy/zibfMXruGsl2NTL5BQFMVLgIyTL
         DxJkVOhJGBcT6NKTs2P7XTKPwjX2jD+EEC+9JOchvUOglmOCqVQhUSS08RE/4v7G9wQ9
         Q4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XhsAUb5ExDLKmdtU39z7R0ZWbB+OKtx/EZcDvN3qaYs=;
        b=dPHULOqvSozkam1NxDLscbhm9U2NVQ6FJlqCChPCP5HHpZYgsKxB/YabHkXdQl6Bd2
         JQTtl0ReIYCKIX/z/HByyMgmc9KFmRYdXh7J1d6TGevrMJNZw9i3Dd2xSXUOrJsK2Hny
         6v6HpHhCxHInKDL1d9cWsx7IVNFX3WIXcV6rkjuemd0Omi+R0mWDmVGaMGdFyUN/id2z
         OshTihss+0Z0cP7dEYJVJRqqthmjurnVL+FGuMywEwo8atLO9aO8PVNv7NdZXNMCQouN
         KyL2sjYQlqLch1KyYBehN0kSn6KqWjmQ8tddnD1U3BNfSdqTxJyiLInasdqKAxVqgiZE
         6KBg==
X-Gm-Message-State: AOAM533r5HhFKgovFMI5Fsug91jgX+eZisZ3q0hmDN6B5R0asm8tbGQm
	uiXf35ti+QGzLGZZOnXjypSbjdiAlQ4=
X-Google-Smtp-Source: 
 ABdhPJyPf0grGeOurWA8kD2xq+33tZLuwormCYdSgsv1ZONp2mE6NsZ+hsEnu0vKgzIRB+pYZRVTcA==
X-Received: by 2002:adf:9bd2:: with SMTP id
 e18mr43048821wrc.235.1635365911917;
        Wed, 27 Oct 2021 13:18:31 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 m3sm2022435wms.25.2021.10.27.13.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 13:18:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] runqemu: unbreak non-gl displays
Date: Wed, 27 Oct 2021 22:18:29 +0200
Message-Id: <20211027201829.3949004-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 20:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157566

Correct two issues:
1. Looking for dri.pc is only needed when gl is enabled.
2. virtio-vga-gl works only when gl is enabled via -display,
otherwise virtio-vga needs to be selected.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 54f2336ba9..1143509975 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1349,9 +1349,14 @@ class BaseConfig(object):
             raise RunQemuError('Option gl/gl-es needs gtk or sdl option.')
 
         if self.sdl == True or self.gtk == True or self.egl_headless == True:
-            self.set_dri_path()
-            self.qemu_opt += ' -device virtio-vga-gl -display '
+            if self.gl or self.gl_es or self.egl_headless:
+                self.qemu_opt += ' -device virtio-vga-gl '
+            else:
+                self.qemu_opt += ' -device virtio-vga '
+
+            self.qemu_opt += '-display '
             if self.egl_headless == True:
+                self.set_dri_path()
                 self.qemu_opt += 'egl-headless,'
             else:
                 if self.sdl == True:
@@ -1360,8 +1365,10 @@ class BaseConfig(object):
                     self.qemu_opt += 'gtk,'
 
                 if self.gl == True:
+                    self.set_dri_path()
                     self.qemu_opt += 'gl=on,'
                 elif self.gl_es == True:
+                    self.set_dri_path()
                     self.qemu_opt += 'gl=es,'
             self.qemu_opt += 'show-cursor=on'
 
-- 
2.20.1


