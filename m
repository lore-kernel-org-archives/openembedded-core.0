Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDF5CA5FFF
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 09:07:08 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41261.1791277623839353075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 02:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=VBjjFLRS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1334352-20261006090701a895a2305b000207c2-hvjdcj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261006090701a895a2305b000207c2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Oct 2026 11:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Kcwe8sG8wN+OHLPcnCqYt8NCp9r2mull4SZEAf+GO7Y=;
 b=VBjjFLRSDrM0RTECKHfZ5kfiDRr2hVbUrLMBKf4SRhxLy3uKIXl0XE+aTFi6VIKn/TT3Hz
 Xic36lWNdmfR+JdkBwbUO6MaoaSMIf5zGEkbaVs5xqHuMZeEoPf1XukGQ4y198cmFp8WR2x7
 lAAgUJ6diq90B8NDWecP7mx+hQ3yTdnT9IVk37cfarroC6LE2NdVVxAKM2nMlrMPqQ5Jsg/d
 HT0/tSu4zDVsWajaYJvB+4oNopQtlUU/gKLNo7ZOZ2QBaFHbIrQRq5MHjcz0Jy5P+UnRvzGW
 OFaIz5dcBby1LNYJUK7tGoTeAK1BdE7XDUJPXak4ep+nFOkFQfj4tITA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH v2 3/3] selftest/runtime_test: add testimage.bbclass NFS rootfs-dbg test
Date: Tue,  6 Oct 2026 11:06:54 +0200
Message-ID: <20261006090654.3445576-3-andrej.kozemcak@siemens.com>
In-Reply-To: <20261006090654.3445576-1-andrej.kozemcak@siemens.com>
References: <20261006090654.3445576-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247277

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a test case for testimage.bbclass with qemu booted from a full
rootfs-dbg image mounted via NFS, plus a slirp variant, sharing a
common _test_testimage_nfs(slirp) implementation. Both also install
cmake-example-ptest and ptest-runner with the ptest DISTRO_FEATURE
enabled, so the ptest suite runs over NFS too.

test_testimage_slirp is switched to oe-selftest-image, which already
provides an SSH server.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 51 ++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index a3c3126036..b82c7c7294 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -137,14 +137,59 @@ class TestImage(OESelftestTestCase):
 
         features = '''
 IMAGE_CLASSES:append = " testimage"
-IMAGE_FEATURES:append = " ssh-server-dropbear"
 IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("IMAGE_CLASSES", "testimage", " + 5120", "", d)}"
 TEST_RUNQEMUPARAMS += " slirp"
 '''
         self.write_config(features)
 
-        bitbake('core-image-minimal')
-        bitbake('-c testimage core-image-minimal')
+        bitbake('oe-selftest-image')
+        bitbake('-c testimage oe-selftest-image')
+
+    def _test_testimage_nfs(self, slirp=False):
+        """
+        Check testimage functionality with an NFS rootfs-dbg image
+        (image-combined-dbg), the same rootfs devtool ide-sdk --nfs=rootfs-dbg
+        boots. runqemu recognizes the rootfs tarball and extracts it itself
+        for NFS boot, the same way test_qemu_can_boot_nfs_and_shutdown
+        (runqemu.py) does. Also installs cmake-example-ptest and runs the
+        ptest suite on top of it.
+        """
+
+        # IMAGE_LINK_NAME/DEPLOY_DIR_IMAGE don't depend on the features below,
+        # so the rootfs-dbg tarball path can be derived before building it.
+        bb_vars = get_bb_vars(('DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'), 'oe-selftest-image')
+        rootfs_tar = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s-dbg.tar.zst' % bb_vars['IMAGE_LINK_NAME'])
+
+        features = '''
+IMAGE_CLASSES:append = " testimage image-combined-dbg"
+IMAGE_GEN_DEBUGFS = "1"
+IMAGE_FSTYPES_DEBUGFS:append = " tar.zst"
+DISTRO_FEATURES:append = " ptest"
+IMAGE_INSTALL:append = " ptest-runner cmake-example-ptest"
+QB_DEFAULT_FSTYPE = "tar.zst"
+QB_FSINFO = "tar.zst:rootfs-dbg"
+'''
+        if slirp:
+            features += 'TEST_RUNQEMUPARAMS += " slirp"\n'
+        self.write_config(features)
+
+        bitbake('oe-selftest-image')
+        self.assertExists(rootfs_tar)
+
+        bitbake('-c testimage oe-selftest-image')
+
+    def test_testimage_nfs(self):
+        """
+        Summary: Check testimage functionality with an NFS rootfs-dbg image.
+        """
+        self._test_testimage_nfs(slirp=False)
+
+    def test_testimage_slirp_nfs(self):
+        """
+        Summary: Check testimage functionality with qemu slirp networking and
+        an NFS rootfs-dbg image.
+        """
+        self._test_testimage_nfs(slirp=True)
 
     def test_testimage_dnf(self):
         """

