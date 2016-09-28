Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A83660107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:28:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w84so4504605wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hM3aPD35x1nPUk0fzH13MpV965wBPT1v0/xvP6bo4TY=;
	b=OMc3oBe5kWL9iTHC4t2fXdReWMk0VwHD2ERM/Y8PJs2P9hHn6nc2Fc0zCRYIN9n83z
	8pYFwk7cMI8aejTXb/kkaLLmNny3k2PCnGHY9AA5eC3LcbwS081dISFsYMZBzY6ESl/F
	Z6zxKzda67K6Tt0DIf9iGxbk0wiYo7riJDN8MYYkGTwoImT5AYaum8XcSOSFZA3ViHU0
	PiBjwv0yHSyAXHhkpT4+PzZmtyvJer5LAZ8N0uxoz7r0BYTq2DpR6RubVmHiob6h0OH+
	MrVRoA+CrKwItRfxa2Zq3Ntg+aqzadI46JeE6Gjnyu4z+uGIcmW75D5j5xM9FH681FiV
	jg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hM3aPD35x1nPUk0fzH13MpV965wBPT1v0/xvP6bo4TY=;
	b=ShWlhWOXK5iptlkfIlHuHPzPv0BFrEWlmp7ofC2hLiyf1XTlcYvZZIWWLIcZlXwbyH
	qCTZp6m7PhmaRVZxcqhkP2O4gSASfYGw5V7qtuaF23QB3qlncHxuVhAfLJJsqJK5NGKL
	/dWIDbKr7y5MTzzyJlqIRcU5JDKFsgFGPQOkcy/AASWK55r+ImRtsobne23nyvIsfrKv
	pGgkQI1pkuk+XQUFpVgNorBFbfXKXa3m9XmWgTzCPEKl0VKUUdF0Q2kai6Qbx2FSAU5L
	gql8xEtQY9VyeHtFcSmfWBRz0GvPDy8fCxT7zUoXr7lA/IsN/E5P/SRrP+f6/IO6IfG8
	Lxng==
X-Gm-Message-State: AA6/9RlktI8gxXpSvJ3CBOp4j8zl9zc9xcQvhQxXJXeGnpgZdOT6nGUJpmCZGMZgSnnm1w==
X-Received: by 10.28.193.13 with SMTP id r13mr6228555wmf.90.1475047732690;
	Wed, 28 Sep 2016 00:28:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	ce6sm6755627wjc.27.2016.09.28.00.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Sep 2016 00:28:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 09:28:49 +0200
Message-Id: <20160928072849.25810-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <4e1404d9-e1b3-ce24-4c20-55757352e2a6@windriver.com>
References: <4e1404d9-e1b3-ce24-4c20-55757352e2a6@windriver.com>
Subject: [PATCHv2] qemuboot: don't fail when QB_DEFAULT_KERNEL isn't symlink
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
X-List-Received-Date: Wed, 28 Sep 2016 07:28:52 -0000

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
 meta/classes/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 97a2357..ef9a128 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -69,7 +69,7 @@ python write_qemuboot_conf() {
     # to the kernel file, which hinders relocatability of the qb conf.
     # Read the link and replace it with the full filename of the target.
     kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('QB_DEFAULT_KERNEL', True))
-    kernel = os.readlink(kernel_link)
+    kernel = os.path.realpath(kernel_link)
     cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
 
     bb.utils.mkdirhier(os.path.dirname(qemuboot))
-- 
2.10.0


