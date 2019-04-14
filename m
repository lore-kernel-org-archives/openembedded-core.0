Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id A6EFF7D6C5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 13:28:45 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id d1so12223161edd.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bJaQsVhNdQXLhywdzkO8azOzaCjjJ94GhVCCixyDkKA=;
	b=AgF6eZg9nEcCVYcK6BIqwd8pxgcngiB1qA4Zusrtmc/aICvqvdi+LS8w1M/IdNZy+4
	jGxtBSAvDCHRZshtN+isZlNzRNeMjuPWfh7cygJRWBdCVciApqifhuaJQP0SOicqTnrs
	ZIWmK90sX1nmv1lx/v8ec+dMmgMzd8y7p58deOa9MCEyY7MCyPSWTu2OsQfi+n5RKIJo
	Sqnd+S8rOng92HRYk/nDzBMFrovDLKqr43ZB7mF27m2cSKfO/1a+e8RwsfL4Oay6gzMF
	pO+aAuQBHHmETlG7Y+gzfr9kh2j9A5iZ+YBhMbGxxXRqw97Ild4a/CWUXvOuFUkDvHB2
	km2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bJaQsVhNdQXLhywdzkO8azOzaCjjJ94GhVCCixyDkKA=;
	b=CJC8oiNx9VbmC3A07VJYiB9+Ksr2J1xjiIT8zRFCVCzMm75FP4YWzbZdMZVBDhRxYt
	YOhYk8AYm+rFkFLCv3OnJY1OW1yERuEnUzXRjcOIat/kCcciFDDeLAnK9FEwwIk0Niuh
	qyxlH5x1P9STXLygUE+FahGdkqj/bQwldyxHZaAtmdiK9TDt3I5BKdUdbdTYqpB05zTQ
	8fY2j+rggoTuT4LWN9xqvJfJkXaNsKDczmeaTTfWj29c/TMWYQDM6KhTb0nHhszFcu4N
	BxPkV5fR/hIDahObeIREIbMpasSZaH4RWC1kXFHkzoe88cFhThe7t9qQJLCHUEW1Nci+
	Cubg==
X-Gm-Message-State: APjAAAU869emTcHaa7Vc7L/u6vQuFuPJDtecuZCMquZ5jHSOkYXZhqoP
	MQbP5pUDlas+yZGwYEVNyWLuL+AFDkM=
X-Google-Smtp-Source: APXvYqwTjNEkilUblyYvpwm65LtjsXBM5MV0SAeoBfFoYNWovRge8ybflHVIXTYdgAPBBqJ9SzVxNw==
X-Received: by 2002:a17:906:1dc9:: with SMTP id
	v9mr35490075ejh.262.1555248525901; 
	Sun, 14 Apr 2019 06:28:45 -0700 (PDT)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	h15sm6333696ejc.78.2019.04.14.06.28.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 14 Apr 2019 06:28:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2019 15:24:14 +0200
Message-Id: <20190414132414.18547-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190414132414.18547-1-adrian.freihofer@gmail.com>
References: <20190414132414.18547-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] runqemu: support non-bootable wic images
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
X-List-Received-Date: Sun, 14 Apr 2019 13:28:46 -0000
Content-Transfer-Encoding: 8bit

wic images are treated as vmtype images including a bootloader. The new
image type wic-nb (non-bootable) is handled as fstype image.
In comparison to existing fstype images such as ext4 wic-nb images
support more than one partition.
This is particularly useful in combination with -machine virt where the
bootloader as well as the devicetree is provided by Qemu.

Example:
QB_DEFAULT_FSTYPE = "wic-nb"
QB_KERNEL_ROOT = "/dev/vda1"
QB_SYSTEM_NAME = "qemu-system-aarch64"
QB_MACHINE = "-machine virt"
QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
QB_SERIAL_OPT = ""
...

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/runqemu | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a4fc606e50..2cf68c834c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -196,7 +196,8 @@ class BaseConfig(object):
         self.bitbake_e = ''
         self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
-                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
+                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz',
+                        'wic-nb')
         self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'wic.vmdk',
                         'wic.qcow2', 'wic.vdi', 'iso')
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
@@ -560,14 +561,19 @@ class BaseConfig(object):
         if self.fstype == 'nfs':
             return
 
+        # Handle wic non-bootable images
+        rootfs_suffix = self.fstype
+        if rootfs_suffix == 'wic-nb':
+            rootfs_suffix = 'wic'
+
         if self.rootfs and not os.path.exists(self.rootfs):
             # Lazy rootfs
             self.rootfs = "%s/%s-%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
                     self.rootfs, self.get('MACHINE'),
-                    self.fstype)
+                    rootfs_suffix)
         elif not self.rootfs:
-            cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
-            cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
+            cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), rootfs_suffix)
+            cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), rootfs_suffix)
             cmds = (cmd_name, cmd_link)
             self.rootfs = get_first_file(cmds)
             if not self.rootfs:
-- 
2.20.1


