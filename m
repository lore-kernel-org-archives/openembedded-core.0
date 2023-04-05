Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F945C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 15:37:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.133491.1680709043469217462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 08:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=BHzZIJ6z;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso3096145wmq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680709042; x=1683301042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIODJCJo+KIm0eigkaURsnWe74eSFL5nBchdi43neFY=;
        b=BHzZIJ6zOvX+pTrI98KzJ38pZePMAs4Hl+FllyQsrTHpHmi47sVemwBDkyXu7xlrU3
         Ty/XRNi7tXMmjRBeTRIXIcI2GvaD4quhLhhp21qPRFfO3scrHspxfUtdDczor6SFa0yD
         AI9GpuzhRW6CSpVwjS0N5N9wKieyarxYvvhy1uTGoNBzuIT/cTaSo2tmIM1LU45Yg8+O
         y/sHsGXvMy5nGgQvqmpBruGTtEXHhtywAB6JcwV4O/vq+n9TXNVzQ1cpLBfmvf+/tAxs
         4UH/b79G4x6n1K7xl4Ax2hguv/MJUSZziPqo6mO77lQwBtrHXPNNIw5X69g73K8/8ZL6
         JEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709042; x=1683301042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIODJCJo+KIm0eigkaURsnWe74eSFL5nBchdi43neFY=;
        b=fHlzAFAYqBXB7iGzPKKO4uJ09gbrpRIaVHRSkCirj5fJVnLYiH/cdngl8uEoYMK5el
         4afYieTP1ElVrDwxA6YEB3DyvIaMtBYYuVUnR+uZXYz7gpJW6ijJ5dXha8q5Sy0Q5/4L
         TDH18hXmMFrYMJ6gU8E6zKM3etSnJqmpFF5kDY3eOF4FuXa9E6gNzYd6XD+Xf/+lC4P6
         FWI4MbDDj9jBaS8MaRB4EFmnSxzH5Xw1pJ7e2yXga/ndjVune4QBylgCQpRrc0AJRdcv
         pqaWjler3Lyxuwzzf/IWSBHLVLaRs7buQBglaYGrCjtA9p/rJ7szKQS+41q8T+SKsD1R
         Te4A==
X-Gm-Message-State: AAQBX9cCSnsf6Zq3nY7VzK5QawULVveFsDLl0/OteRcZxK6mCEF9AFsQ
	r9vRlHDocsRwO8oOSauYPdSg6Ned2nc=
X-Google-Smtp-Source: AKy350YwD1W2PgZAUju2VItvm/AzvFctF9VqWNp31RO7HJa0l5yX6tOqefE6CwgAhSjTB59Scpczvg==
X-Received: by 2002:a1c:7406:0:b0:3ee:18e:a1ef with SMTP id p6-20020a1c7406000000b003ee018ea1efmr4672027wmc.1.1680709041882;
        Wed, 05 Apr 2023 08:37:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003ee6aa4e6a9sm2636935wmp.5.2023.04.05.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:37:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] selftest: efibootpartition.py: fix QEMU_USE_KVM usage
Date: Wed,  5 Apr 2023 17:37:07 +0200
Message-Id: <20230405153707.1823978-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 15:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179740

* if you don't have QEMU_USE_KVM in local.conf it fails with:

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
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index e17da9f9a0..fa74103dec 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -15,7 +15,7 @@ class GenericEFITest(OESelftestTestCase):
     @skipIfNotMachine("qemux86-64", "test is qemux86-64 specific currently")
     def test_boot_efi(self):
         cmd = "runqemu nographic serial wic ovmf"
-        if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td["TARGET_ARCH"]):
+        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
             cmd += " kvm"
         image = "core-image-minimal"
 
-- 
2.40.0


