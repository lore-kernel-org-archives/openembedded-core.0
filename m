Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UZ6Ad-0006MP-PV
	for openembedded-core@lists.openembedded.org;
	Sun, 05 May 2013 23:08:37 +0200
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 3DEC82041E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2013 22:50:39 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2013 22:50:30 +0200
Message-Id: <1367787030-5056-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.2.2
Subject: [PATCH] gstreamer: Fixed dependency problem with -meta packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 May 2013 21:08:49 -0000

Installing the gstreamer -meta packages was not possible, because the
-apps and -glib packages were missing. Allowing for empty -apps/glib
packages fixes this.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 7ae3ef6..9cab392 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -25,9 +25,12 @@ python populate_packages_prepend () {
 }
 
 # metapkg has runtime dependency on PN
-# each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev on PN-staticdev
+# each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev on PN-staticdev,
+# and plugin-meta on plugin-glib and plugin-apps
 # so we need them even when empty (like in gst-plugins-good case)
 ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-apps = "1"
+ALLOW_EMPTY_${PN}-glib = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
 ALLOW_EMPTY_${PN}-staticdev = "1"
 
-- 
1.8.2.2



