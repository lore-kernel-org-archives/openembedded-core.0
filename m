Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id DF6E16AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 19:10:54 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 20:10:51 +0100
Message-Id: <1427137851-16060-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] update-alternatives.bbclass: alternatives should be removed in prerm
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
X-List-Received-Date: Mon, 23 Mar 2015 19:10:55 -0000

This behaviour matches dpkg's manpage and fixes deinstalling
alternatives for programs needed by the postrm script, e.g. /bin/sh.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/update-alternatives.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 4476ea6..2cb9825 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -222,16 +222,16 @@ python populate_packages_updatealternatives () {
                 #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
                 d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)
 
-            bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
+            bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
             postinst = d.getVar('pkg_postinst_%s' % pkg, True) or '#!/bin/sh\n'
             postinst += alt_setup_links
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
             bb.note('%s' % alt_remove_links)
-            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or '#!/bin/sh\n'
-            postrm += alt_remove_links
-            d.setVar('pkg_postrm_%s' % pkg, postrm)
+            prerm = d.getVar('pkg_prerm_%s' % pkg, True) or '#!/bin/sh\n'
+            prerm += alt_remove_links
+            d.setVar('pkg_prerm_%s' % pkg, prerm)
 }
 
 python package_do_filedeps_append () {
-- 
1.9.1


