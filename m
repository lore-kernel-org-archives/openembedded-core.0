Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9508CEE49B2
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:57 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1051.1692634310533466323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a3xEK5NS;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-529fb2c6583so2460056a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634309; x=1693239109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=a3xEK5NSs7DCDY/WzVIag5ca5SGAQD9OxnpOr6fEKIB2l8daRH1Z4pa7PQq4Wsw22a
         FCudXjM0b7IH0qgC19slZ74ndAuXarWmah7Kpai197i1Q5b0p/ZC8xEaqq/GzhM6uZJi
         Otq8xTUdvnhOCVCNse9G5sDdU+NWl8ehG5+BcIOT5JY1z9vymM4ujlhNpVLo5gBliBUM
         zkGMw4Tq0OO2rtaUEixcUH/ISTcaojnppdeOMn2p5pfmqgU/vomAsr2XqRp+hs6sh+DI
         dMnKmtCtMnXhRe+p9sHbeYQLOpQEZG6hfiOJTJYzE/Adfojwa9SJyC50pOviJEJINT1S
         Zugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634309; x=1693239109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19fLgghekqWM22ZBRBUMVm4pfisluZVtZiAq51rVSl8=;
        b=B3buS6iGquXCx91WJ1X/7KCiFYpNHxsSjZXMVCbEmXX1jxMoYra8p3Cqt/KxN09c6W
         gVfUzenFV6cbPJANGceOv4hna9HBBeNthnbm/okmVY/Zqu0W+9vhe/btpkJ6RTASTX7+
         KKsRfY9CAecf/xk5QvJILkA5U4LVL+/HrLZp3Jc1UT9pMqqVxfhES/L9hYbymqGGvfqp
         cWdjXeHrlF385hEgUfhrl+JgeVw4YEc5DfbDQAG05gCawjsdsw7linPwJ4JRRQapv0mr
         0Ch0QCBz5T6qdzHPKwnAjrtgTGCi8ifdFSRPURR1JHMQTrm0h/j3hecV0aXYdeKrpQKm
         uokA==
X-Gm-Message-State: AOJu0Yxdad6/mBXTI9RNfx9+FOWR98AEsA5wbGjUZiFXLn3dLVN5jkfO
	Y0RGk+KIlHmIz+Z7/CNoyPxXkMsIwrU=
X-Google-Smtp-Source: AGHT+IHSD/rNljqR9OocZ6M45z9LqxvaJZEpU2QxKPU7g2bf5NPqzAbslzftUSLhHs1kj5ZRuyw5Ew==
X-Received: by 2002:a05:6402:164e:b0:522:cef7:83c3 with SMTP id s14-20020a056402164e00b00522cef783c3mr5327638edx.8.1692634308710;
        Mon, 21 Aug 2023 09:11:48 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:48 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 09/14] refactor: make multiprocess_launch callable without d
Date: Mon, 21 Aug 2023 18:07:12 +0200
Message-ID: <20230821161120.171956-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186472

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


