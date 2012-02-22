Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05y8-0007bD-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312592"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:56 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:53 -0800
Message-Id: <44285a7a69f45582670350ca63e1fa8996dac890.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 10/10] libgcc: get the gcc header files working
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2012 06:46:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gcc/libgcc_4.6.bb |   53 +++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 076cf37..6d93341 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -14,6 +14,9 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 FILES_libgcov-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a "
@@ -51,3 +54,53 @@ BBCLASSEXTEND = "nativesdk"
 INSANE_SKIP_libgcc-dev = "staticdev"
 INSANE_SKIP_libgcov-dev = "staticdev"
 
+addtask multilib_install after do_install before do_package
+
+
+# this makes multilib gcc files findable for target gcc
+# like this directory is made findable 
+#    /usr/lib/i586-pokymllib32-linux/4.6.3/
+# by creating this symlink to it
+#    /usr/lib64/x86_64-poky-linux/4.6.3/32
+
+python do_multilib_install() {
+        import re
+        # do this only for multilib extended recipe
+        if d.getVar('PN', 1) != 'libgcc':
+                return
+
+        tune_arch = d.getVar('TUNE_ARCH', 1) or ''
+        defaulttune = d.getVar('DEFAULTTUNE', 1) or ''
+        multilibs = d.getVar('MULTILIB_VARIANTS', 1) or ''
+        if multilibs == '':
+                return
+
+	tunes_32 = ['x86', 'core2', 'i586', 'mips', 'mipsel', 'mips-nf', 'mipsel-nf', 'powerpc', 'powerpc-nf']
+        tunes_64 = ['x86-64', 'core2-64', 'mips64', 'mips64el', 'mips64-nf', 'mips64el-nf', 'powerpc64']
+        tunes_x32 = ['x86-64-x32', 'core2-64-x32']
+        tunes_n32 = ['mips64-n32', 'mips64el-n32', 'mips64-nf-n32', 'mips64el-nf-n32']
+
+        for ml in multilibs.split(' '):
+                ml_tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, 1) or ''
+		ml_tune_features = d.getVar('TUNE_FEATURES_tune-' + ml_tune, 1) or ''
+                ml_baselib = d.getVar('BASE_LIB_tune-' + ml_tune, 1) or ''
+                for feature in ml_tune_features.split():
+                        ml_feature_arch = d.getVar('TUNE_FEATURE_ARCH-' + feature, 1) or ''
+		if ml_tune in tunes_32:
+                        bitness = '32'
+                elif ml_tune in tunes_64:
+                        bitness = '64'
+                elif ml_tune in tunes_x32:
+                        bitness = 'x32'
+                elif ml_tune in tunes_n32:
+                        bitness = 'n32'
+
+	binv = d.getVar('BINV', 1) or ''
+
+	src = '/usr/' + ml_baselib + '/' + ml_feature_arch + '-pokyml' + ml + '-linux/' + binv + '/' 
+	dest = (d.getVar('D', 1) or '') + (d.getVar('libdir', 1) or '') + '/' + (d.getVar('TARGET_SYS', 1) or '') + '/' + binv + '/' + bitness
+	if os.path.lexists(dest):
+		os.unlink(dest)
+	os.symlink(src, dest)
+
+}
-- 
1.7.6.4



