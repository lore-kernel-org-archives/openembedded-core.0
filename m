Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8E1560796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 01:30:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7B1U8lo019097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 18:30:08 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 10 Aug 2017 18:30:07 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2017 09:30:43 +0800
Message-ID: <1502415043-15437-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] populate_sdk_base.bbclass: add handling package exclusions to do_populate_sdk
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
X-List-Received-Date: Fri, 11 Aug 2017 01:30:07 -0000
Content-Type: text/plain

There is an error for populate_sdk when we exclude package by using
PACKAGE_EXCLUDE.

Reproduced steps:
echo "PACKAGE_EXCLUDE = \"psplash\"" >> conf/local.conf
bitbake core-image-sato -c populate_sdk

Error log:
ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf.
Command '/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/recipe-sysroot-native/usr/bin/dnf -y -c
/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/sdk/image/opt/poky/2.3/sysroots/i586-poky-linux/etc/dnf/dnf.conf
--setopt=reposdir=/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/sdk/image/opt/poky/2.3/sysroots/i586-poky-linux/etc/yum.repos.d
--repofrompath=oe-repo,/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/oe-rootfs-repo
--installroot=/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/sdk/image/opt/poky/2.3/sysroots/i586-poky-linux
--setopt=logdir=/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/temp
-x psplash --nogpgcheck install run-postinsts dnf
packagegroup-core-x11-base packagegroup-core-ssh-dropbear
packagegroup-core-standalone-sdk-target packagegroup-base-extended
packagegroup-core-x11-sato psplash packagegroup-core-boot rpm' returned 1:
Unable to detect release version (use '--releasever' to specify release version)
Added oe-repo repo from
/buildarea1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:00 ago on Thu 10 Aug 2017 09:26:32 AM UTC.
No package psplash available.
Error: Unable to find a match

Add handling package exclusions to do_populate_sdk. The code copies from
do_rootfs in image.bbclass.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 0354ee1..424c63c 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -101,6 +101,26 @@ def populate_sdk_common(d):
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
 
+    # Handle package exclusions
+    excl_pkgs = (d.getVar("PACKAGE_EXCLUDE") or "").split()
+    inst_pkgs = (d.getVar("PACKAGE_INSTALL") or "").split()
+    inst_attempt_pkgs = (d.getVar("PACKAGE_INSTALL_ATTEMPTONLY") or "").split()
+
+    d.setVar('PACKAGE_INSTALL_ORIG', ' '.join(inst_pkgs))
+    d.setVar('PACKAGE_INSTALL_ATTEMPTONLY', ' '.join(inst_attempt_pkgs))
+
+    for pkg in excl_pkgs:
+        if pkg in inst_pkgs:
+            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL (%s).  It will be removed from the list." % (pkg, d.getVar('PN'), inst_pkgs))
+            inst_pkgs.remove(pkg)
+
+        if pkg in inst_attempt_pkgs:
+            bb.warn("Package %s, set to be excluded, is in %s PACKAGE_INSTALL_ATTEMPTONLY (%s).  It will be removed from the list." % (pkg, d.getVar('PN'), inst_pkgs))
+            inst_attempt_pkgs.remove(pkg)
+
+    d.setVar("PACKAGE_INSTALL", ' '.join(inst_pkgs))
+    d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", ' '.join(inst_attempt_pkgs))
+
     pn = d.getVar('PN')
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
-- 
2.7.4


