Return-Path: <Tobias.Gassner.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67278C3DA45
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 06:35:34 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.32222.1721025324663450392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 23:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=nBfXek8N;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: tobias.gassner.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F3pUio005420
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 06:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S-DKIM-20210427; bh=lf7idoa3TDKw87v1
	p/d1DWrdythNyC/PSmNiBv29eXs=; b=nBfXek8NQr9tU6uKNkeuuFD/4sfq9yIP
	kY5TRfXofD/0dfz2rqc2+fjnSKkgGTdPi2Ja0hlb3LCTvuNOGvH+tlEK1FXIhLxt
	ojOpECmjkdS485A7WTNuE9xHJpirNyEcZaNyBqxERb8ZADP+MBPDb1ZZs1Em/GRH
	Xsmzlahrg/CVU4d0pUgt2nZ4sF5gd28BgPxQa2LjfcwhaI6Fnjs7+7RF4MX9v/c4
	e9BNdbv20d+RiYrlp7jaLZn27NK8HXGWRUWYv3lPB0P18Vghg03aocpgk4OVCMTv
	l1x/uytz+mCgJZ1G6XNYbTn401ep+p0/+wEFH8DOyi93ZoXM4rCSGg==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 40bfq1m726-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 06:35:22 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 08:35:22 +0200
Received: from localhost.localdomain (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 15 Jul 2024 08:35:20 +0200
From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rootfs: run postinst ontarget on ro-rootfs when read-only-rootfs-delayed-postinsts set
Date: Mon, 15 Jul 2024 08:35:11 +0200
Message-ID: <20240715063511.3683708-1-tobias.gassner.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ms2_lO55sRolE0OrdK3CXL8HdYevvO5s
X-Proofpoint-GUID: ms2_lO55sRolE0OrdK3CXL8HdYevvO5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 06:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201899

this patch will ensure that pkg_postinst_ontarget task is executed for read only rootfs when read-only-rootfs-delayed-postinsts is set as IMAGE_FEATURES. In addition to the fix, a test in meta/lib/oeqa/selftest/cases/overlayfs.py testing the fix has been implemented.

Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>
---
 meta/lib/oe/rootfs.py                     |  4 +++
 meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8cd48f9450..5abce4ad7d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -269,7 +269,11 @@ class Rootfs(object, metaclass=ABCMeta):
                 self.pm.remove(["run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                                        True, False, self.d) and \
+                      not bb.utils.contains("IMAGE_FEATURES",
+                                        "read-only-rootfs-delayed-postinsts",
                                         True, False, self.d)
+
         image_rorfs_force = self.d.getVar('FORCE_RO_REMOVE')
 
         if image_rorfs or image_rorfs_force == "1":
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index e31063567b..580fbdcb9c 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine
 
@@ -466,6 +466,45 @@ IMAGE_INSTALL:append = " overlayfs-user"
             line = getline_qemu(output, "Read-only file system")
             self.assertTrue(line, msg=output)
 
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
+    def test_postinst_on_target_for_read_only_rootfs(self):
+        """
+        Summary:  The purpose of this test case is to verify that post-installation
+                  on target scripts are executed even if using read-only rootfs when
+                  read-only-rootfs-delayed-postinsts is set
+        Expected: The test files are created on first boot
+        """
+
+        import oe.path
+
+        vars = get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-minimal")
+        sysconfdir = vars["sysconfdir"]
+        self.assertIsNotNone(sysconfdir)
+        # Need to use oe.path here as sysconfdir starts with /
+        targettestdir = os.path.join(sysconfdir, "postinst-test")
+
+        config = self.get_working_config()
+
+        args = {
+            'OVERLAYFS_INIT_OPTION': "",
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
+            'OVERLAYFS_ROOTFS_TYPE': "ext4",
+            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
+        }
+
+        # read-only-rootfs is already set in get_working_config()
+        config += 'EXTRA_IMAGE_FEATURES += "read-only-rootfs-delayed-postinsts"\n'
+        config += 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
+
+        self.write_config(config.format(**args))
+
+        res = bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            for filename in ("rootfs", "delayed-a", "delayed-b"):
+                status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
+                self.assertIn("found", output, "%s was not present on boot" % filename)
+
     def get_working_config(self):
         return """
 # Use systemd as init manager
-- 
2.45.2


