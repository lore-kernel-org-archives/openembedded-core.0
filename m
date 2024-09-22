Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74870CF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.11637.1726994550417941524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TsfHmeZN;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365392cfafso3426609e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994548; x=1727599348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=TsfHmeZN+k+wFl4m9UGiRckbk4guam/eNnXypmAVGeB2x5oMdQFVTgfR58hBq23esT
         Jt1spAvQ4yX3hdGQAfBsCEhy0QtWMUiEr4F/e/+wiKzl82pzCpTA2SGsSHZnLbw5kmiO
         tnBPplXLk/luO9UEHwCc8Aa+luJPaVGWl9j+D0hqfOk+OApwuII9s+XecWB3O6SF2tp+
         Z3oAH9vkgYebfNZWEqbEsu/+tE80xVIvffmRN2zI1UXtX2+4MtfAqpqfOnXG6XMKkneb
         joZUGtTgEcHOpzwk4+VP5t9/CM6e4dHqGL7BROFysVE9S8trkq8mJu3w1AQfIjQ207Mh
         XGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994548; x=1727599348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=B9ufUhlRFd+b8XzuLbIG4dYPo5agwDv6DF/6tjaggdoQrhuGli0uZlRu8WhRWfmhNV
         pEGiRC6SkpFyr0C80pP4ymQjhmfIniLRfEljIDPrAZS1x939OrYPntFRsWcZF5loas4r
         DIgbgSUTCJBBDRIq6hrX1alXeILF8rsFIRnNV9b+ldtHbLKLfz/Wf3FWCdcY6SBwv0VL
         LsCAwbHE2zgPo1uHTChJzzFM3OYpyzsd1T1qw8plvKuHMEUfcu9APPxtOZenTDR2sbog
         o551ORZpVJ4jgBEs9DEKSFZOpgzZNBXCTY4A9mTfKWasQOJDgne91lAHO3WhS0h3PPio
         D8rw==
X-Gm-Message-State: AOJu0YzZijRtOQjlQHSXseYW0rZwwOiWVTVT1C9Ih0se2c7L+KIF/alS
	IkzKlg53abCUOGkAfBdyOh4UVqUGSD77yq44wxwd1Q1GWGXl3PQVHdGD3b31e3wD7HA24f8YwYJ
	AAc8=
X-Google-Smtp-Source: AGHT+IEGf6I8OI/c3P9r/eXcBjTg/oHi53O+lbAZKHYmHbbMClA/Wt+ThdYb739UbnzfvAh4WFmh3w==
X-Received: by 2002:a05:6512:2345:b0:52e:be50:9c66 with SMTP id 2adb3069b0e04-536ac340248mr4147848e87.53.1726994548466;
        Sun, 22 Sep 2024 01:42:28 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:42:27 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 11/12] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Sun, 22 Sep 2024 11:41:27 +0300
Message-ID: <20240922084128.9648-12-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204783

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


