Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDBAC3DA41
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:27 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.353.1688831784549044264
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=E12zdfuz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so2666920a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831784; x=1691423784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1muMYAtmL0u9bGnqoIQuSrY3bWmt/9CNjv4ZTaSnCU=;
        b=E12zdfuzI49cFcJ2pnKJpa7QCRitcb4hjFf80v1S/y7HWS/BDgW7vN1WYyT+UL0wef
         ei08Uj0swz35M9tOBKSdoRKWmpIwdo9F9ymLxYFLtK7loftIh7+qpPYzMxlR47Z0wgZO
         u2Mql0gTbxXpZqPCFHhylykDVRVc/wHyt3FE2Gxc5tfzGuVOFyhQqtZkJRrk53NF3ISP
         ijJOwY+bf/aOcowbCWUr0BIa166wp392arrzBw6mLsV/BHy3reEYSax1NObC6WE5IAhM
         OK/BjKaC8BBCcgMkEiO5Xducv98My1eTSaTHULzuuRt/w76Qs0tsr4CcRU87X3iWYpXQ
         fK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831784; x=1691423784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1muMYAtmL0u9bGnqoIQuSrY3bWmt/9CNjv4ZTaSnCU=;
        b=dLnhtqZGt2y3tRhqRuEGVZSWka4bRt7Q07A/hs5AqhdUBt09qsnltShH/lSUPA3WnE
         r8zwWrOrdKmLGA6Zw+EVz0gX+x86DRcf6LyrmklKziuPZxbJqWpZDOvBfA41LHx5H5Wm
         Cff21RFRecbuSlzHDTkQDOmw2XeisO0EWdFNkouI9obOXBG7yGy67cYo2wa3VYerhxni
         9nb96pU3SpfwJAEJKAEZyp6UmIUz/Nu3LWxSYaRRwlq3GHNqyNTp3psnykHBqNWXPvoY
         P8yXkAFPTDPzEydg6VJKAb1ADQOKOlUfmXf9XxEPARtEbaJfeO0b6tnzeJfUxdHOQdJh
         FiQQ==
X-Gm-Message-State: ABy/qLbYC884ynY/1fxbfjAW1+3fIYDfnlSOoThCmCDMlQYtuyv2tx1H
	aAOrK8/m4R+4IdTMRhNYVdjp3p7SxvUqEVOFgdM=
X-Google-Smtp-Source: APBJJlEN4Tk6i4X8EfmoPQgzvcYUX4VOhXZzpvXlX0UmfADw5WDEeFxiQYQqRvR2lscPcyLc+51Fcw==
X-Received: by 2002:a17:90a:fe07:b0:262:ca9c:edcb with SMTP id ck7-20020a17090afe0700b00262ca9cedcbmr6370824pjb.9.1688831783600;
        Sat, 08 Jul 2023 08:56:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/17] scripts/runqemu: split lock dir creation into a reusable function
Date: Sat,  8 Jul 2023 05:55:47 -1000
Message-Id: <d296853f1c5bcc6ccd800a4fbcbba18021f98518.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184033

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 004d6bcb067ecf1d796801fa43a98820c4efd3c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 51607f10e5..42abda0962 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1034,6 +1034,17 @@ class BaseConfig(object):
         self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
             self.net_bridge, os.path.join(self.bindir_native, 'qemu-oe-bridge-helper')))
 
+    def make_lock_dir(self, lockdir):
+        if not os.path.exists(lockdir):
+            # There might be a race issue when multi runqemu processess are
+            # running at the same time.
+            try:
+                os.mkdir(lockdir)
+                os.chmod(lockdir, 0o777)
+            except FileExistsError:
+                pass
+        return
+
     def setup_slirp(self):
         """Setup user networking"""
 
@@ -1052,14 +1063,7 @@ class BaseConfig(object):
         mac = 2
 
         lockdir = "/tmp/qemu-port-locks"
-        if not os.path.exists(lockdir):
-            # There might be a race issue when multi runqemu processess are
-            # running at the same time.
-            try:
-                os.mkdir(lockdir)
-                os.chmod(lockdir, 0o777)
-            except FileExistsError:
-                pass
+        self.make_lock_dir(lockdir)
 
         # Find a free port to avoid conflicts
         for p in ports[:]:
@@ -1099,14 +1103,7 @@ class BaseConfig(object):
             logger.error("ip: %s" % ip)
             raise OEPathError("runqemu-ifup, runqemu-ifdown or ip not found")
 
-        if not os.path.exists(lockdir):
-            # There might be a race issue when multi runqemu processess are
-            # running at the same time.
-            try:
-                os.mkdir(lockdir)
-                os.chmod(lockdir, 0o777)
-            except FileExistsError:
-                pass
+        self.make_lock_dir(lockdir)
 
         cmd = (ip, 'link')
         logger.debug('Running %s...' % str(cmd))
-- 
2.34.1


