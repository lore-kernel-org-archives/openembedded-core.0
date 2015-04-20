Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.226])
	by mail.openembedded.org (Postfix) with ESMTP id 368F973D5E
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:53:50 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:49718]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge02 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 96/2E-18238-FF215355; Mon, 20 Apr 2015 14:53:51 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 10:53:47 -0400
Message-Id: <1429541627-3788-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.130:25
X-Cloudmark-Score: 0
Subject: [PATCH] udev: Add RCONFLICTS/RREPLACES for udev-utils
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
X-List-Received-Date: Mon, 20 Apr 2015 14:53:51 -0000

As of commit 9bb5c7472958aeea46225e835f44d45bea7f7351, the
udev-utils package no longer exists with udev taking ownership
of udevadm.  However, systems that had udev-utils installed have
a conflict with udev.

Add RCONFLICTS and RREPLACES variables for udev-utils so udev-utils
will be removed from systems that are upgrading udev.  This change
would be applicable for master back through dizzy when the problem
was introduced.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/udev/udev.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 24463b1..a63fc8c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -61,6 +61,11 @@ INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev ${bindir}/udevadm"
 RRECOMMENDS_${PN} += "udev-cache"
 
+# udev-utils has been removed as a package.  Note that udev conflicts with udev-utils so that
+# udev-utils is removed from systems on upgrade.
+RCONFLICTS_${PN} += "udev-utils"
+RREPLACES_${PN} += "udev-utils"
+
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
-- 
2.1.0


