Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.12744.1587278158675586372
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W+S2pan8;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id a81so7517675wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N77GayHg/5/eLrgYHWXfnTw+B002DDe5KNzYaTDlK3o=;
        b=W+S2pan8iLLSsy5NUrH8UCMfEL3CbwbSFZi5oRNoyV3n4s68OmSHLf3krdWOFzVbRN
         koq8NRZkuVVQxxSgn7OzyhwPB01RD6qD0rXCHr+JOXYDTVHLnl7AdVc8CvehvD9ThKwt
         MXmxqSE+eGSP3qk1tTZln847PR9wRzzolJqd0xblnyfYuk7b3/gAf8zbaqCim75kw5qT
         hBzlHrsG0yfBoWQoDtn6a7h3Of4EqPQPLH58gPk0JS4QMbdfz/ft1vQFAsDpOrS1chop
         e2i1+4sp+MY4ppkNMo9whgWDhCIlC+1Tb2Y2ffmsH1IaTVybK++JJj3XjAeTl4d/nB0x
         pSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=N77GayHg/5/eLrgYHWXfnTw+B002DDe5KNzYaTDlK3o=;
        b=ZWapkmFtGObnKvLxfjdKU1Aw0rBSAotO3ApEfCsjDv9Eqx57pd6dmJ3EdHFCc5pJEV
         c9kShFLAFS/n6rgSBzQAQFcA6woZhBmO/4OZqVLp2Q93O3DQDvfgWE+17mhe8l6JDfp8
         RvFwsizxnKPA4yhM4I+sKpxLN1KXo3xSmnL/F/dpQKwIj1udnRaPglBaZb+xdrZ5Z/VQ
         J6OduJf4iT1lhbMP6bYdnNpRKMFvY+5McB89FreYpiA1N9kc6tIB9IF0t78FS40s1MRf
         4JDFYwzMGCOwLuvVBwuBBOmqRUnG73PxaGUP4a1ITkYsDTTbWvQ4zWYhNbJrvir01sP+
         syug==
X-Gm-Message-State: AGi0Pubg5Iey7WFpDuoQSRvqXw5TQagRkmaXtBVehBlcCx1qgxfAy96H
	V7/AZvllwU1Ikuk68bxTKVvzyG2AZKc=
X-Google-Smtp-Source: APiQypL2FCZi5nzHb8IQb8vZm08n06nkgDaDGFo1QGPN09tkhjm9ENIAvYb40VTaRkAfLohoJgz/jQ==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr11180725wmc.59.1587278156658;
        Sat, 18 Apr 2020 23:35:56 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:55 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 09/10] wic: rootfs: Combine path_validation in one function
Date: Sun, 19 Apr 2020 08:35:37 +0200
Message-Id: <20200419063539.1467641-10-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Combine all the common path validation in a function to avoid code
duplication.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 41 +++++++++++-------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 544e868b5e..f1db83f8a1 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -32,6 +32,22 @@ class RootfsPlugin(SourcePlugin):
 
     name = 'rootfs'
 
+    @staticmethod
+    def __validate_path(cmd, rootfs_dir, path):
+        if os.path.isabs(path):
+            logger.error("%s: Must be relative: %s" % (cmd, orig_path))
+            sys.exit(1)
+
+        # Disallow climbing outside of parent directory using '..',
+        # because doing so could be quite disastrous (we will delete the
+        # directory, or modify a directory outside OpenEmbedded).
+        full_path = os.path.realpath(os.path.join(rootfs_dir, path))
+        if not full_path.startswith(os.path.realpath(rootfs_dir)):
+            logger.error("%s: Must point inside the rootfs:" % (cmd, path))
+            sys.exit(1)
+
+        return full_path
+
     @staticmethod
     def __get_rootfs_dir(rootfs_dir):
         if os.path.isdir(rootfs_dir):
@@ -99,14 +115,7 @@ class RootfsPlugin(SourcePlugin):
                 cd = part.change_directory
                 if cd[-1] == '/':
                     cd = cd[:-1]
-                if os.path.isabs(cd):
-                    logger.error("Must be relative: --change-directory=%s" % cd)
-                    sys.exit(1)
-                orig_dir = os.path.realpath(os.path.join(part.rootfs_dir, cd))
-                if not orig_dir.startswith(part.rootfs_dir):
-                    logger.error("'%s' points to a path outside the rootfs" % orig_dir)
-                    sys.exit(1)
-
+                orig_dir = cls.__validate_path("--change-directory", part.rootfs_dir, cd)
             else:
                 orig_dir = part.rootfs_dir
             copyhardlinktree(orig_dir, new_rootfs)
@@ -168,10 +177,7 @@ class RootfsPlugin(SourcePlugin):
 
                 #create destination
                 if path:
-                    destination = os.path.realpath(os.path.join(new_rootfs, path))
-                    if not destination.startswith(new_rootfs):
-                        logger.error("%s %s" % (destination, new_rootfs))
-                        sys.exit(1)
+                    destination = cls.__validate_path("--include-path", new_rootfs, path)
                     Path(destination).mkdir(parents=True, exist_ok=True)
                 else:
                     destination = new_rootfs
@@ -187,17 +193,8 @@ class RootfsPlugin(SourcePlugin):
 
             for orig_path in part.exclude_path or []:
                 path = orig_path
-                if os.path.isabs(path):
-                    logger.error("Must be relative: --exclude-path=%s" % orig_path)
-                    sys.exit(1)
 
-                full_path = os.path.realpath(os.path.join(new_rootfs, path))
-                # Disallow climbing outside of parent directory using '..',
-                # because doing so could be quite disastrous (we will delete the
-                # directory).
-                if not full_path.startswith(new_rootfs):
-                    logger.error("'%s' points to a path outside the rootfs" % orig_path)
-                    sys.exit(1)
+                full_path = cls.__validate_path("--exclude-path", new_rootfs, path)
 
                 if not os.path.lexists(full_path):
                     continue
-- 
2.25.1

