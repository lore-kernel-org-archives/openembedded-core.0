Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A12EF60116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:03:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so4419114wma.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/MG+qXfMRicfYHQ2L3Io1uELjV8tO/V74GgFjiK09rQ=;
	b=tqWU2PosTIiZz+VJz7X27WbLVOFetAyI82K0Q+z1QfUj3PsL5VdpCPzTbB7gw78v7C
	nBrtfgOHYBb8WBFYGSHPZbWyaH0figNLuATvCxE8HFk4bKqz3rmH2O6PW6BZxk2ITJO5
	eTGBszOcoa/gIEygFuFF+Ynr7BFUKv0AbwoLfP/s5ubB4Wxk33NjLsmmgdwXJAoLYrev
	PfAadL84lT35yfzb8+MCEr49ijJKoUMT0YQP4tvCAFKtaN5ak2hsVEO5gR0A2mNimYNs
	5NWco5Nr65SnVOGxOKoujalNmYibmGAHdnMGCjIkJtKrN7S6f1ASvCNqC+ASp5PpXh/Z
	H8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/MG+qXfMRicfYHQ2L3Io1uELjV8tO/V74GgFjiK09rQ=;
	b=FGJxiHQ/7fw3WxUkV/vNzxcl8u9mrjnQGqJ7oskrbVxCCod19Gnu2YUygmfsbZtECZ
	9sIcE/1+cZUO5LA3WnrsVvnMlIl05D8GktLx0tbBgXQ5q/Zn6fehxvR1JWMgWO28yO5A
	EAeY3+vkHXnLHQ03ZWQ5BYB46+Fq8128d+U0EkapODvwhcycX6TqNYgYIlx10bmGqmkT
	3FlRveCPrfvNg+ZqCl1hn2oRLDFaripjZpOv0cS/VR2uLZx8hBHDQ4YaMWUE9+S8h7Hy
	1Bv8kIMbPjZZXvH9ntGjxJ/OkW+MvkJ3HwVxnLXQa182jCampvM7/QHMw8N0ez2WHEpF
	zvvQ==
X-Gm-Message-State: AE9vXwMmDbo3INm0XTdrzGsoteT9q2YhYch5ImRE0VYrjr7uxxgqjuLjXQfgvA8HwyQmPA==
X-Received: by 10.194.115.38 with SMTP id jl6mr25357759wjb.28.1475046196506;
	Wed, 28 Sep 2016 00:03:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bj8sm6602504wjc.49.2016.09.28.00.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Sep 2016 00:03:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 09:03:14 +0200
Message-Id: <20160928070314.24504-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
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
X-List-Received-Date: Wed, 28 Sep 2016 07:03:16 -0000

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


