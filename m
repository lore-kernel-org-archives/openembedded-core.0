Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 635046D52E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:57 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y8so2512423wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vWtSbVA7mJz6C9hyERzxGRYoCQZIyBAo1eFZMKRbwz4=;
	b=D2UyInAu4i81rSETEVixd3h1ujpWDXnMRUOhIcxjD6udoawwvECq0DueBW68WInLzK
	RH2n5Q9cPa88VK0aOVZplzRynUq5ckMBSBUATeKYwyVU03gbJ0IP4nHENdNlXoOBUJZE
	ixglxGQPSfn1KNC2rd1iVgImgWurUi4SwBKrq7qDdgoZByMlTYwVzHLJ/YEBsROsXdFd
	8U1e/+1z/IbiqAUWFehEHYLAoVuLD/fnTMDWkq6TYZN5A4qYWTeEkDS3GWvRTmZv/E6U
	X10MfUhgR1C1NvnYsHhC9bu849tV5GlVsSMzfSJepYKU3XljbIuUWmyipkMjfivCLADD
	ZuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vWtSbVA7mJz6C9hyERzxGRYoCQZIyBAo1eFZMKRbwz4=;
	b=Uhj2I82J62Q765bOwIyE7CiBmbwBaQUIq5qc3UY2AJyw7wYJmYhnnMr1Z1/FzVC/pI
	SLUwbyjuUHMAY1Su/wVU/PzqxuBfqsEfmelXX4/9uUc2dtf6fvme8742wmt2/dYFP+HG
	Yk4FoKd77M3esZKUo/Hs2zN7iPnLmZMHmsUTU15VbvVexUFkOl15YdZGO9XmnlXTCZRd
	5s+UDBYZ+X2b9DxktC05uZiMvScQfaXbmq9oxPhSAWUHP29MNcxVv77vTF05CR67mTYI
	9ZPAZriKN13hCOq0tfHaEfSydcYtyj/jFeW5vpeBR/4WWGdWqc5pCkTjj7tillUvr6LM
	Xo5A==
X-Gm-Message-State: AJcUukfQUjqK8x6+shNq6KzD/hhpWBHh8vdUWh5ZPAB48OzhpmvAHaGF
	oqRnoZLxAm2yqrP14d44KqnTvaA1
X-Google-Smtp-Source: ALg8bN5Bomgm4J8ep5Noguy9npP/HhrqKgyDy++w9Esal7wVdNcHQl9zgjRP4s2roCedzlyrBYMVGQ==
X-Received: by 2002:a1c:c44c:: with SMTP id u73mr3460790wmf.45.1548260277784; 
	Wed, 23 Jan 2019 08:17:57 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:40 +0100
Message-Id: <20190123161744.45763-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/10] testimage.bbclass: add support for passing runqemu params
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:57 -0000

This is particularly useful when setting up GL tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/testimage.bbclass    | 4 +++-
 meta/lib/oeqa/core/target/qemu.py | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index cb8c12accee..ff1c53b93e1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -32,6 +32,7 @@ TESTIMAGE_AUTO ??= "0"
 # Booting is handled by this class, and it's not a test in itself.
 # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
 # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
+# TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
 
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
@@ -65,6 +66,7 @@ TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_TARGET ?= "qemu"
 TEST_QEMUPARAMS ?= ""
+TEST_RUNQEMUPARAMS ?= ""
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_append_qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
@@ -294,7 +296,7 @@ def testimage_main(d):
     try:
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
-        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"))
+        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
         results = tc.runTests()
     except (RuntimeError, BlockingIOError) as err:
         if isinstance(err, RuntimeError):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index f47fd7468ed..7a161a32319 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -33,11 +33,11 @@ class OEQemuTarget(OESSHTarget):
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger)
 
-    def start(self, params=None, extra_bootparams=None):
+    def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
             self.logger.error("Could not start qemu with slirp without server ip - provide 'TEST_SERVER_IP'")
             raise RuntimeError("FAILED to start qemu - check the task log and the boot log")
-        if self.runner.start(params, extra_bootparams=extra_bootparams):
+        if self.runner.start(params, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams):
             self.ip = self.runner.ip
             if self.use_slirp:
                 target_ip_port = self.runner.ip.split(':')
-- 
2.17.1


