Return-Path: <clemens.lang@bmw-carit.de>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Jan 2019 16:00:59 UTC
Received: from cit-hm8-mail01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 51A696D563
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 16:00:59 +0000 (UTC)
Received: from [10.40.100.13] (port=7157 helo=exchange.bmw-carit.de)
	by cit-hm8-mail01.bmw-carit.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1gf5LT-0006F0-1g for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2019 16:55:43 +0100
Received: from clang-buildvm.bmw-carit.intra (172.20.20.106) by
	CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Thu, 3 Jan 2019 16:55:43 +0100
X-CTCH-RefID: str=0001.0A0C020D.5C2E307F.0066, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 16:55:29 +0100
Message-ID: <20190103155529.11335-1-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Originating-IP: [172.20.20.106]
X-ClientProxiedBy: CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) To
	CIT-HM8-EX01.bmw-carit.intra (10.40.100.13)
Subject: [PATCH] update-alternatives.bbclass: Stabilize iteration order
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
X-List-Received-Date: Thu, 03 Jan 2019 16:00:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The use of a dictionary for link_rename causes problems for higher-order
alternatives, i.e. when an alternative link points to another
alternative link, since these links must be processed in the order in
which they were originally added for symlink correction to work.

Switch from a dict to a list of tuples to ensure processing happens in
the original order.

Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>
---
 meta/classes/update-alternatives.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index ee66379933..1362274d4d 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -148,7 +148,7 @@ def apply_update_alternative_renames(d):
     pkgdest = d.getVar('PKGD')
     for pkg in (d.getVar('PACKAGES') or "").split():
         # If the src == dest, we know we need to rename the dest by appending ${BPN}
-        link_rename = {}
+        link_rename = []
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
             if not alt_link:
@@ -174,7 +174,7 @@ def apply_update_alternative_renames(d):
                 elif os.path.lexists(src):
                     if os.path.islink(src):
                         # Delay rename of links
-                        link_rename[alt_target] = alt_target_rename
+                        link_rename.append((alt_target, alt_target_rename))
                     else:
                         bb.note('%s: Rename %s -> %s' % (pn, alt_target, alt_target_rename))
                         os.rename(src, dest)
@@ -185,22 +185,21 @@ def apply_update_alternative_renames(d):
 
         # Process delayed link names
         # Do these after other renames so we can correct broken links
-        for alt_target in link_rename:
+        for (alt_target, alt_target_rename) in link_rename:
             src = '%s/%s' % (pkgdest, alt_target)
-            dest = '%s/%s' % (pkgdest, link_rename[alt_target])
-            link = os.readlink(src)
+            dest = '%s/%s' % (pkgdest, alt_target_rename)
             link_target = oe.path.realpath(src, pkgdest, True)
 
             if os.path.lexists(link_target):
                 # Ok, the link_target exists, we can rename
-                bb.note('%s: Rename (link) %s -> %s' % (pn, alt_target, link_rename[alt_target]))
+                bb.note('%s: Rename (link) %s -> %s' % (pn, alt_target, alt_target_rename))
                 os.rename(src, dest)
             else:
                 # Try to resolve the broken link to link.${BPN}
                 link_maybe = '%s.%s' % (os.readlink(src), pn)
                 if os.path.lexists(os.path.join(os.path.dirname(src), link_maybe)):
                     # Ok, the renamed link target exists.. create a new link, and remove the original
-                    bb.note('%s: Creating new link %s -> %s' % (pn, link_rename[alt_target], link_maybe))
+                    bb.note('%s: Creating new link %s -> %s' % (pn, alt_target_rename, link_maybe))
                     os.symlink(link_maybe, dest)
                     os.unlink(src)
                 else:
-- 
2.19.2


