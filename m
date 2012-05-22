Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut0-0001jI-Ny
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQfgq017886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:10 -0500
Message-ID: <9aab5330fce6de2b95959ec28e0ecb7484b6d284.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 02/30] update-alternatives.bbclass: Change from using PN to BPN
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2012 19:36:51 -0000
Content-Type: text/plain

In order to better support multilib processing, switch from PN
to BPN.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/update-alternatives.bbclass |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index e235299..fce1e84 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -42,7 +42,7 @@
 # from ALTERNATIVE_LINK_NAME.
 #
 # NOTE: If the ALTERNATIVE_LINK_NAME and ALTERNATIVE_TARGET are the same,
-# ALTERNATIVE_TARGET will have '.{PN}' appended to it.  If the file
+# ALTERNATIVE_TARGET will have '.{BPN}' appended to it.  If the file
 # referenced has not been renamed, it will also be renamed.  (This avoids
 # the need to rename alternative files in the do_install step, but still
 # supports it if necessary for some reason.)
@@ -91,8 +91,8 @@
 # listed in ALTERNATIVE_LINKS, say /path/cmd:
 #
 #     the name of the alternative would be: cmd
-#     the path of installed alternative would be: /path/cmd.${PN}
-#     ${D}/path/cmd will be renamed to ${D}/path/cmd.{PN} automatically
+#     the path of installed alternative would be: /path/cmd.${BPN}
+#     ${D}/path/cmd will be renamed to ${D}/path/cmd.{BPN} automatically
 #     priority will be the same from ALTERNATIVE_PRIORITY
 #
 # If above assumption breaks your requirement, then you still need to use
@@ -107,7 +107,7 @@ def update_alternatives_after_parse(d):
         return
 
     # The following code is deprecated, but included for compatibility with older packages
-    pn = d.getVar('PN', True)
+    pn = d.getVar('BPN', True)
 
     if d.getVar('ALTERNATIVE_LINKS') != None:
         # Convert old format to new format...
@@ -200,7 +200,7 @@ populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
 # place.
 python perform_packagecopy_append () {
 	# Check for deprecated usage...
-	pn = d.getVar('PN', True)
+	pn = d.getVar('BPN', True)
 	if d.getVar('ALTERNATIVE_LINKS', True) != None:
 		bb.warn('%s: Use of ALTERNATIVE_LINKS is deprecated, see update-alternatives.bbclass for more info.' % pn)
 
@@ -210,7 +210,7 @@ python perform_packagecopy_append () {
 	# Do actual update alternatives processing
 	pkgdest = d.getVar('PKGD', True)
 	for pkg in (d.getVar('PACKAGES', True) or "").split():
-		# If the src == dest, we know we need to rename the dest by appending ${PN}
+		# If the src == dest, we know we need to rename the dest by appending ${BPN}
 		link_rename = {}
 		for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
 			alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
@@ -254,7 +254,7 @@ python perform_packagecopy_append () {
 				bb.note('%s: Rename (link) %s -> %s' % (pn, alt_target, link_rename[alt_target]))
 				os.rename(src, dest)
 			else:
-				# Try to resolve the broken link to link.${PN}
+				# Try to resolve the broken link to link.${BPN}
 				link_maybe = '%s.%s' % (os.readlink(src), pn)
 				if os.path.lexists(os.path.join(os.path.dirname(src), link_maybe)):
 					# Ok, the renamed link target exists.. create a new link, and remove the original
@@ -313,7 +313,7 @@ python populate_packages_prepend () {
 }
 
 python package_do_filedeps_append () {
-	pn = d.getVar('PN', True)
+	pn = d.getVar('BPN', True)
 	pkgdest = d.getVar('PKGDEST', True)
 
 	for pkg in packages.split():
-- 
1.7.3.4



