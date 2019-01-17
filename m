Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2037C16C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:48 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c16so8293001lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0ZBMVtt/sUnMLDkQBOkirOk9nhyxBuHeva6+wuZhjvo=;
	b=m1CoZ8k42B/MKKgN34xolLN+vfcCFYp4f7jYaOM3hYhUp2/cINRrRC/YieiBwraiyz
	Fkgy6oOrJO6OeTF7K+RaCsUySo9c1mFpJqY7SPfeDMYy7mMfFzw289wJgoK5DnylvCH2
	gmms1fhNHb+PEl8okJEtsfZYR2AniqFkdcS16Ll9ow/xZAtvjC6M7hax/GNDPRvGNvxq
	ACf6FUZBx/P4mmpLGUMCs44/M5QvCNHuL2yw2OFAX10UuoXWdLBfUsyy/ZJ+ZP1IO8NK
	XnlykeoAkYSYPSDdF0tv+lmbDzT1r2bxoccbQmFlw9COswAON55ZcdGMoCXBsPyQskrn
	4zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0ZBMVtt/sUnMLDkQBOkirOk9nhyxBuHeva6+wuZhjvo=;
	b=lUTcniGqwGzzwf32/hzcZhcFMW7VXpiAh6V3fTYz+2j9twu/+eBXfRUlBefdk2Z2Al
	vmpCvPbuL9KcNYLhL6XJa4PpJjwfmllTAa8MgVX9ikHkqOfeWyvJ32jr5uDxXRmiQe9Z
	/EOglGBxRWjclhriRBEHEOrJM/x9CKfO66yCQG/CRCWpr+MqLb/cCVb64vq3NW8lL1VK
	u0kDAFiVoaCBWxMVDjxnbP8GNFYLQXSGlwCY+kpxBwO4CEx1H3ppkUGmpUiiam7UQjXX
	n5tItaq2QwTViCVgf4IdI+jYZEOKziNGgB3OWQfOJbzL90DEDlIvjImfr9ITgvys1Jhc
	zgMA==
X-Gm-Message-State: AJcUukeqW/K7RoycN/BOC3T62wptc9t9SGNpoQsleAHw8jY2dDX1Slra
	VWDiD0q5yHqovhKSeMhfZ7L3HJ1k
X-Google-Smtp-Source: ALg8bN5Tp/MyIh42tF07H4nXI50aHEBEIF44Pm2TCekguOnQvWEhEEs003gLTXUSu74odWYHEiuUJg==
X-Received: by 2002:a19:6806:: with SMTP id d6mr10429541lfc.48.1547743248245; 
	Thu, 17 Jan 2019 08:40:48 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:06 +0100
Message-Id: <7a5117cde28fa1383dbf5c847db559790ae5d3ae.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 21/27] runqemu: add support for virgl GL acceleration
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:49 -0000

Also, do not hardcode -vga option to qemu, set it according to command line parameters.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc |  2 +-
 scripts/runqemu                            | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 5fdbe4df50e..574b7bbfc7d 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -11,7 +11,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..12372bb7d84 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,9 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    gl - enable virgl-based GL acceleration
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES
+    egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -427,12 +430,30 @@ class BaseConfig(object):
                 sys.argv.remove(quiet)
 
         unknown_arg = ""
+        displayopts = ' -vga vmware'
         for arg in sys.argv[1:]:
             if arg in self.fstypes + self.vmtypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'gl':
+                displayopts = ' -vga virtio -display gtk,gl=on'
+            elif arg == 'gl-es':
+                displayopts = ' -vga virtio -display gtk,gl=es'
+            elif arg == 'egl-headless':
+                displayopts = ' -vga virtio -display egl-headless'
+                try:
+                    # As runqemu can be run within bitbake (when using testimage, for example),
+                    # we need to ensure that we run host pkg-config, and that it does not
+                    # get mis-directed to native build paths set by bitbake.
+                    del os.environ['PKG_CONFIG_PATH']
+                    del os.environ['PKG_CONFIG_DIR']
+                    del os.environ['PKG_CONFIG_LIBDIR']
+                    dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
+                except subprocess.CalledProcessError as e:
+                    raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+                os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
@@ -461,6 +482,9 @@ class BaseConfig(object):
                 self.qemu_opt_script += ' -bios %s' % arg[len('biosfilename='):]
             elif arg.startswith('qemuparams='):
                 self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
+                # if -vga is passed via qemuparams, default value should no longer apply
+                if '-vga' in self.qemu_opt_script:
+                    displayopts = ""
             elif arg.startswith('bootparams='):
                 self.bootparams = arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
@@ -478,6 +502,7 @@ class BaseConfig(object):
                     raise RunQemuError("Can't handle two unknown args: %s %s\n"
                                        "Try 'runqemu help' on how to use it" % \
                                         (unknown_arg, arg))
+        self.qemu_opt_script += displayopts
         # Check to make sure it is a valid machine
         if unknown_arg and self.get('MACHINE') != unknown_arg:
             if self.get('DEPLOY_DIR_IMAGE'):
-- 
2.17.1


