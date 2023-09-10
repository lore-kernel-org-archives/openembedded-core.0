Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD36EEB580
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.39125.1694362765860028984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YXFHu/e9;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-317c3ac7339so3380524f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362764; x=1694967564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KCvk2S8+R6M1hUYSU09U95QEnD4CiRS6l5BrjJwoc0=;
        b=YXFHu/e9Qdvsh1qv5SpLTYNl+ddAatnlOW+nfM3IS/k1Z1jyonEJ6xbC62hPng8jcA
         mQMHnKe5FmI19pvOpG6souxy+KVgrheXRKSQo9Gc89gYukr3H/t1tPRdChHgSuKWFoM2
         Dj290aVlPCiT3+oCNxRlPTdsel97SW9hV1S0eQq1hBMpU3xVEUGL7x4t/1KdvVLLN5k+
         761UrMYDM2csEazM5erh0vNhi0rRclxjJS1v4u5/TyMf83scK64F4vlImr/DbK12I7Zh
         Qv+hMU+c43Fd1wn7z7rEOk9zVXvoY9voSrylCTkLzy8ZQ2AdpkqXWSonxuzdDflOEfIc
         IF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362764; x=1694967564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KCvk2S8+R6M1hUYSU09U95QEnD4CiRS6l5BrjJwoc0=;
        b=DgNbG6F4+Li6X3RACrgSnOlHz40cyt7Zqo01F9WBgDCLTF3F+Lz1U/9ECobDDqqyMO
         X6G1OI/H8n0vbCHwA1p+W7fAR09bx5Qg1roWFyzfpxXaaDzrf0bg7gwHczT6+TXztgPu
         kbfN0FLxmVAkWsj2sKoNTyZOcJMXJBXO/qeN1hbyeFmt42igur9Qjfm8Tz62zCct3rsx
         8O2PTkC4M3B4hhqyDM/HKbq+YDS6/BAtkUo8LaBzd2ZdlHDIkkvRgTQzcok64uOvoaUT
         pm/W/pXwGQlXg/L4756uEnsEWzjBWlKViN0zF8ZE4HQquiMN3ksNgaIcWMaNzIYLTixm
         J6Bg==
X-Gm-Message-State: AOJu0YxRS9+LdJmREZ3VK3Dp0uoP8+jI1LEJj5+mLNmEU81D6KvLOQZh
	JaID0/ZzTfjlW82ZKRHqiMDgOv0xXQI=
X-Google-Smtp-Source: AGHT+IE56TtigQBMBHq9liXFu9wuAWyhS4ezW9VhrIQQsZe8tLL9Dq9xyt6uT3xYZf5toadw8Zonmw==
X-Received: by 2002:adf:ec4c:0:b0:313:ef08:c83b with SMTP id w12-20020adfec4c000000b00313ef08c83bmr5456797wrn.56.1694362763760;
        Sun, 10 Sep 2023 09:19:23 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:23 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 06/12] refactor: make multiprocess_launch callable without d
Date: Sun, 10 Sep 2023 17:52:32 +0200
Message-ID: <20230910161850.4032227-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187464

This is a preparation for making the strip_execs function callable from
devtool without going via tinfoil and a bitbake server process.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/bitbake.conf |  2 +-
 meta/lib/oe/utils.py   | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0bcc8215c5d..69e854ecedc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -975,5 +975,5 @@ BB_UNIHASH ?= "${BB_TASKHASH}"
 oe.sstatesig.find_sstate_manifest[vardepsexclude] = "BBEXTENDCURR BBEXTENDVARIANT OVERRIDES PACKAGE_EXTRA_ARCHS"
 oe.utils.get_multilib_datastore[vardepsexclude] = "DEFAULTTUNE_MULTILIB_ORIGINAL OVERRIDES"
 oe.path.format_display[vardepsexclude] = "TOPDIR"
-oe.utils.multiprocess_launch[vardepsexclude] = "BB_NUMBER_THREADS"
+oe.utils.get_bb_number_threads[vardepsexclude] = "BB_NUMBER_THREADS"
 oe.packagedata.emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1658f3555d3..a3b1bb1087d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -264,10 +264,17 @@ def execute_pre_post_process(d, cmds):
         bb.note("Executing %s ..." % cmd)
         bb.build.exec_func(cmd, d)
 
-# For each item in items, call the function 'target' with item as the first 
+def get_bb_number_threads(d):
+    return int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
+
+def multiprocess_launch(target, items, d, extraargs=None):
+    max_process = get_bb_number_threads(d)
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


