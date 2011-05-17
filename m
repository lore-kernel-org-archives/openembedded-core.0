Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMH3n-0007SJ-9X for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:59:27 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMGbi-0004V5-51
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:30:26 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 10:56:35 +0100
Message-ID: <1305626195.2429.176.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [patch] backport USE_LDCONFIG and PACKAGE_SNAP_LIB_SYMLINKS from oe master
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
X-List-Received-Date: Tue, 17 May 2011 09:59:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a backport of the corresponding package.bbclass functionality
(which is needed by micro) from the openembedded tree. 

p.

From 01e01d38d57d7c766cc1e9a547c73abd4065e1c1 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Fri, 13 May 2011 14:07:26 +0100
Subject: [PATCH] package.bbclass: backport USE_LDCONFIG and PACKAGE_SNAP_SYMLINKS from oe master

---
 meta/classes/package.bbclass |   34 +++++++++++++++++++++++++++-------
 1 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 082f233..4eb349d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -933,12 +933,17 @@ python package_do_shlibs() {
 			if m:
 				needed[pkg].append(m.group(1))
 			m = re.match("\s+SONAME\s+([^\s]*)", l)
-			if m and not m.group(1) in sonames:
-				# if library is private (only used by package) then do not build shlib for it
-				if not private_libs or -1 == private_libs.find(m.group(1)):
-					sonames.append(m.group(1))
-			if m and libdir_re.match(root):
-				needs_ldconfig = True
+			if m:
+				this_soname = m.group(1)
+				if not this_soname in sonames:
+					# if library is private (only used by package) then do not build shlib for it
+					if not private_libs or -1 == private_libs.find(this_soname):
+						sonames.append(this_soname)
+				if libdir_re.match(root):
+					needs_ldconfig = True
+				if snap_symlinks and (file != this_soname):
+					renames.append((os.path.join(root, file), os.path.join(root, this_soname)))
+
 	def darwin_so(root, path, file):
 		fullpath = os.path.join(root, file)
 		if not os.path.exists(fullpath):
@@ -1000,6 +1005,17 @@ python package_do_shlibs() {
 							if name:
 								needed[pkg].append(name)
 								#bb.note("Adding %s for %s" % (name, pkg))
+
+	if bb.data.getVar('PACKAGE_SNAP_LIB_SYMLINKS', d, True) == "1":
+		snap_symlinks = True
+	else:
+		snap_symlinks = False
+
+	if (bb.data.getVar('USE_LDCONFIG', d, True) or "1") == "1":
+		use_ldconfig = True
+	else:
+		use_ldconfig = False
+
 	needed = {}
 	shlib_provider = {}
 	private_libs = bb.data.getVar('PRIVATE_LIBS', d, True)
@@ -1009,6 +1025,7 @@ python package_do_shlibs() {
 
 		needed[pkg] = []
 		sonames = list()
+		renames = list()
 		top = os.path.join(pkgdest, pkg)
 		for root, dirs, files in os.walk(top):
 			for file in files:
@@ -1020,6 +1037,9 @@ python package_do_shlibs() {
 					darwin_so(root, dirs, file)
 				elif os.access(path, os.X_OK) or lib_re.match(file):
 					linux_so(root, dirs, file)
+		for (old, new) in renames:
+		    	bb.note("Renaming %s to %s" % (old, new))
+			os.rename(old, new)
 		shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
 		shver_file = os.path.join(shlibswork_dir, pkg + ".ver")
 		if len(sonames):
@@ -1031,7 +1051,7 @@ python package_do_shlibs() {
 			fd = open(shver_file, 'w')
 			fd.write(ver + '\n')
 			fd.close()
-		if needs_ldconfig:
+		if needs_ldconfig and use_ldconfig:
 			bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
 			postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, True) or bb.data.getVar('pkg_postinst', d, True)
 			if not postinst:
-- 
1.7.1





