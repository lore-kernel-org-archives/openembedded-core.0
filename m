Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D788DC3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 15:01:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.19271.1719586883939723632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 08:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IK4VSfzH;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a724598cfe3so91287366b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719586882; x=1720191682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IyL0+pBS8i2bhrQq91pPHFjicq07nmcND4HyhAsZLmc=;
        b=IK4VSfzHv6IKgpl5Y2ywFmTtz9monZgkwkgieJV7BMNkGW8OtkHMsCK1MMMg3+sg+w
         l0F6w2hRrv9m9uGj6e0YQ5G1ez3vq2rvJ8kBe/SLzr0hFSELeP4KX6349rc7fyjyQizw
         pxpPHKJGw1C+xr73j105mUGWWfZiV29EWkv/9AaCyIaJfFhcU82aQ1erN5RbXrg1j79k
         SiK9HmHtL5KYe2AaeIw7bekL+hRYbmdzBrWT9tWM/eFi/rGhTQkRE6ufiiA27Tg74vYv
         +p25s67dCCpfkFtVZ/Ebr9l5SlUC4Ngt2+fhwemy/xT/KlSE6pVG8VFTDam1Luhfpa87
         Q09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586882; x=1720191682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyL0+pBS8i2bhrQq91pPHFjicq07nmcND4HyhAsZLmc=;
        b=jW5uHntOOLEZTvWIHBnurrpz/PMd70mOQ3y1QAA3DApuj9OD0IWH9RrhD6Er+z2v/d
         nZUcVxJhnCmzSvBrOqBRbQyFi74JgapQ7d47rlbQ/+C6kujUrj7Lr2aajx9+UFBEuNHr
         QPf3oMA0eF4M+MQbtrYwilMg1tUTlIgK2R+g0/QdZM2rlXQcmGAI43BS6hCNpexvfRy+
         8bDCYZPkQtQiDaAqvEasByNZmZM+W43D0ucoskbIhJPczL6Bt/4PCxXir1Ng16qeSzfV
         U3SDOm4Bshz0C77FBAPua+EZGbEjH7K5H6CXPd8oTHmCJ/UIEhLgxOVIlAMwgUDjg0Fk
         ZYeQ==
X-Gm-Message-State: AOJu0Yztge+lT4BBC9WdPj9IOkQ57Cfbyu1HWDFvEqDyccdGPUatlCk+
	RAECHz6rKGkOQU/HOkRurF7JmYdp5kYxP1uIft+NmiRvZnvEKqyZEGhDmQ==
X-Google-Smtp-Source: AGHT+IEqXiYkxtvkvQbqrhf/RGmNO3BsF6I2DdICmLDUTO6jxGbODAeKTRMM8+iGYspvoDhxE2d2jw==
X-Received: by 2002:a17:906:bf4a:b0:a72:5715:f7b9 with SMTP id a640c23a62f3a-a725715f917mr1366657166b.15.1719586881638;
        Fri, 28 Jun 2024 08:01:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065667sm86656466b.114.2024.06.28.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:01:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3: drop deterministic_imports.patch
Date: Fri, 28 Jun 2024 17:01:16 +0200
Message-Id: <20240628150116.3799311-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 15:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201224

From: Alexander Kanavin <alex@linutronix.de>

https://github.com/python/importlib_metadata/issues/489

Upstream discussion revealed that:

- the issue was happening due to a bug in setuptools

- the bug was fixed in setuptools 63 (I confirmed this: empty dist-info
directories no longer seem to trigger any issues if the patch is dropped)

- the patch would obscure any further issues of this kind instead of exposing them
for easy fixing, so they suggest we drop it and report if anything else pops up

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python3/deterministic_imports.patch       | 40 -------------------
 .../recipes-devtools/python/python3_3.12.4.bb |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
deleted file mode 100644
index 2de6ae2e981..00000000000
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 27 May 2022 17:05:44 +0100
-Subject: [PATCH] python3: Ensure stale empty python module directories don't
-
-There are two issues here. Firstly, the modules are accessed in on disk order. This
-means behaviour seen on one system might not reproduce on another and is a real headache.
-
-Secondly, empty directories left behind by previous modules might be looked at. This
-has caused a long string of different issues for us.
-
-As a result, patch this to a behaviour which works for us.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/issues/120492; need to first talk to upstream to see if they'll take one or both fixes]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
----
- Lib/importlib/metadata/__init__.py | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
-index 82e0ce1..969cac4 100644
---- a/Lib/importlib/metadata/__init__.py
-+++ b/Lib/importlib/metadata/__init__.py
-@@ -710,7 +710,14 @@ class Lookup:
-         self.infos = FreezableDefaultDict(list)
-         self.eggs = FreezableDefaultDict(list)
- 
--        for child in path.children():
-+        for child in sorted(path.children()):
-+            childpath = pathlib.Path(path.root, child)
-+            try:
-+                if childpath.is_dir() and not any(childpath.iterdir()):
-+                    # Empty directories aren't interesting
-+                    continue
-+            except PermissionError:
-+                continue
-             low = child.lower()
-             if low.endswith((".dist-info", ".egg-info")):
-                 # rpartition is faster than splitext and suitable for this purpose.
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 8b5e7bd99cb..eb3866d9be7 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -24,7 +24,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
-           file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
-- 
2.39.2


