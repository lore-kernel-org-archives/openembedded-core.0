Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D28C04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:37 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.21295.1691683533150536415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Eg2nSWws;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686bea20652so944085b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683532; x=1692288332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YG8jsf+3DF/NQYlQZEDrXphdnHJcCwqdEfUuOw6VNzY=;
        b=Eg2nSWws6itoQQ88TBnnTvVP/0m1CwduWDaASiyvh+BBg2NMHkZvIDZQguy51AOwPN
         mqU8qYshKZHeWgRRyDEVFfYMZrYwKJ4fVx5mujXnzXf0lHq1zQ4qz67jr2sjvS+b/irh
         g/SlcxC4rEo30yvSvKsk5Le35I839KqXwA70tAS69DUPNesAIEFcjmYT9MPymglmjLMs
         O0pXpGY2ZP/25siu8uKjYm/oP3bqzUZBoIcpFQlMfu1wI55x37SA4men/AWo2MGNJSr2
         Rdm1bzfzgv3eBCjpLFjMeGK8mDl8UGxnzL9Npz/gJ1Z7riTzemtcCIRsgSgMdlZm/JQX
         33hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683532; x=1692288332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YG8jsf+3DF/NQYlQZEDrXphdnHJcCwqdEfUuOw6VNzY=;
        b=RrCx8tuLQDW0unsR9dDVruk12ddvSy9eiWj56VDeVn/x7he92/8CgchB+n1X/IIKT+
         CgYggRW1vVwDnrwOWieVbKVHiz1otmN9EGXLcYocuq0+QqyCMKa527R362V54Ao1p1Vk
         6KFNE6BRPQ1EZGxL/fRV8U57UbYSNxsVcj5nMvHhzpDHT2o4ZX2wSkVb1vBpmqoOeLyv
         Ev3pRmgNUCzrhV5EmewEN23rMM+HG6NdrqpcOnBcMA4xceNpDMc68UiqUgSnIZ0hX42x
         CwArI0g4tzbYaX8sE1jipm2BGdwkV4YLpCX+/1MWmSscUvyXuNPruWRHM5Oc2DvijNuf
         7V6w==
X-Gm-Message-State: AOJu0YygNhyGj2wxaE3BZt7eqym6ErD2msj8TpxxNBCBBaojA803+IB6
	EBqOQOnmLK7SDHpdbHW2lZUalxoev/VXShdnMXg=
X-Google-Smtp-Source: AGHT+IEYBd60ZSehxPV9OTYqfhdBcX2OXQGako6TnM6a2viWaI4KOmQCjmXNxtvzL6agjPJzudA+tw==
X-Received: by 2002:a05:6a00:24c5:b0:676:399f:346b with SMTP id d5-20020a056a0024c500b00676399f346bmr3676408pfv.1.1691683532267;
        Thu, 10 Aug 2023 09:05:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/37] rootfs: Add debugfs package db file copy and cleanup
Date: Thu, 10 Aug 2023 06:04:21 -1000
Message-Id: <4931839ff97e8746cdabe1d06298a96a47638b2b.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185784

From: Alex Kiernan <alex.kiernan@gmail.com>

When copying the package database files for the debugfs, add individual
file copy as well as tree copying. After the debug rootfs has been
created, cleanup the package files.

This then allows us to avoid a problem where (for rpm at least)
extraneous files in the debug rootfs would cause failures during
oe-selftest because some files existed in both regular and debugfs
images.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ce49ea435ce55eb5b6da442c12e03a806534c38d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 890ba5f039..1a48ed10b3 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -106,7 +106,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _cleanup(self):
         pass
 
-    def _setup_dbg_rootfs(self, dirs):
+    def _setup_dbg_rootfs(self, package_paths):
         gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
         if gen_debugfs != '1':
            return
@@ -122,11 +122,12 @@ class Rootfs(object, metaclass=ABCMeta):
         bb.utils.mkdirhier(self.image_rootfs)
 
         bb.note("  Copying back package database...")
-        for dir in dirs:
-            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
-                continue
-            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
-            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
+        for path in package_paths:
+            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path))
+            if os.path.isdir(self.image_rootfs + '-orig' + path):
+                shutil.copytree(self.image_rootfs + '-orig' + path, self.image_rootfs + path, symlinks=True)
+            elif os.path.isfile(self.image_rootfs + '-orig' + path):
+                shutil.copyfile(self.image_rootfs + '-orig' + path, self.image_rootfs + path)
 
         # Copy files located in /usr/lib/debug or /usr/src/debug
         for dir in ["/usr/lib/debug", "/usr/src/debug"]:
@@ -162,6 +163,13 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("  Install extra debug packages...")
             self.pm.install(extra_debug_pkgs.split(), True)
 
+        bb.note("  Removing package database...")
+        for path in package_paths:
+            if os.path.isdir(self.image_rootfs + path):
+                shutil.rmtree(self.image_rootfs + path)
+            elif os.path.isfile(self.image_rootfs + path):
+                os.remove(self.image_rootfs + path)
+
         bb.note("  Rename debug rootfs...")
         try:
             shutil.rmtree(self.image_rootfs + '-dbg')
-- 
2.34.1


