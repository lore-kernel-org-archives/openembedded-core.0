Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id C9C8F719FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 10:56:23 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id r16so182457701ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hC56YFl14rZwN4uSsiY7BLbBTf+Ty8guR/xvfA3ARmo=;
	b=zeJYiYjqNFmUecYp/QzuJAQEUnee/QcdLDmqM3o0cEwDPAqXAQxGQJG6pzqE/vRD3P
	m5vjJZjYYBOMj/+/T5IQpTXdoZ21kxiSkAxfWtPK8y5TGDOtvsjL/nDkbpXjOddRNkOi
	JAhnT2MeUCG4AOJmRN5Vck8OlkwPLNpLRyIBBP1I1Z33KRfSaOJhYORrvVTNRzzq3zQ9
	w7enUpY3RGkXuxD8vLwqNmPO/DE6EM9zO7RR0YL7KUwz25Z21M+UFQjziB1yLoOvb9R6
	wPucggnP9GYUN8+dcVz8u39R9GpkCwcN24nMdNhKoXb6gtAnrf1A7bAQ6v3hCZfSS9Cm
	owYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hC56YFl14rZwN4uSsiY7BLbBTf+Ty8guR/xvfA3ARmo=;
	b=GNBSW/CSSKTmXVrx03wp4RwUKwFFjMWsigQ8RGuGEIiSBG8vaIRCeb5N+PKa5hgRWR
	6vTuTnKmedV3+QnhxqN0BphGUYQui+2GFSJtkwyWpbov+6EgfdCxh8xgWDggNNBkATFR
	2WJ/MEkKCijE0d1Qa4kx0bF8QhcK5LtClxKatuSjxloDw9T324GYf4VJPmY1Z7mFuX1s
	4RbytftdUc4v06+crbUUTCEtH4FESO8lBCa+jXgWVUst1NYM3DT7RzjMBZDrZFsyDyFO
	gTwtboVERKdSFrx7MNa9dLciHKMsvJrAQD3YfEAODpnmvMgjpo11KZ9Zt5il8MveFS9r
	b1Hg==
X-Gm-Message-State: AN3rC/6fcokQbcH1L9ZHx8RadTeL0rEOOgU5FFjFjBgMrYri/RBjVHfM
	Qk55Zkw/iddPAJSn
X-Received: by 10.107.160.77 with SMTP id j74mr30916289ioe.58.1493808985287;
	Wed, 03 May 2017 03:56:25 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8CE40.dip0.t-ipconnect.de.
	[93.232.206.64])
	by smtp.gmail.com with ESMTPSA id u191sm34480ita.15.2017.05.03.03.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 May 2017 03:56:24 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 12:56:19 +0200
Message-Id: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Wed, 03 May 2017 10:56:33 -0000

That a utility function permanently changes the process environment is
bad style and leads to subtle, hard to debug problems.

For example, we had one oe-selftest which used runqemu() with an
override for DEPLOY_DIR_IMAGE. Another test then just called runCmd()
and ended up passing the wrong DEPLOY_DIR_IMAGE set earlier in
os.environ.

The approach used here is to extend the launch command such that 'env'
sets the environment variables. The specific values here should be
safe to use this way, even without extra quoting. This approach is
simple and has the advantage that the existing log.info('launchcmd=')
output includes the environment variables.

A more complex approach would be to pass a modified environment hash
to the subprocess module.

[YOCTO #11443]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ba44b96..c543797 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -98,11 +98,12 @@ class QemuRunner:
                 raise SystemExit
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
+        env = []
         if self.display:
-            os.environ["DISPLAY"] = self.display
+            env.append("DISPLAY=" + self.display)
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
             # interact badly with screensavers.
-            os.environ["QEMU_DONT_GRAB"] = "1"
+            env.append("QEMU_DONT_GRAB=1")
         if not os.path.exists(self.rootfs):
             logger.error("Invalid rootfs %s" % self.rootfs)
             return False
@@ -110,12 +111,12 @@ class QemuRunner:
             logger.error("Invalid TMPDIR path %s" % self.tmpdir)
             return False
         else:
-            os.environ["OE_TMPDIR"] = self.tmpdir
+            env.append("OE_TMPDIR=" + self.tmpdir)
         if not os.path.exists(self.deploy_dir_image):
             logger.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
             return False
         else:
-            os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
+            env.append("DEPLOY_DIR_IMAGE=" + self.deploy_dir_image)
 
         if not launch_cmd:
             launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
@@ -128,6 +129,9 @@ class QemuRunner:
                 launch_cmd += ' nographic'
             launch_cmd += ' %s %s' % (self.machine, self.rootfs)
 
+        if env:
+            launch_cmd = 'env %s %s' % (' '.join(env), launch_cmd)
+
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams)
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None):

base-commit: ba2884f6ad3a4e746fc80cbd707f83fa8abd4210
-- 
git-series 0.9.1

