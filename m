Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 418746FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:43:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 11 Oct 2016 05:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,329,1473145200"; d="scan'208";a="1052292209"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2016 05:43:31 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 15:43:28 +0300
Message-Id: <1476189809-24240-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] update-rc.d.bbclass: ignore init script return code
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
X-List-Received-Date: Tue, 11 Oct 2016 12:43:31 -0000

We need to ignore the return code from the init script 'stop' command in
the preinst and prerm scriptlets. Otherwise package upgrade or
deinstallation (at least when opkg is used) is likely to fail if the
daemon is not running. That is because an init script possibly returns
'1' if you try to stop a service that is not running which, in turn,
causes the scriptlet to fail which, in turn, causes the package
(de-)installation to fail.

[YOCTO #10299]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 458941f..236a742 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -37,7 +37,7 @@ INIT_D_DIR = "${sysconfdir}/init.d"
 
 updatercd_preinst() {
 if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+	${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
 fi
 if type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
@@ -62,7 +62,7 @@ fi
 
 updatercd_prerm() {
 if [ -z "$D" -a -x "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+	${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
 fi
 }
 
-- 
2.6.6


