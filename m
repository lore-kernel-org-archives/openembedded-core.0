Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A173B79E16
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 12:16:16 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 70so1684788pgh.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 04:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=SR8AyJdX2jfyBcAhngwUqUhCmjHZARSDTFvFJPPMgig=;
	b=Z8Khi4lAb2u9AW0ueJxVHQ2eINkzM89EHA3dE9Ts6fLgmyYm95bDOGGkiBtGFQcvDE
	B7XxyIKywHOdcE3itcRHByK8kK5pLdhARvdcuANnGM/C8Ohdnoz2cZpvH/anHlrGNfmf
	3UAZhX5m9G6AyPUG9QmFBugccLrUkIWd+v7CXs/p9XbYHBaSEyewIT9gRB96nbgDNMsW
	00m2GH2hGabhfDLKjHWIv3dCDSk5oomWFRAKoZNayVWxsgQWn5PbyYR+zjl91PnkjXMY
	K52S1QyDMSTOPPB7a5Dv9OqEMDEiMU8UgFEO7+PB8NqE1msJtWj1zJFsAkrk58y3wQzq
	6kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=SR8AyJdX2jfyBcAhngwUqUhCmjHZARSDTFvFJPPMgig=;
	b=qFXQkvyIvflHC2V40WbVbbC3AVwgGsd56+xW/UrNYIhHj2bzV3N3aFTRR77vv1hIn7
	c1FrSRMdRTkGcg/Mj14ajhPwKqUJI0g9s5ACKayG7RecnwQhiIio65BBZCEXwuHpqyMC
	/XBqX6mZK67dLTXTHTmMXhcs5D383mxX9fPVf29v9E19H6UjgsZ7wshNVbVrDe2ohtOE
	LZrHhKPhJKhBFVQUQPlLYGcRN4lcr7m5PvY5ewWAunilDyUJisubWuO86phczrgxEOvA
	Sw8EOEXfULWDzXd5GQ3DMr/98B427P0pz9CSBUZh2AGx+ESW7DLgakFP0cDbx3EtpTzU
	D4RA==
X-Gm-Message-State: AGRZ1gKhUYFb8kVz6tC1kgI7xvwCiZvKRKlCFHs6gyE0xP7M6JdIG700
	UvaSUiSPpfF2dzGOPsj8DiEd5fITcIQ=
X-Google-Smtp-Source: AJdET5eSzYm0W5sD1IVJGfzgqm5/9cM7lJKv1hKhbCR4lCb3ggqBZ9ZXbmSDqf8lYCgxiDb+c0KD0A==
X-Received: by 2002:a63:91c1:: with SMTP id l184mr1333032pge.29.1541592977534; 
	Wed, 07 Nov 2018 04:16:17 -0800 (PST)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	a73-v6sm609510pfj.38.2018.11.07.04.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 04:16:17 -0800 (PST)
Date: Wed, 07 Nov 2018 12:16:02 +0000
Message-Id: <20181107121602.13768-2-nathan@nathanrossi.com>
In-Reply-To: <20181107121602.13768-1-nathan@nathanrossi.com>
References: <20181107121602.13768-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/2] kernel-initramfs.bbclass: Handle built-in /dev/console dependence
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
X-List-Received-Date: Wed, 07 Nov 2018 12:16:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The kernel has two differing code paths when handling a built-in cpio
versus a cpio passed to the kernel from a boot loader. When the kernel
is booted with the built-in cpio it expects the /dev/console node to
exist and will panic if it does not exist.

  Kernel panic - not syncing: /dev/console is missing or not a character device!

When the cpio is passed to the kernel via a bootloader, this behaviour
is not observed.

To resolve this issue, ensure any cpio that is built into the kernel is
prepared with a /dev/console node. This is done by appending to the
copied cpio of the INITRAMFS_IMAGE. In order to create the node to
append, the task must be executed with root permission (to run mknod).
As such this change creates and intermediate _prepare task between the
existing _bundle and _copy tasks.

Note: The default/minimal initramfs that the kernel sources
gen_initramfs_list.sh generates contains this device node.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/usr/gen_initramfs_list.sh?h=master#n55

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/kernel-initramfs.bbclass | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-initramfs.bbclass b/meta/classes/kernel-initramfs.bbclass
index b23fb51495..135f4c8949 100644
--- a/meta/classes/kernel-initramfs.bbclass
+++ b/meta/classes/kernel-initramfs.bbclass
@@ -16,7 +16,8 @@ python __anonymous () {
     if image and bundle:
         # add all the tasks
         bb.build.addtask('do_initramfs_copy', 'do_initramfs_bundle', 'do_install', d)
-        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_copy', d)
+        bb.build.addtask('do_initramfs_prepare', 'do_initramfs_bundle', 'do_initramfs_copy', d)
+        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_prepare', d)
 
         # make the do_initramfs_copy task depend on the image do_image_complete task
         d.appendVarFlag('do_initramfs_copy', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
@@ -67,6 +68,18 @@ do_initramfs_copy () {
     echo "Finished copy of initramfs into ./usr"
 }
 
+do_initramfs_prepare[dirs] = "${B}"
+fakeroot do_initramfs_prepare () {
+    echo "Preparing initramfs by creating required /dev/ nodes"
+    # append a /dev/console node, this node must be created in the rootfs
+    # for built-in initramfs cpios otherwise it will error with:
+    #   Kernel panic - not syncing: /dev/console is missing or not a character device!
+    rm -rf ${B}/usr/append
+    mkdir -p ${B}/usr/append/dev
+    mknod -m 600 ${B}/usr/append/dev/console c 5 1
+    (cd  ${B}/usr/append && echo "./dev/console" | cpio -oA -H newc -F ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio)
+}
+
 do_initramfs_bundle[dirs] = "${B}"
 do_initramfs_bundle () {
     echo "Creating a kernel image with a bundled initramfs..."
---
2.19.1

