Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2169.1619132916721891661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 16:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JQ7/4x69;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id y124-20020a1c32820000b029010c93864955so178766wmy.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 16:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZE7jxTRAa8YV2ZlDfeil2TZ9X9DtGgXPESbjrOSymhE=;
        b=JQ7/4x699u7Drhsl7aStTo0hlk9pBoWPfisO6yE7RQZBtKOQ60ii8Tq9B/CDvlGvfk
         N34yiENXMNhhdLpBOSTIE0najJl2KGkA/sckae0m1x/ULGTKXvLb0+pMyFKr+Pl3BUqP
         aoPzq7xQ8GW/BhP3ILxey/Oi8tPPy5IRD1jCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZE7jxTRAa8YV2ZlDfeil2TZ9X9DtGgXPESbjrOSymhE=;
        b=jh9xa5BqugMbfPbhprB3B7ZXMfxEpKacFNu0/AF44qOsthwkjFI+lg2SerIXcf9W5p
         CvtAXnlo087Iv8vsZ0KzbkR4wDjQSbBn2jAS1yQqVT9TvxJuhkFlOfD1MDq0QDHJ5yT6
         VGwMJLcV5yT5qSs30VJGXfeg4Oo7RZcYuAyvGYuOB96W2lsXG/xRFH1RolerZJiS521+
         lVmu/ye0yr8aKG5Cj2v3eL3+A1ECcW3gbYEcdoXqx4hM9Rae5GOJA532va1JRF2xIu+T
         SqUX5h5LyWYCx7ZPhF22ZHA6BznaeBTDwTIT4nL72dR07AH6PpWGRMV0osfXUXrR4PpE
         wh0Q==
X-Gm-Message-State: AOAM533VVB9SxG649dJm2W+sZr8MzEASUeGEkqEAyJomF//RadAJR4oK
	FfHyngnm0X9IVeS+tEJRcwGWP3aRoCTWnQ==
X-Google-Smtp-Source: ABdhPJwg1W+DOcxur2opJR8uXV5JDP99qAw3m35FK3l7Xz9e0OFocPeQ+4HhBK02GLwwkkc4S4DMNg==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr1105386wmi.178.1619132914688;
        Thu, 22 Apr 2021 16:08:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9e5d:1acf:2dd2:29e6])
        by smtp.gmail.com with ESMTPSA id k22sm6502438wrh.5.2021.04.22.16.08.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 16:08:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: Ensure we cleanup snapshot files after image run
Date: Fri, 23 Apr 2021 00:08:34 +0100
Message-Id: <20210422230834.1594956-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to cleanup snapshot files if we make a copy of them to ensure
the tmpfs doesn't run out of space. There is already NFS code needing
this so make it a generic code path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ba0b701aff3..edd17d09c4a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -145,7 +145,6 @@ class BaseConfig(object):
         self.qemu_opt = ''
         self.qemu_opt_script = ''
         self.qemuparams = ''
-        self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
         # File name(s) of a OVMF firmware file or variable store,
@@ -210,6 +209,8 @@ class BaseConfig(object):
         self.qemupid = None
         # avoid cleanup twice
         self.cleaned = False
+        # Files to cleanup after run
+        self.cleanup_files = []
 
     def acquire_taplock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
@@ -1020,8 +1021,9 @@ class BaseConfig(object):
                 logger.info('Running %s...' % str(cmd))
                 if subprocess.call(cmd) != 0:
                     raise RunQemuError('Failed to run %s' % cmd)
-                self.clean_nfs_dir = True
                 self.rootfs = dest
+                self.cleanup_files.append(self.rootfs)
+                self.cleanup_files.append('%s.pseudo_state' % self.rootfs)
 
         # Start the userspace NFS server
         cmd = ('runqemu-export-rootfs', 'start', self.rootfs)
@@ -1204,6 +1206,7 @@ class BaseConfig(object):
             self.rootfs = newrootfs
             # Don't need a second copy now!
             self.snapshot = False
+            self.cleanup_files.append(newrootfs)
 
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
@@ -1476,10 +1479,13 @@ class BaseConfig(object):
         if self.saved_stty:
             subprocess.check_call(("stty", self.saved_stty))
 
-        if self.clean_nfs_dir:
-            logger.info('Removing %s' % self.rootfs)
-            shutil.rmtree(self.rootfs)
-            shutil.rmtree('%s.pseudo_state' % self.rootfs)
+        if self.cleanup_files:
+            for ent in self.cleanup_files:
+                logger.info('Removing %s' % ent)
+                if os.path.isfile(ent):
+                    os.remove(ent)
+                else:
+                    shutil.rmtree(ent)
 
         self.cleaned = True
 
-- 
2.30.2

