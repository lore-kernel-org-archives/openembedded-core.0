Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA6F78660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMuj6001329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:57 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:10 +0800
Message-ID: <fb6911113a4309fde3e6264c639e85e2dc1ab4cc.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/23] staging.bbclass: extend_recipe_sysroot(): search multilib manifest
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:55 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"

$ bitbake lib32-wrlinux-image-glibc-small
WARNING: lib32-wrlinux-image-glibc-small-1.0-r1 do_rootfs: Manifest for lib32-qemuwrapper-cross not found, searched manifests:
/path/to/tmp/sstate-control/manifest-qemux86_64-lib32-qemuwrapper-cross.populate_sysroot
/path/to/tmp/sstate-control/manifest-core2-64-lib32-qemuwrapper-cross.populate_sysroot
/path/to/tmp/sstate-control/manifest-x86_64-lib32-qemuwrapper-cross.populate_sysroot
/path/to/tmp/sstate-control/manifest-allarch-lib32-qemuwrapper-cross.populate_sysroot

It was because image recipes' multilib PACKAGE_EXTRA_ARCHS are not changed by
mutlilib.bbclass, so extend_recipe_sysroot() didn't know anything about
mutlilib's PACKAGE_EXTRA_ARCHS, now fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/staging.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 75bec84..91ae1e8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -519,6 +519,15 @@ python extend_recipe_sysroot() {
         else:
             pkgarchs = ['${MACHINE_ARCH}']
             pkgarchs = pkgarchs + list(reversed(d2.getVar("PACKAGE_EXTRA_ARCHS").split()))
+            # Search multilib archs for multilib image recipe like lib32-core-image-minimal
+            mlprefix = d2.getVar('MLPREFIX')
+            if bb.data.inherits_class('image', d2) and mlprefix:
+                ml_variant = mlprefix.rstrip('-')
+                override = ":virtclass-multilib-" + ml_variant
+                localdata = bb.data.createCopy(d2)
+                overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + ml_variant
+                localdata.setVar("OVERRIDES", overrides)
+                pkgarchs = pkgarchs + list(reversed(localdata.getVar("PACKAGE_EXTRA_ARCHS").split()))
             pkgarchs.append('allarch')
             for pkgarch in pkgarchs:
                 manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.populate_sysroot" % (pkgarch, c))
-- 
2.7.4


