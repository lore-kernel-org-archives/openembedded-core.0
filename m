Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5880D7864B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMsqe018031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:54 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:08 +0800
Message-ID: <462acc2afc109953468e20e664953e0514718e98.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/23] staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:52 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-sato lib32-core-image-sato
$ bitbake build-sysroots

All lib32 manifests which had been built should be installed, but only a few
such as qemux86_64-lib32-base-files were installed (it was installed because
MACHINE_ARCH was still qemux86-64 when multilib), but others such as
x86-lib32-zlib were not installed, this was incorrect. For multilib builds,
fix-up overrides to prepend :virtclass-multilib- and then again append
additional multilib arches from the PACKAGE_EXTRA_ARCHS list if needed can fix
the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/staging.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 412e269..455eb05 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -190,8 +190,23 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
         pkgarchs = ['${MACHINE_ARCH}']
         pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
         pkgarchs.append('allarch')
+
+        # Handle multilib archs
+        variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+        for variant in variants.split():
+            localdata = bb.data.createCopy(d)
+            overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+            localdata.setVar("OVERRIDES", overrides)
+            bb.data.update_data(localdata)
+            pkgarchs_ml = localdata.getVar('PACKAGE_EXTRA_ARCHS').split()
+            for arch in pkgarchs_ml:
+                if arch not in pkgarchs:
+                    pkgarchs.append(arch)
+
         targetdir = targetsysroot
 
+    bb.debug(1, 'pkgarchs: %s' % pkgarchs)
+
     bb.utils.mkdirhier(targetdir)
     for pkgarch in pkgarchs:
         for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
-- 
2.7.4


