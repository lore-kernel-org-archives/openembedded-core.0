Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F9DC83F1B
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:39 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.4406.1693164751063324043
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RNiO+XzM;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so7326024a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164749; x=1693769549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=RNiO+XzM7G1ub+trBwDMRqw479zR/2Akavh7teoTs56ddc/BXE53ucko34/97KVL9z
         XlTNbaPAggCgkNlOx6Sd3FmNyJlVua34iqg9A/gfApWCZlkIPbYCa9BI9kOTWQWGc4l3
         5cCr3BA9r8jfRw0uhMEa3HD2GZGCI0p+ikQyOfvl9tErCuMaqEsYDc58msgLNst8e5LK
         c9MVVa3zchSaf3SeXDM02RZCXVKriD5pk+QupJqX2h0NYTVFSdpOjN61/1JXX0r4ZiMr
         2rKnyIXckEs8Cdpu/3LT2ucgClDBqQvkZGzZBpwLyWkFApqL3SPtSnkFkOXUgmZkUbni
         C3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164749; x=1693769549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=ZCzeLFr3cXHITUXv8viaEw5t15HHUe5OHLObyo4vCJRXL5LWU5zllgMBn9eJev3LFn
         wtgxHnN6wPfUOxCd6z27jZnqI64ahn2Z7FFBBrcbv2NughMsYFK3jqCxq/TgJ75m/MDD
         muZX6v6sEQEd5HHySxAiahMbQ3JWfDM2wPW/7N9eBxmgUIgJc45Fsp4JxEbbwTMfX0Hx
         rlj90PcoQ527heZd32JEeMjMnXMA+H3Iw0LzuFfqbBVp6tU+kAPf2QNzxayWvxoHtHsY
         MC4R+0FATBwCfMmE73OxmZ8yo5hQhlsW8PAdOogJxZAOHjw8xUJsGG/0J89BOZu2PtS+
         tDzA==
X-Gm-Message-State: AOJu0Yw4lTk6zFunm/FaEohAibFMgviZXlWVVXIpNxh5O5eOsqg3WrIc
	bo8j2qIppEdljW6eLAhYmXll0o6cG24=
X-Google-Smtp-Source: AGHT+IE3vXbn03G9NHsfhs9sn53J7FJrWzx52u+EHBW9a1RxeNMr+1kAWM76URO9FoySsGBgi31NWQ==
X-Received: by 2002:a17:907:1b02:b0:9a1:c35b:9e09 with SMTP id mp2-20020a1709071b0200b009a1c35b9e09mr14863122ejc.8.1693164749206;
        Sun, 27 Aug 2023 12:32:29 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:28 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 08/13] refactor: make multiprocess_launch callable without d
Date: Sun, 27 Aug 2023 21:29:50 +0200
Message-ID: <20230827193200.4083340-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186788

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oe/package.py |  5 +++--
 meta/lib/oe/utils.py   | 12 +++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9d70925b9b7..ffca7559ba7 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -164,7 +164,8 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
                 # ...but is it ELF, and is it already stripped?
                 checkelf.append(file)
                 inodecache[file] = s.st_ino
-    results = oe.utils.multiprocess_launch(is_elf, checkelf, d)
+    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
+    results = oe.utils.multiprocess_launch_mp(is_elf, checkelf, max_process)
     for (file, elf_file) in results:
                 #elf_file = is_elf(file)
                 if elf_file & 1:
@@ -192,7 +193,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
         elf_file = int(elffiles[file])
         sfiles.append((file, elf_file, strip_cmd))
 
-    oe.utils.multiprocess_launch(runstrip, sfiles, d)
+    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process)
 
 
 def file_translate(file):
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 69ca8987f3d..430e874d90a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -264,10 +264,17 @@ def execute_pre_post_process(d, cmds):
             bb.note("Executing %s ..." % cmd)
             bb.build.exec_func(cmd, d)
 
-# For each item in items, call the function 'target' with item as the first 
+def multiprocess_launch_max_process(d):
+    return int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
+
+def multiprocess_launch(target, items, d, extraargs=None):
+    max_process = multiprocess_launch_max_process(d)
+    return multiprocess_launch_mp(target, items, max_process, extraargs)
+
+# For each item in items, call the function 'target' with item as the first
 # argument, extraargs as the other arguments and handle any exceptions in the
 # parent thread
-def multiprocess_launch(target, items, d, extraargs=None):
+def multiprocess_launch_mp(target, items, max_process, extraargs=None):
 
     class ProcessLaunch(multiprocessing.Process):
         def __init__(self, *args, **kwargs):
@@ -302,7 +309,6 @@ def multiprocess_launch(target, items, d, extraargs=None):
             self.update()
             return self._result
 
-    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
     launched = []
     errors = []
     results = []
-- 
2.41.0


