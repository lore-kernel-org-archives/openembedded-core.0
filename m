Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut0-0001jG-DT
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQeO6026913
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:09 -0500
Message-ID: <abbc4037f2e4206a877be42be6ca5c132dbfef01.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 01/30] update-alternatives.bbclass: Refactor the implementation
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
X-List-Received-Date: Tue, 22 May 2012 19:36:50 -0000
Content-Type: text/plain

Refactor in order to:
  * Deprecate the old interfaces, but keep them for compatibility
  * Provide a new, interface -- capable of working with split packages
  * Each update-alternative will not set proper "per-file" provides

Note: this adds a warning message when the older deprecated behavior is
used.  The older behavior has been fully tested using oe-core.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass             |   16 +-
 meta/classes/package_rpm.bbclass         |    4 -
 meta/classes/update-alternatives.bbclass |  344 ++++++++++++++++++++++++------
 3 files changed, 293 insertions(+), 71 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6fba5b6..1b776ae 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1156,6 +1156,15 @@ python package_do_filedeps() {
 	rpmdeps = d.expand("${RPMDEPS}")
 	r = re.compile(r'[<>=]+ +[^ ]*')
 
+	def file_translate(file):
+		ft = file.replace("@", "@at@")
+		ft = ft.replace(" ", "@space@")
+		ft = ft.replace("\t", "@tab@")
+		ft = ft.replace("[", "@openbrace@")
+		ft = ft.replace("]", "@closebrace@")
+		ft = ft.replace("_", "@underscore@")
+		return ft
+
 	# Quick routine to process the results of the rpmdeps call...
 	def process_deps(pipe, pkg, provides_files, requires_files):
 		provides = {}
@@ -1173,12 +1182,7 @@ python package_do_filedeps() {
 				continue
 
 			file = f.replace(pkgdest + "/" + pkg, "")
-			file = file.replace("@", "@at@")
-			file = file.replace(" ", "@space@")
-			file = file.replace("\t", "@tab@")
-			file = file.replace("[", "@openbrace@")
-			file = file.replace("]", "@closebrace@")
-			file = file.replace("_", "@underscore@")
+			file = file_translate(file)
 			value = line.split(":", 1)[1].strip()
 			value = r.sub(r'(\g<0>)', value)
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2da7a8b..df2b884 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -710,10 +710,6 @@ python write_specfile () {
 		splitrconflicts  = strip_multilib(localdata.getVar('RCONFLICTS', True), d) or ""
 		splitrobsoletes  = []
 
-		# For now we need to manually supplement RPROVIDES with any update-alternatives links
-		if pkg == d.getVar("PN", True):
-			splitrprovides = splitrprovides + " " + (d.getVar('ALTERNATIVE_LINK', True) or '') + " " + (d.getVar('ALTERNATIVE_LINKS', True) or '')
-
 		# Gather special src/first package data
 		if srcname == splitname:
 			srcrdepends    = splitrdepends
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 7b0518d..e235299 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -3,6 +3,68 @@
 # command directly in your recipe, but in most cases this class simplifies
 # that job.
 #
+# To use this class a number of variables should be defined:
+#
+# List all of the alternatives needed by a package:
+# ALTERNATIVE_<pkg> = "name1 name2 name3 ..."
+#
+#   i.e. ALTERNATIVE_busybox = "sh sed test bracket"
+#
+# The pathname of the link
+# ALTERNATIVE_LINK_NAME[name] = "target"
+#
+#   This is the name of the binary once it's been installed onto the runtime.
+#   This name is global to all split packages in this recipe, and should match
+#   other recipes with the same functionality.
+#   i.e. ALTERNATIVE_LINK_NAME[bracket] = "/usr/bin/["
+#
+# NOTE: If ALTERNATIVE_LINK_NAME is not defined, it defaults to ${bindir}/name
+#
+# The default link to create for all targets
+# ALTERNATIVE_TARGET = "target"
+#
+#   This is useful in a multicall binary case
+#   i.e. ALTERNATIVE_TARGET = "/bin/busybox"
+#
+# A non-default link to create for a target
+# ALTERNATIVE_TARGET[name] = "target"
+#
+#   This is the name of the binary as it's been install by do_install
+#   i.e. ALTERNATIVE_TARGET[sh] = "/bin/bash"
+#
+# A package specific link for a target
+# ALTERNATIVE_TARGET_<pkg>[name] = "target"
+#
+#   This is useful when a recipe provides multiple alternatives for the
+#   same item.
+#
+# NOTE: If ALTERNATIVE_TARGET is not defined, it will inherit the value
+# from ALTERNATIVE_LINK_NAME.
+#
+# NOTE: If the ALTERNATIVE_LINK_NAME and ALTERNATIVE_TARGET are the same,
+# ALTERNATIVE_TARGET will have '.{PN}' appended to it.  If the file
+# referenced has not been renamed, it will also be renamed.  (This avoids
+# the need to rename alternative files in the do_install step, but still
+# supports it if necessary for some reason.)
+#
+# The default priority for any alternatives
+# ALTERNATIVE_PRIORITY = "priority"
+#
+#   i.e. default is ALTERNATIVE_PRIORITY = "10"
+#
+# The non-default priority for a specific target
+# ALTERNATIVE_PRIORITY[name] = "priority"
+#
+# The package priority for a specific target
+# ALTERNATIVE_PRIORITY_<pkg>[name] = "priority"
+#
+#
+# -----
+#
+#
+# The following describes deprecated behavior, using any of the
+# following modes will result in a warning, and eventually an error:
+#
 # There are two basic modes supported: 'single update' and 'batch update'
 #
 # 'single update' is used for a single alternative command, and you're
@@ -38,79 +100,239 @@
 
 # defaults
 ALTERNATIVE_PRIORITY = "10"
-ALTERNATIVE_LINK = "${bindir}/${ALTERNATIVE_NAME}"
-
-update_alternatives_postinst() {
-update-alternatives --install ${ALTERNATIVE_LINK} ${ALTERNATIVE_NAME} ${ALTERNATIVE_PATH} ${ALTERNATIVE_PRIORITY}
-}
-
-update_alternatives_postrm() {
-update-alternatives --remove ${ALTERNATIVE_NAME} ${ALTERNATIVE_PATH}
-}
-
-# for batch alternatives, we use a simple approach to require only one parameter
-# with the rest of the info deduced implicitly
-update_alternatives_batch_postinst() {
-for link in ${ALTERNATIVE_LINKS}
-do
-	name=`basename ${link}`
-	path=${link}.${PN}
-	update-alternatives --install ${link} ${name} ${path} ${ALTERNATIVE_PRIORITY}
-done
-}
-
-update_alternatives_batch_postrm() {
-for link in ${ALTERNATIVE_LINKS}
-do
-	name=`basename ${link}`
-	path=${link}.${PN}
-	update-alternatives --remove ${name} $path
-done
-}
-
-update_alternatives_batch_doinstall() {
-	for link in ${ALTERNATIVE_LINKS}
-	do
-		mv ${D}${link} ${D}${link}.${PN}
-	done
-}
 
+# The following code is deprecated, but included for compatibility with older packages
 def update_alternatives_after_parse(d):
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d):
         return
 
+    # The following code is deprecated, but included for compatibility with older packages
+    pn = d.getVar('PN', True)
+
     if d.getVar('ALTERNATIVE_LINKS') != None:
-        doinstall = d.getVar('do_install', 0)
-        doinstall += d.getVar('update_alternatives_batch_doinstall', 0)
-        d.setVar('do_install', doinstall)
+        # Convert old format to new format...
+        alt_links = d.getVar('ALTERNATIVE_LINKS', True) or ""
+        for alt_link in alt_links.split():
+        	alt_name = os.path.basename(alt_link)
+
+        	alternative = d.getVar('ALTERNATIVE_%s' % pn, True) or ""
+        	alternative += " " + alt_name
+        	d.setVar('ALTERNATIVE_%s' % pn, alternative)
+        	d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
+        	d.setVarFlag('ALTERNATIVE_TARGET', alt_name, alt_link)
         return
 
-    if d.getVar('ALTERNATIVE_NAME') == None:
-        raise bb.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE')
-    if d.getVar('ALTERNATIVE_PATH') == None:
-        raise bb.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_PATH" % d.getVar('FILE')
+    if d.getVar('ALTERNATIVE_NAME') != None or d.getVar('ALTERNATIVE_PATH') != None:
+        # Convert old format to new format...
+        alt_name = d.getVar('ALTERNATIVE_NAME', True)
+        alt_path = d.getVar('ALTERNATIVE_PATH', True)
+        alt_link = d.getVar('ALTERNATIVE_LINK', True) or ("%s/%s" % (d.getVar('bindir', True), alt_name))
+        if alt_name == None:
+        	raise bb.build.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE')
+        if alt_path == None:
+        	raise bb.build.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_PATH" % d.getVar('FILE')
+
+        alternative = d.getVar('ALTERNATIVE_%s' % pn, True) or ""
+        alternative += " " + alt_name
+
+	# Fix the alt_path if it's relative
+	alt_path = os.path.join(os.path.dirname(alt_link), alt_path)
+
+        d.setVar('ALTERNATIVE_%s' % pn, alternative)
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
+        d.setVarFlag('ALTERNATIVE_TARGET', alt_name, alt_path)
+
+
+# We need special processing for vardeps because it can not work on
+# modified flag values.  So we agregate the flags into a new variable
+# and include that vairable in the set.
+
+UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
+
+def gen_updatealternativesvardeps(d):
+   pkgs = (d.getVar("PACKAGES", True) or "").split()
+   vars = (d.getVar("UPDALTVARS", True) or "").split()
+
+   # First compute them for non_pkg versions
+   for v in vars:
+      for flag in (d.getVarFlags(v) or {}):
+         if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
+            continue
+         d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFlag(v, flag, False)))
+
+   for p in pkgs:
+      for v in vars:
+         for flag in (d.getVarFlags("%s_%s" % (v,p)) or {}):
+            if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
+               continue
+            d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
 
 python __anonymous() {
+    # deprecated stuff...
     update_alternatives_after_parse(d)
+
+    # compute special vardeps
+    gen_updatealternativesvardeps(d)
+}
+
+def gen_updatealternativesvars(d):
+   ret = []
+   pkgs = (d.getVar("PACKAGES", True) or "").split()
+   vars = (d.getVar("UPDALTVARS", True) or "").split()
+
+   for v in vars:
+      ret.append(v + "_VARDEPS")
+
+   for p in pkgs:
+      for v in vars:
+         ret.append(v + "_" + p)
+         ret.append(v + "_VARDEPS_" + p)
+   return " ".join(ret)
+
+# First the deprecated items...
+populate_packages[vardeps] += "ALTERNATIVE_LINKS ALTERNATIVE_NAME ALTERNATIVE_PATH"
+
+# Now the new stuff, we use a custom function to generate the right values
+populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
+
+# We need to do the rename after the image creation step, but before
+# the split and strip steps..  packagecopy seems to be the earliest reasonable
+# place.
+python perform_packagecopy_append () {
+	# Check for deprecated usage...
+	pn = d.getVar('PN', True)
+	if d.getVar('ALTERNATIVE_LINKS', True) != None:
+		bb.warn('%s: Use of ALTERNATIVE_LINKS is deprecated, see update-alternatives.bbclass for more info.' % pn)
+
+    	if d.getVar('ALTERNATIVE_NAME', True) != None or d.getVar('ALTERNATIVE_PATH', True) != None:
+		bb.warn('%s: Use of ALTERNATIVE_NAME is deprecated, see update-alternatives.bbclass for more info.' % pn)
+
+	# Do actual update alternatives processing
+	pkgdest = d.getVar('PKGD', True)
+	for pkg in (d.getVar('PACKAGES', True) or "").split():
+		# If the src == dest, we know we need to rename the dest by appending ${PN}
+		link_rename = {}
+		for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
+			alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
+			if not alt_link:
+				alt_link = "%s/%s" % (d.getVar('bindir', True), alt_name)
+				d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
+
+			alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
+			alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
+			# Sometimes alt_target is specified as relative to the link name.
+			alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
+
+			# If the link and target are the same name, we need to rename the target.
+			if alt_link == alt_target:
+				src = '%s/%s' % (pkgdest, alt_target)
+				alt_target_rename = '%s.%s' % (alt_target, pn)
+				dest = '%s/%s' % (pkgdest, alt_target_rename)
+				if os.path.lexists(dest):
+					bb.note('%s: Already renamed: %s' % (pn, alt_target_rename))
+				elif os.path.lexists(src):
+					if os.path.islink(src):
+						# Delay rename of links
+						link_rename[alt_target] = alt_target_rename
+					else:
+						bb.note('%s: Rename %s -> %s' % (pn, alt_target, alt_target_rename))
+						os.rename(src, dest)
+				else:
+					bb.warn("%s: alternative target (%s or %s) does not exist, skipping..." % (pn, alt_target, alt_target_rename))
+					continue
+				d.setVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, alt_target_rename)
+
+		# Process delayed link names
+		# Do these after other renames so we can correct broken links
+		for alt_target in link_rename:
+			src = '%s/%s' % (pkgdest, alt_target)
+			dest = '%s/%s' % (pkgdest, link_rename[alt_target])
+			link_target = os.path.join(os.path.dirname(src), os.readlink(src))
+
+			if os.path.lexists(link_target):
+				# Ok, the link_target exists, we can rename
+				bb.note('%s: Rename (link) %s -> %s' % (pn, alt_target, link_rename[alt_target]))
+				os.rename(src, dest)
+			else:
+				# Try to resolve the broken link to link.${PN}
+				link_maybe = '%s.%s' % (os.readlink(src), pn)
+				if os.path.lexists(os.path.join(os.path.dirname(src), link_maybe)):
+					# Ok, the renamed link target exists.. create a new link, and remove the original
+					bb.note('%s: Creating new link %s -> %s' % (pn, link_rename[alt_target], link_maybe))
+					os.symlink(link_maybe, dest)
+					os.unlink(src)
+				else:
+					bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
 }
 
 python populate_packages_prepend () {
-	pkg = d.getVar('PN', True)
-	bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
-	postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
-	if not postinst:
-		postinst = '#!/bin/sh\n'
-	if d.getVar('ALTERNATIVE_LINKS') != None:
-		postinst += d.getVar('update_alternatives_batch_postinst', True)
-	else:
-		postinst += d.getVar('update_alternatives_postinst', True)
-	d.setVar('pkg_postinst_%s' % pkg, postinst)
-	postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
-	if not postrm:
-		postrm = '#!/bin/sh\n'
-	if d.getVar('ALTERNATIVE_LINKS') != None:
-		postrm += d.getVar('update_alternatives_batch_postrm', True)
-	else:
-		postrm += d.getVar('update_alternatives_postrm', True)
-	d.setVar('pkg_postrm_%s' % pkg, postrm)
+	pn = d.getVar('BPN', True)
+
+	# Do actual update alternatives processing
+	pkgdest = d.getVar('PKGD', True)
+	for pkg in (d.getVar('PACKAGES', True) or "").split():
+		# Create post install/removal scripts
+		alt_setup_links = ""
+		alt_remove_links = ""
+		for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
+			alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
+			alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
+			alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
+			# Sometimes alt_target is specified as relative to the link name.
+			alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
+
+			alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name, True) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name, True)
+			alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg, True) or d.getVar('ALTERNATIVE_PRIORITY', True)
+
+			# This shouldn't trigger, as it should have been resolved earlier!
+			if alt_link == alt_target:
+				bb.note('alt_link == alt_target: %s == %s -- correcting, this should not happen!' % (alt_link, alt_target))
+				alt_target = '%s.%s' % (alt_target, pn)
+
+			if not os.path.lexists('%s/%s' % (pkgdest, alt_target)):
+				bb.warn('%s: NOT adding alternative provide %s: %s does not exist' % (pn, alt_link, alt_target))
+				continue
+
+			# Default to generate shell script.. eventually we may want to change this...
+			alt_target = os.path.relpath(alt_target, os.path.dirname(alt_link))
+
+			alt_setup_links  += '	update-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
+			alt_remove_links += '	update-alternatives --remove  %s %s\n' % (alt_name, alt_target)
+
+		if alt_setup_links:
+			bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
+			bb.note('%s' % alt_setup_links)
+			postinst = (d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)) or '#!/bin/sh\n'
+			postinst += alt_setup_links
+			d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+			bb.note('%s' % alt_remove_links)
+			postrm = (d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)) or '#!/bin/sh\n'
+			postrm += alt_remove_links
+			d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
+
+python package_do_filedeps_append () {
+	pn = d.getVar('PN', True)
+	pkgdest = d.getVar('PKGDEST', True)
+
+	for pkg in packages.split():
+		for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split():
+			alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
+			alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
+			alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
+
+			if alt_link == alt_target:
+				bb.warn('alt_link == alt_target: %s == %s' % (alt_link, alt_target))
+				alt_target = '%s.%s' % (alt_target, pn)
+
+			if not os.path.lexists('%s/%s/%s' % (pkgdest, pkg, alt_target)):
+				continue
+
+			# Add file provide
+			trans_target = file_translate(alt_target)
+			d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + alt_link)
+			if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or ""):
+				d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
+}
+
-- 
1.7.3.4



