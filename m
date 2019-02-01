Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6567C4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a16so1418452wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=EEKG20d5wH4ii+mIVHv7rQspq7ZgYphG8mHZYBjxAfQmbYnizpXtpnSJg2bpLG/BME
	vkdBAULUAYc5HsCTSC5vlhKg8NN61d0eg3Dvi45lteEAzbitBDM5wpMq/jKoAXrA4f2I
	QKEUPVcyxAvVp6052VGQ3Xmuie25E8+YA6odF8PcxxoE4wbQUx9/BomHol4mx7IGphxv
	497quCts8aFlnEYZNc4p4WiXpOgQBMa9k0oQ78y5FDHC8wk+2U8/etwrAArvQumQjTHQ
	GE3PgK51XSSWADgXOEyStNtRCzUeKvWtW3iMkqcEeqxOE4bDKvMBRM6IViC6diZFi3A5
	f0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=Svxw/Vx4WDcDTwePTe/eVE6fGD6nC82EWuJMuRIb2jKtuo86aknKBOKOgPzu4Vzkq7
	3G+GqVSRGCnHn9T+/KOG7f6XA6oT6MuQe+YqAgdXcnlYZgePofg0FEWblSOd/n4kvZQm
	dP0NbbUVp3VCGiAsnwdVrll0pxVt8+JgWSUZDT69nPs1YsKw0ViRFOkqHHIQZLbzOIMN
	YGYbaXL2RT6SJ72n079y8BbohonjJXyNqJG29LDJBFYtu91nKLrkz6wabpb7DSLT5+lv
	4swILMfXYiVTwlfwXcZ34yxBhRwobhhmcTNsgzCenEYzu13TNEWjIZ7wGiEU96nUIfMt
	QRpA==
X-Gm-Message-State: AJcUukeam24oRzjEJUVmuoFsFKsMO0sk0ju9j2VkuzFc1JlIuuRlVShj
	yM7Jz6N2N+cCqH20+t1uQrjcp/3D
X-Google-Smtp-Source: ALg8bN5XKuIfjrvKPELwy46aEusXTzw60uq1+ffDICJR6s4QNRHi5LsgZE+xn9lQTcVE9jKT5mewBA==
X-Received: by 2002:adf:83e7:: with SMTP id 94mr38952703wre.278.1549026375914; 
	Fri, 01 Feb 2019 05:06:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:53 +0100
Message-Id: <20190201130554.90094-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/13] runqemu: do not check for GL libraries
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:16 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 50888a532e8..586f8700c94 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -118,39 +118,6 @@ def check_tun():
     if not os.access(dev_tun, os.W_OK):
         raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
-def check_libgl(qemu_bin):
-    cmd = ('ldd', qemu_bin)
-    logger.debug('Running %s...' % str(cmd))
-    need_gl = subprocess.check_output(cmd).decode('utf-8')
-    if re.search('libGLU', need_gl):
-        # We can't run without a libGL.so
-        libgl = False
-        check_files = (('/usr/lib/libGL.so', '/usr/lib/libGLU.so'), \
-            ('/usr/lib64/libGL.so', '/usr/lib64/libGLU.so'), \
-            ('/usr/lib/*-linux-gnu/libGL.so', '/usr/lib/*-linux-gnu/libGLU.so'))
-
-        for (f1, f2) in check_files:
-            if re.search('\*', f1):
-                for g1 in glob.glob(f1):
-                    if libgl:
-                        break
-                    if os.path.exists(g1):
-                        for g2 in glob.glob(f2):
-                            if os.path.exists(g2):
-                                libgl = True
-                                break
-                if libgl:
-                    break
-            else:
-                if os.path.exists(f1) and os.path.exists(f2):
-                    libgl = True
-                    break
-        if not libgl:
-            logger.error("You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.")
-            logger.error("Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.")
-            logger.error("Fedora package names are: mesa-libGL-devel mesa-libGLU-devel.")
-            raise RunQemuError('%s requires libGLU, but not found' % qemu_bin)
-
 def get_first_file(cmds):
     """Return first file found in wildcard cmds"""
     for cmd in cmds:
@@ -1178,8 +1145,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


