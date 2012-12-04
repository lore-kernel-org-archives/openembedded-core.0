Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TftG0-0000Sr-Lu
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:13:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 05:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226378599"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 05:59:34 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Tue,  4 Dec 2012 15:59:12 +0200
Message-Id: <2a5e0c811c34ab1a7180afc9f25a5051cd393514.1354626535.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/5] gconf.bbclass: run postinstalls at rootfs time
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
X-List-Received-Date: Tue, 04 Dec 2012 14:13:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gconf.bbclass |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 7a3ee3c..38097bc 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -15,13 +15,16 @@ export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"
 
 gconf_postinst() {
 if [ "x$D" != "x" ]; then
-	exit 1
+	export GCONF_BACKEND_DIR=${STAGING_LIBDIR_NATIVE}/GConf/2
+	export GCONF_CONFIG_SOURCE="xml::$D${sysconfdir}/gconf/gconf.xml.defaults"
+else
+	export GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source`
 fi
-SCHEMA_LOCATION=/etc/gconf/schemas
+
+SCHEMA_LOCATION=$D/etc/gconf/schemas
 for SCHEMA in ${SCHEMA_FILES}; do
 	if [ -e $SCHEMA_LOCATION/$SCHEMA ]; then
-		HOME=/root GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
-			gconftool-2 \
+		HOME=$D/root gconftool-2 \
 			--makefile-install-rule $SCHEMA_LOCATION/$SCHEMA > /dev/null
 	fi
 done
-- 
1.7.9.5



