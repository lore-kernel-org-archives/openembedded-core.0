Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4089BC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 17:18:26 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.1735.1739467104323183433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 09:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXby62kr;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f3df03d786so198727b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467103; x=1740071903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjIDwM/ficQhwTBh1t20XQzT0JC0VI5opq4IFymKs9U=;
        b=UXby62krfSeT04Rv+BP9ipO4sTht/HwO8sY8nG33G4Mu4mNY1fZZ5mvpPzpTKuTwHN
         n2soeLY3H/BL1AP13AO37aWWt/vGabzQgabKum4pf428T4UTKJMbbPAiHkhpK6EDpmkg
         wBNO+BUkZDH0+bUf4lbnO91ExpXpzPEfGD1pYm5XV5lEapUckKW8fRkAXQ2/Wgt0CDb9
         0JZY7iY43RGSM+1MBrc0Te2iKulk3lwIiD8+DGGd9X4dr5pEBsm62W24zDLeJNyiCozX
         MbUp0785Jl4M1Zfy6ECIl+LrjI+5AxhIox5FiJbF48atdbliXQTcbuAsycM3sAMQXqHq
         kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467103; x=1740071903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjIDwM/ficQhwTBh1t20XQzT0JC0VI5opq4IFymKs9U=;
        b=gEwP4KWASK/Y3hzfmka8v6rnkZvBNdzrySbNKtJPXVtFD5a5VH4Dg/dA+9UCeNfxml
         37pZ/I/TvNUNYVXmrA9AhDn2k/TrRQmK9fxxnnBEXD9iMBMc/7U5UPI8LXJKaOO1C94/
         W2VKAB8mOEpFDQrc6te6yGEylCHvKbmx+Mo3iXbLF/qEe3jteQ9SDQubT0P0aozwbQ0M
         HtsKe7jhF8ysJMVyMlN9B0XnUXa7pjiGRY6dQ37SP1OgEQMF91TvsFRX9QG1RXo8HBIg
         4FVWaYxmlohVdzmvjWgYqIGiILD7HUjkoR+0lMWqOcpsJxGg3UgA8u+igiozA9wKRDZI
         z6ng==
X-Gm-Message-State: AOJu0YzBF1jrqCIRo2YQFiNo4MlNSeh62aSetuf1X1Pf6k+IDlEWrNU5
	TJ68Ofdo0UhuGBlZrB1MIuzTXYUNeZsu4She6inDmtGLiht2ea402oVMyvFY
X-Gm-Gg: ASbGncur5MVZEdnwZ1sM0sow1dMRhiv726NjwJQpvGlp43V2OyFygkgfjOYBrccWfjZ
	R8yc3kXVYdZb4jufMRoU6/VeccuRKgtfyL5eVMzBfH2+IogbZ00alWGg/nHGuLIumRqr3zmYXaU
	Hj/PEXaxphogUDvaZWLZVtMN0b/H6FS05l0Xlbadfa7qIynSlh+3kVIh4StCohS9VLhQhtqMXO/
	ddUAUjFFm6JNtJrJIrHlzLcoxDsSgEjXBUi/C2YSyvliwkzrUG55IxmX3j/O6Qke4NHngm064qr
	kqb0g4wOAHBfKw==
X-Google-Smtp-Source: AGHT+IGQHccE7zAkF/qUPJt+dmPUlxIlXuPHUnTVN2xLAa1v3mAA7tN3SP7OxSwFESeJF/yJvBD+mQ==
X-Received: by 2002:a05:6808:2e99:b0:3f3:c94d:b083 with SMTP id 5614622812f47-3f3d8e3e09fmr2973567b6e.25.1739467102916;
        Thu, 13 Feb 2025 09:18:22 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::3f26])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727001cdb70sm742968a34.13.2025.02.13.09.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:18:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx30: Improve os.walk() handling
Date: Thu, 13 Feb 2025 10:18:17 -0700
Message-ID: <20250213171817.2590606-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 17:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211361

There have been errors seen when assembling root file system SPDX
documents where they will references files that don't exist in the
package SPDX.

The speculation is that this is caused by os.walk() ignoring errors when
walking, causing files to be omitted. Improve the code by adding an
error handler to os.walk() to report errors when they occur.

In addition, sort the files and directories while walking to ensure
consistent ordering of the file SPDX IDs.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6a39246fe1c..e3e5dbc7427 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -19,6 +19,10 @@ from datetime import datetime, timezone
 from pathlib import Path
 
 
+def walk_error(err):
+    bb.error(f"ERROR walking {err.filename}: {err}")
+
+
 def set_timestamp_now(d, o, prop):
     if d.getVar("SPDX_INCLUDE_TIMESTAMPS") == "1":
         setattr(o, prop, datetime.now(timezone.utc))
@@ -148,11 +152,13 @@ def add_package_files(
     spdx_files = set()
 
     file_counter = 1
-    for subdir, dirs, files in os.walk(topdir):
+    for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
             dirs[:] = [d for d in dirs if d not in ignore_top_level_dirs]
 
+        dirs.sort()
+        files.sort()
         for file in files:
             filepath = Path(subdir) / file
             if filepath.is_symlink() or not filepath.is_file():
@@ -356,7 +362,9 @@ def add_download_files(d, objset):
             if fd.type == "file":
                 if os.path.isdir(fd.localpath):
                     walk_idx = 1
-                    for root, dirs, files in os.walk(fd.localpath):
+                    for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
+                        dirs.sort()
+                        files.sort()
                         for f in files:
                             f_path = os.path.join(root, f)
                             if os.path.islink(f_path):
@@ -1046,7 +1054,9 @@ def create_rootfs_spdx(d):
     collect_build_package_inputs(d, objset, rootfs_build, packages, files_by_hash)
 
     files = set()
-    for dirpath, dirnames, filenames in os.walk(image_rootfs):
+    for dirpath, dirnames, filenames in os.walk(image_rootfs, onerror=walk_error):
+        dirnames.sort()
+        filenames.sort()
         for fn in filenames:
             fpath = Path(dirpath) / fn
             if not fpath.is_file() or fpath.is_symlink():
@@ -1282,7 +1292,9 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     root_files = []
 
     # NOTE: os.walk() doesn't return symlinks
-    for dirpath, dirnames, filenames in os.walk(sdk_deploydir):
+    for dirpath, dirnames, filenames in os.walk(sdk_deploydir, onerror=walk_error):
+        dirnames.sort()
+        filenames.sort()
         for fn in filenames:
             fpath = Path(dirpath) / fn
             if not fpath.is_file() or fpath.is_symlink():
-- 
2.47.1


