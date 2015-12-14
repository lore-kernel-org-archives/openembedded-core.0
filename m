Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Dec 2015 20:51:37 UTC
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.225])
	by mail.openembedded.org (Postfix) with ESMTP id A03B16067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:51:37 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:56740]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge03 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 50/A7-16293-03A2F665; Mon, 14 Dec 2015 20:44:32 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 15:44:29 -0500
Message-Id: <1450125869-32890-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.142:25
X-Cloudmark-Score: 0
Subject: [PATCH] initscripts: Add RREPLACES for initscripts-functions
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
X-List-Received-Date: Mon, 14 Dec 2015 20:51:37 -0000

Back at commit acaf650aa4d458120038ba431c2d1ea563f90f77
initscripts was split into the initscripts and
initscripts-functions packages.  However, no RREPLACES was listed.
When using opkg for package managment, upgrades fail unless
--force-overwrite is specified.

Add an RREPLACES declaration stating that initscripts-functions
replaces initscripts so old system can upgrade without conflicts.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index f90de6e..c0feca3 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -51,6 +51,7 @@ RDEPENDS_${PN} = "${PN}-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','bash','',d)} \
 		 "
 FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
+RREPLACES_${PN}-functions = "${PN}"
 
 ALTERNATIVE_PRIORITY_${PN}-functions = "90"
 ALTERNATIVE_${PN}-functions = "functions"
-- 
2.1.0


