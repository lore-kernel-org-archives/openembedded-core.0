Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 14BC07E7BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:18:09 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w7so11183819oic.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Vf0gJMusTk2tbUWK0PELNxrpSzbGk4Opp3hV66pwCTc=;
	b=s5xML8UbATV9zux0N9jPKVsn1wRMzFP7HBsXIWOrN/+d0aIWy4Ij7U5OPftmkz0R4R
	1RCryTw2Kzt/e6pDYLXNrzODOluj6sr2RjYHWVlq8SMFBHJNe8KIA4YQT0KtUMDMXOTp
	xGc8EgkvnnT3ecKx7W6FLgYvUyI1V3N4eFAtN8aDqqrXPnbXTbduBDFBBbKFijUGW+vY
	0f06YMDTM70azu6qyO4LN+TMaWnhiTktsXW/DZDdvuWlmccV1WHHiXhgMmgoqr7TKKPq
	68vMsWAGj2WuQX5eWLcoXJQQsut4MqtHQuhT3YgKpfudsoegfXMe9B1diyf/b5+b7u0m
	2NQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vf0gJMusTk2tbUWK0PELNxrpSzbGk4Opp3hV66pwCTc=;
	b=aNCiRSsTpFd4hnsvZJrFOlePQCymtJm3oe9FAXYndnIf2EjrbZahlhA3JbZmFV4Gjv
	0Po8jasWIkquPqXazty8wx7M9ueXzs9xEyYwJea5PmF9R9TlwbpeRFRKnQGARwLfxJXV
	PGjhmHMb2F4DCJXRbTr47VE97/rJ3V0DuProG+lODKtIDYcVyfHRvx3GfLkygggAoHcq
	DgSW4vXYekOnceiTQbb7cScGgT3sLD4+LC84PZnrzhK4TtJGRnQ4aaENUqRySONzind8
	u0okw2JNYWySWL7BzQ9Zh3KpybJMldN9uIc7NCKwcSM1RhLzc52Tcm5lr3AoUy4Px33q
	elUQ==
X-Gm-Message-State: APjAAAXpbs//PmNf6U/U242gG3Br7O1TKSFg8qAzZZjcxibbqAOSY+Kl
	iOA5DLP2qEW/Au6atVzS1tf6ZaQ0HPM=
X-Google-Smtp-Source: APXvYqyRM3KiGARTYbK3n9dyUgVBR9DlblGMOJ78NBPbfis9oeK9FoqkBKW682K4W33/UCyMa0ecxw==
X-Received: by 2002:aca:ed04:: with SMTP id l4mr931168oih.26.1562015889527;
	Mon, 01 Jul 2019 14:18:09 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	l15sm4460040otr.38.2019.07.01.14.18.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 14:18:09 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 16:18:48 -0500
Message-Id: <20190701211849.31989-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701211849.31989-1-anibal.limon@linaro.org>
References: <20190701211849.31989-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCHv2 2/3] runqemu: Add support for multiple tap devices
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
X-List-Received-Date: Mon, 01 Jul 2019 21:18:09 -0000
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
 scripts/runqemu | 146 +++++++++++++++++++++++++++---------------------
 1 file changed, 83 insertions(+), 63 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8a54c9ef9a..2f318e114d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -205,19 +205,21 @@ class BaseConfig(object):
 
     def acquire_lock(self, lock, error=True):
         logger.debug("Acquiring lockfile %s..." % lock)
+        descriptor = None
         try:
-            self.lock_descriptors[lock] = open(lock, 'w')
-            fcntl.flock(self.lock_descriptors[lock], fcntl.LOCK_EX|fcntl.LOCK_NB)
+            descriptor = open(lock, 'w')
+            fcntl.flock(descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
             msg = "Acquiring lockfile %s failed: %s" % (lock, e)
             if error:
                 logger.error(msg)
             else:
                 logger.info(msg)
-            if self.lock_descriptors[lock]:
-                self.lock_descriptor[lock].close()
-                self.lock_descriptor[lock] = None
+            if descriptor:
+                descriptor.close()
+                descriptor = None
             return False
+        self.lock_descriptors[lock] = descriptor
         return True
 
     def release_lock(self, lock):
@@ -1004,64 +1006,81 @@ class BaseConfig(object):
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
@@ -1287,9 +1306,10 @@ class BaseConfig(object):
 
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


