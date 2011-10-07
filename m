Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RC9eN-000627-8I for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 14:35:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97CaYOP003970 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 13:36:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4BlMPpSKwFol
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 13:36:34 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97CaUVu003960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 13:36:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 13:29:51 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317990600.2405.5.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] libc-package.bbclass: Use a makefile for locale gernation to increase parallelization
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
X-List-Received-Date: Fri, 07 Oct 2011 12:35:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We can generate the locales in parallel. The easiest way to do this is
generate a Makefile and then run this with our usual parallel make
options.

[YOCTO #1554]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 71a577b..6ef2f97 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -252,6 +252,8 @@ python package_do_split_gconvs () {
 		rprovides.append(legitimize_package_name('%s-binary-localedata-%s' % (bpn, libc_name)))
 		bb.data.setVar('RPROVIDES_%s' % pkgname, " ".join(rprovides), d)
 
+	commands = {}
+
 	def output_locale_binary(name, pkgname, locale, encoding):
 		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
 		ldlibdir = base_path_join(treedir, bb.data.getVar("base_libdir", d, 1))
@@ -298,17 +300,9 @@ python package_do_split_gconvs () {
 				-E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % \
 				(path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
 
+		commands["%s/%s" % (outputpath, name)] = cmd
+
 		bb.note("generating locale %s (%s)" % (locale, encoding))
-		import subprocess
-		process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-		if process.wait() != 0:
-			bb.note("cmd:")
-			bb.note(cmd)
-			bb.note("stdout:")
-			bb.note(process.stdout.read())
-			bb.note("stderr:")
-			bb.note(process.stderr.read())
-			raise bb.build.FuncFailed("localedef returned an error")
 
 	def output_locale(name, locale, encoding):
 		pkgname = bb.data.getVar('MLPREFIX', d) + 'locale-base-' + legitimize_package_name(name)
@@ -353,6 +347,17 @@ python package_do_split_gconvs () {
 		bb.note("  " + " ".join(non_utf8))
 
 	if use_bin == "compile":
+		makefile = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree", "Makefile")
+		m = open(makefile, "w")
+		m.write("all: %s\n\n" % " ".join(commands.keys()))
+		for cmd in commands:
+			m.write(cmd + ":\n")
+			m.write("	" + commands[cmd] + "\n\n")
+		m.close()
+		d.setVar("B", os.path.dirname(makefile))
+		d.setVar("EXTRA_OEMAKE", "${PARALLEL_MAKE}")
+		bb.note("Executing binary locale generation makefile")
+		bb.build.exec_func("oe_runmake", d)
 		bb.note("collecting binary locales from locale tree")
 		bb.build.exec_func("do_collect_bins_from_locale_tree", d)
 		do_split_packages(d, binary_locales_dir, file_regex='(.*)', \




