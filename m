Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF168-0002Qu-SH
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:41:28 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 04:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="303796177"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 04:23:57 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:24:22 +0200
Message-Id: <1363001062-18854-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
References: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 3/3] build-appliance-image: fix lost net connectivity after restart
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
X-List-Received-Date: Mon, 11 Mar 2013 11:41:36 -0000

The issue is that an ethernet config file is removed without
proper checks in place (rm -f), which triggers an error and
makes the connman startup script to fail.

The file is now removed with proper checks in place.

Fixes [YOCTO #4003].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
index 135a6c1..59ebb57 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -9,7 +9,7 @@ NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^ ]*\):\([^ ]*\):\([^ ]*\):\([^
 if [ "x$NET_CONF" = "x" ]; then
 	# Wired interface is not configured via kernel cmdline
 	# Remove connman config file template
-	rm ${CONFIGF}
+	rm -f ${CONFIGF}
 else
 	# Setup a connman config accordingly
 	sed -i -e "s|^\(IPv4 =\)|\1 ${NET_CONF}|" ${CONFIGF}
-- 
1.7.10.4



