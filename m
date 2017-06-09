Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id ED7DA782FD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 18:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 493C720BAF;
	Fri,  9 Jun 2017 18:41:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id crVenbo5kFei; Fri,  9 Jun 2017 18:41:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 286A6207BD;
	Fri,  9 Jun 2017 18:41:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8E67C1624D4;
	Fri,  9 Jun 2017 14:41:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 14:41:35 -0400
Message-Id: <1497033695-138298-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] uboot-config: check UBOOT_CONFIG variable, not flags, for error conditions
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
X-List-Received-Date: Fri, 09 Jun 2017 18:41:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Sometimes there's a need to change existing UBOOT_CONFIG setting from a recipe,
distro or local config, such as an override or even switch back to UBOOT_MACHINE.
Unfortunately, there's no easy way to override or unset flags, so using them as
an error condition is rather heavy-handed. Change those conditions to check the
UBOOT_CONFIG variable itself, not its flags.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/classes/uboot-config.bbclass | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 10013b7..8f1ded4 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -20,24 +20,21 @@ python () {
     ubootbinaries = d.getVar('UBOOT_BINARIES')
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
+    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
 
-    if not ubootmachine and not ubootconfigflags:
+    if not ubootmachine and len(ubootconfig) == 0:
         PN = d.getVar("PN")
         FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
         raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
-    if ubootmachine and ubootconfigflags:
+    if ubootmachine and len(ubootconfig) > 0:
         raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
 
     if ubootconfigflags and ubootbinaries:
         raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
 
-    if not ubootconfigflags:
-        return
-
-    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
     if len(ubootconfig) > 0:
         for config in ubootconfig:
             for f, v in ubootconfigflags.items():
@@ -57,6 +54,4 @@ python () {
                         bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
                     break
-    elif len(ubootconfig) == 0:
-       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
 }
-- 
2.7.4


