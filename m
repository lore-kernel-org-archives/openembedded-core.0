Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B291C43217
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.9153.1649924435379672201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R79SfH5r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so3719368wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZyOpF3X6jc2KtnaQ4JDzMxZLrJJG+bv9zktREnQZVH4=;
        b=R79SfH5r9onohkgmpMDt8buZia49o2sCDVKz21EHoiq//2nGfAfgG/QYKZ0fsG5zPk
         PFyOrPaHhwRsOKcrri69uiZox0UJrHEBcqGOh8qC5bb9TQDgKE0o8VZGD746SKRIGXAm
         VGRqbWEs5Z8ee8hSqfzhDIhqGKqEft2/gjPaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZyOpF3X6jc2KtnaQ4JDzMxZLrJJG+bv9zktREnQZVH4=;
        b=EbjzUOLk65yN1yokJIFeT1fUUI8NJ/GOzwmRuwB2VulUJK5ALPKh05Dv4r33ozjKry
         Ozn0pBZRhqfWRBNv09+MpyvuxlVd9PKRHmcOzMqNlSo8DPHX/YJJ+rxOTl42deAXGT19
         8yIUI89BhRhJstst6dw61xozYhrFdWfG7krUYcHrPfFo5SRDsyZRFa4t+xrnMg91qj57
         EyTf8FNwWDjKz9nNTuF486Jr86G6uR77ZTuXbA/L5n8D+1vb6W0b9Z84mUbQ4Hy92A7e
         PxAT3bD5+/WAwS8alGzMkLyeaaepXm9/kHRAxOLXXdqXRWvhV/Iq2NtMXAY/EcNBbwnF
         igVg==
X-Gm-Message-State: AOAM533GV6Vj45RSO1ewNGH+GKlkwB2IewXkwN9QQKquoz588I3HSMtY
	DnDA4g2JyyLb6r+nyVa5ePg4F8JzoaVY9A==
X-Google-Smtp-Source: 
 ABdhPJxKJr+AeikQSdrV6ubiRy/psOnz3sYy/EKmoXCK95knLVGcomj5uJt6Yrza8JoELT9WPQFe5A==
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr1972473wmj.171.1649924433220;
        Thu, 14 Apr 2022 01:20:33 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b0038e8fb63293sm1356511wmq.22.2022.04.14.01.20.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:20:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] runqemu: Allow auto detection of the correct graphics
 options
Date: Thu, 14 Apr 2022 09:20:31 +0100
Message-Id: <20220414082031.2227955-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164395

Running "runqemu qemux86 kvm" when qemu is configured for sdl and/or gtk
display output currently leads to a poor user experience with no cursor
and corrupted fonts in the gtk case. This is due to no options being
passed to qemu which leads to the loss of the font envirornment variable
and the show-cursor option.

If the user hasn't specified a display type, grep the output of
"qemu-system-xxx --help" for the display types and pick the "best"
which ensures our config is passed in. That resolves the gtk font issue
and the cursor issue with both sdl and gtk.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Fix for non x86 which don't have the vga option, skip that there
    and avoid string whitespace concat issues

 scripts/runqemu | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2f77a7bd0f2..36af764b1b5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1363,13 +1363,27 @@ class BaseConfig(object):
         if (self.gl_es == True or self.gl == True) and (self.sdl == False and self.gtk == False):
             raise RunQemuError('Option gl/gl-es needs gtk or sdl option.')
 
-        if self.sdl == True or self.gtk == True or self.egl_headless == True:
-            if self.gl or self.gl_es or self.egl_headless:
-                self.qemu_opt += ' -device virtio-vga-gl '
+        # If we have no display option, we autodetect based upon what qemu supports. We
+        # need our font setup and show-cusor below so we need to see what qemu --help says
+        # is supported so we can pass our correct config in.
+        if not self.nographic and not self.sdl and not self.gtk and not self.egl_headless == True:
+            output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True)
+            if "-display gtk" in output:
+                self.gtk = True
+            elif "-display sdl" in output:
+                self.sdl = True
             else:
-                self.qemu_opt += ' -device virtio-vga '
+                self.qemu_opt += '-display none'
 
-            self.qemu_opt += '-display '
+        if self.sdl == True or self.gtk == True or self.egl_headless == True:
+
+            if self.qemu_system.endswith(('i386', 'x86_64')):
+                if self.gl or self.gl_es or self.egl_headless:
+                    self.qemu_opt += ' -device virtio-vga-gl '
+                else:
+                    self.qemu_opt += ' -device virtio-vga '
+
+            self.qemu_opt += ' -display '
             if self.egl_headless == True:
                 self.set_dri_path()
                 self.qemu_opt += 'egl-headless,'
@@ -1415,7 +1429,7 @@ class BaseConfig(object):
         if serial_num < 2:
             self.qemu_opt += " -serial null"
 
-    def setup_final(self):
+    def find_qemu(self):
         qemu_bin = os.path.join(self.bindir_native, self.qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
@@ -1434,8 +1448,13 @@ class BaseConfig(object):
 
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
+        self.qemu_bin = qemu_bin
+
+    def setup_final(self):
+
+        self.find_qemu()
 
-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND').replace('@DEPLOY_DIR_IMAGE@', self.get('DEPLOY_DIR_IMAGE')))
+        self.qemu_opt = "%s %s %s %s %s" % (self.qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND').replace('@DEPLOY_DIR_IMAGE@', self.get('DEPLOY_DIR_IMAGE')))
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
-- 
2.32.0


