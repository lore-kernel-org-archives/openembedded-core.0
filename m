Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72568C7618D
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.18084.1678709762321138910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CEEWoYCt;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id x13so550641edd.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frcfsW8gyrHmpET78rxcCSF0PPOsgcaxdCPTbJt+CBQ=;
        b=CEEWoYCtNI3C/V8Vkfu7vSxAU77oQmLYJ85n3xXrO2F309xTW6QpNUGITm3e+rGrXM
         oLiu/IPM/aqqOE0IrQzQ6zRwsQdHGuIXl1/vdLIe534aD0hJsecU2Si+EquirC8QnCLz
         5mYx8vGSSNvaL09twPe0PCdwhAiYQDPLNWg1MxevodQNLvMqxNZV9MECIi5lrrwN1VHQ
         3LyGsMBx3o20JfvZwFEuz8zdKsY6qpVUlVNVsDfeAaFenvijq7SecVKPif2r8l5kT9eS
         S/LhUfMYRbt8z0jbRfgFSskZuf0oB4/JDggjCSQ09AKp/+XxO/ofKfY6UZtnC7gic2CE
         Uu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frcfsW8gyrHmpET78rxcCSF0PPOsgcaxdCPTbJt+CBQ=;
        b=xV/DLJYSltB4XnoJK+f3RGNgNG36XSjJ0dZ+KmOnQThUAUPBFqfQwtqDRI8sREfkPs
         K4xR9Cc5rHqDiYlFKplphmvYbs5xNizTJM8mc2E9decfvntobwD64biBAfQp4b88fc74
         LfQgag4LrgqH2+EMEWyDDYcUrqf630zMfGhSF8NHkAzObV2H9YHCrPXsx5r3F8NWNmSW
         ySlciRM+VFLcmERlWiX6meLkSZjImDra6A/SXSuNvlVHL7vnyxVdcoikQpATCOdh7RPN
         qSQ8L3Sd4XlwbCO6wor1XEwmZvf8ORRX9jYPnQGkxVOvxRyTb9sYTkn8rKvdS8bqULpy
         qe6Q==
X-Gm-Message-State: AO0yUKV+ST6kq1PMval4hpqzMq0xRdzVXvn8hqkJTiCwsTqd/CvHVikc
	F2tiIYwCd+cyqsBKTa0T0Y6c2hbFAH4=
X-Google-Smtp-Source: AK7set8Qxgury4dzkce/GQG3JtwY1ZIF+ewHvJdW2BNuswCKSltyhRnmLKZiao3FHKDPwaLHW0/YFA==
X-Received: by 2002:a17:906:70c4:b0:90b:208:6179 with SMTP id g4-20020a17090670c400b0090b02086179mr10452423ejk.28.1678709760750;
        Mon, 13 Mar 2023 05:16:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hs16-20020a1709073e9000b0092be4b381b7sm17310ejc.81.2023.03.13.05.16.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:16:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] selftest: efibootpartition.py: fix QEMU_USE_KVM usage
Date: Mon, 13 Mar 2023 13:15:39 +0100
Message-Id: <2e250b90f5866bb730e53d01f5350662ecd2a335.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178444

* it's not in self.td causing:
  2023-03-12 18:06:29,591 - oe-selftest - DEBUG - Checking if qemux86-64 is not this MACHINE
  2023-03-12 18:06:29,594 - oe-selftest - INFO -  ... ERROR
  2023-03-12 18:06:29,594 - oe-selftest - INFO - Traceback (most recent call last):
    File "/OE/build/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
      return func(*args, **kwargs)
             ^^^^^^^^^^^^^^^^^^^^^
    File "/OE/build/poky/meta/lib/oeqa/selftest/cases/efibootpartition.py", line 18, in test_boot_efi
      if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td["TARGET_ARCH"]):
                               ~~~~~~~^^^^^^^^^^^^^^^^
  KeyError: 'QEMU_USE_KVM'

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index e17da9f9a0..d34698c6ad 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -6,7 +6,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
 from oeqa.core.decorator.data import skipIfNotMachine
 import oe.types
 
@@ -15,7 +15,7 @@ class GenericEFITest(OESelftestTestCase):
     @skipIfNotMachine("qemux86-64", "test is qemux86-64 specific currently")
     def test_boot_efi(self):
         cmd = "runqemu nographic serial wic ovmf"
-        if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td["TARGET_ARCH"]):
+        if oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td["TARGET_ARCH"]):
             cmd += " kvm"
         image = "core-image-minimal"
 
-- 
2.39.2


