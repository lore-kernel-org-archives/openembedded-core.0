Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEQa-0000av-2A
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:01:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144370026"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:43 -0700
Message-Id: <bc59ab2c4438e57e45f3d45e3f42d4f5c621ad99.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
References: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 4/8] util-linux: Example of pkg level INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Sat, 24 Mar 2012 00:01:52 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

util-linux-lscpu provides an example of pkg level incompatible
license. In this instance, we've set the license for this specific
package as GPLv3. The other packages inherit the recipe LICENSE.

What this allows is the package to not be included on install to
the image.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-core/util-linux/util-linux_2.21.bb |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index ab26fcd..c0c8bc6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -3,7 +3,7 @@ PR = "r5"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-LICENSE_util-linux-lscpu = "GPLv3+"
+LICENSE_${PN}-lscpu = "GPLv3+"
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
@@ -16,16 +16,14 @@ SRC_URI[sha256sum] = "2813ae6fe0449b60402e122c2baf97f26aa53e6e2dd05591c6cbcdf67f
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
+# The removal of the package should now occur during
+# the build if INCOMPATIBLE_LICENSE is set to GPLv3
+
 python () {
     d.setVar("REMOVELSCPU", "no")
     if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
         # avoid GPLv3
         d.setVar("REMOVELSCPU", "yes")
-        packages = (d.getVar("PACKAGES", False) or "").split()
-        if "util-linux-lscpu" in packages:
-            packages.remove("util-linux-lscpu")
-        d.setVar("PACKAGES", " ".join(packages))
-
         src_uri = (d.getVar("SRC_URI", False) or "").split()
         src_uri.append("file://remove-lscpu.patch")
         d.setVar("SRC_URI", " ".join(src_uri))
-- 
1.7.1



