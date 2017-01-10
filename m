Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2304371A32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:51:03 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id v186so60501598lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sLX99+4rNN6PEH/l0ZFPb65OkkiEXLvXaay9FzARmUQ=;
	b=SjslKu4cESX4vfPWnMfnaOwttq7J6SqkTIcHgOpyGH4D1lj7ORniHpNt33dEjp/XrD
	RVwKkAN6m88GBS6jSeHb9eop0Zds9s/TQHUPnih900aHCWR+xd4719pB8ehxhqYQ4QSq
	m4SmGtMR4R+g/UYpgWu0bHCJqDiN4shyZFUczUTL7yTcSYhWFovjM8LOHZJqR/ubn2+I
	YL976ZeBNlGu25vIEHkNUSOAjyBC4GU+tafnBiSvw5tiEplJpo4S1YZTCNN+GTd/MDqt
	0P2XaOW9L57XwM3tZrOQ5vuicbQnfNZwoIv/OKaHyrgXw+pnNakdkx4vLZDmZJX+vCf3
	n4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=sLX99+4rNN6PEH/l0ZFPb65OkkiEXLvXaay9FzARmUQ=;
	b=rWg7WKYKNM8k8OBHojfbIzSnUyvIRN7X+76R9PEtJOfsgvYUz3mlMpWm5ZRHPkXCPG
	8mOonKvkxfSP3nWpP8tBL7KQzcjAvh4SxbowrUGpagxayevqqt2yfcOAhhNQ4BkRxcSY
	jKjr3Ya7zhDbp0WFIg4Wef8ZM7/KJLKvx3L7L7JKoKfEMe6S+LpbIGFHjQ2kdj3uCAil
	r3JL5JAbUx1phuYUJXiBijzGXddqmo4+K9pby0UqkLtyIvyUaUqPFHKcnWN/oQiA0OYr
	hzhE/10SD+0WWtj4vFGOM0U+i5Xhq0zAgHjWdiRgeVBH83ft/s7YNVCMyXsk/WDHW9x7
	nuWg==
X-Gm-Message-State: AIkVDXJYDlvj87443jZNJYiCGzlHDhPS3kIbug32g+Rp5K2O+BkAyPjn0+L7zB3n6vqlbw==
X-Received: by 10.46.87.73 with SMTP id r9mr1183875ljd.22.1484052663109;
	Tue, 10 Jan 2017 04:51:03 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c75sm450711lfe.28.2017.01.10.04.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 04:51:01 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 13:50:15 +0100
Message-Id: <f4bae8e4e188f523bf1984375aeb20d943ad39f6.1484051596.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 5/5] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Tue, 10 Jan 2017 12:51:03 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 63 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index ce9e9701280b758d3413aae29615f34a7bc909e4..f9e9854ede8162ff12467fa23a365b25c132ba54 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,6 +29,7 @@ import unittest
 from glob import glob
 from shutil import rmtree
 from functools import wraps, lru_cache
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
@@ -62,10 +63,14 @@ class Wic(oeSelfTest):
     resultdir = "/var/tmp/wic/build/"
     alternate_resultdir = "/var/tmp/wic/build/alt/"
     image_is_ready = False
+    native_sysroot = None
     wicenv_cache = {}
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        if not Wic.native_sysroot:
+            Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
+
         arch = get_host_arch()
         is_x86 = arch in ['i586', 'i686', 'x86_64']
         if is_x86:
@@ -441,3 +446,61 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
+
+    def _make_fixed_size_wks(self, size):
+        """
+        Create a wks of an image with a single partition. Size of the partition is set
+        using --fixed-size flag. Returns a tuple: (path to wks file, wks image name)
+        """
+        with NamedTemporaryFile("w", suffix=".wks", delete=False) as tf:
+            wkspath = tf.name
+            tf.write("part " \
+                     "--source rootfs --ondisk hda --align 4 --fixed-size %d "
+                     "--fstype=ext4\n" % size)
+        wksname = os.path.splitext(os.path.basename(wkspath))[0]
+
+        return wkspath, wksname
+
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath, wksname = self._make_fixed_size_wks(200)
+
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % wkspath).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(1, len(wicout))
+
+        wicimg = wicout[0]
+
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
+                     ignore_status=True,
+                     native_sysroot=self.native_sysroot)
+        self.assertEqual(0, res.status)
+
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(1, len(partlns))
+        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
+
+    def test_fixed_size_error(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag. The size of partition is intentionally set to 1MiB
+        in order to trigger an error in wic.
+        """
+        wkspath, wksname = self._make_fixed_size_wks(1)
+
+        self.assertEqual(1, runCmd("wic create %s -e core-image-minimal" \
+                                   % wkspath, ignore_status=True).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(0, len(wicout))
-- 
2.5.5


