Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FCAC7EE23
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3968.1682502648438201108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hKsTN5Z1;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3047ff3269aso1961428f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502647; x=1685094647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qMzxeLtJNRqgP38a0zIVcK7sRkcU+Z3xfTHpoEh21c=;
        b=hKsTN5Z1Nq4/hW9yWxeYOHxFAcf3FqbIOKdpuTvdTv3tsKhBn/VJJs6Oc/rtIdoOTk
         JQm5Nn6Vp04FNx0/WM58NW7mcHhhIgRZc9qE+RrqU0QUojPIMKXFe+RaExP7NYvCgGyM
         pHrIWNvLxyme2eMfWROPc82GSU7BPs16rakWsNvj1jP0cU5yktGHl2k9sxXWEybQqvPS
         t5Yos1ojI+VcNMBuNiACtp0TuGk/46QKXmvAhtV01s3EzB3KP0fAbv/tP1WfOToUEADG
         D4D8C9zf05JTB1M3DJKWW7tPCylLmK/8JTK/bVoCi23DchqMCLbTJ/lz3Tv0tV7qso0c
         en0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502647; x=1685094647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qMzxeLtJNRqgP38a0zIVcK7sRkcU+Z3xfTHpoEh21c=;
        b=Olk1TfFhfN2A+lcRcta9kUthN5YKgSYpJCi8rF19R2u5GMEaamhKmFWBLhLHR9Xzl2
         76Pc+L8gmqZduxfBkbb0LJWkkJCV0b9a8xo5sg0hmezfFHjAt6elKzjlR6BTgOFHSG4Z
         GxG7UglyQjhOT1qKLwDf0k2oE3pUop+KA8T4sIxkshT32NtJELZCWRuOvCG9UbfJX5DA
         xu5YK5FU9EZMrYs+ZcLSE4nxRyHR7MCb93PJTzw9uH3EQJAiqSD4QDsjrMpQ6ePuIrD4
         ihmTGgMOjwwyuQLry+06I4aqpcU9JejfvEtCGIEkqpwSs9PBHJs0QXuyv+ty1vIaB31F
         KslA==
X-Gm-Message-State: AAQBX9dCr3+7FhTyC4O9ihzr2+TxHlks7MBJECtsK1ydqZFBxwwcmDm7
	vunEMbinuX0BmcqJknQ8WVijLK2CY48=
X-Google-Smtp-Source: AKy350Z9ovSL/6xksCs6/aLRc2bhJ62GlXeWfHW1TF+/Zr+lxDdyyr4z4JC02eOhP5Y376kQ5OCovQ==
X-Received: by 2002:a5d:66c2:0:b0:2ef:af46:1278 with SMTP id k2-20020a5d66c2000000b002efaf461278mr15002516wrw.10.1682502646851;
        Wed, 26 Apr 2023 02:50:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/11] oeqa/sdk/assimp: run only when zlib is in the SDK
Date: Wed, 26 Apr 2023 11:50:33 +0200
Message-Id: <20230426095036.2632847-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180426

Otherwise assimp will silently fall back to a vendored copy of zlib
which will fail with -D_TIME_BITS=64 due to https://github.com/madler/zlib/pull/764

This was exposed by multilib mips core-image-minimal SDKs, where the default
64 bit sysroot has zlib, but 32 bit sysroot does not.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index aa6541c6f6d..e4c5c730037 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -22,6 +22,9 @@ class BuildAssimp(OESDKTestCase):
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
+        if not (self.tc.hasTargetPackage("zlib", multilib=True) or \
+                self.tc.hasTargetPackage("libz1", multilib=True)):
+            raise unittest.SkipTest("Assimp test needs zlib in the SDK")
 
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-- 
2.30.2


