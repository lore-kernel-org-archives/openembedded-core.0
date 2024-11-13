Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CD2D597D2
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:38 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.3467.1731467789627627345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lsYzJFPk;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.176, mailfrom: steve@sakoman.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so23039035ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467789; x=1732072589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NpPd/oUahTFQYZhPlH7HzFx7mjpWbnxuVvla11hcNY=;
        b=lsYzJFPkzY096EnClpabML3JWARyYnsgxJUOlcXOYMeCz8cXEg6Rb8X59P9KriPU+N
         h/h2cEFsc5Yi/uvCD2TgxnXg+sjrlJdd4ZIsi5nQCLnbIZC3WxTmsFSrtH4/9Y91TY7L
         wray9heLoJayHfsjxTE7Iean1g9OWtEklomd1lGBd18CYcJKGt8XyeZo0G4mLcfQtsuy
         vdclpZ1/kiHBBZl/lXYs0d6XwiTWiE7/cBZl41fGjErNDT/ewXvKCXR3R6LQok/vfdfH
         lFh4Isa6OPB5tQPZkx9jOm4tv0g1xmwgMtTOfHnBVV1iCooP08rXhFFLnqwXqd4dRkn4
         p//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467789; x=1732072589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NpPd/oUahTFQYZhPlH7HzFx7mjpWbnxuVvla11hcNY=;
        b=oC2kDSvAmCRUhcM9v+Zng0C2I+wanshnV6RG51w4b6QsHTX812MXtnfUxHo7P4FRo1
         ZzCuci7hMiIRuQWznWxR/aMmkL3VKpfs4SE+IO6R1XoI7jikCNC9BUBnUX7+npA4e4GX
         LfY3E2Niom3w0wJcPrnol01ZjvBxg1xRru1tGKWgk5ZU7XjuSHNVYGzmW726mKQCnR/Z
         dQ+BperYVv0Q4TraIy5aNVi+mZaofPZXIVhonggtgD2YJSeV8wKd/aIrOoGThzpxMkIr
         uufXqlSrFHK9qXBezipOg34h5EangbmScQLpsdTxQNsQebOKhfM9BPk/DqSJEjJCFIVZ
         y7qg==
X-Gm-Message-State: AOJu0YwIu5ZlwURuAMS6XunGCRsO9ENr0kOGApUgeo0kQoOq/PpHFon0
	E2IXnJx1Y9D8i+5JOuGn5w1Wr2D6CqcjgWTnDMYmGrjLKAtWxR7Bgu7Ek7F1VHgGhLe3FZc1psZ
	c
X-Google-Smtp-Source: AGHT+IGGQOjahRf4tDOAwSSNyYU0z/7HCZIRusSLUzCUqkezLQ0QTkoGkC5nkEcUQLTQXyOh8I4Ktw==
X-Received: by 2002:a05:6e02:1f03:b0:3a5:e532:799d with SMTP id e9e14a558f8ab-3a6f19e86dcmr190153985ab.3.1731467788525;
        Tue, 12 Nov 2024 19:16:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/19] patch.py: Use shlex instead of deprecated pipe
Date: Tue, 12 Nov 2024 19:15:59 -0800
Message-Id: <8eec5c4417301ea3b38e6662e7b29c9071f233e1.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207079

From: Ola x Nilsson <olani@axis.com>

The pipe library is deprecated in Python 3.11 and will be removed in
Python 3.13.  pipe.quote is just an import of shlex.quote anyway.

Clean up imports while we're at it.

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 5f33c7b99a991c380d1813da8248ba5470ca4d4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
2.34.1


