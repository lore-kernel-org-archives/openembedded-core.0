Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R0vTL-0004h9-7y
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 15:13:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2011 06:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="45463897"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 06 Sep 2011 06:08:36 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 21:08:36 +0800
Message-Id: <f042dae0c5066ac798eede73f6f7c113c22269f4.1315313790.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
Subject: [PATCH 2/5] package_deb.bbclass: put the stderr into log.do_xxx-attemptonly.xxx
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
X-List-Received-Date: Tue, 06 Sep 2011 13:13:52 -0000

Currently the stderr msgs go into log.do_rootfs and can cause a fatal failure
in "log_check rootfs".

However, the err msg could be spurious since we *only attempt* to install the
the packages, which may not exist actually. E.g., without this patch, we can
get a fatal ERROR due to
E: Couldn't find package task-core-tools-dev.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/package_deb.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 48aa232..87e20da 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -176,7 +176,7 @@ package_install_internal_deb () {
 	rm -f ${WORKDIR}/temp/log.do_${task}-attemptonly.${PID}
 	if [ ! -z "${package_attemptonly}" ]; then
 		for i in ${package_attemptonly}; do
-			apt-get install $i --force-yes --allow-unauthenticated >> ${WORKDIR}/temp/log.do_${task}-attemptonly.${PID} || true
+			apt-get install $i --force-yes --allow-unauthenticated >> ${WORKDIR}/temp/log.do_${task}-attemptonly.${PID} 2>&1 || true
 		done
 	fi
 
-- 
1.7.6



