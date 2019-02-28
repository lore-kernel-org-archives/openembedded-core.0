Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39A017CCAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 04:15:45 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id q128so10027619ywg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fWQAD/lHD0VDTLnpYTXMT3A6pl8k5gUsgBX1WvOjzzY=;
	b=VkQWtTQMEIDKwVQNY38ku4yiNX4TboEMFS98ejhvtDXzPLHuxjkU2HvoCtqSg7BkHa
	Fc9K9sAZajif0wCwkT5Kb6tuGiX5cX0O4qD9KKwDdYnAfv4wZFoAvPr6JdtIYGZP1FzB
	szeJZhxrQsWH9Ya+une15MnQQY/hyK4wEAhToqtoAsOan1ON18C43tnX0HBhpNUyiKPi
	PCZ2+aD/fpRWmvrelPSlerSuEJ+6uCCv8dw3QYC10uT5IDG7SAmrZjj1pk+akmnY6SkW
	6N2cOZJ/sybMIYMcSIg/wJGKXO5NyIxAjbR77Qqm6X3LWhXMr25tQBxhQJQtNf19dli4
	WCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fWQAD/lHD0VDTLnpYTXMT3A6pl8k5gUsgBX1WvOjzzY=;
	b=tsS16kW1RngYtZLi2eFXS/LDWVzPp2wzICfW7j7/4mDP3jAb5IXSpiuVe6iGSXeE/a
	oA1Y1Q6jjAGtM+Ri/MKy5lbesZRgLVtF2N2P3sawtThFOUh6yagNPO4mDva2/qWORFfE
	oY4aXUH78qVpmT1Hn6sS312KOFxVJ4qYqHY6FhOw062JzBDuRDRukZCfAtyVcEkEC325
	uobPRrpnkGHiMFBIdAk5WxYFxHsAaU9txNttVDAElQIS5KbfRj8IU29D61F/JQ1Fthjy
	1wQFrFI4ww55rirFm1/6eFcd5f+MgPDjrTLXoO9DCzaqVLjUbwBjZxXHsDNhJaigRGt7
	P7Ug==
X-Gm-Message-State: AHQUAualDyz6lRBiFlP61iJotbYVt7DdJiZMGIOHHuYnX0vekg8h9ijp
	r26msL8Wr0EjqORgJy7m6EvEPQ1kj5ddEA==
X-Google-Smtp-Source: AHgI3IbT+IEq5nLndCqwa5vfrLCsARv+GFd+y3e2XvZ7lSWpSUrZAmguA5afht1TBrlL5EEctSxsfg==
X-Received: by 2002:a81:27d5:: with SMTP id n204mr4044397ywn.495.1551327345990;
	Wed, 27 Feb 2019 20:15:45 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	z201sm6126529ywd.23.2019.02.27.20.15.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Feb 2019 20:15:45 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Wed, 27 Feb 2019 23:15:43 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 23:15:40 -0500
Message-Id: <20190228041541.14628-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190228041541.14628-1-jdmason@kudzu.us>
References: <20190228041541.14628-1-jdmason@kudzu.us>
Subject: [RFC 1/2] qemuarm64: fix hvc0 error and cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2019 04:15:45 -0000

The following error is being frequently posted
INIT: Id "hvc0" respawning too fast: disabled for 5 minutes

Remove the references to hvc0 to work around this error.  Also, add some
comments to describe what is going on.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index ee19385eaf..8d4a482fec 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -7,20 +7,23 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-SERIAL_CONSOLES ?= "38400;ttyAMA0 38400;hvc0"
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;tty1"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
-QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+# We need both ttyAMA0 and tty1 to allow for this to work in the stdio mode or the normal mode
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 console=tty1"
 QB_OPT_APPEND = "-show-cursor -monitor null"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+# Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+# Virtio block device
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+# Virtio serial console
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev vc,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-- 
2.17.2


