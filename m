Return-Path: <anibal.limon@linaro.org>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id ACC747E731
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 17:01:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q4so1543168pgj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rJG896kltnjF75TKlYg4EvFodN7bcBWcrR6g1+xtyMA=;
	b=QOTXdFcgB1o9BMYc2Il28gjZnc+lhzX0eMMByB4EstxVTvRU1ZM+RMcmlgVSJz0WDu
	zhQL2t6xL3ewYnssUppyGaJvs+ERDX0hrLyzwt4yC+ETXFWmnW2nlhxgXOFwI3d5LC8X
	lMLDCYYDcDOegTyjNfOBAxcCFVlsYidU+fJly7eVS4c0l+4yo4qvwtULdqFYmr6O+2N1
	ME97rBKFl8DDaSqeHqzMRZuCij7GQJJLBbi1sSvoT6QOhz9UEuk3v/EWW4qRmcQLiW3W
	AD1SM/q8BnJCb3pRH+gq/Nk9swmLDbgpZfN+vmXPNs+yHUKMiBF5TLjnSplL/Bxi1e7O
	8Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rJG896kltnjF75TKlYg4EvFodN7bcBWcrR6g1+xtyMA=;
	b=jBT9X57BiNnWzdGjDmGONE0cu09JbSK+CkDHRf4lCFqqqhxmlWJl7LYY3Fh9c2G+1z
	BGOvGtA7iBhIR/LD6YR9p3y59nx0r0HYAqD+47Q7SYrY851uovIx3z3HtKZzOROMgTws
	pmchrr+pjq4msWef43BZoqTxr71WC1gXclJPh4IrfLUHkwBV1OdR0qzHiSRHXhRDnK59
	+Z3xXEyB5gSWvE/xeTRyaKSW5J+2anFHhuk65olSZptBbQrL/54C3M9EEuRKTajz8kLZ
	XbqI+klWah2xEYudLoejhR8JDXdn6/U8CY9tGZOiaTnjhGTL9Dd9tEO2qdfCXY7V1i3P
	Nkkw==
X-Gm-Message-State: APjAAAWEf2ppplTPxlWEOVzRVwXmJyhy8IAiSSebXLD3dhHUxpVtxR2G
	K69sCu6Pt1ORh3b3w8cojMmRCJNLhk7oRQ==
X-Google-Smtp-Source: APXvYqyU4vQlNl+Bbila/ro5SHeAIkZEz8r26TXI6RE9fqg56hczPczx6tajGLhBZaBTjWk5Li2/qw==
X-Received: by 2002:a17:90a:1aa4:: with SMTP id
	p33mr14085932pjp.27.1562173300625; 
	Wed, 03 Jul 2019 10:01:40 -0700 (PDT)
Received: from blackbox.Home ([200.68.141.206])
	by smtp.gmail.com with ESMTPSA id
	o16sm8417666pgi.36.2019.07.03.10.01.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 10:01:40 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2019 12:02:22 -0500
Message-Id: <20190703170223.6228-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703170223.6228-1-anibal.limon@linaro.org>
References: <20190703170223.6228-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCHv4 2/3] runqemu: Add support for multiple tap devices
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
X-List-Received-Date: Wed, 03 Jul 2019 17:01:39 -0000
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
 scripts/runqemu | 141 ++++++++++++++++++++++++++++--------------------
 1 file changed, 83 insertions(+), 58 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 38dd1c30d9..0134f86b4c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1006,64 +1006,88 @@ class BaseConfig(object):
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
+            # XXX: Linux qemuarm and qemuppc dosen't configure the interface 
+            # if device is specified in ip (ethN), so if only one tap device is
+            # requested don't specify ethN.
+            if tap_no == 1:
+                netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
+                logger.info("Network configuration: %s", netconf)
+                self.kernel_cmdline_script += " ip=%s" % netconf
+            elif tap_idx == 0:
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
@@ -1289,9 +1313,10 @@ class BaseConfig(object):
 
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


