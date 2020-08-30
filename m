Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.38882.1598818529414337649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 13:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AD8bke9u;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: vvavrychuk@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id w5so3951959wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvqJ9+ON4xXDpAwoPDouj++c5bqCO8iuhUt2qqImzXQ=;
        b=AD8bke9uiHjXVGcMsjsjLyUeW2lAlJNAo9Ympan3Z1yh3vcFOx0//3AkjFycGp+bUc
         ttjne0Ue0a4C+cCktXsi8+5Sw21qhHVQA6UD+tAqDXaPe6E5/k4U7lj5vyefFnkRBG0T
         4dlOCafXDnjWK56EHqiY3RJ54UXsgQyUpfc7kZjxRufGc5jClHpLjWuohlVsEgbjWWi4
         D0a2NSg8U0w0Et5oJxhOX1wBqyBoLCq+k/Ozeqxa0+dfzxt3j5xQpDG76JQBZ1m8zIbm
         flZEyBVhzfqCtlnCEd7ukwmOWseZ8Y3d2HU7dUECxnzDMwH0uAvHgNyKD0ZhP+4RY/qz
         JeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvqJ9+ON4xXDpAwoPDouj++c5bqCO8iuhUt2qqImzXQ=;
        b=jnbBItge2q3/mUfZuctRss4v7qnP0EduygNxV3SVwXwnj/ya0oDt0vp3jHOFzcrhfw
         opm9ysgwa67C5bDERdN5qPsUM3fGAUH6q4qSHR3NG0NBlyJvWo+GxgiixJUl7Q3Rv5WI
         xMEdjV7vuFGlNJyIHISsd83ykdwqab3jz0/NzuPUCbPJQ6sym/v9A0LcBPPR536LaHKM
         3i/cjVorXk9zo/Pl+hJ4YtWSlCxGHMXO5qrvK1HWKcuhIsvQ1jLPNWjJnXpp8JJlf1U6
         zJwLo0e8HaHPWMJ+xZPzPEVE0zzuoeU/5ZkVmcXI7r1tHmCeTm5fFIk9WL0PfbaLZJ8L
         LPwA==
X-Gm-Message-State: AOAM530EKEaVmd4EGkHC4qW6DFe61Pit+a85JlrbNbFUVrsFGJTYT941
	HDdzIyyzQ6uQN+jtzBy8qTB6fp9m0YPiyw==
X-Google-Smtp-Source: ABdhPJyfYNY/usooa/4upcS7g9szwl2Um8WvgsjOyy4goN1euBKkMhPlZKcREda3Apu4Af/bufl2Ag==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr9015860wrr.390.1598818527474;
        Sun, 30 Aug 2020 13:15:27 -0700 (PDT)
Return-Path: <vvavrychuk@gmail.com>
Received: from localhost.localdomain ([213.174.17.69])
        by smtp.gmail.com with ESMTPSA id h5sm6969516wrc.45.2020.08.30.13.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 13:15:26 -0700 (PDT)
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH] runqemu: Change virtio-vga to virtio-gpu.
Date: Sun, 30 Aug 2020 23:15:22 +0300
Message-Id: <20200830201522.23701-1-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio-vga is available in QEMU only for hppa, i386, and ppc
architectures. On the other hand, virtio-gpu is available for all
architectures.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 scripts/runqemu | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7fb5f7db57..5d6b35ffe4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -461,19 +461,19 @@ class BaseConfig(object):
             elif arg == 'sdl':
                 if 'gl' in sys.argv[1:]:
                     self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on,show-cursor=on'
+                    self.qemu_opt_script += ' -device virtio-gpu -display sdl,gl=on,show-cursor=on'
                 elif 'gl-es' in sys.argv[1:]:
                     self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es,show-cursor=on'
+                    self.qemu_opt_script += ' -device virtio-gpu -display sdl,gl=es,show-cursor=on'
                 else:
                     self.qemu_opt_script += ' -display sdl,show-cursor=on'
             elif arg == 'gtk':
                 if 'gl' in sys.argv[1:]:
                     self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=on,show-cursor=on'
+                    self.qemu_opt_script += ' -device virtio-gpu -display gtk,gl=on,show-cursor=on'
                 elif 'gl-es' in sys.argv[1:]:
                     self.set_dri_path()
-                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=es,show-cursor=on'
+                    self.qemu_opt_script += ' -device virtio-gpu -display gtk,gl=es,show-cursor=on'
                 else:
                     self.qemu_opt_script += ' -display gtk,show-cursor=on'
             elif arg == 'gl' or arg == 'gl-es':
@@ -482,7 +482,7 @@ class BaseConfig(object):
                     raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
             elif arg == 'egl-headless':
                 self.set_dri_path()
-                self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
+                self.qemu_opt_script += ' -device virtio-gpu -display egl-headless,show-cursor=on'
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.23.0

