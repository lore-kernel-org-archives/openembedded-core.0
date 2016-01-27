Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACCA731F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:24:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jan 2016 03:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,354,1449561600"; d="scan'208";a="869740576"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.8.138])
	by orsmga001.jf.intel.com with ESMTP; 27 Jan 2016 03:24:18 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 11:24:00 +0000
Message-Id: <a88848d2cb55d34de4ae05002af00bbc0e040432.1453893763.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453893763.git.joshua.g.lock@intel.com>
References: <cover.1453893763.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1453893763.git.joshua.g.lock@intel.com>
References: <cover.1453893763.git.joshua.g.lock@intel.com>
Subject: [PATCH v5 2/2] connman: tidy up connman-conf usage
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
X-List-Received-Date: Wed, 27 Jan 2016 11:24:20 -0000

From: Joshua Lock <joshua.lock@collabora.co.uk>

connman-conf is now a systemd oneshot and therefore doesn't need to
be sed'ed in to the ConnMan service file.

Note: this doesn't affect sysvinit where we provide a ConnMan
init script which checks for the presence of the wired-networking
script and, if it exists, executes it as part of the connman init.

[YOCTO #8399]

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 856ba44..c375251 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -69,11 +69,6 @@ python __anonymous () {
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
-SYSTEMD_WIRED_SETUP = "ExecStartPre=-${datadir}/connman/wired-setup"
-
-do_compile_append() {
-	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
-}
 
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-- 
2.5.0


