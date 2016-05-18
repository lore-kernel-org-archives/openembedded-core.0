Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9D16373174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:34:00 +0000 (UTC)
Received: from localhost.localdomain (111-250-207-159.dynamic.hinet.net
	[111.250.207.159])
	by msfrf2622.sfr.fr (SMTP Server) with ESMTP id CCC601C000AC9;
	Wed, 18 May 2016 14:34:00 +0200 (CEST)
Received: from localhost.localdomain (111-250-207-159.dynamic.hinet.net
	[111.250.207.159])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2622.sfr.fr (SMTP Server) with ESMTPSA;
	Wed, 18 May 2016 14:33:59 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 20:33:37 +0800
Message-Id: <1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 12:34:00 -0000

When compiling mesa, if dri is disabled in PACKAGECONFIG, or if the list of DRI drivers is empty, it will cause populate_package to fail, because it can't find - rightfully - the directory for the DRI drivers.
This patch checks that the directory indeed exists before trying to get a list of the files in it

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/recipes-graphics/mesa/mesa.inc | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a4e5351..0e46092 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -143,15 +143,16 @@ python mesa_populate_packages() {
 
     import re
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-    dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
-    lib_name = d.expand("${MLPREFIX}mesa-megadriver")
-    for p in dri_pkgs:
-        m = re.match('^(.*)_dri\.so$', p)
-        if m:
-            pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
-            d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
-            d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
-            d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
+    if os.path.isdir(d.getVar('PKGD', True) + dri_drivers_root):
+        dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
+        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
+        for p in dri_pkgs:
+            m = re.match('^(.*)_dri\.so$', p)
+            if m:
+                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
+                d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
+                d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
+                d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
 
     pipe_drivers_root = os.path.join(d.getVar('libdir', True), "gallium-pipe")
     do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
-- 
2.7.4


