Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id B16497F945
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 20:59:52 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id v18so32493642iol.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 12:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l4G3r1SvScHnOrs6UhjjPtZ6aiyejlC7RwnRfdR5FtI=;
	b=YvmVDYq9wdzub2ejGGF/+gvecPpC4nLrQwSS6XdfQC6tQsAXHF6M7duMA8QV0fdzqW
	VH7eYiRXmao4Twg0pGFkR/ixOPsYGAfMhu8itJsdzYAFy3zce7Dz+rnJ85590jlwoySo
	3edc/rMmzaHt/a63C+aEsHaIecR1ZQRJV39VocLvFXIrHj8OqyBuF+mK22/eMWZzKQ8S
	7IzLDlDyfcEE5c1AqjBY5ZOinDsrsUOGEWyGLsu9PEgiHLGjxW6Y6cfo4Gw7UIInlcTQ
	jYdEHn2HbVyzhecM1VZ9yYpqeE7U++qLHY3E7NhR320+2fAvC/JaSKNgnqvYfE+fnFcH
	TQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l4G3r1SvScHnOrs6UhjjPtZ6aiyejlC7RwnRfdR5FtI=;
	b=jOW2PTUsEhcmuAViEJemIbRciA+IJOwcGdCrmpu0HvOIPHpNZYJa7S0dQVOazcRTsY
	BQ9pIEoJgnchXhTDZjvXlhdTQl1wM6hmvoPaU1mpurxzrkQaLUA1sRwQ6zzikwnjGMO3
	rk6tNqPP/+8I6bokAeRNl98qp/hxuCq5qfPfSisMa2PJCJip744KEELz35p/x4oxVxi8
	kUkh0ouc5iMlaHG2blknFyF5LXkyWQd3HC5JQsDrO441oaPYNAl78SYCJGiNVJRCOwHI
	TuLw9YeDuKOt26h4WIea3lpy/A8snCoBDYAbLIICrNUnsKA06d3p5P6QRXUVKZKCoJXg
	fLhg==
X-Gm-Message-State: APjAAAWFOsNAhBoSWGXoDCF9N2k4jKPBvDsfC4kzue6OKxQwCA9OpeC7
	CFeHk1m/ihLpfhkZkWzhkDjjqabX
X-Google-Smtp-Source: APXvYqxtVDHTPl9NGhPUfzHptmo3u4nkrs9Deivw3bzlakhaoXY4AtdwFSEs1zSms6GCTtqeZNvIew==
X-Received: by 2002:a02:778d:: with SMTP id
	g135mr55654989jac.115.1577739593601; 
	Mon, 30 Dec 2019 12:59:53 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	l16sm11887014ioj.70.2019.12.30.12.59.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 12:59:53 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 14:59:50 -0600
Message-Id: <20191230205950.1878233-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] runqemu: Add multiconfig support
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
X-List-Received-Date: Mon, 30 Dec 2019 20:59:52 -0000
Content-Transfer-Encoding: 8bit

Users may want to run qemu against a specific multiconfig instead of the
base configuration, so give them the ability to specify which config
should be used with the MULTICONFIG environment variable.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/runqemu | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ef454d67ff..b6fca041ae 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -135,6 +135,7 @@ class BaseConfig(object):
                         'DEPLOY_DIR_IMAGE',
                         'OE_TMPDIR',
                         'OECORE_NATIVE_SYSROOT',
+                        'MULTICONFIG',
                         )
 
         self.qemu_opt = ''
@@ -401,9 +402,7 @@ class BaseConfig(object):
             self.set("MACHINE", arg)
             return
 
-        cmd = 'MACHINE=%s bitbake -e' % arg
-        logger.info('Running %s...' % cmd)
-        self.bitbake_e = subprocess.check_output(cmd, shell=True).decode('utf-8')
+        self.bitbake_e = self.run_bitbake_env(arg)
         # bitbake -e doesn't report invalid MACHINE as an error, so
         # let's check DEPLOY_DIR_IMAGE to make sure that it is a valid
         # MACHINE.
@@ -1410,10 +1409,7 @@ class BaseConfig(object):
 
         self.cleaned = True
 
-    def load_bitbake_env(self, mach=None):
-        if self.bitbake_e:
-            return
-
+    def run_bitbake_env(self, mach=None):
         bitbake = shutil.which('bitbake')
         if not bitbake:
             return
@@ -1421,14 +1417,24 @@ class BaseConfig(object):
         if not mach:
             mach = self.get('MACHINE')
 
+        multiconfig = self.get('MULTICONFIG')
+        if multiconfig:
+            multiconfig = "mc:%s" % multiconfig
+
         if mach:
-            cmd = 'MACHINE=%s bitbake -e' % mach
+            cmd = 'MACHINE=%s bitbake -e %s' % (mach, multiconfig)
         else:
-            cmd = 'bitbake -e'
+            cmd = 'bitbake -e %s' % multiconfig
 
         logger.info('Running %s...' % cmd)
+        return subprocess.check_output(cmd, shell=True).decode('utf-8')
+
+    def load_bitbake_env(self, mach=None):
+        if self.bitbake_e:
+            return
+
         try:
-            self.bitbake_e = subprocess.check_output(cmd, shell=True).decode('utf-8')
+            self.bitbake_e = self.run_bitbake_env(mach=mach)
         except subprocess.CalledProcessError as err:
             self.bitbake_e = ''
             logger.warning("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
@@ -1443,7 +1449,13 @@ class BaseConfig(object):
         if result and os.path.exists(result):
             return result
 
-        cmd = ('bitbake', 'qemu-helper-native', '-e')
+        cmd = ['bitbake', '-e']
+        multiconfig = self.get('MULTICONFIG')
+        if multiconfig:
+            cmd.append('mc:%s:qemu-helper-native' % multiconfig)
+        else:
+            cmd.append('qemu-helper-native')
+
         logger.info('Running %s...' % str(cmd))
         out = subprocess.check_output(cmd).decode('utf-8')
 
-- 
2.23.0


