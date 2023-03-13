Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0154AC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 15:56:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.24050.1678722974475645974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 08:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gxujpjkg;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso11299132wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678722973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQvOVrISHKegPx0FHTzgS1bkMrNBDU96ZkbaYE+9exw=;
        b=Gxujpjkgipo7+aHTl/nGZm9qA+Xgb/dHIhIeaoQkUDA5WIyh82tks/vmXvq2eudW1a
         Av/ym/rWfNlObFHySvzGsehXEvBxYgy9/8anSiineoVCHy6rc/RgLu1MD1K0n0XD0MDc
         GtUPEB5zmRc32wlW+zzYG30SBxS1yEHbj1FwR8iQF89P/V9NEaSJxHGQ1+iZLJ/7soWC
         XaUfFJIFo0Psv+HEmNYBofplcly+whXnunUVxooIvwXd6MKbuQtRbq4O71bVRGtbI/4K
         457x9cOBYVTPYD95oGbMDpg+bsys2PO8xgYtpIRUS4aAqRK66WwlsMJfCzwbBWrm2n/V
         dprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678722973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQvOVrISHKegPx0FHTzgS1bkMrNBDU96ZkbaYE+9exw=;
        b=YooCGePbVm79baBUgqP5nOsWpEMB3I8upYaKzUSH/oFguVxb23BFAEBmqfs5dsbuKP
         vVPUMiul+84BFpikxxRX3CzD+XwIZAqH4VzOYO1KrWpf116G2GGs/zttXjCBRKOUeljV
         IbkU6vozbL6WMJJ1FyQBbaJqfS4rFoDJ1e8OKeN9tpEzP7V0HsVvJoZfBN0NTA3EFE84
         zVKpj7ZH0GMFkPuoh6KNByYnLk4FUJmEVSLLDreR7paEkp+sIPMikGSt2v6e5h1Phngf
         /mEhCGHTYy69FnbfHn/fyQJzRKlzWSi9IMUOwmHVJZyg+58c/6BPOGb76ooRKSBzlUFf
         j0fg==
X-Gm-Message-State: AO0yUKXynDT5vcMt1GvInHCZlxq1IZqDT9NERa5O1UwVSgC6EGYYi2jm
	EO5mzjJwqcPR0yGBiuz0AUSpH8KBaX0=
X-Google-Smtp-Source: AK7set/qzpb6svxfV3JFLQG+p5nmHxeGkT8+ERcaHPjIHPTLOXxp/vTMtcIB/68ef+zbkB7XoPPktg==
X-Received: by 2002:a05:600c:1d9b:b0:3eb:39e2:9156 with SMTP id p27-20020a05600c1d9b00b003eb39e29156mr11609080wms.5.1678722972788;
        Mon, 13 Mar 2023 08:56:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v23-20020a7bcb57000000b003ecdbba95fdsm122423wmj.23.2023.03.13.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:56:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] selftest: incompatible_lic.py: run bitbake -c testimage separately for each image
Date: Mon, 13 Mar 2023 16:56:03 +0100
Message-Id: <20230313155603.3841787-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 15:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178455

* with 1 preconfigured tap device you cannot run testimage on multiple images
  at the same time

  in my case have /tmp/qemu-tap-locks/tap0.skip (tap0 is used by openvpn on builder)
  and /etc/runqemu-nosudo as my build user doesn't have sudo powers

  but then when 2 do_testimage tasks are executed at the same time it fails like this:

    NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Started
    NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Started
    QMP Available for connection at /OE/build/poky/build-st/tmp/.c2d3k3bh
    QMP Available for connection at /OE/build/poky/build-st/tmp/._4agpi1v
    ERROR: core-image-full-cmdline-1.0-r0 do_testimage: runqemu exited with code 1
    ERROR: core-image-full-cmdline-1.0-r0 do_testimage: Output from runqemu:
    runqemu - INFO - Continuing with the following parameters:
    KERNEL: [/OE/build/poky/build-st/tmp/deploy/images/qemux86-64/bzImage]
    MACHINE: [qemux86-64]
    FSTYPE: [ext4]
    ROOTFS: [/OE/build/poky/build-st/tmp/deploy/images/qemux86-64/core-image-full-cmdline-qemux86-64.ext4]
    CONFFILE: [/OE/build/poky/build-st/tmp/deploy/images/qemux86-64/core-image-full-cmdline-qemux86-64.qemuboot.conf]

    runqemu - INFO - Found /tmp/qemu-tap-locks/tap0.skip, skipping tap0
    runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap1.lock failed: [Errno 11] Resource temporarily unavailable
    runqemu - ERROR - Error: There are no available tap devices to use for networking,
    runqemu - ERROR - and I see /etc/runqemu-nosudo exists, so I am not going to try creating
    runqemu - ERROR - a new one with sudo.
    runqemu - INFO - Cleaning up
    runqemu - INFO - Host uptime: 67474.59

    tput: No value for $TERM and no -T specified

    WARNING: core-image-full-cmdline-1.0-r0 do_testimage: Qemu ended unexpectedly, dump data from host is in /OE/build/poky/build-st/tmp/log/runtime-hostdump/202303131614_qemu
    WARNING: core-image-full-cmdline-1.0-r0 do_testimage: runqemu during is_alive() test
    ERROR: core-image-full-cmdline-1.0-r0 do_testimage: Error executing a python function in exec_func_python() autogenerated:

  which is very reasonable error message, but 600 lines later it also shows:

    RESULTS - xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
    SUMMARY:
    core-image-weston () - Ran 71 tests in 34.073s
    core-image-weston - OK - All required tests passed (successes=14, skipped=57, failures=0, errors=0)
    NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Succeeded
    NOTE: Tasks Summary: Attempted 1141 tasks of which 1139 didn't need to be rerun and 1 failed.

    Summary: 1 task failed:
      /OE/build/poky/meta/recipes-extended/images/core-image-full-cmdline.bb:do_testimag

  and I didn't notice that there are actually 2 different images core-image-weston
  and core-image-full-cmdline and spent most time trying to figure out how it was
  able to run all those ptest when qemu failed to start at the beginning.

  It's possible to create 2nd tap with runqemu-ifup before running this test.
  Then it works, maybe some check like in DevtoolTests to error out early if
  there isn't enough tap devices? But the implementation in:
  https://git.openembedded.org/openembedded-core/commit/?id=2258345e19efff7717fe19a5026ec55f1b6f90b6
  has its own limitations (e.g. not checking /tmp/qemu-tap-locks/tap0.skip)
  and would probably need to be re-implemented as some generic decorator
  as other tests need this as well.

  It's a bit slower when serialized:
  INFO - RESULTS - incompatible_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston: PASSED (145.96s)
  without this change:
  INFO - RESULTS - incompatible_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston: PASSED (104.72s)

  I don't mind if this is rejected, sending it mostly to document this behavior.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 4edf60fc55..b2da25e612 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -158,5 +158,6 @@ CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
 CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
 """)
         bitbake('core-image-full-cmdline core-image-weston')
-        bitbake('-c testimage core-image-full-cmdline core-image-weston')
+        bitbake('-c testimage core-image-full-cmdline')
+        bitbake('-c testimage core-image-weston')
 
-- 
2.39.2


