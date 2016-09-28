Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3FE600BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:27:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so4481378wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/MG+qXfMRicfYHQ2L3Io1uELjV8tO/V74GgFjiK09rQ=;
	b=G1/nmgj5ncu4swtdSJIocToxPZ9Kysq7/m7zMcOgDqq53LfNNlRbIttHpkLqotT74h
	VdvUiZnDHyAJg4pcsA1izKxYjjbtAJtgvkKQrTiayjjpm5joUARATM6lru459QOxISa7
	Y5HxQEr4YEI6s4sj4Z6wj60n7i8B3P5RuACqpjMdy3rScXwDOZtYDx0RE9ArnCB5RYU1
	GGyON2X3Ir9xBPISZyICa6q7M6VR1cSmWnVjsuDefBxzevHfbY2NGCmq4R3+7TpnuoHD
	7qhvu4XJ9vX0HpX3moQoKt/2E/WzH67sfKQK7JQNhzZGOFBM0/dz4TB1mN4PJOUdUpC7
	VLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/MG+qXfMRicfYHQ2L3Io1uELjV8tO/V74GgFjiK09rQ=;
	b=A4pKqFXKBVwX3G79HoPVJyWneukr9g+ymzABEDI0gcbbKAlYj/9wgpKsdMX3kS/Hoi
	reDueNSZY+t8J8P1YnsMqs9uNNvewFOPgOScim61ugaGpMaTRbf0fr04L97IV81RQOSZ
	dK0Kp8nqaFY+256rTDAhKfQfsZKRgxT2n/iSW7ijka4Z+i5b11MKyctnhkGhmvjMlU7v
	cgCv4EwRlwNeFH5RWVwE5cyUElT5n04e61wOCX+j8kmNuFXhv8VJrAJqeyB5HcqUgLKT
	F2W2GuEBjRco/RnBd+NcBlyAhuew3qqC8tphJRRfRlzzg0hXEJMbkA7C+ICwVA11RTWH
	dz/A==
X-Gm-Message-State: AA6/9RnITQI3AMqQT1NveEKuDV4EOJ47naYNEqvD7LGhba6CLc5lrHe+mTbPCeFVClCkJg==
X-Received: by 10.28.25.71 with SMTP id 68mr6500943wmz.91.1475047674890;
	Wed, 28 Sep 2016 00:27:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id o5sm7181438wmg.16.2016.09.28.00.27.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Sep 2016 00:27:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 09:27:52 +0200
Message-Id: <20160928072752.20915-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <4e1404d9-e1b3-ce24-4c20-55757352e2a6@windriver.com>
References: <4e1404d9-e1b3-ce24-4c20-55757352e2a6@windriver.com>
Subject: [PATCH] qemuboot: don't fail when QB_DEFAULT_KERNEL isn't symlink
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
X-List-Received-Date: Wed, 28 Sep 2016 07:27:56 -0000

* in some cases we might set QB_DEFAULT_KERNEL to the real filename
  instead of symlink and then this whole readlink work around actually
  breaks the build, because os.readlink fails on normal files:

  >>> os.readlink('deploy/images/qemux86/bzImage-linux-yocto-qemux86-master-20160927084848.bin')
  'bzImage-linux-yocto-qemux86.bin'
  >>> os.readlink('deploy/images/qemux86/bzImage-linux-yocto-qemux86.bin')
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  OSError: [Errno 22] Invalid argument: '/jenkins/mjansa/build-starfish-master-mcf/BUILD/deploy/images/qemux86/bzImage-linux-yocto-qemux86.bin'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/qemuboot.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 97a2357..a3a05ba 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -69,7 +69,11 @@ python write_qemuboot_conf() {
     # to the kernel file, which hinders relocatability of the qb conf.
     # Read the link and replace it with the full filename of the target.
     kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('QB_DEFAULT_KERNEL', True))
-    kernel = os.readlink(kernel_link)
+    try:
+        kernel = os.readlink(kernel_link)
+    except OSError as e:
+        # we assume it failed, because QB_DEFAULT_KERNEL is already real file or hardlink, not symlink
+        kernel = kernel_link
     cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
 
     bb.utils.mkdirhier(os.path.dirname(qemuboot))
-- 
2.10.0


