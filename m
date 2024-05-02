Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57984C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 11:44:26 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11279.1714650265128325814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 04:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TW7UuF4p;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso12134809e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714650263; x=1715255063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0HbgzuzzURj4c/0MXi05AYtCWfLk79wPp8ELVcACrQ=;
        b=TW7UuF4pCdoo9rw3zVJxy03af33QphcXKRfBPRHqJ1ts3vFRy8qqNC3LHBpcb5Mntr
         ghsowc5//1ekWLxcVk9vD2ECKe0Yk1/t7TLogEzzoiRpPsurIuIVzie4XnRGUfZIAVDB
         +ZvlNVBQ+ICC8kkksMF7kzt3t3Y/BVWGSA0Wv/y7uwnUHgzkuHsab71e7Asoo7VwP2K0
         BCR8ld+OUieVd8EDdXdaY37F9DW/6wt1mzzC49E9kjrM8NOPoZk/IRlDbg7DlSje8OTs
         XaQ+UMLCH5dpZ4m0OCzkp0hqk/+cQb4MJY/bUjLZgokG0xYKbjtPZyQIscdc+WGgloBz
         h18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714650263; x=1715255063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0HbgzuzzURj4c/0MXi05AYtCWfLk79wPp8ELVcACrQ=;
        b=q4BNoSmUszHf0bcrDD5U7i30uOeSFmL/EBcYQguADs7eh6/Eue5gJHli+AVu6dVkVv
         UK0++Kqw+0WZI8eFYlWxuUxhYdBTcFTKFrHugcWR6RMh92t94eHbpAcAXawhTqdj3v7U
         w3tD0kyAuc422qu+XuovdO6E9zuoHhW5+pNqd2em21met8zpugN+8Tz5+a9C/BBRtVT8
         net3iV8ZTezfUxSRVd9EwsBbxo1ywdqcEuRHWeuVXWVH0u4FIZqBg0dvaCU8LFEsiUks
         etRmgWsqAa95fStuz6BDi9vEwB1WgV1yIU4idqEDtCJmLkkZ3t+GI+PvhQNNu4G/f4mS
         V8xA==
X-Gm-Message-State: AOJu0YxdL7DS6BSAU8pabXeBG15BW+KttUM8u7AOz+aGAsrfMNxt6jjC
	8E8rpko7LGlM8KvX08S1EFtx1jktTxSll8Mf5nvswlwPW3jgXp1PTlfO+w==
X-Google-Smtp-Source: AGHT+IFdLHCMpZPD9RfgEy22avKyroartuIovgLA2ef3HXgFf7dF8bOfM/tSB3JnjRHe5EVNBNp1dg==
X-Received: by 2002:ac2:48a1:0:b0:51d:9e17:29f0 with SMTP id u1-20020ac248a1000000b0051d9e1729f0mr3661038lfg.24.1714650262829;
        Thu, 02 May 2024 04:44:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b00a5906b4e417sm463596ejh.98.2024.05.02.04.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:44:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] scripts/oe-setup-build: write a build environment initialization one-liner into the build directory
Date: Thu,  2 May 2024 13:44:21 +0200
Message-Id: <20240502114421.644096-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 11:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198913

With this, users no longer have to know where oe-init-build-env is relative to the
build directory; that information is contained in the one liner and then
it's possible to simply use that:

. /path/to/build/init-build-env

This will particularly help with initializing builds in unpacked
build bundles, as users won't have to know where oe-init-build-env
is in the bundle directory tree - similar to esdk initialization.

(From OE-Core rev: 1cabdf287c2739accdab3a766df060f1bc802b63)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-setup-build | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index 5364f2b4812..c0476992a2a 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -91,7 +91,16 @@ def setup_build_env(args):
     builddir = args.b if args.b else template["buildpath"]
     no_shell = args.no_shell
     coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
-    cmd = "TEMPLATECONF={} . {} {}".format(template["templatepath"], os.path.join(coredir, 'oe-init-build-env'), builddir)
+    cmd_base = ". {} {}".format(os.path.join(coredir, 'oe-init-build-env'), os.path.abspath(builddir))
+
+    initbuild = os.path.join(builddir, 'init-build-env')
+    if not os.path.exists(initbuild):
+        os.makedirs(builddir, exist_ok=True)
+        with open(initbuild, 'w') as f:
+            f.write(cmd_base)
+    print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
+
+    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ['SHELL'])
     print("Running:", cmd)
-- 
2.39.2


