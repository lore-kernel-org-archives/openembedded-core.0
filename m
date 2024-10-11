Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C56DD0D783
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:21:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.10179.1728649287811440611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FoaSoj8r;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so2253670e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728649286; x=1729254086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=FoaSoj8rhy9r73MOTAuVi9EQURoEcHn5Yc2OYJvCdKktZLlwZhhHPXIoMvq30Nw54M
         yvH0FKEv8NzOzl9PsPQkQI2V0oIvgNKoW7OC+IcnUB2VPJWVBvZF4z8iFzMK/u42jJr0
         gqREIokVh+pJENkf3m8xHftKA9jsxf3J0TbzlCrlJyd5YTd9f2ESg2CBRDhjFzqzVMHz
         U1RjHTIBMhbBFSDhqhVSMQiIc2rcSqjfJbsmDyGAJNTO5JfoOAlHIbfPByh1GG30mwYG
         SWyovCpHMNa/o7iD+62VsZ/rWR56OlVZv44XHKF+d0hUfIszeKZoec4fGG8qQL38OCDc
         XkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649286; x=1729254086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=fUq99XnCLFmwsl73qbwzZguo+fhZppMuXRy7TEeeivoXsBf07uM7S0p+6C8NGt4mQL
         oQHYpyh1zuGyISHOtbRR9qMDE6AYzVsD4oGn+YPyMfsX7wh4kzBVfi+wKiQnwh4AjuVz
         2cAujbssW1N+2fkYi+gcFXDxjgz8wxgia1ynXGDw5A8ft0iHUj9/XMcVvc+WpcAnqDwT
         Vyi+XZ2L41b9ICps4xJnTwogXfRFajkFya4ccHqM1FfsM2d4F7DXt02mQ06SiFCJYyS4
         Tu1KYkV8tbb5yjJkG5yLKy06n6NZWXxj8dnWhA1KAjBWu3bx9P5A6k9Rqm+hlYKPUDPZ
         5E/w==
X-Gm-Message-State: AOJu0YxJufXAYPBsR+kkdrwgCLKgjB7heR8OX0v3HBfpVnqFlxG3YPay
	FtrWfG3mZi+sA/ri9BprP2MGwN6LD4kB9HGvFA/8VDMZrjbjB946Q9SZ8DwEzsHIe9qnF8Qw/cJ
	/wFw=
X-Google-Smtp-Source: AGHT+IHztqFt13YGPTwDeKbzWdzEm2sJpxqs1l+ogFkOxQBdLMxPGYhu+i0ZoBzDZE331yz8mOv1rw==
X-Received: by 2002:a05:6512:1092:b0:52c:ebd0:609 with SMTP id 2adb3069b0e04-539da3b44f0mr1343170e87.7.1728649285866;
        Fri, 11 Oct 2024 05:21:25 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8608sm591336e87.89.2024.10.11.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:21:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v8 7/8] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Fri, 11 Oct 2024 15:20:43 +0300
Message-ID: <20241011122044.12222-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011122044.12222-1-mikko.rapeli@linaro.org>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205692

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


