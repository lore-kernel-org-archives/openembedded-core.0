Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TGziZ-0000K5-34
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:04:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2012 14:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,492,1344236400"; d="scan'208";a="213873136"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2012 14:51:38 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q8QLoCWm027864;
	Wed, 26 Sep 2012 14:50:12 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q8QLoCdN027863;
	Wed, 26 Sep 2012 14:50:12 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 14:50:09 -0700
Message-Id: <ef32354b1a77f3dc7b61ce86d5c879bc70f8eff0.1348695851.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
References: <c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1348695851.git.elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 3/3] license.conf/bbclass: Move globals to license.conf
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
X-List-Received-Date: Wed, 26 Sep 2012 22:04:31 -0000

This requires the changes to bitbake.conf that allow parsing of
license.conf.

As we should now be parsing license.conf, we can move some globals
out of license.bblcass and into the conf file.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |   65 ------------------------------------------
 meta/conf/licenses.conf      |   64 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 65 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index ad543f6..a66933f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -10,71 +10,6 @@ addtask populate_lic after do_patch before do_package
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
-# Standards are great! Everyone has their own. In an effort to standardize licensing
-# names, common-licenses will use the SPDX standard license names. In order to not
-# break the non-standardized license names that we find in LICENSE, we'll set
-# up a bunch of VarFlags to accomodate non-SPDX license names.
-#
-# We should really discuss standardizing this field, but that's a longer term goal.
-# For now, we can do this and it should grab the most common LICENSE naming variations.
-#
-# We should NEVER have a GPL/LGPL without a version!!!!
-# Any mapping to MPL/LGPL/GPL should be fixed
-# see: https://wiki.yoctoproject.org/wiki/License_Audit
-
-# GPL variations
-SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
-SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
-SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
-
-#LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
-
-#MPL variations
-SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
-SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
-SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
-SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
-
-#MIT variations
-SPDXLICENSEMAP[MIT-X] = "MIT"
-SPDXLICENSEMAP[MIT-style] = "MIT"
-
-#Openssl variations
-SPDXLICENSEMAP[openssl] = "OpenSSL"
-
-#Python variations
-SPDXLICENSEMAP[PSF] = "Python-2.0"
-SPDXLICENSEMAP[PSFv2] = "Python-2.0"
-SPDXLICENSEMAP[Python-2] = "Python-2.0"
-
-#Apache variations
-SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
-SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
-
-#Artistic variations
-SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
-SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
-
-#Academic variations
-SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
-SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
-SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
-SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
-
-#Other variations
-SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
-
 license_create_manifest() {
 	mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
 	# Get list of installed packages
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 6ed4dfe..3cb143c 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -39,6 +39,70 @@ SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
 SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet YPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 
+# Standards are great! Everyone has their own. In an effort to standardize licensing
+# names, common-licenses will use the SPDX standard license names. In order to not
+# break the non-standardized license names that we find in LICENSE, we'll set
+# up a bunch of VarFlags to accomodate non-SPDX license names.
+#
+# We should really discuss standardizing this field, but that's a longer term goal.
+# For now, we can do this and it should grab the most common LICENSE naming variations.
+#
+# We should NEVER have a GPL/LGPL without a version!!!!
+# Any mapping to MPL/LGPL/GPL should be fixed
+# see: https://wiki.yoctoproject.org/wiki/License_Audit
+
+# GPL variations
+SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
+SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
+SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
+
+#LGPL variations
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+
+#MPL variations
+SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
+SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
+SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
+SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
+
+#MIT variations
+SPDXLICENSEMAP[MIT-X] = "MIT"
+SPDXLICENSEMAP[MIT-style] = "MIT"
+
+#Openssl variations
+SPDXLICENSEMAP[openssl] = "OpenSSL"
+
+#Python variations
+SPDXLICENSEMAP[PSF] = "Python-2.0"
+SPDXLICENSEMAP[PSFv2] = "Python-2.0"
+SPDXLICENSEMAP[Python-2] = "Python-2.0"
+
+#Apache variations
+SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
+SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
+
+#Artistic variations
+SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
+SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
+
+#Academic variations
+SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
+SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
+SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
+SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
+
+#Other variations
+SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
 
 # Additional license directories. Add your custom licenses directories this path.
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
-- 
1.7.5.4



