Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyf-0001XA-8A
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213869"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:29:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:54 -0800
Message-Id: <9f6508ac8ed88525cb9320348a6ce5e414dc8a5e.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/20] package_rpm.bbclass: Replace shell provides/requires script with python version
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a813c8b..08a13f5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -930,8 +930,9 @@ python do_package_rpm () {
 
 	# Construct per file dependencies file
 	def dump_filerdeps(varname, outfile, d):
-		outfile.write("#!/bin/sh\n")
-		outfile.write("\n# Dependency table\n")
+		outfile.write("#!/usr/bin/env python\n\n")
+		outfile.write("# Dependency table\n")
+		outfile.write('deps = {\n')
 		for pkg in packages.split():
 			dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
 			dependsflist = (d.getVar(dependsflist_key, True) or "")
@@ -944,7 +945,7 @@ python do_package_rpm () {
 				file = file.replace("@tab@", "\t")
 				file = file.replace("@space@", " ")
 				file = file.replace("@at@", "@")
-				outfile.write("#" + pkgd + file + "\t")
+				outfile.write('"' + pkgd + file + '" : "')
 				for dep in depends_dict:
 					ver = depends_dict[dep]
 					if dep and ver:
@@ -953,12 +954,15 @@ python do_package_rpm () {
 						outfile.write(dep + " " + ver + " ")
 					else:
 						outfile.write(dep + " ")
-				outfile.write("\n")
-		outfile.write("\n\nwhile read file_name ; do\n")
-		outfile.write("\tlength=$(echo \"#${file_name}\t\" | wc -c )\n")
-		outfile.write("\tline=$(grep \"^#${file_name}\t\" $0 | cut -c ${length}- )\n")
-		outfile.write("\tprintf \"%s\\n\" ${line}\n")
-		outfile.write("done\n")
+				outfile.write('",\n')
+		outfile.write('}\n\n')
+		outfile.write("import sys\n")
+		outfile.write("while 1:\n")
+		outfile.write("\tline = sys.stdin.readline().strip()\n")
+		outfile.write("\tif not line:\n")
+		outfile.write("\t\tsys.exit(0)\n")
+		outfile.write("\tif line in deps:\n")
+		outfile.write("\t\tprint(deps[line] + '\\n')\n")
 
 	# OE-core dependencies a.k.a. RPM requires
 	outdepends = workdir + "/" + srcname + ".requires"
-- 
1.7.6.5



