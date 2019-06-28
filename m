Return-Path: <anibal.limon@linaro.org>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A22D7EA5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:37:56 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bi6so2411013plb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 20:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wAkmMDly0bZ8LiPueFeslg8jzXm3MB4NJxjNlm+XwoE=;
	b=g2zncgl6CY1mEA32gTBYoBs1siJyLD4JRrhQ+B1iIgSCdBobEAU08q4qx+ZF5eAeO4
	ya4+Y6ab2TtsSX6NzP2qkT02RuMuiM27PggNaZN1LZrRFRaUoAT3U22Hl/yCSiYOcUX/
	FibZf7mPA7qdGy50xFrDyIzIlP8/xP492aEYMzIFjebu4y9yMYz9M2ZLg+UgfceHh3KG
	UJzwwdKCyibQc3IPMy1qH2zjzI6fvpbZPNYOshYn164/LMbC82CayPk1aP5TGn6N8NfW
	Q8Myr20hzVr4ehPLBnKZJC4B4d4EtryCVthVFCK5jyCSuWAaQe/elcMexyjewZDtXP3I
	bFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wAkmMDly0bZ8LiPueFeslg8jzXm3MB4NJxjNlm+XwoE=;
	b=TtdGWZhpT1QcemXEu7oofNlC9RE7F29nUZGc8bvS3McHDGWyIrN7Jw0q2kF3Gz0dOB
	s51Edd2GwoC6ZRgFipxJnxetS8e6CnmjgNU8Wh6FLwzJXfTnTWdByEjk/bC4RF+vxL/E
	kNthsuNcN0Pdq9PnboK6iw2Sq8WMJm3pv1zgSxJ6E59rf3b/p2H1UVpaNl6BuRc7aLNM
	Oob4XuhKV3s3mp73y8FVX7gqqGU3gZNwFE8oJXm4i1fLvrD4lz5Sq9FSTSDLjDE6vyB6
	6SNmSKhcPP/vBOOBABAY3Fj/Z3Ta/CMU+H9Z9PUD7pj9KvsriOtovPlP1Zc0R/3/92cv
	RD0g==
X-Gm-Message-State: APjAAAWPsvqTbFqlglDMBIA2x1KEjlLtwN1qN2t3gNEW4S3Hid3dLZe4
	tjsuEu9fl7MnyACcgg8Ijp9WIn0aP0JCVlno
X-Google-Smtp-Source: APXvYqxSOC3E+L4Pf2dnWBa7RlSbDaFzc5NDv5TtbFyHrBaMqtm727iVgjV7d7H17PYdAUy3flJsVQ==
X-Received: by 2002:a17:902:bf08:: with SMTP id
	bi8mr9052756plb.189.1561693077572; 
	Thu, 27 Jun 2019 20:37:57 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	e184sm566027pfa.169.2019.06.27.20.37.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 20:37:57 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 22:38:29 -0500
Message-Id: <20190628033830.27713-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628033830.27713-1-anibal.limon@linaro.org>
References: <20190628033830.27713-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] runqemu: Add support for multiple tap devices
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
X-List-Received-Date: Fri, 28 Jun 2019 03:37:56 -0000
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
index 8a54c9ef9a..e1a78c8910 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1004,64 +1004,81 @@ class BaseConfig(object):
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
@@ -1287,9 +1304,10 @@ class BaseConfig(object):
 
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


