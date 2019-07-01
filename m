Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71BC97E7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:23:05 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b7so14949384otl.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=23//2jW+dSpQktUrLt6wEsBNrPFr/UFeTd9Q8H4SwbI=;
	b=JdNg+KMPt0w3b1+BE4CuTat45L9NHJD0u1KrAfWQElvC+CNTXuYHqKCmW0huBbTXjr
	mYHdVYB9uNKD5P7MNvBdd72XpVUm3Cbl8JgNAaENahznj3kkFR9+3nDMh9vQo7Y0GcKl
	AckZ1L7wTX8GTVBqPnH2BotJrQ2TyLf7CrQkuFt3eA+jJKvtT6PysLFSQVnTk8j5GESG
	+9AmsJr/ZxwjEBzkB5xaxgE07sU2fA4K7fL1g5U/PSikVtm2cDzhxiJV1m4mpvIdUwAJ
	9JgrNjq8thTR1HcITthcXX/sO1GlZqNzVCXBs96zu6OxeOGU53MLJj4pDcuAjqVN+kwT
	gtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=23//2jW+dSpQktUrLt6wEsBNrPFr/UFeTd9Q8H4SwbI=;
	b=HqG6wclgMdLlmvxo4Tcp3Pi5fQuQbte/b12RbMbEtZRfnlDg+k8W1ruSfmOArc4qES
	2joLRapATva/V5xcylrGG4irUOOYWXeJ8YXwxNIkx+L/j2N48hDdeRXKiGRDo5M9Vw3u
	7ubqz+SqOPaJ01A6cRfvfp4EySMrO1zvBI47BTwGJdCMv9WMgKT+E7CBvGnGGA5Lms6m
	ydUXYkWGQX2NsPTNUD6izi1lp1cBkU7KbZSqxAE0UIeSkFhmtfS0smvzXbgN+4aExQC2
	ESKLc5xZQhwGD/9CoDFpk6Li0mh9uDt5mcB4cZcaKCvaRpEwfZbRnNWzo48cQbuBttm7
	E/+A==
X-Gm-Message-State: APjAAAUEZdlfdX2HdaziY9DnTodeq7xZ3xLhLYVs2/52TJKYhd/JwAGB
	w0CQrWNGVE8mj35ORSwE2lxa5KREVCM=
X-Google-Smtp-Source: APXvYqxVDdq7Y5OShclDUmZRzjbWUZXwgrU9dJt/OdSy8lv8wYobrvTycSiTYszwH0wZ+wc3B8Aw6w==
X-Received: by 2002:a9d:529:: with SMTP id 38mr18211951otw.145.1562016186396; 
	Mon, 01 Jul 2019 14:23:06 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	v203sm4569695oie.5.2019.07.01.14.23.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 14:23:05 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 16:23:49 -0500
Message-Id: <20190701212350.32503-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701212350.32503-1-anibal.limon@linaro.org>
References: <20190701212350.32503-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCHv3 2/3] runqemu: Add support for multiple tap devices
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
X-List-Received-Date: Mon, 01 Jul 2019 21:23:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the ability to set more than one tap devices into the
same qemu instance,

The code was modified to detect multiple @TAP@ and @MAC@ in the
QA_TAP_OPT and QA_NETWORK_DEVICE respectively, it handles the
attach/creation of multiple tap devices and stores into a list
for lock/unlock.

Configure the first interface because Kernel IP Configuration
only takes care of the first device.

This patch was tested using qemux86, kvm-vhost and NFS rootfs.

Example of the configuration:

QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no \
              -netdev tap,id=net1,ifname=@TAP@,script=no,downscript=no"
QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@ \
                     -device virtio-net-pci,netdev=net1,mac=@MAC@"

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 scripts/runqemu | 134 +++++++++++++++++++++++++++---------------------
 1 file changed, 76 insertions(+), 58 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 38dd1c30d9..2f318e114d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1006,64 +1006,81 @@ class BaseConfig(object):
             except FileExistsError:
                 pass
 
