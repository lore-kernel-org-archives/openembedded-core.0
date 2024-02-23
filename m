Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDAFC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:46 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.8975.1708689704935869614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=al974W1k;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3f829cde6dso87659266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689703; x=1709294503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOfpcwtJPHLioc2iDM+BFjugBbNU3DfvXictnAj3QYY=;
        b=al974W1kSGgN4/NVouaF2MWV/EiXON1SZRY8Y5BuuKkjKOKG1Ul3PNuJJyy53yuoHW
         yi6nz/lV7HcSoBGhN6V1gVznaXN+pKDDlTlwVMFtfZuGatkSp+kWrrnYXyxwbz0DN7gi
         Vsze7aS5QqE/JECm4Pju+wQZv0FJvnd5CbQwCjdDTPKhv1RTxcKWEvbZ1Ocqh5K8bFle
         Tku10j2xCIZsXloK/G1XndvUl+OB/n+axRiuYDoxszEdsu9dm3mqURA0683wvhKV3VYD
         N9s8Xr1CEbawWzD7IYcE+oKxFFdn3ZM+duE3m6vavDKmwg9MKBhj+obzS3KjePcglwAU
         az0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689703; x=1709294503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOfpcwtJPHLioc2iDM+BFjugBbNU3DfvXictnAj3QYY=;
        b=hCqMsBZMwyggPyJmwPgAUvcH/6wIXbZiiuSHSiyWYIzAqY3AaUmFv4gHA3iK6aJ6Dm
         +VpkgaONP1lNlQJgI+5MbvYIzlhVDnkLoSaOh1Q4LnV5uzob/7GkkwL3iBT2Fd3Wycn8
         +wCK9nGOKSKuBE5eEsmWFyBV4FsHCkG8gxRlpX1d9AgY2FG5ylCP4B9k502CykZAOGjL
         az1PFDdEnWkIeK/8/KQvLd3osSS/evo9rINHCV0XwQAiAjmHnlrbXKn+SVg01nlMNLBe
         zstIHIwBMv6GXP5zwNBm+wun0fXd8QKIXfEzgXNuRO84v70ZnhZv3obBGX/5BHFWo8FI
         t6wA==
X-Gm-Message-State: AOJu0YxWxEiL5AhG6qEcb753Dp+nmXFHKNdTNaPybUbFgF+4vAvzQeu+
	JDpdz+J24Ht37NHAIQUjEDY09bVqQYjNrk7lxBlLc+yr0CiVxklxNHXyBDRw
X-Google-Smtp-Source: AGHT+IHliyIVP8Lvb0B0vh/kcstWRL5jV2T/N4MeAcD9g4oWlC7iANxCZuG8kZyuEzWOib/3xZ5BJg==
X-Received: by 2002:a17:906:b792:b0:a3f:4eaf:ec66 with SMTP id dt18-20020a170906b79200b00a3f4eafec66mr1002071ejb.25.1708689702950;
        Fri, 23 Feb 2024 04:01:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 01/10] scripts/oe-setup-build: write a build environment initialization one-liner into the build directory
Date: Fri, 23 Feb 2024 13:01:25 +0100
Message-Id: <20240223120134.3713127-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196061

This allows avoiding having to know where oe-init-build-env is relative to the
build directory; that information is contained in the one liner and then
it's possible to simply use that:

. /path/to/build/init-build-env

This will particularly help with initializing builds in unpacked
build bundles, as users won't have to know where oe-init-build-env
is in the bundle directory tree - similar to esdk initialization.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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


