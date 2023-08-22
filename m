Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFC2EE49B3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:55 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.5238.1692732226629626525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JlMLVeW/;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9a2033978so75508451fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732224; x=1693337024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=JlMLVeW/NHVUU8cM0q7Oo8uGZ5a239ZIiXnm4WtpyjOBj1ONJIjGtKZ2CBYoI3u4DV
         LfsSPJwVmjJYLtcK/k4WIDeSPG1VfoaeQqpZJZN7UXwEGgRfIN+v0j3jFJ1BhuDVwZOw
         9+60zm6+8HZYUVss7Dp03amQarCHgS5LLnWhGZCVW+zMWoMzHOdz9xTnwSN23a1AMLX2
         KX0r+WWNh1JyjnVny8mz2hAisnffh478rSgJU+bB/GXSp4WgfIUwO2v8TGzjjDfNm6VN
         ftTh+mQ3QRh6MwelsJ0E9P2GJLJgzmlEESUgIY9UobpZK6twrw4Er+9jcPOJT6EBQAX3
         jLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732224; x=1693337024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=bGGVt9ISWk0owHQ9q19mjxhXmeaCEMr/8Qs0kSuJiC7OPizEkTK2JYytr0oupIk8PA
         1EYdo/aBuQah1G51enuoBKJkh0cJ7LSof6tP4E3Iy03Co5RTXBLbnGb8LaatELhfnvXy
         MR+JGMAfAdBSdu7IfaLL79FJG182HCvn+71DIEZmRS6ks6thi8fFoY2Zm9556Hu4nzMc
         UvOTMYho37twEy/6mrKA/FLsE41mj3G5NNghISoEPHM1YBcCTpJZBzSNjBF7sVR2UayM
         Wdh0q6NZ7K4c34G5AyD0jq1mH94pNdyifUZi7GLWD9xc1xaiutLM5jKxPeAitqwAGpGT
         liNQ==
X-Gm-Message-State: AOJu0YzwVmluzSTd97sgezQy+LAx2DKYLHYv6oR6OjC7ZBMi6SSMd24D
	/owlwBqBepZPKNZbu4gCrr8pB3xMTE8=
X-Google-Smtp-Source: AGHT+IHOL0KZGm0dQx39aJS5bzQdZKKTXAYN2OjRGeOR4SERlfHMcqDWrMgNf9JVVbvcLb4j/ELlUw==
X-Received: by 2002:a2e:8013:0:b0:2b9:ba75:6620 with SMTP id j19-20020a2e8013000000b002b9ba756620mr7677630ljg.6.1692732224335;
        Tue, 22 Aug 2023 12:23:44 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 08/13] refactor: make multiprocess_launch callable without d
Date: Tue, 22 Aug 2023 21:20:14 +0200
Message-ID: <20230822192300.3235896-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186531

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


