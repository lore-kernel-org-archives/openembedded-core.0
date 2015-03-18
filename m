Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C0C42723BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 15:38:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2015 08:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,423,1422950400"; d="scan'208";a="667010217"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2015 08:38:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 17:38:39 +0200
Message-Id: <12cae80ab3c2c31b53d73b6d15613cd3e25f650d.1426693079.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1426693079.git.cristian.iorga@intel.com>
References: <cover.1426693079.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1426693079.git.cristian.iorga@intel.com>
References: <cover.1426693079.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] neard: fix the install path in init scripts
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
X-List-Received-Date: Wed, 18 Mar 2015 15:38:42 -0000

The neard make scripts will place the daemon executable
in /usr/lib/neard/nfc/neard. Change the path accordingly
in init scripts.

Fixes [YOCTO #7390].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/neard/neard.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 6b6b1da..4042a69 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -25,7 +25,7 @@ do_install() {
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
+		sed "s:@installpath@:${libexecdir}/nfc:" ${WORKDIR}/neard.in \
 		  > ${D}${sysconfdir}/init.d/neard
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
-- 
2.1.0


