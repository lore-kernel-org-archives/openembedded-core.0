Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 69B1B60017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 20:58:55 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q19-v6so7104282pll.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=GpFoDm6dn2S+B89MBfWjsovrEoeKuzEhe9u3X6sOmLo=;
	b=T75IGHz4BOoOs6+Lh59fdSLMnyOZ/sHOH9Nn06Q5vlTZ6Y1v3M7Bu/zfUnAi01iyeX
	esd7qP74ZBADxNxnTMl8DiVbGIwumVWP8S6lgUIVSVmyrlSOvhV3jLgb1WkSH8IhF14R
	YJzE3SUuV03FR9EntXra3x3I7J8/NhMiq8W9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GpFoDm6dn2S+B89MBfWjsovrEoeKuzEhe9u3X6sOmLo=;
	b=pyqdkiU3AsCtraDGB5VGs2H90gR6gLlE1YrH23tiAUUi6pCWV2PkNbXNKnIOqobrDP
	9LEZV/H92krStrgFu0B2SywUSHDSAFvq380ZvPLZYo+v6v1JBpGdiFxyqhQzyFictTcb
	QWJDZshLwHWNcenGg2Qp6/CxG97IViszieu80iG0LAURWPgR3d50+SJD0Om1f3qrjYXa
	6Nz5VLvbd27rRAnCh+1BCHnN0ADYMP5qHx+kvdnqTk3QOfYN7RlADwfZr0nus2sRWnMh
	wjj2Ijx2TH9ZYLyRtPE7jzxnAlm68uCcyu7/2YzKgOKA22eWiJONBDq/lOjGGqOGJacW
	JhBg==
X-Gm-Message-State: AGRZ1gJxXpQVvuclMYYYniWrLLeAb6XY00kYkLq4SkDKrvBadJHtQbLs
	KyrGh80UfzYeZAoLrPpq5O+y/v808g7UMw==
X-Google-Smtp-Source: AJdET5cGly0TfTUN43v872Vv4zsOHwv55pBkzmq173G2mNpyTivo94te9aUes0Qeqzc4xwCK8jOFpA==
X-Received: by 2002:a17:902:6f16:: with SMTP id
	w22-v6mr6146437plk.235.1541710735699; 
	Thu, 08 Nov 2018 12:58:55 -0800 (PST)
Received: from yct-lpt.pdx.yoctoproject.org (5751f4a1.skybroadband.com.
	[87.81.244.161]) by smtp.gmail.com with ESMTPSA id
	e12-v6sm4724605pff.5.2018.11.08.12.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 12:58:54 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 12:58:38 -0800
Message-Id: <20181108205840.24972-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.17.2
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH 1/3] scripts/runqemu: Add serialstdio mode
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
X-List-Received-Date: Thu, 08 Nov 2018 20:58:55 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its currently not possible to have a console available whilst using qemu in graphics
mode. This is causing some issues for testing autobuilder bringup so all a "serialstdio"
mode to runqemu to accomodate this.

The existing serialstdio internal variable is renamed to allow the new user visible option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 087220ca0a..0c61253d6a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -75,6 +75,7 @@ of the following environment variables (in any order):
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
     serial - enable a serial console on /dev/ttyS0
+    serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
     kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
@@ -211,6 +212,7 @@ class BaseConfig(object):
         self.slirp_enabled = False
         self.nfs_instance = 0
         self.nfs_running = False
+        self.serialconsole = False
         self.serialstdio = False
         self.cleantap = False
         self.saved_stty = ''
@@ -428,6 +430,9 @@ class BaseConfig(object):
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'serial':
+                self.kernel_cmdline_script += ' console=ttyS0'
+                self.serialconsole = True
+            elif arg == "serialstdio":
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialstdio = True
             elif arg == 'audio':
@@ -1169,7 +1174,7 @@ class BaseConfig(object):
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
-        if self.serialstdio:
+        if self.serialconsole:
             if sys.stdin.isatty():
                 subprocess.check_call("stty intr ^]", shell=True)
                 logger.info("Interrupt character is '^]'")
@@ -1196,7 +1201,7 @@ class BaseConfig(object):
         #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
         serial_num = len(re.findall("-serial", self.qemu_opt))
         if serial_num == 0:
-            if re.search("-nographic", self.qemu_opt):
+            if re.search("-nographic", self.qemu_opt) or self.serialstdio:
                 self.qemu_opt += " -serial mon:stdio -serial null"
             else:
                 self.qemu_opt += " -serial mon:vc -serial null"
-- 
2.17.2


