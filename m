Return-Path: <stefan.wiehler@missinglinkelectronics.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 May 2017 16:20:48 UTC
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [5.9.234.182])
	by mail.openembedded.org (Postfix) with ESMTP id D3C01607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 16:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 4FA6DE0195
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 18:13:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oieXrwgYtJxi; Wed,  3 May 2017 18:13:38 +0200 (CEST)
Received: from topf.mle (p4FE1E831.dip0.t-ipconnect.de [79.225.232.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 530E4E0194;
	Wed,  3 May 2017 18:13:37 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 18:13:17 +0200
Message-Id: <20170503161317.16784-1-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.11.0
Cc: ulrich.langenbach@missinglinkelectronics.com
Subject: [PATCH] module.bbclass: Add devshell support
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
X-List-Received-Date: Wed, 03 May 2017 16:20:53 -0000

Adds development shell support for out-of-tree kernel modules by reproducing
the build environment of the compile task.

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 meta/classes/module.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 802476bc7a..9b019513ae 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,6 +1,7 @@
 inherit module-base kernel-module-split pkgconfig
 
 addtask make_scripts after do_prepare_recipe_sysroot before do_compile
+addtask make_scripts after do_prepare_recipe_sysroot before do_devshell
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -18,6 +19,26 @@ python __anonymous () {
     d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
 }
 
+python do_devshell_prepend () {
+    os.environ['CFLAGS'] = ''
+    os.environ['CPPFLAGS'] = ''
+    os.environ['CXXFLAGS'] = ''
+    os.environ['LDFLAGS'] = ''
+
+    os.environ['KERNEL_PATH'] = d.getVar('STAGING_KERNEL_DIR')
+    os.environ['KERNEL_SRC'] = d.getVar('STAGING_KERNEL_DIR')
+    os.environ['KERNEL_VERSION'] = d.getVar('KERNEL_VERSION')
+    os.environ['CC'] = d.getVar('KERNEL_CC')
+    os.environ['LD'] = d.getVar('KERNEL_LD')
+    os.environ['AR'] = d.getVar('KERNEL_AR')
+    os.environ['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
+    kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
+    if kbuild_extra_symbols:
+        os.environ['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
+    else:
+        os.environ['KBUILD_EXTRA_SYMBOLS'] = ''
+}
+
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
-- 
2.11.0


