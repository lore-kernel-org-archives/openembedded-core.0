Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB92CC07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:54 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.35677.1698200985472130460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=odnhAmSv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-27d113508bfso4423933a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200984; x=1698805784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60p2pYIzbxBgB/yQarqbtVc20WhfQZy2+AgU/lpb3Og=;
        b=odnhAmSv6CP8/YIMnFzFgwDujssHCUocGRNmfhwImK2cA2SQcEJ8CHHnjQ3C8bNsv0
         EL4MCKeQ1Fllf5KcDvt7dI15rlmobdgh1tDz2kF8eiTJugiCkBMW2KIkHspvTiKunfXO
         49CA1fbGgCpJ8Uy41+WSO58H7n45+u/dTR6YfFYpk9QaBPFPdvEIXp4P1peP3KJdlCQV
         7lMn0dPK4vpYY3vq0cW9r1rdBJSpMmif2nrITY7fDCmLTkCI6rBe1w1HajADcvl+nsEH
         vmFGn5Rm0Kx+OLDp8GYiANLw/55kwUrNVS/EPhUQLKizw5kwSd4XMhjyM1KRbJUj2xRj
         Gdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200984; x=1698805784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60p2pYIzbxBgB/yQarqbtVc20WhfQZy2+AgU/lpb3Og=;
        b=tvTUGJOUXADHYb+cCZOlh9/PChYvE99sIo9sUZjbOG8e9c78yDrysiDTR6t1N3gzzo
         5W8OanDJM/CWKseAluz+Gmzi30nBcjJxq0HclWT9CL4s1Atz7kDWPwWmzMD1G1X3tgdG
         25lEAQPFTz5VjELLAFxLurxzIAHtt70EZ+fCditUVtF5S5QEGOQrloQGz8Oj1QpAEX7o
         RbrAvS+tNImJAxwUZb8dK18uCgi2TG3dtFPSoZxb0H+/c2AmQ0j33U3lc/3hdmMPFGFy
         USrNd5IlwsooURmgUd8Wmy7GS+U82WiCxf04zJRXUN4EQKSn90tTuZQxa3vByEj0Q5d6
         JE0Q==
X-Gm-Message-State: AOJu0Yxkae1Na9/VE8cyeUrZntbOcX3ryS/J+OMWUNvPhpSmStEVy2Ni
	+xTBfHXgOdlz6vyJn3DELwuOV5BAvVhz74ZPIsA=
X-Google-Smtp-Source: AGHT+IFZuBQ3/Kfz+RhopZ13qymSfOM825uWm5tTRvnWcStgEr0XIAfZvqSfyMIOg9xpzMBoG9qW9w==
X-Received: by 2002:a17:90a:2ec5:b0:27d:97e5:f3fa with SMTP id h5-20020a17090a2ec500b0027d97e5f3famr14066348pjs.29.1698200984616;
        Tue, 24 Oct 2023 19:29:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] patch.py: Use shlex instead of deprecated pipe
Date: Tue, 24 Oct 2023 16:29:28 -1000
Message-Id: <a6ef13bdad40826d76a3331cd0878bb22510f375.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698200772.git.steve@sakoman.com>
References: <cover.1698200772.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189665

The pipe library is deprecated in Python 3.11 and will be removed in
Python 3.13.  pipe.quote is just an import of shlex.quote anyway.

Clean up imports while we're at it.

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 5f33c7b99a991c380d1813da8248ba5470ca4d4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 7cd8436da5..feb6ee7082 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
+import shlex
+import subprocess
 import oe.path
 import oe.types
 
@@ -24,7 +27,6 @@ class CmdError(bb.BBHandledException):
 
 
 def runcmd(args, dir = None):
-    import pipes
     import subprocess
 
     if dir:
@@ -35,7 +37,7 @@ def runcmd(args, dir = None):
         # print("cwd: %s -> %s" % (olddir, dir))
 
     try:
-        args = [ pipes.quote(str(arg)) for arg in args ]
+        args = [ shlex.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
         (exitstatus, output) = subprocess.getstatusoutput(cmd)
-- 
2.34.1


