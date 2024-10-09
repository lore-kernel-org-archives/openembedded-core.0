Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02273CEDD83
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:27:30 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.14029.1728473241242140287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V2dX4C7a;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso94332051fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 04:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473239; x=1729078039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=V2dX4C7aUKC37f5FL6cRyd8HIpUQVHBXKt0ez5o4P11Coc3XFuu1we+Fi/9I67iTq2
         SzIjbrixpUg12FYa66pJ63srqV+07EOJ/vE1vimg+PAZfcsZBq6FT2UTBXWT5kBxW2MM
         gtMYmSLLeTgU84jBHMx+4GNN3feXIjYHzFLQX06/FWtLt/mFj4uzIge6feXAeK1qiN5q
         BKczrC7eHbcvoY/gyogcqTyJLHLtPIpH7IYFgr1UQYdJvvc1hZOBA+EWecKW2QiLP+ji
         r4ns8LI46wNvvEKhJQ2lFfDDuZsUd4aEukX1m+ig0lgSSq9CsdOvsD6625vCjcwZXtvW
         +wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473239; x=1729078039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=L8bzxcA7YoqOPpen+csQs6i++zsnrXPxcVj/6FusYoA1gr5FWB9bddKX3nhOjpWs5G
         HrKS//9mieLuFn28P+R5Hcx0rxa6pvMxM6fNBImGUxz22vzeBJ7eyEeXOkq3rZT2akXs
         qimZe/MWTfr8jthFfS8AHhUNFx8CMS16jdqSh2JjBVQtslmM/4pulnDTP3/RQQVW9+sh
         990JjnBQlxawymcZpaqRVDh4Rq2Qu4+5pVyjWFjxZltphfuGn4tqVW0/8+niTUYo62ZR
         +o1e1tddWWlUUdgRhQsO68tOghKA1xWqxAeqTYeUIfhbY5nSFlzhRcuqJyWNsRkCPKHK
         yxyA==
X-Gm-Message-State: AOJu0YxoT8ZSgn3A05LvL+Ki4uYTc9UisxNmAqHzgcaGIr15vQ/YyLbp
	2rltTmnXvLs5tiUyMb6hf9331+SJJxwEXIb0Zz6puU2hwW0eqesR+8XjhA4yCl5C+Xrm9tC28Lr
	kY2w=
X-Google-Smtp-Source: AGHT+IFigF3k23Mf0geYH9yBXbNYLtbFBnr1n7O5gE1yhNrCS1Fd7AFl1qJxCjJgYP5MQdFT0JHiVw==
X-Received: by 2002:a05:6512:1113:b0:538:9e36:7b6a with SMTP id 2adb3069b0e04-539c48e335amr1887457e87.32.1728473239220;
        Wed, 09 Oct 2024 04:27:19 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm1449220e87.223.2024.10.09.04.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:27:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 7/8] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Wed,  9 Oct 2024 14:26:33 +0300
Message-ID: <20241009112634.402123-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009112634.402123-1-mikko.rapeli@linaro.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205355

To support "slirp" networking on shared build machines instead
of tun/tap devices. Users can set

TEST_RUNQEMUPARAMS = "slirp"

in their build/conf/local.conf to run selftests using "slirp"
networking. The same works for testimage.bbclass and oeqa runtime
tests.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b616759209..f2a46c965b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -939,7 +939,8 @@ class Wic2(WicTestCase):
         bitbake('wic-image-minimal')
         self.remove_config(config)
 
-        with runqemu('wic-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'wic-image-minimal') or ""
+        with runqemu('wic-image-minimal', ssh=False, runqemuparams='%s nographic' % (runqemu_params)) as qemu:
             cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' " \
                   "-e '/dev/root /|/dev/sda2 /' -e '/dev/sda3 /media' -e '/dev/sda4 /mnt'"
             status, output = qemu.run_serial(cmd)
@@ -959,8 +960,9 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal ovmf')
         self.remove_config(config)
 
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal') or ""
         with runqemu('core-image-minimal', ssh=False,
-                     runqemuparams='nographic ovmf', image_fstype='wic') as qemu:
+                     runqemuparams='%s nographic ovmf' % (runqemu_params), image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
@@ -1154,8 +1156,9 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal-mtdutils')
         self.remove_config(config)
 
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal-mtdutils') or ""
         with runqemu('core-image-minimal-mtdutils', ssh=False,
-                     runqemuparams='nographic', image_fstype='wic') as qemu:
+                     runqemuparams='%s nographic' % (runqemu_params), image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
@@ -1214,8 +1217,9 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal')
         self.remove_config(config)
 
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal') or ""
         with runqemu('core-image-minimal', ssh=False,
-                     runqemuparams='nographic', image_fstype='wic') as qemu:
+                     runqemuparams='%s nographic' % (runqemu_params), image_fstype='wic') as qemu:
             # Check that we have ONLY two /dev/sda* partitions (/boot and /)
             cmd = "grep sda. /proc/partitions | wc -l"
             status, output = qemu.run_serial(cmd)
@@ -1446,8 +1450,8 @@ class Wic2(WicTestCase):
             os.rename(image_path, image_path + '.bak')
             os.rename(new_image_path, image_path)
 
-            # Check if it boots in qemu
-            with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
+            runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal') or ""
+            with runqemu('core-image-minimal', ssh=False, runqemuparams='%s nographic' % (runqemu_params)) as qemu:
                 cmd = "ls /etc/"
                 status, output = qemu.run_serial('true')
                 self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.34.1


