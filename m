Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.11319.1586871396537895335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ReqQVoGa;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id k21so12539091ljh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X0T7wATlJ3IaEfQup9RRiXEdaPEbdQy2f1sLNTbmwl4=;
        b=ReqQVoGaoulEp8tyWrvoI5W0EBmH7Zobdcd9weineIq3+okbibi7+baq0UZ6DnEAMk
         LSqu7jzQNZpV/KAtx2ARSXfSmAtzb5vrDE0AmEygOcbR63q2eHQFeE8VpxkdgelSX5HO
         BjrHXfrlKZyCE+D30idYneRaRCAVGVBEAW7cAJ9YGMq7RH65pCLTDuH1LM8xVuHxkJaC
         wXu4QSkKgI13wje9pHdDewgZabqIi9NEWC6unkUFynCqO6AEvproMzasM6xS/+5ZAuL+
         +2sb9IUQRp8WLhnIBfCqnVu4AXNbCWm9Jf4JX8q9wMXhwAVCy1c7yCSqSMQvaH0AIaDs
         l7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=X0T7wATlJ3IaEfQup9RRiXEdaPEbdQy2f1sLNTbmwl4=;
        b=b6e1xl8J/mDkCDoMMVnowkW/9P8EMjZJ8L+mScTg4Gz79SXi67YEv8i/pc0InMnjl4
         jSR5bTbm3PIstE5/gfuWlwH6INwWExZuxZu51B3BvIWF1GmtJBgVx3rEBseylQdvsHAi
         WwB0AQSpzokJU4YaVvZxebvLtUo4hvQC9FYrt/ay0iAQ52ji1pdjGsuTZFenZF3NZF2c
         CZ3HYriJnD2WcNNDAaPI+uLCwXbxgYT8sqy6hYedBiW4BJnO9NMmkOiyyXFBehw2jyZF
         wsNbXw65kAZyMrg4liLzpoJuffmZvTeO426jH6CAsXL02O/dEgOHlUH5LIRnvrjs0NQH
         RKgg==
X-Gm-Message-State: AGi0PuY7WjWHhdZfxIIVZTHHthPPX5m2h6p3jQPGcOEoEXHeHWbZzjXO
	CacSGILViL3ylscO5rrcoIBaXyh5I4Q=
X-Google-Smtp-Source: APiQypKsPwpz1bWXJorKJYuL2vYc32Olm2iEwwj/bstYgXxTPe9UoIULQ0WB5XHS6byGI36vhEdgQw==
X-Received: by 2002:a05:651c:50a:: with SMTP id o10mr116906ljp.163.1586871394524;
        Tue, 14 Apr 2020 06:36:34 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:33 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 09/10] wic: rootfs: Combine path_validation in one function
Date: Tue, 14 Apr 2020 15:36:13 +0200
Message-Id: <20200414133614.1830058-10-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine all the common path validation in a function to avoid code
duplication.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 41 +++++++++++-------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 9d0666b638..53942cc4b7 100644
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
@@ -161,10 +170,7 @@ class RootfsPlugin(SourcePlugin):
 
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
@@ -180,17 +186,8 @@ class RootfsPlugin(SourcePlugin):
 
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

