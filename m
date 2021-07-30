Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.22081.1627640600305806600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 03:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aF4ttZxk;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id o5so15955702ejy.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DY4lk4sCCduOQk7ol1mAa3JYj8J5rEqjKcUcXmt6j4A=;
        b=aF4ttZxkcj45pjxBi+iYQLvHctEu+gTB/V8l2B2ADWsYkjWTOvScg/PSGwYSqf1+Et
         aO8UNvmckw3DsW5hLjrSGfhv/mIZ7TYuUYS36zcscYYbLjCIfdLlyXbywrrTbpiHiwJ0
         zsE4DNr/nohYKvMINTjnTy3Id+OTnMUAZWQ7/jefaHEpeUvp7iE1uj8A5e/ouiGZvbf/
         2N7NT9NSpzA7cYeSWp+kW2TQl4972sqHO6dTYdQMWMF6aODfMwRMBrDVWQQkUAFlVOw6
         gaRzKb1l4+fKSnAF2FvBcmfPmV8ql1SL0Rn4Ita+D+TWBqtlipkeWy/LgfoF1UaFsr6n
         2aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DY4lk4sCCduOQk7ol1mAa3JYj8J5rEqjKcUcXmt6j4A=;
        b=Hq3y7sInQMNAD5cxLOL0SIjM479q4hmiQrNt3DDVbyQ1cbXC4FTYvtvpZ2yKYappR2
         1bXnlQroGAWGAoeDQTn4WYAk5EOCJ7cgcI0ubvDLIEmNLd8f+yxEhAniWGxn8s/3Y9uz
         ofEZ+/VND9YFdphTgg9P5t30MaVSsrQ1FUjU6S1ayJztKrNNzidCJ27YBZpMZUpa1NCd
         LIgzhKmUvNgbvQPWkyzMmuH6T6uD4A6DwSXVPxDnvAUrYS7zMlG2ezXvJ2LrrG0dX4nI
         CZg9QIU+7OqvNwLG1hPpUTuBvWTP18ZSYLYHMDuJHRIdQH8odn2ldI74UzFRgux3hjj4
         fa3w==
X-Gm-Message-State: AOAM5339Dd/lmNBWA962Tz1BGBQhcPgzMpzuY/rFiRIaYnD/OxawBVo3
	fm+zZpuNjpC4KA4RblB1G48LKEo38N+5kg==
X-Google-Smtp-Source: ABdhPJw+jaICFkEO11QPYOsyjDeUVP/KWKgqUOOy/kasb5OAIjRGk95Abua9IeKc85bOzxKg5CpCvQ==
X-Received: by 2002:a17:907:75d2:: with SMTP id jl18mr1834687ejc.238.1627640598895;
        Fri, 30 Jul 2021 03:23:18 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c14sm404358ejb.78.2021.07.30.03.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:23:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] convert-overrides.py: allow specifying multiple target dirs
Date: Fri, 30 Jul 2021 12:23:08 +0200
Message-Id: <20210730102308.19038-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730102308.19038-1-Martin.Jansa@gmail.com>
References: <20210730102308.19038-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/contrib/convert-overrides.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 739fd53bdb..bfdf785719 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -23,12 +23,10 @@ import tempfile
 import shutil
 import mimetypes
 
-if len(sys.argv) != 2:
+if len(sys.argv) < 2:
     print("Please specify a directory to run the conversion script against.")
     sys.exit(1)
 
-targetdir = sys.argv[1]
-
 # List of strings to treat as overrides
 vars = ["append", "prepend", "remove"]
 vars = vars + ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
@@ -125,15 +123,17 @@ def processfile(fn):
 ourname = os.path.basename(sys.argv[0])
 ourversion = "0.9.1"
 
-for root, dirs, files in os.walk(targetdir):
-   for name in files:
-      if name == ourname:
-          continue
-      fn = os.path.join(root, name)
-      if os.path.islink(fn):
-          continue
-      if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
-          continue
-      processfile(fn)
+for targetdir in sys.argv[1:]:
+    print("processing directory '%s'" % targetdir)
+    for root, dirs, files in os.walk(targetdir):
+        for name in files:
+            if name == ourname:
+                continue
+            fn = os.path.join(root, name)
+            if os.path.islink(fn):
+                continue
+            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
+                continue
+            processfile(fn)
 
 print("All files processed with version %s" % ourversion)
-- 
2.30.2

