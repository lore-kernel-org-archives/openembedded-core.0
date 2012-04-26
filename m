Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNUv8-0005ra-Iu for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 22:04:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QJsTcJ007019;
	Thu, 26 Apr 2012 20:54:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06700-06; Thu, 26 Apr 2012 20:54:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QJsMLF007011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Apr 2012 20:54:23 +0100
Message-ID: <1335470063.20130.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Apr 2012 20:54:23 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: package_rpm.bbclass: Replace shell provides/requires script with python version
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
X-List-Received-Date: Thu, 26 Apr 2012 20:04:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The existing shell script is a fork bomb and forks off hundreds of
grep/cur/wc calls as it reads from its input stream and iterates over
the file data table for each line of input. This patch replaces the
shell code with python code which doesn't exec anything and hence runs
much faster without the exec() overhead. This speeds up rpm packaging
considerably, as can be measured simply by timing it, or watching the
processor utilisation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index ffe3b31..d90976b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1004,8 +1004,9 @@ python do_package_rpm () {
 
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
@@ -1018,7 +1019,7 @@ python do_package_rpm () {
 				file = file.replace("@tab@", "\t")
 				file = file.replace("@space@", " ")
 				file = file.replace("@at@", "@")
-				outfile.write("#" + pkgd + file + "\t")
+				outfile.write('"' + pkgd + file + '" : "')
 				for dep in depends_dict:
 					ver = depends_dict[dep]
 					if dep and ver:
@@ -1027,12 +1028,15 @@ python do_package_rpm () {
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




