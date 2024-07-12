Return-Path: <Tobias.Gassner.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F259C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:16:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.7511.1720790163434691396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=eHQEdLRI;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: tobias.gassner.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C3iHJc016590
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S-DKIM-20210427; bh=yKle8A45xfP73xra
	71ENbhg+yfTh+oJipDS16a8fZb4=; b=eHQEdLRIyuAQOd5S51CQapc+Pgftvo1w
	NwSrY6giEMdOGFPcS8gwfQtNY7A6SR6NLOVlpzLRjslt/xBqhGlq9EhwY5Cdtr8X
	z42bSGWTx53xziWIVO+w4tc7veMbPFcsyF2sSk+op/9UhktGzWaoaJBd2Ddv1nWu
	vuDUMoK5TjnOOCq4yYREQCgWF8yqyGIL2u2EK8Av7SiW0AZcQgGoLsnYTe+lUAux
	3kaehKH0l/ds18IYMVt9zptBxJnucNS71SAzdNMc/6iOsAAYgIghXMGP7Hct3UfR
	eO3crbfUQet32YCtezFGhSNRERJTN0EdfR2YpUHQIPA9Eg1CAvBidg==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 40ajk6ybmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:16:01 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 15:16:00 +0200
Received: from localhost.localdomain (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 12 Jul 2024 15:16:00 +0200
From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs when read-only-rootfs-delayed-postinsts is set
Date: Fri, 12 Jul 2024 15:15:51 +0200
Message-ID: <20240712131551.3516167-1-tobias.gassner.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EyZVl1jnAtuc8l5k23VDrlEW5vleW5QO
X-Proofpoint-GUID: EyZVl1jnAtuc8l5k23VDrlEW5vleW5QO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201826

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


