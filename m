Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B30ECD13D8
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.27419.1694943558994775839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VAYu2VF4;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9adc75f6f09so316307266b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943557; x=1695548357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXh2TR3IFHz+w1o3cWio5W4b/uEPWdFcmxUEYBbbXVE=;
        b=VAYu2VF4hZOZKy8cvv3g2dI7Y/QteyzUn12IkjWdU3w3XiZ5hPb391qEXYuYlA0rbq
         Aof/jn+BvSzAEMdNtxcOYi3u2qbkHHGFwsfhi5YuLymim+KtKcNLCB2f1AB4ULdtvpfX
         2U50LmNVhdbu2+j7UwRIX/7qwRDviuOBz466a6u58dZLgL3jlQr7ccDnhwoiMupjA2cF
         XwVO+eFzs6TN8fqTMWhUU/joioiJuMKDjMNZ/cj85X5v0CuykoXPoP/P3BNzNm0d7ldJ
         yPS48dguWrS/I8LH9NlEf3t2DZBkKbF2QKWf01PsADF3hVdzHtJnsQ4+f7uvDRwfZUrN
         7AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943557; x=1695548357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXh2TR3IFHz+w1o3cWio5W4b/uEPWdFcmxUEYBbbXVE=;
        b=S7e/z/BXAyiHaULagz1niVChLNZ5vKWTwpeq8ecsodBIUmIbJZ1H5ufmd/QYt/IMGc
         Q0SLEn/4VqDJKyHgR9KX3htEBGuk8gaPn1zCtMH8BaVAwuExukeHAwTVIiLWnx/RjcJ+
         oKNsF8dQmfxtJRBtvxgDhmoq0Mt8CBJeHrbyl4m42ipMfG4cU1bPapkf/HirXjhhGX6k
         wk23Gb8E7wQO+W9IGjZ+jCJq/3FC2pNnvAbeh/uQ2UVnIKoUxZhyAZc8wfq7nrJE77Y/
         PNj8V5hvp8oeCiSsLZ9A13kZ5tKIG9Zy0Wp4CAA2xWui3w3McuGjuOrnL71qp+oTfBX7
         YHbg==
X-Gm-Message-State: AOJu0Yz8ETQIXtdarfylNzyNimdhcOmV4DD7j3J+jNCr6UgMHSBXM1q5
	Ak2fxBpjIGJN8RrgGgIAXWalifmHnQU=
X-Google-Smtp-Source: AGHT+IHI/1uNw5xibXerGvJtaAnKDDbYts031K1Of6bwfN2BE4dDY9BoIF2IlZZJlpirfgjq39nzDQ==
X-Received: by 2002:a17:906:5dda:b0:9ad:7d5b:dc11 with SMTP id p26-20020a1709065dda00b009ad7d5bdc11mr5254895ejv.33.1694943557421;
        Sun, 17 Sep 2023 02:39:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/29] go-helloworld: update to latest revision
Date: Sun, 17 Sep 2023 11:38:53 +0200
Message-Id: <20230917093901.428214-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187794

Fix up test case to match what binary prints.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/go.py                      | 2 +-
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index 7514d108f1a..39a80f4dcae 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -18,4 +18,4 @@ class GoHelloworldTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         msg = 'Incorrect output: %s' % output
-        self.assertEqual(output, "Hello, Go examples!", msg=msg)
+        self.assertEqual(output, "Hello, world!", msg=msg)
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index ce6ec08c59b..98cd4d81033 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
-SRCREV = "5bec756976671f30903223ec46ff8a70dced4954"
+SRCREV = "d9923f6970e9ba7e0d23aa9448ead71ea57235ae"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.30.2


