Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1Te4B6-000064-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 14:29:25 +0100
Received: by zeus (Postfix, from userid 996)
	id F0FAB520FAC; Thu, 29 Nov 2012 06:06:09 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 06:06:09 -0700
Message-Id: <1354194369-17500-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gstreamer: Fix plugin builds
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
X-List-Received-Date: Thu, 29 Nov 2012 13:29:25 -0000

Not all gstreamer plugins have localized documentation trees.

The commit
  commit f50e2984d9411a059b86d6c158e9416fceb84c3d
  Author: Martin Jansa <martin.jansa@gmail.com>
  Date:   Wed Nov 28 15:59:48 2012 +0100
breaks the build for such packages because the file "po/Makefile.in.in"
is not present.

This change allows building without the po/ subdirectory.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index 07b26a3..fc9567a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -23,5 +23,7 @@ PACKAGES_DYNAMIC += "^${PN}-.*"
 # ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
 # http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
 oe_runconf_prepend() {                                                                                                                                      
-	sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+	if [ -e ${S}/po/Makefile.in.in ]; then
+		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+	fi
 }                                                                                                                                                           
-- 
1.7.9.5



