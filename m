Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A83267D435
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 07:29:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a184so5320418wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 00:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pPUBVLUc6FpHVFcHNaFp5iywDS0bvjL7LH3Oy0fRWRg=;
	b=Cv1I10vTdZBbQDaSZj2M6qSjsobbkMnNTUFEH3oF8g7588KIFXVfiC55TLh8F3A5kt
	lk3UznpdkZRnkm1/LrqwBkg8XbJF2otbTPVG7+8dXNVq4KYx8D/GFSKM80eQeLuSvUop
	up6AhJasZW+todWk6TTqoVCtJNCn5uFkcUKWRUo+AjdCXsTNMh1N7RDqrrpUgJRy4H7z
	MoeXf3DPC8LPf7TgIdDlAI/mvJLmRpUlFr1sRqqvGsuqoyiiOT1hRhA2NNVHo4hLFKkB
	qqbR221xl6jyTqf1itEOM1T/Z5YlDA0aBX1i8CVwxRN86HcLsjEoS8ADqdhZi7mOzQBX
	HxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pPUBVLUc6FpHVFcHNaFp5iywDS0bvjL7LH3Oy0fRWRg=;
	b=eJUx0/nm/5xFqez6jwVO/V0RFbKl7E4/VPGkytNz83GexaTf67fCvlxuNHvUKZEDzT
	rly863HuhYT2BlJ7QnvcmkJcYMFoDyXv3ddVhGszNQ+pZcgWkohyUb7lyFBm5ccR873U
	JNJxqfwJgANd1Ga+gCx1AmvkyhASC/ID1XXMrmw0zgSUeIizW3IX0B8D/hZ/FbvRXTmH
	bA0Z7ZfxuB3DNV4/BFGjX7/ZiCzErwT/0JEgCGyZUK+A/xh9FizfiwY5rbjQnoSe6O05
	h0Ti8pDJdcLclYrGu0AVNZd49AppL/sXNt9YX/UqIpGtHUINOxE3H5m/sl/WiazoEggS
	sL9w==
X-Gm-Message-State: APjAAAUYaXPLNHQiOPSW17OSiWqvLmqz9ayQSPX3b/ZCgXwPDLFHlTHU
	NmxZ5d/1xbaR6XdfcyffZHgxyF6WrvE=
X-Google-Smtp-Source: APXvYqytkt4XXQ9ia0bT0HFUpjUEgC5ka64yv1Td69qB8awtH9PY5dcdgYjYf+2BCukoGcULF/pv9A==
X-Received: by 2002:a05:600c:2294:: with SMTP id
	20mr5010797wmf.56.1554967783219; 
	Thu, 11 Apr 2019 00:29:43 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-180.residential.rdsnet.ro.
	[5.13.211.180]) by smtp.gmail.com with ESMTPSA id
	v192sm3941147wme.24.2019.04.11.00.29.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 00:29:42 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
X-Google-Original-From: Beniamin Sandu <beniamin.sandu@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 10:28:54 +0300
Message-Id: <20190411072854.31885-1-beniamin.sandu@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [[PATCH v2] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Thu, 11 Apr 2019 07:29:42 -0000

The kernel-devsrc rework doesn't take into account localversion
files in the kernel source tree. This might result in modules with an
incomplete version magic when building out-of-tree using the SDK.

Before:
root@qemux86:~# insmod hello.ko
[   42.000212] hello: version magic '5.0.3-yocto-standard SMP preempt
mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
SMP preempt mod_unload PENTIUMM '
[   42.008200] hello: version magic '5.0.3-yocto-standard SMP preempt
mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
SMP preempt mod_unload PENTIUMM '
insmod: can't insert 'hello.ko': invalid module format

After:
root@qemux86:~# insmod hello.ko
[   39.094288] hello: loading out-of-tree module taints kernel.
[   39.108044] Hello World!

Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 69a8eaef81..5ec5929735 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -228,6 +228,9 @@ do_install() {
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
+
+	# copy any localversion files
+	cp -a localversion* $kerneldir/build/ 2>/dev/null || :
     )
 
     # Make sure the Makefile and version.h have a matching timestamp so that
-- 
2.17.1


