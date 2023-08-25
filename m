Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919ABC83F04
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:53 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.2562.1693002463907359371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EVC0HGdR;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so5021835a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002462; x=1693607262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=EVC0HGdRBEptyoS/j+qkYWS92BHrx3Jd5Nfprm45F/7kU/+KmjlCRlwA+tgDNnkTIS
         f9bYerz6aG6ggjKu5tyPsdNn8jVMAx/oJvIMEBqY1ul1oipW9C7DUVDlXc4k4CmArQMo
         qcZbgK4MY+oz5LK8H/n1sWSWl7MrPldNeb8WKLTDxgIK6c4ykEVyqCbIYVCVP9ywWhoO
         RX3xX1fJbQ2WwXsCUzuj1arsxnoT64wnScREhh4ntL0THakIoUywN6z+8K3smiW/XMAF
         czKBH48uvYdOsPXWyRuGekgMkHkt+zhH1wR1xpJrS3qm5uOSlQd/O0B+IuWQ3GvYqz3Z
         OQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002462; x=1693607262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=Wy6K8gPH0+rdNrisykuQr8ZG60EfK6AdEXNwOYMAio2vNjs/jNKlYPy8arq38BZ6sy
         h6v0xXN9+mqzHPYYZXfiHK8eHdOKAUy9LrUXZl3k0pYu6dpXm7qqedqtd5kVOYN5nn7J
         H/XOa6nWoS89VGdHUaczp6GBebiD267jBWbA9OKq2f4xJb39G9pv6IS5PPkCp2Q7cBGT
         Ovc5CmDOgwnxGI9yldxWRyMC/4QzKV9eWCFY8CE2x6n6NY0lBdm6m0XylUMwRAYzye+J
         NBIJvH8pAWMDWrkoDGGVp+2lucRgm6OQzxz6LyKJNc11eTXh0IcKsCGQt8rMLr1fPwnf
         XJeg==
X-Gm-Message-State: AOJu0Yw3GmgQwqoXeeQTx5tb78s45Od6b5P3mR1mn/M8RsLWq9SDjBxt
	dv/miSpZ2P/kLK5innJClMZII8mvbeQ=
X-Google-Smtp-Source: AGHT+IGh/OclwF4pg2HzvmRnpV8ZJ4YffNBRt/HJaGm30gkPTHzSQQ4/ExOPIS4rATN/1+Uq4OYqig==
X-Received: by 2002:aa7:c384:0:b0:522:4764:8baa with SMTP id k4-20020aa7c384000000b0052247648baamr20858291edq.12.1693002462064;
        Fri, 25 Aug 2023 15:27:42 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:41 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 08/13] refactor: make multiprocess_launch callable without d
Date: Sat, 26 Aug 2023 00:25:48 +0200
Message-ID: <20230825222711.2735745-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186735

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