-        cmd = (ip, 'link')
-        logger.debug('Running %s...' % str(cmd))
-        ip_link = subprocess.check_output(cmd).decode('utf-8')
-        # Matches line like: 6: tap0: <foo>
-        possibles = re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
-        tap = ""
-        for p in possibles:
-            lockfile = os.path.join(lockdir, p)
-            if os.path.exists('%s.skip' % lockfile):
-                logger.info('Found %s.skip, skipping %s' % (lockfile, p))
-                continue
-            lock = lockfile + '.lock'
-            if self.acquire_lock(lock, error=False):
-                tap = p
-                logger.info("Using preconfigured tap device %s" % tap)
-                logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
-                break
-
-        if not tap:
-            if os.path.exists(nosudo_flag):
-                logger.error("Error: There are no available tap devices to use for networking,")
-                logger.error("and I see %s exists, so I am not going to try creating" % nosudo_flag)
-                raise RunQemuError("a new one with sudo.")
-
-            gid = os.getgid()
-            uid = os.getuid()
-            logger.info("Setting up tap interface under sudo")
-            cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
-            tap = subprocess.check_output(cmd).decode('utf-8').strip()
-            lockfile = os.path.join(lockdir, tap)
-            lock = lockfile + '.lock'
-            self.acquire_lock(lock)
-            self.cleantap = True
-            logger.debug('Created tap: %s' % tap)
-
-        if not tap:
-            logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
-            return 1
-        self.tap = tap
-        tapnum = int(tap[3:])
-        gateway = tapnum * 2 + 1
-        client = gateway + 1
-        if self.fstype == 'nfs':
-            self.setup_nfs()
-        netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
-        logger.info("Network configuration: %s", netconf)
-        self.kernel_cmdline_script += " ip=%s" % netconf
-        mac = "%s%02x" % (self.mac_tap, client)
-        qb_tap_opt = self.get('QB_TAP_OPT')
-        if qb_tap_opt:
-            qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap)
-        else:
-            qemu_tap_opt = "-netdev tap,id=net0,ifname=%s,script=no,downscript=no" % (self.tap)
+        self.taps = []
+        qemu_tap_opt = self.get('QB_TAP_OPT')
+        if not qemu_tap_opt:
+            qemu_tap_opt = '-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no'
 
         if self.vhost_enabled:
-            qemu_tap_opt += ',vhost=on'
+            opts = []
+            for tap_opt in qemu_tap_opt.split():
+                if 'tap' in tap_opt:
+                    tap_opt += ',vhost=on'
+                    opts.append(tap_opt)
+                else:
+                    opts.append(tap_opt)
+            qemu_tap_opt = ' '.join(opts)
+
+        tap_no = qemu_tap_opt.count('@TAP@')
+        for tap_idx in range(tap_no):
+            cmd = (ip, 'link')
+            logger.debug('Running %s...' % str(cmd))
+            ip_link = subprocess.check_output(cmd).decode('utf-8')
+            # Matches line like: 6: tap0: <foo>
+            possibles = re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
+            tap = ""
+            for p in possibles:
+                if p in self.taps:
+                    continue
+
+                lockfile = os.path.join(lockdir, p)
+                if os.path.exists('%s.skip' % lockfile):
+                    logger.info('Found %s.skip, skipping %s' % (lockfile, p))
+                    continue
+                lock = lockfile + '.lock'
+                if self.acquire_lock(lock, error=False):
+                    tap = p
+                    logger.info("Using preconfigured tap device %s" % tap)
+                    logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
+                    break
 
-        self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qemu_tap_opt))
+            if not tap:
+                if os.path.exists(nosudo_flag):
+                    logger.error("Error: There are no available tap devices to use for networking,")
+                    logger.error("and I see %s exists, so I am not going to try creating" % nosudo_flag)
+                    raise RunQemuError("a new one with sudo.")
+
+                gid = os.getgid()
+                uid = os.getuid()
+                logger.info("Setting up tap interface under sudo")
+                cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
+                tap = subprocess.check_output(cmd).decode('utf-8').strip()
+                lockfile = os.path.join(lockdir, tap)
+                lock = lockfile + '.lock'
+                self.acquire_lock(lock)
+                self.cleantap = True
+                logger.info('Created tap: %s' % tap)
+
+            if not tap:
+                logger.error("Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.")
+                return 1
+            self.taps.append(tap)
+            tapnum = int(tap[3:])
+            gateway = tapnum * 2 + 1
+            client = gateway + 1
+
+            if tap_idx == 0:
+                netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0::eth%d" % (client, gateway, tap_idx)
+                logger.info("Network configuration: %s", netconf)
+                self.kernel_cmdline_script += " ip=%s" % netconf
+
+            mac = "%s%02x" % (self.mac_tap, client)
+            qemu_tap_opt = qemu_tap_opt.replace('@TAP@', tap, 1)
+            self.network_device = self.network_device.replace('@MAC@', mac, 1)
+
+        self.set('NETWORK_CMD', '%s %s' % (self.network_device, qemu_tap_opt))
+        if self.fstype == 'nfs':
+            self.setup_nfs()
 
     def setup_network(self):
         if self.get('QB_NET') == 'none':
@@ -1289,9 +1306,10 @@ class BaseConfig(object):
 
         logger.info("Cleaning up")
         if self.cleantap:
-            cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
-            logger.debug('Running %s' % str(cmd))
-            subprocess.check_call(cmd)
+            for tap in self.taps:
+                cmd = ('sudo', self.qemuifdown, tap, self.bindir_native)
+                logger.debug('Running %s' % str(cmd))
+                subprocess.check_call(cmd)
         for lock in self.lock_descriptors.keys():
             self.release_lock(lock)
 
-- 
2.20.1


