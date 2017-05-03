Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEEE71B86
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 13:38:58 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e65so35756757ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1EHM6m8R6u8+g+cdfnnz30zTkQHC8RVnrnBhRFt62jw=;
	b=JDiIZ8oXMukCZP7rdWfhvgMHEEV99vgnQ7MO2bgjcjzZGDXhjk4qOXf4/s+t4d9XcL
	xfqqI1TLqv8lVWicQG7TlbQaaaWdeFCI52hZJm2aiaEjJT+cAD/19+x9mEbsXE/SoAN7
	shgRleNNhHt9CR1WY6b3zig8rwLjliFLf562slC+R6mWLrBuSNFLq7GJoijxr5Di3280
	6tLb7XKn2VJCqRqG6ge18HNy4AglVq5wBKlrioxJzx5Q10ZwLA2eer1r5VhoBImyrg7b
	jEwR7FWKNZiRJ4qFnRz7tuWgldXgRwgceTpuuVpkJt+ke+zgIo4nuDAgMFniSAymoNTj
	uERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1EHM6m8R6u8+g+cdfnnz30zTkQHC8RVnrnBhRFt62jw=;
	b=KDVUd8HnMQgUKO9UAmf3kQyLdhHpaD21aBdb0bH0vx0rN0ITf87W8hrusHuIZUKcOE
	AoqFtnnkYnJMXU70JimoEjWOjTw04wH+uHI5uwjDXWgXe+EDlUNnJc5+UmMaDIvEkyl4
	rvGl6gzi0j7CLJ4o2d3G5FgNz9N6/WVJpWSJegzCcU7HG3c2Y+0oxIqgSmFx7D88J2BA
	S04QDarRZxqGMieRCvZKJC9ExWOHpyaItOvM0NAXTstJGIAD5TgerEV7RgZTAL6vrw0I
	WNRBT4orLzstBJdqEu4pl+wVkMV7HRMI2UH7Y+4nCye23jUZh/EyyFlJK/nz5TMoc4XX
	6ibw==
X-Gm-Message-State: AN3rC/7FcBNwiMNFQVTp6N1z/I+ZDJIFUU6WkpUnMfmTlqJfGuOYu6Ce
	85yXZRZmab8aURZ3
X-Received: by 10.36.104.72 with SMTP id v69mr588320itb.27.1493818739402;
	Wed, 03 May 2017 06:38:59 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8CE40.dip0.t-ipconnect.de.
	[93.232.206.64])
	by smtp.gmail.com with ESMTPSA id j22sm7174920ioo.9.2017.05.03.06.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 May 2017 06:38:58 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 15:38:53 +0200
Message-Id: <93c7e01fce95fb42074c5b7b283438ba7d1f6147.1493818653.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CAJTo0LZNYYvckGiHC_ouva5f5WN-7YPmBfBWmgWinfmo4N7+AA@mail.gmail.com>
References: <CAJTo0LZNYYvckGiHC_ouva5f5WN-7YPmBfBWmgWinfmo4N7+AA@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 May 2017 13:38:58 -0000

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
index ba44b96..cd60ba7 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -98,11 +98,12 @@ class QemuRunner:
                 raise SystemExit
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
+        env = os.environ.copy()
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

