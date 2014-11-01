Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA4965C87
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Nov 2014 16:57:13 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id l4so782008lbv.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Nov 2014 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PPONIieUCmjl2hNjOuYATxxVPzJc/qVDdaIM4kVxZWg=;
	b=TfdXraBcGMpsSI8kY1cutoF4TTfJ+Sw0BdFmcUslWEvSPDev4+jQXBOqmkiR1UpIyL
	2m1Muc8bxhrnatF7y+WbXswUxZdu14HA3ID8FextlvTLQT0AP3z/XmI/N/bWQHIjjm2A
	75Abie4RYHHROvi7g2DM1OB6Rr2GAwE+fsOLG2ka23Wl7H84QYS9BVPIxRlyosrHjGsL
	AGsTpntK2sLPa1iWS4BZqFFYK7iTOlXmT60OfZWAfj7Vfe4/AloyH4EAkaNpJBzSrxC2
	EokADPMH68mb7rhTWUDpb3/041NVjet55Luz6VcL/PEoHvDqB8okFjHcZaW9wHWaDmX/
	4Gjw==
X-Received: by 10.112.156.168 with SMTP id wf8mr35368109lbb.28.1414861033318; 
	Sat, 01 Nov 2014 09:57:13 -0700 (PDT)
Received: from neopili.fritz.box
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id e3sm5793328lam.26.2014.11.01.09.57.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Nov 2014 09:57:12 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Nov 2014 17:57:07 +0100
Message-Id: <1414861027-13914-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [PATCH] package_manager: Fix populate_sdk for dpkg packages
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
X-List-Received-Date: Sat, 01 Nov 2014 16:57:21 -0000

Without this patch:

ERROR: Unable to install packages. Command '/var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/sysroots/x86_64-linux/usr/bin/apt-get  install --force-yes --allow-unauthenticated nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-qt5022' returned 100:
Reading package lists...
Building dependency tree...
Reading state information...
W: Unable to read /var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/work/bobcat_64-poky-linux/meta-toolchain/1.0-r7/apt-sdk/preferences.d/ - DirectoryExists (2: No such file or directory)
E: Unable to locate package nativesdk-packagegroup-sdk-host
E: Unable to locate package packagegroup-cross-canadian-qt5022

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/work/bobcat_64-poky-linux/meta-toolchain/1.0-r7/temp/log.do_populate_sdk.4926
NOTE: recipe meta-toolchain-1.0-r7: task do_populate_sdk: Failed
ERROR: Task 7 (/var/lib/jenkins/jobs/qt5022-cesium/workspace/repo/yocto/meta/recipes-core/meta/meta-toolchain.bb, do_populate_sdk) failed with exit code '1'
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

Tested on yocto 1.7

Only build test, not tested on target.

 meta/lib/oe/package_manager.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 27fdf26..8828bce 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -188,7 +188,7 @@ class DpkgIndexer(Indexer):
                 release.write("Label: %s\n" % arch)
 
             cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
-            
+
             index_cmds.append(cmd)
 
             deb_dirs_found = True
@@ -1467,6 +1467,7 @@ class DpkgPM(PackageManager):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
         super(DpkgPM, self).__init__(d)
         self.target_rootfs = target_rootfs
+        self.pkg_archs = archs
         self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB', True)
         if apt_conf_dir is None:
             self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
@@ -1662,7 +1663,7 @@ class DpkgPM(PackageManager):
         bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
 
         arch_list = []
-        for arch in self.all_arch_list:
+        for arch in self.pkg_archs.split():
             if not os.path.exists(os.path.join(self.deploy_dir, arch)):
                 continue
             arch_list.append(arch)
-- 
2.1.1


