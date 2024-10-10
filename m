Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3460ACF07D8
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:57:48 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.38961.1728550657917810573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SfKmZyvV;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facf00b0c7so16783401fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 01:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550656; x=1729155456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=SfKmZyvVRAFZ/8sqEhXpnFCXr7v9LW1H4IRsAbzhhusV9usfIqmVP7tgjDEqkRgR4A
         fvRaS03ckJtHKtQanatvbJ7qkeadBpb9mHxhlk/cU2lkvU+Z5sTM+3C0dBPOhZxANMg1
         6LPBVSbKRg8gAzAoAi/EmeYTLr7HSG61cxB+ZNA5Au8xAo3SyWJsE313vBmojQ+mHz6M
         /37XiWz1JwsQ/UUFgVOs+DncRST8VPp5T/zCZ7DVoe6sBt3CxrNns+Y2mnhtD4613vm9
         MHo76G3ai0+k7kUjwXQll1C5FP6qWp1QKeyKG/vptbBNCRhmX7SXihA/Te0VxChMWHSV
         jfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550656; x=1729155456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=EOht8VJmEgFFR3YOTBKEcYyhYbAApq9jU1rMERwHAnnukfcWZ4jAsxg2ludG9Pq3Mi
         e4reisX5MH4U5Sk6hlpz8r37A+7nqFHIXXWHLHpicLjkpgIsC+quEzrOsTaRsX62Is7l
         OZkdRkMkR+Tql9h+YXnGC7n2/3EmgT5deIbS/5fefW1NOxSfjtnGegVUiexhsG7/J7z1
         ppiRXvPmh50Z44j4gv/JYFOU0zOicqZj63kAsk9j5MAaqVKrijin8RzxVMH13TJzQMLK
         AjuylhmMLZMNgMlV+NCKqAGVhhdzchro9Oy734qPlcRdjpA2gdCpshDLAVbg9VRDl3Aw
         Axpg==
X-Gm-Message-State: AOJu0YwVA90XB9ID46yACpN//6GV4vTDl2hnse0+r5QA8pFoEewZXhq3
	MwrxpKHp1M/nn0NXIKHC4tIruD4VKdXHCZzATElpG3n+63vRtop5Qka2VBZUY4qhVZbym5ESzLR
	6gpo=
X-Google-Smtp-Source: AGHT+IHNIf7kg+VV1fmW+02SIim8LnANRH+X0pFu38yOLngOvyxH7vgScRLtuW/wLYm8D22zQaQycg==
X-Received: by 2002:a2e:bcc1:0:b0:2f6:6074:db9a with SMTP id 38308e7fff4ca-2fb207cba5fmr9401881fa.7.1728550655915;
        Thu, 10 Oct 2024 01:57:35 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2459cb82sm1397621fa.56.2024.10.10.01.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:57:34 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 7/8] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Thu, 10 Oct 2024 11:56:46 +0300
Message-ID: <20241010085647.439990-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010085647.439990-1-mikko.rapeli@linaro.org>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 08:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205396

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


