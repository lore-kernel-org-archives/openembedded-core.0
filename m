Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4q-0008G8-FZ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0Df2008226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:13 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:13 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:36 -0600
Message-ID: <47cd6c268de1cf4a073991907f89bf0106a248b5.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 04/22] package_rpm.bbclass: Add the runtime dependencies to the pre/post scriptlets
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:36 -0000
Content-Type: text/plain

When the scriptlets are processed in RPM, they have a different dependency
set then the core package.  OE has no way to specify dependencies for the
pre/post scriptlists, so we simply make the runtime dependencies scriptlets
as well.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   86 ++++++++++++++++++++++++--------------
 1 files changed, 55 insertions(+), 31 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1ff92ce..200a941 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -730,10 +730,10 @@ python write_specfile () {
     srcrconflicts  = []
     srcrobsoletes  = []
 
-    srcpreinst  = []
-    srcpostinst = []
-    srcprerm    = []
-    srcpostrm   = []
+    srcrpreinst  = []
+    srcrpostinst = []
+    srcrprerm    = []
+    srcrpostrm   = []
 
     spec_preamble_top = []
     spec_preamble_bottom = []
@@ -792,6 +792,11 @@ python write_specfile () {
         splitrconflicts  = strip_multilib_deps(localdata.getVar('RCONFLICTS', True), d)
         splitrobsoletes  = []
 
+        splitrpreinst  = localdata.getVar('pkg_preinst', True)
+        splitrpostinst = localdata.getVar('pkg_postinst', True)
+        splitrprerm    = localdata.getVar('pkg_prerm', True)
+        splitrpostrm   = localdata.getVar('pkg_postrm', True)
+
         # Gather special src/first package data
         if srcname == splitname:
             srcrdepends    = splitrdepends
@@ -801,10 +806,10 @@ python write_specfile () {
             srcrreplaces   = splitrreplaces
             srcrconflicts  = splitrconflicts
 
-            srcpreinst  = localdata.getVar('pkg_preinst', True)
-            srcpostinst = localdata.getVar('pkg_postinst', True)
-            srcprerm    = localdata.getVar('pkg_prerm', True)
-            srcpostrm   = localdata.getVar('pkg_postrm', True)
+            srcrpreinst    = splitrpreinst
+            srcrpostinst   = splitrpostinst
+            srcrprerm      = splitrprerm
+            srcrpostrm     = splitrpostrm
 
             file_list = []
             walk_files(root, file_list, conffiles)
@@ -850,6 +855,15 @@ python write_specfile () {
         splitrprovides = bb.utils.join_deps(rprovides, commasep=False)
 
         print_deps(splitrdepends, "Requires", spec_preamble_bottom, d)
+        if splitrpreinst:
+            print_deps(splitrdepends, "Requires(pre)", spec_preamble_bottom, d)
+        if splitrpostinst:
+            print_deps(splitrdepends, "Requires(post)", spec_preamble_bottom, d)
+        if splitrprerm:
+            print_deps(splitrdepends, "Requires(preun)", spec_preamble_bottom, d)
+        if splitrpostrm:
+            print_deps(splitrdepends, "Requires(postun)", spec_preamble_bottom, d)
+
         # Suggests in RPM are like recommends in OE-core!
         print_deps(splitrrecommends, "Suggests", spec_preamble_bottom, d)
         # While there is no analog for suggests... (So call them recommends for now)
@@ -880,21 +894,22 @@ python write_specfile () {
         spec_preamble_bottom.append('')
 
         # Now process scriptlets
-        for script in ["preinst", "postinst", "prerm", "postrm"]:
-            scriptvar = localdata.getVar('pkg_%s' % script, True)
-            if not scriptvar:
-                continue
-            if script == 'preinst':
-                spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
-            elif script == 'postinst':
-                spec_scriptlets_bottom.append('%%post -n %s' % splitname)
-            elif script == 'prerm':
-                spec_scriptlets_bottom.append('%%preun -n %s' % splitname)
-                scriptvar = wrap_uninstall(scriptvar)
-            elif script == 'postrm':
-                spec_scriptlets_bottom.append('%%postun -n %s' % splitname)
-                scriptvar = wrap_uninstall(scriptvar)
-            spec_scriptlets_bottom.append('# %s - %s' % (splitname, script))
+        if splitrpreinst:
+            spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
+            spec_scriptlets_bottom.append(splitrpreinst)
+            spec_scriptlets_bottom.append('')
+        if splitrpostinst:
+            spec_scriptlets_bottom.append('%%post -n %s' % splitname)
+            spec_scriptlets_bottom.append(splitrpostinst)
+            spec_scriptlets_bottom.append('')
+        if splitrprerm:
+            spec_scriptlets_bottom.append('%%preun -n %s' % splitname)
+            scriptvar = wrap_uninstall(splitrprerm)
+            spec_scriptlets_bottom.append(scriptvar)
+            spec_scriptlets_bottom.append('')
+        if splitrpostrm:
+            spec_scriptlets_bottom.append('%%postun -n %s' % splitname)
+            scriptvar = wrap_uninstall(splitrpostrm)
             spec_scriptlets_bottom.append(scriptvar)
             spec_scriptlets_bottom.append('')
 
@@ -943,6 +958,15 @@ python write_specfile () {
 
     print_deps(srcdepends, "BuildRequires", spec_preamble_top, d)
     print_deps(srcrdepends, "Requires", spec_preamble_top, d)
+    if srcrpreinst:
+        print_deps(srcrdepends, "Requires(pre)", spec_preamble_top, d)
+    if srcrpostinst:
+        print_deps(srcrdepends, "Requires(post)", spec_preamble_top, d)
+    if srcrprerm:
+        print_deps(srcrdepends, "Requires(preun)", spec_preamble_top, d)
+    if srcrpostrm:
+        print_deps(srcrdepends, "Requires(postun)", spec_preamble_top, d)
+
     # Suggests in RPM are like recommends in OE-core!
     print_deps(srcrrecommends, "Suggests", spec_preamble_top, d)
     # While there is no analog for suggests... (So call them recommends for now)
@@ -972,26 +996,26 @@ python write_specfile () {
 
     spec_preamble_top.append('')
 
-    if srcpreinst:
+    if srcrpreinst:
         spec_scriptlets_top.append('%pre')
         spec_scriptlets_top.append('# %s - preinst' % srcname)
-        spec_scriptlets_top.append(srcpreinst)
+        spec_scriptlets_top.append(srcrpreinst)
         spec_scriptlets_top.append('')
-    if srcpostinst:
+    if srcrpostinst:
         spec_scriptlets_top.append('%post')
         spec_scriptlets_top.append('# %s - postinst' % srcname)
-        spec_scriptlets_top.append(srcpostinst)
+        spec_scriptlets_top.append(srcrpostinst)
         spec_scriptlets_top.append('')
-    if srcprerm:
+    if srcrprerm:
         spec_scriptlets_top.append('%preun')
         spec_scriptlets_top.append('# %s - prerm' % srcname)
-        scriptvar = wrap_uninstall(srcprerm)
+        scriptvar = wrap_uninstall(srcrprerm)
         spec_scriptlets_top.append(scriptvar)
         spec_scriptlets_top.append('')
-    if srcpostrm:
+    if srcrpostrm:
         spec_scriptlets_top.append('%postun')
         spec_scriptlets_top.append('# %s - postrm' % srcname)
-        scriptvar = wrap_uninstall(srcpostrm)
+        scriptvar = wrap_uninstall(srcrpostrm)
         spec_scriptlets_top.append(scriptvar)
         spec_scriptlets_top.append('')
 
-- 
1.7.3.4



