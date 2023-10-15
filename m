Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3845CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 08:44:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.86021.1697359455493176279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 01:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQJ6Ru55;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-313e742a787so2097219f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697359454; x=1697964254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwPth/dkrTsht1HbmcjhZft6ywvGZlirvp1Jyj0gTo8=;
        b=fQJ6Ru55Jc38nghHbAaxtwWfVp09YJMaAKqRDAddr28zMRkiREJ/j2w1TjtkUdJr5C
         FJ0/aKwENRwboPqIJKeQ59kZjjFvOZsWDK5ZFOtg0RoszL46xaCwwbRVdxPexoFHm22c
         VzS/vudR6VUKP8AldAtinVxaOYJga8g3tL3c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697359454; x=1697964254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwPth/dkrTsht1HbmcjhZft6ywvGZlirvp1Jyj0gTo8=;
        b=f6k/ib2TfKP0sdGANtvfvVyfvB2dGDGd2XssDA9+QEw72b2e8rU/zutcyTGJ+Y5oXB
         JuO9j4vpuaAtyZ+AFU+hvMCPPC2xY2QNTknTNPTU3tTaS4G97/fHQ7qrxUacBOYzA3D1
         AlE/IoAEhfVuVTR7vfq7l1IzOuZz6yAEZb0WyIwVKYyWOE5oRd+62tiRuzlky+GbusT7
         UslAs7QLTgfsPHjI8Tj6NgFDaoLCLjIOZnI79GSJfu+tcEz7IAoWDstJQf8TTXQyoyg+
         +4NI9nSGx9xSElT5d1zyEHadTRvTFnC1pQocU1dZUTin2q5toXR15CtZnuk+TnaqYkN1
         BXxg==
X-Gm-Message-State: AOJu0YxNxiNWG3vR9C404lFyh+QBFXtp/+Xh7qGUsrQ3UWViyDcTXRrk
	gVDTWueVBQHI0eu4yGoD6iwcGaAdge+CZx9Cix4=
X-Google-Smtp-Source: AGHT+IFZsRd3eU/PpNP5qkuRm6k7xV+vaN6e/cLLWasx5pPq2hqegk2IF5HvSYw0h2sc4KURChK0tA==
X-Received: by 2002:adf:f249:0:b0:324:8353:5247 with SMTP id b9-20020adff249000000b0032483535247mr3265362wrp.16.1697359453731;
        Sun, 15 Oct 2023 01:44:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7e01:6bdd:8c85:9c17])
        by smtp.gmail.com with ESMTPSA id v24-20020adfa1d8000000b00326f5d0ce0asm7837498wrv.21.2023.10.15.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 01:44:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: paul.gortmaker@windriver.com,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] linux-yocto-6.5: Add serial port suspend/boot workaround
Date: Sun, 15 Oct 2023 09:44:12 +0100
Message-Id: <20231015084412.379771-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 08:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189140

The 6.5 kernel has some issues with serial ports not always starting up
in early boot correctly after upstream PM changes. Add a hack to cause
data not to get lost in the xmit buffer. This has caused breakage on the
autobuilder.

[Patch being sent for wider attention and not for merging as Bruce would
handle adding it to the kernels]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../linux/files/suspendhack.patch             | 79 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/files/suspendhack.patch

