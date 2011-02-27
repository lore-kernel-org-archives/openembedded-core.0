Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyS-0007DK-BN
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:32 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:10 -0800 (PST)
Received: by 10.227.196.65 with SMTP id ef1mr3780901wbb.158.1298799010735;
	Sun, 27 Feb 2011 01:30:10 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f27sm2270354wbf.7.2011.02.27.01.30.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:45 +0100
Message-Id: <90d9dd3f162cafd06175259eb5a26b662ace0e86.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 34/50] package.bbclass: Rewrite package_do_filedeps() to reduce the amount of subprocesses created and improve speed
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:28 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   77 ++++++++++++++++++++++++------------------
 1 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c8adbb0..137de09 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -822,55 +822,66 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps"
 #  FILERDEPENDS_filepath_pkg - per file dep
 
 python package_do_filedeps() {
-	import os
+	import os, re
 
 	pkgdest = bb.data.getVar('PKGDEST', d, True)
 	packages = bb.data.getVar('PACKAGES', d, True)
 
-	cmd = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/perfile_rpmdeps.sh", d)
 	rpmdeps = bb.data.expand("${RPMDEPS}", d)
+	r = re.compile(r'[<>=]+ +[^ ]*')
 
 	# Quick routine to process the results of the rpmdeps call...
-	def process_deps(pipe, pkg, varname):
-		dep_files = ""
+	def process_deps(pipe, pkg, f, provides_files, requires_files):
+		provides = []
+		requires = []
+		file = f.replace(pkgdest + "/" + pkg, "")
+		file = file.replace("@", "@at@")
+		file = file.replace(" ", "@space@")
+		file = file.replace("\t", "@tab@")
+		file = file.replace("[", "@openbrace@")
+		file = file.replace("]", "@closebrace@")
+		file = file.replace("_", "@underscore@")
+
 		for line in pipe:
-			key = ""
-			value = ""
-			# We expect two items on each line
-			# 1 - filepath
-			# 2 - dep list
-			line_list = line.rstrip().split(None,1);
-			if len(line_list) <= 0 or len(line_list) > 2:
-				bb.error("deps list length error! " + len(line_list));
-			if len(line_list) == 2:
-				file = line_list[0];
-				value = line_list[1]
-				file = file.replace(pkgdest + "/" + pkg, "")
-				file = file.replace("@", "@at@")
-				file = file.replace(" ", "@space@")
-				file = file.replace("\t", "@tab@")
-				file = file.replace("[", "@openbrace@")
-				file = file.replace("]", "@closebrace@")
-				file = file.replace("_", "@underscore@")
-				dep_files = dep_files + " " + file
-				key = "FILE" + varname + "_" + file + "_" + pkg
-				bb.data.setVar(key, value, d)
-		bb.data.setVar("FILE" + varname + "FLIST_" + pkg, dep_files, d)
+			if line.startswith("Requires:"):
+				i = requires
+			elif line.startswith("Provides:"):
+				i = provides
+			else:
+				continue
+			value = line.split(":", 1)[1].strip()
+			value = r.sub(r'(\g<0>)', value)
+			if value.startswith("rpmlib("):
+				continue
+			i.append(value)
+
+		if len(provides) > 0:
+			provides_files.append(file)
+			key = "FILERPROVIDES_" + file + "_" + pkg
+			bb.data.setVar(key, " ".join(provides), d)
+
+		if len(requires) > 0:
+			requires_files.append(file)
+			key = "FILERDEPENDS_" + file + "_" + pkg
+			bb.data.setVar(key, " ".join(requires), d)
 
 	# Determine dependencies
 	for pkg in packages.split():
-		if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1  or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
+		if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
 			continue
 
-		# Process provides
-		dep_pipe = os.popen(cmd + " --rpmdeps " + rpmdeps + " --provides " + pkgdest + "/" + pkg)
+		provides_files = []
+		requires_files = []
+		for root, dirs, files in os.walk(pkgdest + "/" + pkg):
+			for file in files:
+				f = os.path.join(root, file)
 
-		process_deps(dep_pipe, pkg, 'RPROVIDES')
+				dep_pipe = os.popen(rpmdeps + " --provides --requires -v " + f)
 
-		# Process requirements
-		dep_pipe = os.popen(cmd + " --rpmdeps " + rpmdeps + " --requires " + pkgdest + "/" + pkg)
+				process_deps(dep_pipe, pkg, f, provides_files, requires_files)
 
-		process_deps(dep_pipe, pkg, 'RDEPENDS')
+		bb.data.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files), d)
+		bb.data.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files), d)
 }
 
 SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
-- 
1.6.6.1



