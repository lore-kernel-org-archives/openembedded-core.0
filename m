Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D23AA60745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:19:09 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so51492004wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QKewvXEjUMA6AsH8tnaEoOHKV/LhBxEp991kp0JyS8g=;
	b=Vav201jJqstwy9vboKQCHCNjDQr+7o+kHD3uTWsrbk5dWwsnInGumxGlrq0IP5UrGR
	3Wja3/cTVyHRIM9yLNcinTCVK+0Pj1Crk5YWZATKVupEBjJDm+Kb08vdh4ih4c1ur9er
	fskUnBp3qGg7UQkVkOKion0YNpqzKEMuBu8C1N66lTBG9FPFNZ7cCU+YMqD9ydCznMpI
	bY+KWTZ+GzcFiA5nQVdmb0RhQdQDdA3EuAT5nXmBDbmmyYEoQq1EuVUrT0lxvlVeRJyw
	nI8DovulaD19hmZlb/ywjBtbpFS467+P1aTbRSmuOzdBrAju2GLo3fmJ1A7XdTB5+Hzt
	b6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QKewvXEjUMA6AsH8tnaEoOHKV/LhBxEp991kp0JyS8g=;
	b=HCTDH5mTtUYxBbRlGap9Td0hw8Amw8zxXkopDkhF3DXP/3lfMZIFsmXVB+29+RSdp3
	+cufESt3TqvCvSh69P/KpvNFmie/bs2V5BwoZT/XUmHxnCTniei+RaxeeuISiLHjmL9O
	ozOVdfEsTRVD3OAZqb14z2w89c+YnMxc4rw7vCpvSwrNz/zUXTOB3JOMXOfznDC4LB0f
	ZGhSZpu/gA9YqdgBGT00xXuUSTJBxcz8RCIYU6i55BjowFVZg3nKuWpESipA3PXZwPlp
	R9a4N8t32hbCBx8ci49++RJeHKW0m/Sf6Aaq0zR70ZpylNjJq1xc7yrWnD/2+mc9CAUQ
	v4mg==
X-Gm-Message-State: ALoCoQkgKxm1gAcsIqcIkACZ8IDVu9S7m6AR1QeGP6Ddis+uZm8wq06SQ+fwZMlLwvZtME49tM64
X-Received: by 10.28.129.131 with SMTP id c125mr15208498wmd.21.1448281150017; 
	Mon, 23 Nov 2015 04:19:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k125sm6258257wmf.2.2015.11.23.04.19.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 04:19:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 12:10:26 +0000
Message-Id: <1448280627-22439-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
References: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] oeqa/qemurunner: pass nographic to runqemu if DISPLAY isn't set
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
X-List-Received-Date: Mon, 23 Nov 2015 12:19:11 -0000

Not everyone wants to run the tests with a qemu that has a graphical output, so
allow display to be None and pass nographic to runqemu in that case.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index e1c8ea1..def8ace 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -94,9 +94,9 @@ class QemuRunner:
     def start(self, qemuparams = None):
         if self.display:
             os.environ["DISPLAY"] = self.display
-        else:
-            logger.error("To start qemu I need a X desktop, please set DISPLAY correctly (e.g. DISPLAY=:1)")
-            return False
+            # Set this flag so that Qemu doesn't do any grabs as SDL grabs
+            # interact badly with screensavers.
+            os.environ["QEMU_DONT_GRAB"] = "1"
         if not os.path.exists(self.rootfs):
             logger.error("Invalid rootfs %s" % self.rootfs)
             return False
@@ -118,10 +118,10 @@ class QemuRunner:
             logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
-        # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
-        # badly with screensavers.
-        os.environ["QEMU_DONT_GRAB"] = "1"
+
         self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8 printk.time=1" qemuparams="-serial tcp:127.0.0.1:{}"'.format(threadport)
+        if not self.display:
+            self.qemuparams = 'nographic ' + self.qemuparams
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-- 
2.1.4


