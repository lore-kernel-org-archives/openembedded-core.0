Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CD2CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 08:41:04 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.85831.1697359257011089083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 01:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WPZ2dyRu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so3407050f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697359255; x=1697964055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F38Wvmsv927hMgQ3ae1Kg/79Av0mO3me+NNI0WCI9WM=;
        b=WPZ2dyRumnLTiZwYW/waftIwybf0m6E6pDHwy2tzaFytCCW2roppXl+u1b7DOsrz7K
         Jz/m9ZM2g1SG7obs6NbI7THNWJJOA3N1KtQq+SjjomQu1o9pyIUfJdCgpm+KW1yWrm3Y
         ukVjxuA3MENILHR/rWwmpRkEBIfMZ1CSaHPAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697359255; x=1697964055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F38Wvmsv927hMgQ3ae1Kg/79Av0mO3me+NNI0WCI9WM=;
        b=Zdizu86HM0BqOVPZTAAB2dIQ1KJfbfRRE6R+mWraFp8yATmtp5EHsqzzPaFmQ7awWA
         O2rnbdyaJotYMMYbKGqCg+UC1vcpue9KtD2Z8JLUUxxB5KZ9ODPUaf/VrEscZSLmjaJW
         nR8N9MVi7Jhk9QsIaJYdPsE8+lYGD625WKMSXVJJHSVuC11MKj/1HlaY5OchrIZ95wEf
         vaJmkBCLKPSq44KKnb4LDmmeEB6hylI3NjM3V/oXU26VG0hALEf/fAfgd7P0jABbOc5u
         hkg4K/BSpXcwgWT4ATwPqYwoJZkcSwhe3xskRZmXWCKVKt0LJiC5KWf4orj1iP8h3fQ7
         /rIg==
X-Gm-Message-State: AOJu0YxNzdf8pyGLXertMLPxQg4ZTU6vYHxmqrnvVquazk1Gcqhrlrt6
	eKcSwutSKNgkQ6PWeHtHhK+f6d0uoaO7f5QKMAA=
X-Google-Smtp-Source: AGHT+IFASNPTQzED4wAaUN/SiGevwrkAsbaAsZYo/lgCINQjGTdq1OH1ghrW03E7gFZpPCEGOIoMkw==
X-Received: by 2002:adf:fa47:0:b0:32d:a01a:9573 with SMTP id y7-20020adffa47000000b0032da01a9573mr4486642wrr.8.1697359254808;
        Sun, 15 Oct 2023 01:40:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7e01:6bdd:8c85:9c17])
        by smtp.gmail.com with ESMTPSA id q17-20020adff791000000b00326f0ca3566sm3060180wrp.50.2023.10.15.01.40.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 01:40:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: Add suspend hack
Date: Sun, 15 Oct 2023 09:40:53 +0100
Message-Id: <20231015084053.379415-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 08:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189139

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