diff --git a/meta/recipes-kernel/linux/files/suspendhack.patch b/meta/recipes-kernel/linux/files/suspendhack.patch
new file mode 100644
index 00000000000..03cfc084fef
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/suspendhack.patch
@@ -0,0 +1,79 @@
+We're seeing an issue on x86_64 with 6.5.X where data appears to be
+left in the transmission buffer and not sent to the port on the second
+serial port (ttyS1) until we trigger it with intervention such as an echo
+to the same serial port from within the image.
+
+Paul Gortmaker bisected the issue down to this commit:
+
+serial: core: Start managing serial controllers to enable runtime PM
+https://lore.kernel.org/linux-serial/1431f5b4-fb39-483b-9314-ed2b7c118c11@gmail.com/T/#t
+
+We run very simple plain images under qemu with two serial ports
+configured. These are x86_64 images with two 16550A ports with the
+standard x86 port addresses which appear as ttyS0 and ttyS1, nothing
+special. We run a console and getty on ttyS0 and a getty on ttyS1.
+After boot, we wait for a getty to appear on ttyS1, login to it and run
+commands. The serial connections are made over sockets from qemu.
+
+
+With 6.5.5 (and latest 6.5.X head as of yesterday), we see an issue say
+1% of the time where the getty never appears on ttyS1 even after our
+timeout of 1000s.
+
+When this happens we've added code to login to the ttyS0 getty and run
+debug commands. We've been able to confirm the getty is running and the
+init system doesn't matter (happens with sysvinit and systemd). The
+most interesting debug I've seen is this:
+
+root@qemux86-64:~# cat /proc/tty/driver/serial
+serinfo:1.0 driver revision:
+0: uart:16550A port:000003F8 irq:4 tx:418 rx:43 RTS|CTS|DTR|DSR|CD
+1: uart:16550A port:000002F8 irq:3 tx:249 rx:0 RTS|CTS|DTR|DSR|CD
+2: uart:unknown port:000003E8 irq:4
+3: uart:unknown port:000002E8 irq:3
+root@qemux86-64:~# echo helloA > /dev/ttyS1
+root@qemux86-64:~# echo helloB > /dev/ttyS0
+helloB
+root@qemux86-64:~# cat /proc/tty/driver/serial
+serinfo:1.0 driver revision:
+0: uart:16550A port:000003F8 irq:4 tx:803 rx:121 RTS|CTS|DTR|DSR|CD
+1: uart:16550A port:000002F8 irq:3 tx:281 rx:0 RTS|CTS|DTR|DSR|CD
+2: uart:unknown port:000003E8 irq:4
+3: uart:unknown port:000002E8 irq:3
+
+This is being run after the getty didn't appear for 60s on ttyS1 so
+we've logged into ttyS0 and run these commands. We've seen that if it
+doesn't appear after 60s, it won't appear after 1000s either.
+
+The tx:249 is interesting as it should be tx:273, 273 being the number
+of bytes our successful serial getty prompt has. Once we echo something
+to the port (8 bytes), tx: jumps to 281, so it suddenly found our
+missing login prompt. This is confirmed with the data appearing on the
+port after the echo.
+
+I did try disabling the autosuspend code in the commit above but it
+made no difference. What does seem to help is changing the conditional
+the patch adds around start_tx() back to being under the original
+conditions. This is relatively harmless as it will just stop_tx() again
+if the xmit buffer is empty and this is a one off operation at probe time.
+The small overhead is much preferred to randomly failing tests.
+
+Discussions with upstream are being attempted:
+https://lore.kernel.org/linux-serial/c85ab969826989c27402711155ec086fd81574fb.camel@linuxfoundation.org/T/#t
+
+Upstream-Status: Pending
+
+diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
+index 831d033611e6..cb2434b733c2 100644
+--- a/drivers/tty/serial/serial_core.c
++++ b/drivers/tty/serial/serial_core.c
+@@ -157,7 +157,7 @@ static void __uart_start(struct tty_struct *tty)
+ 	 * enabled, serial_port_runtime_resume() calls start_tx() again
+ 	 * after enabling the device.
+ 	 */
+-	if (pm_runtime_active(&port_dev->dev))
++	if (1)
+ 		port->ops->start_tx(port);
+ 	pm_runtime_mark_last_busy(&port_dev->dev);
+ 	pm_runtime_put_autosuspend(&port_dev->dev);
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 392e6b3d819..51ee963c1ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -41,7 +41,8 @@ PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https \
+           file://suspendhack.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.5.7"
-- 
2.39.2


