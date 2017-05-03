Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAE871AD5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 12:40:55 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c15so66136965ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yQS2gnA8MDZQiSKPjzzG/6p8yJQVtPwTVL0bBgFKdic=;
	b=ZgE0kHtXdvjvaomgQTgu4c5NVZJVeHTwJunsCiIQiHwDXfvaUKFqz+Fw1rIPooqZc4
	5t7bCnPgHkfHv0pvHybgkc9FVKx416wMfI2SActYTixBXIi6OPv4XYLC41B72c6F9dNR
	6LiMUtzgiDdBuXdzH5WaJvUPh4USc/jHlgiz60gMTc0kOM6Fge0VzaGK5hui89JsqVup
	bcUEx2fTybNcaGgoSC46HLsD+i1i2BI3pSPDqtILrww9ildjivbXIUrsc7qS8yUgEAem
	x7dzdLwhL99QwwpNJ6FSjpdLwF0jbktCBhrh+b4b8wSH51NZvwVt/AirD4ZtFJ6S9mqm
	pQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yQS2gnA8MDZQiSKPjzzG/6p8yJQVtPwTVL0bBgFKdic=;
	b=BCxwiDU1ZfbCuGmEn/nH5XCbi7J17Rh/Jct7njF1pMqkGr3ZIgfrlE4W0bkf+TDQrw
	hEjCUPvVv5U2/sWy59O5petEMVmctPfIbI8JoaD18EJmlidWQJwBMHNT0tj8zHi4ZCgq
	PjqVIPvr9KJrwquIM8Sav1P/z+o59R9fJL/f/NPaxBr/2CTvW/r8+UloT+T6bi5cE7dD
	psF5KOx38MK/VBbiA8Zm0jYlmhU1lnkl4zG5AvqaBY3Rn9bbbbEBb6A8DoShAzJNgRg6
	5wOFD0dCUSVdD/t1OCQWXjoMEo0USycm7iT/+WOqWNggWDFqD0VnMQaHSUMw0INGivoU
	mGag==
X-Gm-Message-State: AN3rC/7yrJQNHApm8wSIWbwCcLuIb3EwSEfWfVnaMRH16Vlm4Li+d+Ls
	GRG4ivpa9lctnd5w
X-Received: by 10.36.14.15 with SMTP id 15mr322023ite.100.1493815256913;
	Wed, 03 May 2017 05:40:56 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8CE40.dip0.t-ipconnect.de.
	[93.232.206.64]) by smtp.gmail.com with ESMTPSA id
	u133sm9048309iod.21.2017.05.03.05.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 May 2017 05:40:55 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 14:40:49 +0200
Message-Id: <bb19f2d1d316485322c8962224ddafdf20cb04bb.1493815193.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1493813847.4241.251.camel@intel.com>
References: <1493813847.4241.251.camel@intel.com>
Subject: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 12:40:56 -0000

That a utility function permanently changes the process environment is
bad style and leads to subtle, hard to debug problems.

For example, we had one oe-selftest which used runqemu() with an
override for DEPLOY_DIR_IMAGE. Another test then just called runCmd()
and ended up passing the wrong DEPLOY_DIR_IMAGE set earlier in
os.environ.

The approach used here is to pass the desired environment dict to the
launch() method as a new, optional parameter, which then gets passed
on to subproject.Popen(). The modified env variables do not get
logged, as before.

[YOCTO #11443]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ba44b96..b06ccc8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -98,11 +98,12 @@ class QemuRunner:
                 raise SystemExit
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
+        env = dict(os.environ.items())
         if self.display:
-            os.environ["DISPLAY"] = self.display
+            env["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
             # interact badly with screensavers.
-            os.environ["QEMU_DONT_GRAB"] = "1"
+            env["QEMU_DONT_GRAB"] = "1"
         if not os.path.exists(self.rootfs):
             logger.error("Invalid rootfs %s" % self.rootfs)
             return False
@@ -110,12 +111,12 @@ class QemuRunner:
             logger.error("Invalid TMPDIR path %s" % self.tmpdir)
             return False
         else:
-            os.environ["OE_TMPDIR"] = self.tmpdir
+            env["OE_TMPDIR"] = self.tmpdir
         if not os.path.exists(self.deploy_dir_image):
             logger.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
             return False
         else:
-            os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
+            env["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
         if not launch_cmd:
             launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
@@ -128,9 +129,9 @@ class QemuRunner:
                 launch_cmd += ' nographic'
             launch_cmd += ' %s %s' % (self.machine, self.rootfs)
 
-        return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams)
+        return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
-    def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None):
+    def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
         try:
             threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
@@ -157,7 +158,7 @@ class QemuRunner:
         # blocking at the end of the runqemu script when using this within
         # oe-selftest (this makes stty error out immediately). There ought
         # to be a proper fix but this will suffice for now.
-        self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp)
+        self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env)
         output = self.runqemu.stdout
 
         #

base-commit: ba2884f6ad3a4e746fc80cbd707f83fa8abd4210
-- 
git-series 0.9.1

