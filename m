Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7B071A52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:40 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so128685860qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=C/RaCHBrNFYALlCj5dloOYOsw3t1W9vsqr6sbfE5f2g=;
	b=mqRBb+/CEcHlnqD9fAtlbSQUXKsDFFDWLPjlphLOrfGTL+EdSJL/EOAiSx7jzmEK38
	pJELedYZeeHX77q6L65bSN6oU9246X7yavmQHahT9GG8NytHh/Y5MIcHUvqQVx09HxMf
	z0ju7FTJu/epkKxSKkszSE03iY2+4MU4fjhIVbCmDSkqIlZqNuDJOeIrEG7QDq7sRmsF
	/3f0CQeCjaZrSUVMToEGNKSAkNtdjJL/D6Je0mmju9DbemEf1ihSAsCHsoEn/9GQtqhU
	zNQ7LxXFdVgp5FWHuA1UPiuEx6pe7F62gQcR381Vy/ej5eVxUDrRS1FenRkuhLiULh5+
	NhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=C/RaCHBrNFYALlCj5dloOYOsw3t1W9vsqr6sbfE5f2g=;
	b=R9cOVYiwjqMOYs5+41ZH///oUNUex5woGB6nwhL1UGQMUkNcderCLc96MjjlFL0sTu
	+J0Ee/hEZsBnkZ4JXM0lVveFMmZ05RNXKvYoh2KO4on/8Ef1Z5awHgTfUMTxdLnigsSr
	lNxX6B3CY0DQSazNMAYNFhXDTXLTzA7Od6r8V/iH4bksYvAofm9/tOoAZtpVaAIEkeVV
	IpKwFNwsrB4E/lfX4XE8xmSASphXQDWu2enddoUsu41NxFU8H7QjX6nSPLwFQKdJ70Sz
	fEKbAMAGbxUikqKtHmHhKoHzfWsCLh+SsUmrdUqQfgoT+V4A68MtB+elqmNOnfrg+4v8
	fOEQ==
X-Gm-Message-State: ABUngvfP057NwI7aXm/uP1/8lUfCJhGPmmD//LewKA8xh0/uH+SQUX3WQuR2CDkRFrnHWg==
X-Received: by 10.25.43.69 with SMTP id r66mr8927131lfr.158.1479203561980;
	Tue, 15 Nov 2016 01:52:41 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:41 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:09 +0100
Message-Id: <eb38d44adc6f103f898ee7a8859d7ef046df4402.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 09/11] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:41 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index ad783043b92130a023fd70120becec479c6253a7..052d77d510adf4b3fe56ab8fcc87a834c15b1d4c 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,6 +29,7 @@ import unittest
 from glob import glob
 from shutil import rmtree
 from functools import wraps
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
@@ -378,3 +379,67 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
                                    % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
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
+        return (wkspath, wksname)
+
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath, wksname = self._make_fixed_size_wks(200)
+
+        wic_cmd_vars = {
+            'wks': wkspath,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(1, len(wicout))
+
+        wicimg = wicout[0]
+
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg, ignore_status=True)
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
+        wic_cmd_vars = {
+            'wks': wkspath,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(1, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars, ignore_status=True).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(0, len(wicout))
-- 
2.5.0


