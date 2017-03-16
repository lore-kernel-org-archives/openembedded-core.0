Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 980C17763E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489670409; x=1521206409;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=ZsuKwwwmO8PGeyR1ys2bEcm1dLW2CIadyUNjEJWN/mI=;
	b=gsruHBrxbdUiZXlEYiAv2WuA4bO/Ltl4Jx3iIXM8KshitVX4S0i7Kf32
	CoeD7gTGdn/lyeIrxfOjt71zwy1qzg==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 06:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,172,1486454400"; d="scan'208";a="68021730"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 Mar 2017 06:20:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 15:19:07 +0200
Message-Id: <20170316131907.19844-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170316131907.19844-1-alexander.kanavin@linux.intel.com>
References: <20170316131907.19844-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] dnf: add /usr/bin/dnf symlink that points to /usr/bin/dnf-2
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
X-List-Received-Date: Thu, 16 Mar 2017 13:20:07 -0000

All documentation refers to dnf binary as 'dnf' yet make install
does not create one - it's done by Fedora's spec file when building
the rpm. Let's replicate this behavior.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py       |  2 +-
 meta/lib/oeqa/runtime/cases/dnf.py   |  2 +-
 meta/recipes-devtools/dnf/dnf_git.bb | 10 +++++++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index eeb4c76071a..ae6849bce3f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -677,7 +677,7 @@ class RpmPM(PackageManager):
     def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
-        dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf-2")
+        dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
         standard_dnf_args = (["-v", "--rpmverbosity=debug"] if self.d.getVar('ROOTFS_RPM_DEBUG') else []) + ["-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 77e7eb94507..59a263dc63a 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -12,7 +12,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class DnfTest(OERuntimeTestCase):
 
     def dnf(self, command, expected = 0):
-        command = 'dnf-2 %s' % command
+        command = 'dnf %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
index 018352a6c9b..3a2cb635e40 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -30,9 +30,17 @@ EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
 BBCLASSEXTEND = "native nativesdk"
 RDEPENDS_${PN}_class-target += "python-core python-codecs python-netclient python-email python-threading python-distutils librepo python-shell python-subprocess libcomps libdnf python-sqlite3 python-compression python-pygpgme python-backports-lzma python-rpm python-iniparse python-json python-importlib python-curses python-argparse"
 
+# Create a symlink called 'dnf' as 'make install' does not do it, but
+# .spec file in dnf source tree does (and then Fedora and dnf documentation
+# says that dnf binary is plain 'dnf').
+do_install_append() {
+        ln -s -r ${D}/${bindir}/dnf-2 ${D}/${bindir}/dnf
+        ln -s -r ${D}/${bindir}/dnf-automatic-2 ${D}/${bindir}/dnf-automatic
+}
+
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install_append_class-native() {
-        create_wrapper ${D}/${bindir}/dnf-2 \
+        create_wrapper ${D}/${bindir}/dnf \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.11.0


