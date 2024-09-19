Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA63CF3957
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:38:03 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.21267.1726756679943859631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LRTQh5UG;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365c060f47so1175560e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756678; x=1727361478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5i3mJb6yOab7xNaPlCaVKAqusTsAOf/bLVHjvrfRkg=;
        b=LRTQh5UGc9fWMoSA1SCAUFJ9K4WOkML7ATGy/9V/ShzzJJ1ZZuuE4LjTCTNDWxHmx3
         bE5qVq2PtNd0CXzV5zZ2qpDq3CWyPVcdwcCZnmi3x9xOq0A3wHEMlFRPQSrI7BMO4VjA
         mSWxhtVLn8lvcZbhtB2IcvA5FlwWb6TKyxx9dd0BAQmR0uS8XaeFZxxepTZYzrPmlyGy
         zYu761699caWxLZwvBCGVbOjtaengTGcjpBTtuYewFISKN6io/paXP9Xag8bVBqTF6uo
         IuJvRQ/aSWC+MJQaCaXXGizagysgTbSEA68+kI2rPML51yKEpH3gZ5OKZv5eJk3W3yaP
         Gbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756678; x=1727361478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5i3mJb6yOab7xNaPlCaVKAqusTsAOf/bLVHjvrfRkg=;
        b=CGfkFEM644gZayPo78Wkr56oDLw/CWnzD8KIkGsurkkkLkoMIL8QHNoKWhaioQGVLC
         3spAld9srNdL3P+Nl/apbtIxgirlFcWfd6+/JUAEfPmsA5CIpopA3P+C2hZRA7wBmhwu
         vTR9NMiAe76BBI+0bXSq2lfp134rurdZjtHnBrNnCWzvZ9veemePRpXYBCGf/aDmi1ok
         6s/BUPkGh4rfIPO1dwunwchPJ10hY8txDg9xyY169s8tenDAbev+koVZ1KNKaw/3o7QS
         nadYJD9FA7ijybzqB9x/hoC1iDTc9t2HmV+FHDZt7OG4lv/Avbno/FBR1ug6O04tu6aq
         ttDA==
X-Gm-Message-State: AOJu0YyxD8r+Uk/bsq7a2vBqyxGv+cNouetuT0uH7soWIGIUpYz3KryD
	yta2IYb0vB4c48qvXs1l2VGxL/IMTeZBMoeRbtxzNlWe+mAApa+IW96X2UfvaNCyg347MhG3Ewq
	WNs0=
X-Google-Smtp-Source: AGHT+IHXJjvRhHnAyE68vUJFmeIZHNO9jzEbPPcpTHhRaJ+96vuodgsv654HmOiYavnl6bfWRWMp9w==
X-Received: by 2002:a05:6512:31cb:b0:52f:89aa:c344 with SMTP id 2adb3069b0e04-53678fc22e7mr15790421e87.16.1726756678040;
        Thu, 19 Sep 2024 07:37:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:57 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 11/12] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Thu, 19 Sep 2024 17:37:05 +0300
Message-ID: <20240919143706.6074-12-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204703

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
index b616759209..7d5da74de4 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -939,7 +939,8 @@ class Wic2(WicTestCase):
         bitbake('wic-image-minimal')
         self.remove_config(config)
 
-        with runqemu('wic-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'wic-image-minimal')
+        with runqemu('wic-image-minimal', ssh=False, runqemuparams='%s nographic' % (runqemu_params)) as qemu:
             cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' " \
                   "-e '/dev/root /|/dev/sda2 /' -e '/dev/sda3 /media' -e '/dev/sda4 /mnt'"
             status, output = qemu.run_serial(cmd)
@@ -959,8 +960,9 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal ovmf')
         self.remove_config(config)
 
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal')
         with runqemu('core-image-minimal', ssh=False,
-                     runqemuparams='nographic ovmf', image_fstype='wic') as qemu:
+                     runqemuparams='%s nographic ovmf' % (runqemu_params), image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
@@ -1154,8 +1156,9 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal-mtdutils')
         self.remove_config(config)
 
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal-mtdutils')
         with runqemu('core-image-minimal-mtdutils', ssh=False,
-                     runqemuparams='nographic', image_fstype='wic') as qemu:
+                     runqemuparams='%s nographic' % (runqemu_params), image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
@@ -1214,8 +1217,9 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal')
         self.remove_config(config)
 
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal')
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
+            runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-minimal')
+            with runqemu('core-image-minimal', ssh=False, runqemuparams='%s nographic' % (runqemu_params)) as qemu:
                 cmd = "ls /etc/"
                 status, output = qemu.run_serial('true')
                 self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.34.1


