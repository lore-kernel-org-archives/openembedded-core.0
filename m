Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id B31906CFF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:31:32 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:31:25 +0200
Message-Id: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/4] mesa: make runtime variables depend on PACKAGECONFIG
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
X-List-Received-Date: Thu, 17 Oct 2013 11:31:32 -0000

- This solves a conflict between mesa-gl and a custom library,
  both providing a libgles2 package, although being disabled
  in mesa-gl.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afc795c..3e8041b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -105,11 +105,16 @@ do_install_append () {
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
-    for p in (("libegl", "libegl1"), ("libgl", "libgl1"),
-              ("libgles1", "libglesv1-cm1"), ("libgles2", "libglesv2-2"),
-              ("libgles3",)):
-        fullp = p[0] + "-mesa"
-        pkgs = " ".join(p)
+    pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+    for p in (("egl", "libegl", "libegl1"),
+              ("dri", "libgl", "libgl1"),
+              ("gles", "libgles1", "libglesv1-cm1"),
+              ("gles", "libgles2", "libglesv2-2"),
+              ("gles", "libgles3",)):
+        if not p[0] in pkgconfig:
+            continue
+        fullp = p[1] + "-mesa"
+        pkgs = " ".join(p[1:])
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
@@ -117,7 +122,7 @@ python __anonymous() {
         
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
-        pkgs = p[0] + "-dev"
+        pkgs = p[1] + "-dev"
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
-- 
1.8.1.2


