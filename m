Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5A3EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.13089.1692801430499433869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WnPztGKa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf55a81eeaso26314365ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801429; x=1693406229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlh4y9/3tB1ue6UuUkLx//KL3IW5Lup0DGL8Wm8S/Yw=;
        b=WnPztGKaRnFsm30YzWwdaEAjtZ8JqILJoxYtWEMPeX3Twf/IFHVrUzM3ebi7+9aj8c
         fKyo459BgB0MERNO/LIVD0hjvrYVkIbn6a+cCe14RGxa37tIizXJgmqwrn94GwuMyCTd
         Q4jV2GltkKdcE/aRgEoDCKHpkfaXxXyGbO9DeRVJix1nlIu7MT/j6Zzl6fDXNpTxsd6d
         LgzCK34v3SjS+xUfZX7uGxxxu08Ph3RwOGOfVgV77STmDZBvbkBnbL3RZQRdsBlluu92
         hfNuBAQEY8hgG0Kf6SSQ8BZ04aXNuzeX7aWvQeFBadWYoMHxHTHBYkW/UAPS+hqKn3PS
         paBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801429; x=1693406229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlh4y9/3tB1ue6UuUkLx//KL3IW5Lup0DGL8Wm8S/Yw=;
        b=MNmuUQGQTojI85TVjojGXSODpmzB7eKYOkhrabzQ+K3Mv6n/E7ffU9pPDUocO3bzgA
         UyI9cxC514qv9H3nKn0gK1aNlCVkiN15jveqi84oHFwwxUwhD8eshwD2Xo5+9+OBQ/R5
         HVoulR3ULqBOEuUjfurap1q1d43B+sZTr8/izMWlP83hLbFZ61HL5DakgEjqN1b+foN8
         moMrLVdUNnR6BC/OW/8lYFmjJGrVWjzFE8a9VHUtvjrBWwwiMMm/iNoZaOyatGMUURQJ
         bBlKq7whWewSUKZCVAm0e1w4RtpbL3HADPrzKIUr+hS8FmliAq3V1QaqApJpQCdGtH8g
         UKag==
X-Gm-Message-State: AOJu0YzlTKR71gKoSC7kR3sqzYc1jY7q1FFNreTP0lSV2qbGK8hs3Oe4
	CKMDvegcnpfYDeX4WbC50n3ymhd1jrYqJl3UtAo=
X-Google-Smtp-Source: AGHT+IGOST8oLlO/rXb5yIKI+XxeATlfgzphr8HkEKrQyEUl8kjh9SV+QICFAM/HL/KN1Y/LFxwbnA==
X-Received: by 2002:a17:903:247:b0:1c0:9ae1:6f8d with SMTP id j7-20020a170903024700b001c09ae16f8dmr5013364plh.32.1692801429611;
        Wed, 23 Aug 2023 07:37:09 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/36] rootfs: Add debugfs package db file copy and cleanup
Date: Wed, 23 Aug 2023 04:35:54 -1000
Message-Id: <96c79c54f282497eb1521b1d5da648ae83fcfe8b.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186605

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
index 91312f8353..2824d4f037 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -104,7 +104,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _cleanup(self):
         pass
 
-    def _setup_dbg_rootfs(self, dirs):
+    def _setup_dbg_rootfs(self, package_paths):
         gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
         if gen_debugfs != '1':
            return
@@ -120,11 +120,12 @@ class Rootfs(object, metaclass=ABCMeta):
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
@@ -160,6 +161,13 @@ class Rootfs(object, metaclass=ABCMeta):
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


