Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F83D21258
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:33 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.44639.1729154792098702163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N4rmnC7N;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f58c68c5so1111813e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154790; x=1729759590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=N4rmnC7NgKhCrFDUaCvMjyJzQFmBbsmDXJqcxdlyZgg5cadnU96CSTUw1fN3BrenwD
         hl6y/R4eCiShDDOtlaDsoXTtJZEA8QIcXAKd8fO6vqRNkeRc/OMPwr65Q4BqS96s+qZf
         EBKHaHOS5HCuhZDMSKxe41WAu8KYbrLLcuda6EsKr9WYSJqH5+6PHbfUtG2IPFSt4b1h
         j0VeS/zbKMpIR+IeC0Zena1cnq+85LofrlxZcCDHO35CPRYvUpsL6LiYmQGSsh002bPm
         sR8AA63whAKrEgWctm01mCKZ9FUIHrSuanaO+MmKNkBViZ7LJaJ/nIw6zHHH8Iz9IZFJ
         IwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154790; x=1729759590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=oLBuGFOA2N7Ck/VPmXHO4duuPIFQy1O8RZ/ZAWO2aSsjaFICulb7rFj4O2UfQFTYPj
         RI+fdI8FmTv4sGXuz1y6f2DMWNNtTgkrBHFTqJDjKY0pVQiIiQkePyp9I8eoZmx/ULi8
         YpF1icYgeBuRsA9nXwcafPBBhuK6yiHcxvH/eSI1rT5/72rQSpeKnVPhDtYRiYs/JzHh
         zsjBsssmDbCvdMHFOHW1CN1i2t86D7QtDIFgiA25vfICUVFHbi0mHAKd38iR3bfcF/Bp
         /IHjfqL8XpAlZEmfXWGkgxGWsQwCJN5YzS5BxLe+qvnqshhcH78mPtTFzypi/a4bQMFg
         y6Eg==
X-Gm-Message-State: AOJu0Yz7PDlHcbCPmX5Ci8OutGgfMoqk1we7xi6qQeP5lz8xnwYL+sl3
	Y+9yX9kEIcb6Rf2Q0yqnzJZCb/THBpTta90eveMkTgNiESv9GTIOQu+pYJ1bXiscCaVNioKsx9S
	k+fA=
X-Google-Smtp-Source: AGHT+IHOr8J8bQJYHDNUqmVg5Rp1mSJLqO8qp9envQzVhG0Ciw1WMR3QnuQIX8h1df2gf/6e+jD3ng==
X-Received: by 2002:a05:6512:2398:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-539e54d6122mr13780832e87.12.1729154790090;
        Thu, 17 Oct 2024 01:46:30 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:28 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 07/11] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Thu, 17 Oct 2024 11:45:48 +0300
Message-ID: <20241017084552.182136-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206002

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


