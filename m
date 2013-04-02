Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UMziy-000823-OE
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 13:50:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Apr 2013 04:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,393,1363158000"; d="scan'208";a="311109609"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2013 04:32:24 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2013 14:35:56 +0300
Message-Id: <1364902556-351-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] package_deb.bbclass: fix 'armel' override
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 11:50:01 -0000

The 'armel' override for DKPG_ARCH was causing the meta-toolchain
build to fail. The assignment was moved to an anonymous fragment
of Python code, so it doesn't affect the assignments in
cross-canadian.bbclass anymore, thus fixing the issue.

[YOCTO #4080]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/classes/package_deb.bbclass |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4559199..853b5ea 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -7,7 +7,6 @@ inherit package
 IMAGE_PKGTYPE ?= "deb"
 
 DPKG_ARCH ?= "${TARGET_ARCH}" 
-DPKG_ARCH_arm ?= "armel"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
@@ -406,8 +405,11 @@ python () {
         d.setVarFlag('do_package_write_deb_setscene', 'fakeroot', "1")
 
     # Map TARGET_ARCH to Debian's ideas about architectures
-    if d.getVar('DPKG_ARCH', True) in ["x86", "i486", "i586", "i686", "pentium"]:
-        d.setVar('DPKG_ARCH', 'i386')
+    darch = d.getVar('DPKG_ARCH', True)
+    if darch in ["x86", "i486", "i586", "i686", "pentium"]:
+         d.setVar('DPKG_ARCH', 'i386')
+    elif darch == "arm":
+         d.setVar('DPKG_ARCH', 'armel')
 }
 
 python do_package_write_deb () {
-- 
1.7.10.4



