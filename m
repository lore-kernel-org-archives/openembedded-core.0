Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RveCI-0001OL-EE for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 01:18:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A0Abuq024131
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:10:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22429-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:10:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A0AUXB024125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:10:30 GMT
Message-ID: <1328832638.10451.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 00:10:38 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Optimise the per file rpm handling
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
X-List-Received-Date: Fri, 10 Feb 2012 00:18:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently a process was being forked off for each individual file
this class wanted to inspect with rpmdeps. This converts it to use
rpmdeps-oecore which allows batch processing of these dependencies.

For do_package for perl, this reduced the time by about 1 minute (33%).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 348c13c..dfabcf8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1125,7 +1125,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps-oecore --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
 
 # Collect perfile run-time dependency metadata
 # Output:
@@ -1136,7 +1136,7 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NA
 #  FILERDEPENDS_filepath_pkg - per file dep
 
 python package_do_filedeps() {
-	import os, re
+	import re, subprocess
 
 	pkgdest = d.getVar('PKGDEST', True)
 	packages = d.getVar('PACKAGES', True)
@@ -1145,39 +1145,49 @@ python package_do_filedeps() {
 	r = re.compile(r'[<>=]+ +[^ ]*')
 
 	# Quick routine to process the results of the rpmdeps call...
-	def process_deps(pipe, pkg, f, provides_files, requires_files):
-		provides = []
-		requires = []
-		file = f.replace(pkgdest + "/" + pkg, "")
-		file = file.replace("@", "@at@")
-		file = file.replace(" ", "@space@")
-		file = file.replace("\t", "@tab@")
-		file = file.replace("[", "@openbrace@")
-		file = file.replace("]", "@closebrace@")
-		file = file.replace("_", "@underscore@")
+	def process_deps(pipe, pkg, provides_files, requires_files):
+		provides = {}
+		requires = {}
 
 		for line in pipe:
+			f = line.split(" ", 1)[0].strip()
+			line = line.split(" ", 1)[1].strip()
+
 			if line.startswith("Requires:"):
 				i = requires
 			elif line.startswith("Provides:"):
 				i = provides
 			else:
 				continue
+
+			file = f.replace(pkgdest + "/" + pkg, "")
+			file = file.replace("@", "@at@")
+			file = file.replace(" ", "@space@")
+			file = file.replace("\t", "@tab@")
+			file = file.replace("[", "@openbrace@")
+			file = file.replace("]", "@closebrace@")
+			file = file.replace("_", "@underscore@")
 			value = line.split(":", 1)[1].strip()
 			value = r.sub(r'(\g<0>)', value)
+
 			if value.startswith("rpmlib("):
 				continue
-			i.append(value)
+			if file not in i:
+				i[file] = []
+			i[file].append(value)
 
-		if len(provides) > 0:
+		for file in provides:
 			provides_files.append(file)
 			key = "FILERPROVIDES_" + file + "_" + pkg
-			d.setVar(key, " ".join(provides))
+			d.setVar(key, " ".join(provides[file]))
 
-		if len(requires) > 0:
+		for file in requires:
 			requires_files.append(file)
 			key = "FILERDEPENDS_" + file + "_" + pkg
-			d.setVar(key, " ".join(requires))
+			d.setVar(key, " ".join(requires[file]))
+
+	def chunks(files, n):
+		return [files[i:i+n] for i in range(0, len(files), n)]
 
 	# Determine dependencies
 	for pkg in packages.split():
@@ -1186,13 +1196,15 @@ python package_do_filedeps() {
 
 		provides_files = []
 		requires_files = []
+		rpfiles = []
 		for root, dirs, files in os.walk(pkgdest + "/" + pkg):
 			for file in files:
-				f = os.path.join(root, file)
+				rpfiles.append(os.path.join(root, file))
 
-				dep_pipe = os.popen(rpmdeps + " --provides --requires -v " + f)
+		for files in chunks(rpfiles, 100):
+			dep_pipe = os.popen(rpmdeps + " " + " ".join(files))
 
-				process_deps(dep_pipe, pkg, f, provides_files, requires_files)
+			process_deps(dep_pipe, pkg, provides_files, requires_files)
 
 		d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files))
 		d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files))
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f35779d..5fb436e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -216,9 +216,9 @@ python package_do_filedeps_append () {
 	# Load/backup original set
 	filerprovides = d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
 
-	dep_pipe = os.popen('sed -e "s,^,Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox_links))
+	dep_pipe = os.popen('sed -e "s,^,%s/%s%s Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox, pkgdest, pkg, f_busybox_links))
 
-	process_deps(dep_pipe, pkg, "%s/%s%s" % (pkgdest, pkg, f_busybox), provides_files, requires_files)
+	process_deps(dep_pipe, pkg, provides_files, requires_files)
 
 	# Add the new set
 	filerprovides += d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""



