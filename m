Return-Path: <ejo@pengutronix.de>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 21 Jan 2018 00:00:34 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id B4A9F787CA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 00:00:34 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <ejo@pengutronix.de>)
	id 1ed2pG-00070k-PQ; Sun, 21 Jan 2018 00:45:30 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <ejo@pengutronix.de>)
	id 1ed2pG-00051M-Fy; Sun, 21 Jan 2018 00:45:30 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 00:44:41 +0100
Message-Id: <20180120234441.18217-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.11.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: uol@pengutronix.de, Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH] base.bbclass: fix do_unpack[cleandirs] varflag handling
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
X-List-Received-Date: Sun, 21 Jan 2018 00:00:35 -0000

As introduced by a56fb90dc3805494eeaf04c60538425e8d52efc5 ('base.bbclass
wipe ${S} before unpacking source') the base.bbclass uses a python
anonymous function to set the 'do_unpack' varflag 'cleandirs' to either
'${S}' or '${S}/patches' depending on equality of '${S}' and '${WORKDIR}'.

Not that this only differs from the way almost all other recipes set or
modify a tasks 'cleandirs' flag, it also has a significant impact on the
kernel.bbclass (and possibly further ones) and causes incorrect
behavior for rebuilds triggered by source modification, e.g. by a change
of the defconfig file for a kernel build.

The kernel.bbclass tries to extend do_unpack[cleandirs]:

| do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"

As python anonymous functions are evaluated at the very end of recipe
parsing, the d.setVarFlag('do_unpack', 'cleandirs', '${S}') statement in
base.bbclass will overwrite every modification to cleandirs that is done
as shown for the kernel class above.

As a result of this, a change to a kernels 'defconfig' will lead to an
updated defconfig file in ${WORKDIR}, but as ${B} never gets cleaned and
${B}/.config still exists, it will not be copied to ${B}/.config and
thus not find its way in the build kernel.

This is a severe issue for the kernel development and build process!

This patch changes setting of the cleandirs varflag in base.bbclass to
a simple variable assignment as almost all other recipes do it. This now
again allows overwriting or appending the varflag with common methods
such as done in kernel.bbclass.

This issue affects morty, pyro, rocko and master.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/classes/base.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 912e81e002..2949b074d8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -152,12 +152,8 @@ python base_do_fetch() {
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
 
-python () {
-    if d.getVar('S') != d.getVar('WORKDIR'):
-        d.setVarFlag('do_unpack', 'cleandirs', '${S}')
-    else:
-        d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 'patches'))
-}
+do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
+
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
-- 
2.11.0


