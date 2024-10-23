Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E855DCDDE7C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:40 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.7361.1729685376039223414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=m8GmdSKy;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so52186431fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685374; x=1730290174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=m8GmdSKyuPMDhnPJMR/FPr8tIFklFI71CcJY8VTZASKsBoHB8GFxjaq52A/hSvLOke
         Cl5Dj73yJrcLMU5+iDVQ+xogMxS21rki7FuV8zw6Id95YT6XXnqEtcjrdPTQkudVb8+n
         waQ2TOSGUxgunSNMKYwvy/ZRnLyUUN8p96/OPJ6I42UgkmjWybnP76y4UEeSG7BuTwNZ
         PDG4jC0wzNLwc8RMO9wz9WJkzfFBbU/4ScdBzCcTEGdsPljENBgurNDGdMHbMtJ13d2Z
         HiJXldU1ivNmf1SjShInGe+GJcJr6+w3tacD2aAtZNX4aNLQt1Kiwhi2K4tYnDkxtaEU
         d9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685374; x=1730290174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQTWSW2pxYCYeqvg5XPpJ4xKvMr/05hM5ADcPNUguk=;
        b=QCE4inqD4LxeqXAV815zSoXKXGbMj1nTsAHsz+WlqWHn+o3jxe0ydwSQ86hZ3a1F9g
         uK5RojAKpCpL3emZ5CRQtQi0mnKMSTrQ3Nhgbfba3cyzun5DHFTtq9FK9sLhpOI94ne3
         tu0oryPuketj4VtZCzfWEOusnLn4fb8941EOl5cMq3g/N5QRVupjFu+G4NQ/+frs9Eo3
         +fA8xkJK+p+bXo+U5xdH4zVqcCcC5SL6+/XO5PzFlBeRz1/ibI+0o3fBRklAV0Mf2EZS
         CugO0rNBbucE4R35IZCLFEV9ksdxpP09XoKH3JlXWGsCaDOXjENpRncDjlWw7CN2sGz5
         yGuA==
X-Gm-Message-State: AOJu0YxDsWN/2z8cTKDrQ8Ny378w38UwAyFRs+NMlMnIRsquXaJ+RyzP
	MaKaxkoSe5rbDwa/N1vUzqK/0nu0b32j492lDsdLZ6lUwfX5VJeweughRsbzIU6PQjkdP9lj9im
	1T2Y=
X-Google-Smtp-Source: AGHT+IH7XsNAVR1SnLkLIkr4ksmV+xnxhhv3cWy1FNeEZJT7onQRdIjsb2xXbiG22+W0LbvvBxNkEA==
X-Received: by 2002:a2e:6111:0:b0:2fb:5d2c:7509 with SMTP id 38308e7fff4ca-2fc9d2ff8bfmr9363041fa.14.1729685373947;
        Wed, 23 Oct 2024 05:09:33 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:33 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 7/9] oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Wed, 23 Oct 2024 15:08:37 +0300
Message-ID: <20241023120839.437771-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206208

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


