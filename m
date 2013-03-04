Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCU5G-00048X-Sq
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 13:01:35 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2013 03:45:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,778,1355126400"; d="scan'208";a="298680569"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2013 03:45:05 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 13:45:03 +0200
Message-Id: <1362397503-25593-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 12:01:35 -0000

When checking the dependencies in setscene_depvalid(), make sure we also
consider those dependencies needed when running the postinstalls on
host.

[YOCTO #3918]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
Changes in v2:
 * added systemd-systemctl-native to the list;

Thanks,
Laurentiu

 meta/classes/sstate.bbclass |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 118a28a..ef12d97 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -640,6 +640,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
             return True
         return False
+    def isPostInstDep(x):
+        if x in ["qemu-native", "gdk-pixbuf-native", "gtk+-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native"]:
+            return True
+        return False
 
     # We can skip these "safe" dependencies since the aren't runtime dependencies, just build time
     if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] == "do_populate_sysroot":
@@ -658,8 +662,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         # do_package_write_* and do_package doesn't need do_package
         if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
             continue
-        # do_package_write_* and do_package doesn't need do_populate_sysroot
+        # do_package_write_* and do_package doesn't need do_populate_sysroot, unless is a postinstall dependency
         if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
+            if isPostInstDep(taskdependees[task][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+                return False
             continue
         # Native/Cross packages don't exist and are noexec anyway
         if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
-- 
1.7.9.5



