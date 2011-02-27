Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcy9-0007Da-1f
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:13 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:51 -0800 (PST)
Received: by 10.227.54.197 with SMTP id r5mr273792wbg.145.1298798991757;
	Sun, 27 Feb 2011 01:29:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm2267185wbd.17.2011.02.27.01.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:26 +0100
Message-Id: <992c90f00632475c2f9cc7f3328013317e3f8798.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 19/50] package.bbclass: Ensure dependency version information is preserved
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

[BUGID #176]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   32 +++++++++++++++++---------------
 1 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2f3e9bf..02c2dd3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -478,7 +478,8 @@ python populate_packages () {
 					dangling_links[pkg].append(os.path.normpath(target))
 
 	for pkg in package_list:
-		rdepends = bb.utils.explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, True) or bb.data.getVar('RDEPENDS', d, True) or "")
+		rdepends = bb.utils.explode_dep_versions(bb.data.getVar('RDEPENDS_' + pkg, d, True) or bb.data.getVar('RDEPENDS', d, True) or "")
+
 		for l in dangling_links[pkg]:
 			found = False
 			bb.debug(1, "%s contains dangling link %s" % (pkg, l))
@@ -489,12 +490,12 @@ python populate_packages () {
 						bb.debug(1, "target found in %s" % p)
 						if p == pkg:
 							break
-						if not p in rdepends:
-							rdepends.append(p)
+						if p not in rdepends:
+							rdepends[p] = ""
 						break
 			if found == False:
 				bb.note("%s contains dangling symlink to %s" % (pkg, l))
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+		bb.data.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False), d)
 }
 populate_packages[dirs] = "${D}"
 
@@ -955,7 +956,8 @@ python package_do_pkgconfig () {
 python read_shlibdeps () {
 	packages = bb.data.getVar('PACKAGES', d, True).split()
 	for pkg in packages:
-		rdepends = bb.utils.explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
+		rdepends = bb.utils.explode_dep_versions(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
+
 		for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
 			depsfile = bb.data.expand("${PKGDEST}/" + pkg + extension, d)
 			if os.access(depsfile, os.R_OK):
@@ -963,8 +965,8 @@ python read_shlibdeps () {
 				lines = fd.readlines()
 				fd.close()
 				for l in lines:
-					rdepends.append(l.rstrip())
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+					rdepends[l.rstrip()] = ""
+		bb.data.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False), d)
 }
 
 python package_depchains() {
@@ -988,7 +990,7 @@ python package_depchains() {
 	def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
 
 		#bb.note('depends for %s is %s' % (base, depends))
-		rreclist = bb.utils.explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, True) or bb.data.getVar('RRECOMMENDS', d, True) or "")
+		rreclist = bb.utils.explode_dep_versions(bb.data.getVar('RRECOMMENDS_' + pkg, d, True) or bb.data.getVar('RRECOMMENDS', d, True) or "")
 
 		for depend in depends:
 			if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
@@ -1000,16 +1002,16 @@ python package_depchains() {
 				depend = depend.replace('-dbg', '')
 			pkgname = getname(depend, suffix)
 			#bb.note("Adding %s for %s" % (pkgname, depend))
-			if not pkgname in rreclist:
-				rreclist.append(pkgname)
+			if pkgname not in rreclist:
+				rreclist[pkgname] = ""
 
 		#bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
-		bb.data.setVar('RRECOMMENDS_%s' % pkg, ' '.join(rreclist), d)
+		bb.data.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False), d)
 
 	def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
 
 		#bb.note('rdepends for %s is %s' % (base, rdepends))
-		rreclist = bb.utils.explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, True) or bb.data.getVar('RRECOMMENDS', d, True) or "")
+		rreclist = bb.utils.explode_dep_versions(bb.data.getVar('RRECOMMENDS_' + pkg, d, True) or bb.data.getVar('RRECOMMENDS', d, True) or "")
 
 		for depend in rdepends:
 			if depend.find('virtual-locale-') != -1:
@@ -1021,11 +1023,11 @@ python package_depchains() {
 				depend = depend.replace('-dbg', '')
 			pkgname = getname(depend, suffix)
 			#bb.note("Adding %s for %s" % (pkgname, depend))
-			if not pkgname in rreclist:
-				rreclist.append(pkgname)
+			if pkgname not in rreclist:
+				rreclist[pkgname] = ""
 
 		#bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
-		bb.data.setVar('RRECOMMENDS_%s' % pkg, ' '.join(rreclist), d)
+		bb.data.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False), d)
 
 	def add_dep(list, dep):
 		dep = dep.split(' (')[0].strip()
-- 
1.6.6.1



