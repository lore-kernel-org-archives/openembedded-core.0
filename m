Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D47CD44D6F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:55:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.46008.1730901339204971538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VAUmMU48;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so873827766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730901337; x=1731506137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ATwN52tjvmV5omNGcAmOIzHxYtuDy+KGYpZs0r4WvQ=;
        b=VAUmMU48nkUJBPuGXfE0cD9rCcqlm1cnDeYoNn/ozjfHiQvgltV8h9k9F3aX0Bo59H
         ZJSClrxG5npCl7W0rPjcwKPif0HKHaRKrcoQdlr4YonOwEPCSFf21Wm9eLpRCZDcTrH8
         v1q5bsTUpYxkbmTrIngChuAxzYGjwevquPGpxt1qK8f03p7PJti+h7Eym8nGRpT/x4Tm
         SQt3Q/MI0whBLDIOncpB4p/rAmzXXp8geIqf+rw2Kkwwg9NkdPo4Q4lEPnfe72Z0TTOl
         rXnL1tvcn+dyVfHYYQz6/InisRcyinCAGoLToulFvMvK+xUvQsSrzTsMPtFKwIth2YGY
         4z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901337; x=1731506137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ATwN52tjvmV5omNGcAmOIzHxYtuDy+KGYpZs0r4WvQ=;
        b=CX1JYVxRp2Yz4nb/YLUYj40H7JfeEtBSNUrCE/AxcxjuzNk/r/pZNzNpYuv0H1uisf
         qDWocoMT8HXW390RdiCMhiUc9eCm2EDhAzamFPPQRU015N3b7ZBbO2Slk0RsRIqGGg7s
         sGi84hJtREmuklhzNatagEKC8jWzY85irrI0nsBcM5CvZZ6UDAenxv5CO3L/8ykJKtBd
         T6H0qn1eiU4zSQ5f/o02MLItR7xO6qtBfhNs10Q+8WagrP+RcQDQrXpmroirGxgUoj6D
         oz+NYN/0ukE8WCkLetfZ5STKOs2PkXftyvcyxNsgwbkP/hB9ZQK5TdhgWiK/a01bzhuv
         sfIA==
X-Gm-Message-State: AOJu0YyubWtl1K+XQnuf8L6rYnYwfmefw6rP/GPgnV1pCg7h3I5hDVCU
	sfmgMdRFnFZpjiG+P9SZWPwqwDbJweShSOEenXeHdlxX7g7tZtdsQoFrfg==
X-Google-Smtp-Source: AGHT+IHkN33RRbh8DIZZU702UuXz/Z88m62reT7tWfuCrQHKBsyrwOO7u4euqQkBpp0PISyfvvwl6g==
X-Received: by 2002:a17:906:da8e:b0:a9a:20f9:a402 with SMTP id a640c23a62f3a-a9e5089c0aemr2382545566b.13.1730901337205;
        Wed, 06 Nov 2024 05:55:37 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16e0ed7sm284200366b.77.2024.11.06.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:55:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ola x Nilsson <olani@axis.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [kirkstone][PATCH] patch.py: Use shlex instead of deprecated pipe
Date: Wed,  6 Nov 2024 14:55:22 +0100
Message-ID: <20241106135522.3503529-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206781

From: Ola x Nilsson <olani@axis.com>

The pipe library is deprecated in Python 3.11 and will be removed in
Python 3.13.  pipe.quote is just an import of shlex.quote anyway.

Clean up imports while we're at it.

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
This was already backported to dunfell in:
https://lists.openembedded.org/g/openembedded-core/message/189665
but it's missing in kirkstone.

With pipes removed in python-3.13 it's one of reasons why kirkstone
doesn't parse with python-3.13 on host

 meta/lib/oe/patch.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 4ec9caed45..e607148ec7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -2,9 +2,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
+import shlex
+import subprocess
 import oe.path
 import oe.types
-import subprocess
 
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
@@ -25,8 +27,6 @@ class CmdError(bb.BBHandledException):
 
 
 def runcmd(args, dir = None):
-    import pipes
-
     if dir:
         olddir = os.path.abspath(os.curdir)
         if not os.path.exists(dir):
@@ -35,7 +35,7 @@ def runcmd(args, dir = None):
         # print("cwd: %s -> %s" % (olddir, dir))
 
     try:
-        args = [ pipes.quote(str(arg)) for arg in args ]
+        args = [ shlex.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
         proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
@@ -215,7 +215,7 @@ class PatchTree(PatchSet):
         with open(self.seriespath, 'w') as f:
             for p in patches:
                 f.write(p)
-         
+
     def Import(self, patch, force = None):
         """"""
         PatchSet.Import(self, patch, force)
@@ -919,4 +919,3 @@ def should_apply(parm, d):
             return False, "applies to later version"
 
     return True, None
-
-- 
2.47.0


