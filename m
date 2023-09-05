Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18768CA0FFB
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.27274.1693933178688884181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OQnSziAN;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-313e742a787so23879f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933177; x=1694537977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmsQxkNVWaDgGBhR/wx42mDBkC+iCPyEtuWdQmFXKe0=;
        b=OQnSziANLmFlc3AKMQxuu7PSmC69Fre/OK7e4mNEYhZa5wSuYjrp8KlbgqEr9jXnc8
         YHdTiAYTRZHJ3psjXa9LkTo4P7ExcQTBlhR4OtU5Y5qHNN/KMjRFUTDz9XbkMhh7YLgY
         gL7MeH4Ktgki2wko0DOb1WOnbpP07g7/EvQFP+qssNerEvcK4jbjZkCjq8RNZjJZwnfN
         qWM3PjTR50aC3u961on3ThrjAowyMoNSBLP1tVl5iRGVS0FcBtdND7ro8VNywhojnJI4
         UB8COAVRCFWx/DJD+Xemc7vrLijyWfU9YD3k7jNH5IL5bSk8yR+jvTfVN5QEea+xGO9/
         GWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933177; x=1694537977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmsQxkNVWaDgGBhR/wx42mDBkC+iCPyEtuWdQmFXKe0=;
        b=MGLnDQWJwXBbgEtJEWk/lddt33nY7ldmDlEnXOkh3VI/bkGQc5eJ9/p2luoMZD4rk7
         fvppRfLVVHOxnF9wcywYKckLQMla3YrJQ23pKzo0jKovMNB62go7h3PVLqyZmMnTLx15
         kL7QzOA2Jp/SFEkzjV6Q3wdmFrfoHI25V7VCBkQUwQS7iB5meUPO1qUgkkBIX/AnedTG
         NmnwrWgyle2xYWr+xteOkmDhF85uwW0blWLcyltpaufSp1ePt63Oe1NEnLTenAKjNckX
         88RbPVALiT+pkD9Am/686CEDaJBE90bKwJGR0X8SVAUVSKK+u6J8oITOLIAWVCWBTJUB
         4+bw==
X-Gm-Message-State: AOJu0YyhwdU4iaVOu9G2BMKELuj5KQgF2D5xaZEnxn2nbXUr2pFKSeWR
	/O+XLn6qZSBODIRjrDzcTvp9EFHAJls=
X-Google-Smtp-Source: AGHT+IF/xRQIyOeDwJZQgKRI4dXC+huDOBf5f5JpRSJLFWjLVvRr9VGG8x+H7hcfJbHkwRTDjQwOVg==
X-Received: by 2002:adf:fb10:0:b0:313:e2e3:d431 with SMTP id c16-20020adffb10000000b00313e2e3d431mr318049wrr.12.1693933176875;
        Tue, 05 Sep 2023 09:59:36 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:36 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 08/14] refactor: make multiprocess_launch callable without d
Date: Tue,  5 Sep 2023 18:51:17 +0200
Message-ID: <20230905165913.2560907-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187240

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
index 69ca8987f3d..39042463d6b 100644
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


