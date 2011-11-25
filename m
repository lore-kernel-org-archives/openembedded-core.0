Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTxVD-00056Y-Gf for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 16:15:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF99JR006342
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:09:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05426-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:09:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF8wHp006336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:08:59 GMT
Message-ID: <1322233746.22755.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 15:09:06 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] getVar/setVar cleanups
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
X-List-Received-Date: Fri, 25 Nov 2011 15:15:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Complete the bb.data.getVar/setVar replacements with accesses
directly to the data store object.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 72196d6..a95dfd9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -360,12 +360,12 @@ python () {
         d.setVarFlag('do_compile', 'umask', 022)
         deps = (d.getVarFlag('do_install', 'depends') or "").split()
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        bb.data.setVarFlag('do_install', 'depends', " ".join(deps),d)
+        d.setVarFlag('do_install', 'depends', " ".join(deps))
         d.setVarFlag('do_install', 'fakeroot', 1)
         d.setVarFlag('do_install', 'umask', 022)
         deps = (d.getVarFlag('do_package', 'depends') or "").split()
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        bb.data.setVarFlag('do_package', 'depends', " ".join(deps),d)
+        d.setVarFlag('do_package', 'depends', " ".join(deps))
         d.setVarFlag('do_package', 'fakeroot', 1)
         d.setVarFlag('do_package', 'umask', 022)
         d.setVarFlag('do_package_setscene', 'fakeroot', 1)
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 6f5bcd0..499a1fb 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -20,7 +20,7 @@ python () {
     sdkarchs = []
     for arch in archs:
         sdkarchs.append(arch + '-nativesdk')
-    bb.data.setVar('PACKAGE_ARCHS', " ".join(sdkarchs), d)
+    d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
 }
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 687247a..0c0b549 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -31,31 +31,31 @@ python do_distrodata_np() {
 	if pn.find("-native") != -1:
 	    pnstripped = pn.split("-native")
 	    bb.note("Native Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-nativesdk") != -1:
 	    pnstripped = pn.split("-nativesdk")
 	    bb.note("Native Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-cross") != -1:
 	    pnstripped = pn.split("-cross")
 	    bb.note("cross Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-crosssdk") != -1:
 	    pnstripped = pn.split("-crosssdk")
 	    bb.note("cross Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-initial") != -1:
 	    pnstripped = pn.split("-initial")
 	    bb.note("initial Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	"""generate package information from .bb file"""
@@ -130,19 +130,19 @@ python do_distrodata() {
 	if pn.find("-native") != -1:
 	    pnstripped = pn.split("-native")
 	    bb.note("Native Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-cross") != -1:
 	    pnstripped = pn.split("-cross")
 	    bb.note("cross Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-initial") != -1:
 	    pnstripped = pn.split("-initial")
 	    bb.note("initial Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	"""generate package information from .bb file"""
@@ -308,8 +308,8 @@ python do_checkpkg() {
 		which is designed for check purpose but we override check command for our own purpose
 		"""
 		ld = bb.data.createCopy(d)
-		bb.data.setVar('CHECKCOMMAND_wget', "/usr/bin/env wget -t 1 --passive-ftp -O %s --user-agent=\"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12\" '${URI}'" \
-					% tmpf.name, d)
+		d.setVar('CHECKCOMMAND_wget', "/usr/bin/env wget -t 1 --passive-ftp -O %s --user-agent=\"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12\" '${URI}'" \
+					% tmpf.name)
 		bb.data.update_data(ld)
 
 		try:
@@ -452,19 +452,19 @@ python do_checkpkg() {
 	if pname.find("-native") != -1:
 	    pnstripped = pname.split("-native")
 	    bb.note("Native Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pname.find("-cross") != -1:
 	    pnstripped = pname.split("-cross")
 	    bb.note("cross Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pname.find("-initial") != -1:
 	    pnstripped = pname.split("-initial")
 	    bb.note("initial Split: %s" % pnstripped)
-	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	pdesc = localdata.getVar('DESCRIPTION', True)
diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index f164547..c1dbbe3 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -45,7 +45,7 @@ python populate_packages_append () {
 					schemas.append(f)
 		if schemas != []:
 			bb.note("adding gconf postinst and prerm scripts to %s" % pkg)
-			bb.data.setVar('SCHEMA_FILES', " ".join(schemas), d)
+			d.setVar('SCHEMA_FILES', " ".join(schemas))
 			postinst = d.getVar('pkg_postinst_%s' % pkg, 1) or d.getVar('pkg_postinst', 1)
 			if not postinst:
 				postinst = '#!/bin/sh\n'
diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bbclass
index 23183b3..5aace0f 100644
--- a/meta/classes/image-swab.bbclass
+++ b/meta/classes/image-swab.bbclass
@@ -53,7 +53,7 @@ python() {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('nativesdk', d) and not bb.data.inherits_class('cross', d):
        deps = (d.getVarFlag('do_setscene', 'depends') or "").split()
        deps.append('strace-native:do_populate_sysroot')
-       bb.data.setVarFlag('do_setscene', 'depends', " ".join(deps), d)
+       d.setVarFlag('do_setscene', 'depends', " ".join(deps))
        logdir = bb.data.expand("${TRACE_LOGDIR}", d)
        bb.utils.mkdirhier(logdir)
     else:
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 12e0b83..d0cc279 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -437,7 +437,7 @@ python populate_packages_prepend () {
 		else:
 			rdepends = []
 		rdepends.extend(get_dependencies(file, pattern, format))
-		bb.data.setVar('RDEPENDS_' + pkg, ' '.join(rdepends), d)
+		d.setVar('RDEPENDS_' + pkg, ' '.join(rdepends))
 
 	module_deps = parse_depmod()
 	module_regex = '^(.*)\.k?o$'
@@ -464,10 +464,10 @@ python populate_packages_prepend () {
 	for pkg in packages[1:]:
 		if not pkg in blacklist and not pkg in metapkg_rdepends:
 			metapkg_rdepends.append(pkg)
-	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+	d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 	d.setVar('DESCRIPTION_' + metapkg, 'Kernel modules meta package')
 	packages.append(metapkg)
-	bb.data.setVar('PACKAGES', ' '.join(packages), d)
+	d.setVar('PACKAGES', ' '.join(packages))
 }
 
 # Support checking the kernel size since some kernels need to reside in partitions
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index fc1a579..bbe06fd 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -10,7 +10,7 @@
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
 
 python __anonymous () {
-    enabled = d.getVar("ENABLE_BINARY_LOCALE_GENERATION", 1)
+    enabled = d.getVar("ENABLE_BINARY_LOCALE_GENERATION", True)
 
     pn = d.getVar("PN", True)
     if pn.endswith("-initial"):
@@ -19,15 +19,15 @@ python __anonymous () {
     if enabled and int(enabled):
         import re
 
-        target_arch = d.getVar("TARGET_ARCH", 1)
-        binary_arches = d.getVar("BINARY_LOCALE_ARCHES", 1) or ""
-        use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", 1) or ""
+        target_arch = d.getVar("TARGET_ARCH", True)
+        binary_arches = d.getVar("BINARY_LOCALE_ARCHES", True) or ""
+        use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", True) or ""
 
         for regexp in binary_arches.split(" "):
             r = re.compile(regexp)
 
             if r.match(target_arch):
-                depends = d.getVar("DEPENDS", 1)
+                depends = d.getVar("DEPENDS", True)
 		if use_cross_localedef == "1" :
 	                depends = "%s cross-localedef-native" % depends
 		else:
@@ -109,19 +109,19 @@ inherit qemu
 
 python package_do_split_gconvs () {
 	import os, re
-	if (d.getVar('PACKAGE_NO_GCONV', 1) == '1'):
+	if (d.getVar('PACKAGE_NO_GCONV', True) == '1'):
 		bb.note("package requested not splitting gconvs")
 		return
 
-	if not d.getVar('PACKAGES', 1):
+	if not d.getVar('PACKAGES', True):
 		return
 
-	bpn = d.getVar('BPN', 1)
-	libdir = d.getVar('libdir', 1)
+	bpn = d.getVar('BPN', True)
+	libdir = d.getVar('libdir', True)
 	if not libdir:
 		bb.error("libdir not defined")
 		return
-	datadir = d.getVar('datadir', 1)
+	datadir = d.getVar('datadir', True)
 	if not datadir:
 		bb.error("datadir not defined")
 		return
@@ -144,9 +144,9 @@ python package_do_split_gconvs () {
 					deps.append(dp)
 		f.close()
 		if deps != []:
-			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
+			d.setVar('RDEPENDS_%s' % pkg, " ".join(deps))
 		if bpn != 'glibc':
-			bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'), d)
+			d.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'))
 
 	do_split_packages(d, gconv_libdir, file_regex='^(.*)\.so$', output_pattern=bpn+'-gconv-%s', \
 		description='gconv module for character set %s', hook=calc_gconv_deps, \
@@ -165,9 +165,9 @@ python package_do_split_gconvs () {
 					deps.append(dp)
 		f.close()
 		if deps != []:
-			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
+			d.setVar('RDEPENDS_%s' % pkg, " ".join(deps))
 		if bpn != 'glibc':
-			bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'), d)
+			d.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'))
 
 	do_split_packages(d, charmap_dir, file_regex='^(.*)\.gz$', output_pattern=bpn+'-charmap-%s', \
 		description='character map for %s encoding', hook=calc_charmap_deps, extra_depends='')
@@ -185,23 +185,23 @@ python package_do_split_gconvs () {
 					deps.append(dp)
 		f.close()
 		if deps != []:
-			bb.data.setVar('RDEPENDS_%s' % pkg, " ".join(deps), d)
+			d.setVar('RDEPENDS_%s' % pkg, " ".join(deps))
 		if bpn != 'glibc':
-			bb.data.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'), d)
+			d.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'))
 
 	do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern=bpn+'-localedata-%s', \
 		description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
-	bb.data.setVar('PACKAGES', d.getVar('PACKAGES') + ' ' + d.getVar('MLPREFIX') + bpn + '-gconv', d)
+	d.setVar('PACKAGES', d.getVar('PACKAGES') + ' ' + d.getVar('MLPREFIX') + bpn + '-gconv')
 
-	use_bin = d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", 1)
+	use_bin = d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", True)
 
 	dot_re = re.compile("(.*)\.(.*)")
 
 #GLIBC_GENERATE_LOCALES var specifies which locales to be supported, empty or "all" means all locales 
 	if use_bin != "precompiled":
-		supported = d.getVar('GLIBC_GENERATE_LOCALES', 1)
+		supported = d.getVar('GLIBC_GENERATE_LOCALES', True)
 		if not supported or supported == "all":
-			f = open(base_path_join(d.getVar('WORKDIR', 1), "SUPPORTED"), "r")
+			f = open(base_path_join(d.getVar('WORKDIR', True), "SUPPORTED"), "r")
 			supported = f.readlines()
 			f.close()
 		else:
@@ -218,7 +218,7 @@ python package_do_split_gconvs () {
 			supported.append(dbase[0] + d2)
 
 	# Collate the locales by base and encoding
-	utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', 1) or 0)
+	utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
 	encodings = {}
 	for l in supported:
 		l = l[:-1]
@@ -233,12 +233,12 @@ python package_do_split_gconvs () {
 		encodings[locale].append(charset)
 
 	def output_locale_source(name, pkgname, locale, encoding):
-		bb.data.setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
-		(bpn, legitimize_package_name(locale), bpn, legitimize_package_name(encoding)), d)
-		bb.data.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst', 1) \
-		% (locale, encoding, locale), d)
-		bb.data.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm', 1) % \
-		(locale, encoding, locale), d)
+		setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
+		(bpn, legitimize_package_name(locale), bpn, legitimize_package_name(encoding)))
+		d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst', True) \
+		% (locale, encoding, locale))
+		d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm', True) % \
+		(locale, encoding, locale))
 
 	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
 		m = re.match("(.*)\.(.*)", name)
@@ -246,23 +246,23 @@ python package_do_split_gconvs () {
 			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
 		else:
 			libc_name = name
-		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
-			% (bpn, libc_name)), d)
+		d.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
+			% (bpn, libc_name)))
 		rprovides = (d.getVar('RPROVIDES_%s' % pkgname, True) or "").split()
 		rprovides.append(legitimize_package_name('%s-binary-localedata-%s' % (bpn, libc_name)))
-		bb.data.setVar('RPROVIDES_%s' % pkgname, " ".join(rprovides), d)
+		d.setVar('RPROVIDES_%s' % pkgname, " ".join(rprovides))
 
 	commands = {}
 
 	def output_locale_binary(name, pkgname, locale, encoding):
-		treedir = base_path_join(d.getVar("WORKDIR", 1), "locale-tree")
-		ldlibdir = base_path_join(treedir, d.getVar("base_libdir", 1))
-		path = d.getVar("PATH", 1)
+		treedir = base_path_join(d.getVar("WORKDIR", True), "locale-tree")
+		ldlibdir = base_path_join(treedir, d.getVar("base_libdir", True))
+		path = d.getVar("PATH", True)
 		i18npath = base_path_join(treedir, datadir, "i18n")
 		gconvpath = base_path_join(treedir, "iconvdata")
 		outputpath = base_path_join(treedir, libdir, "locale")
 
-		use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", 1) or "0"
+		use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", True) or "0"
 		if use_cross_localedef == "1":
 	    		target_arch = d.getVar('TARGET_ARCH', True)
 			locale_arch_options = { \
@@ -292,9 +292,9 @@ python package_do_split_gconvs () {
 				--inputfile=%s/i18n/locales/%s --charmap=%s %s" \
 				% (treedir, datadir, locale, encoding, name)
 
-			qemu_options = bb.data.getVar("QEMU_OPTIONS_%s" % d.getVar('PACKAGE_ARCH', 1), d, 1)
+			qemu_options = d.getVar("QEMU_OPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True)
 			if not qemu_options:
-				qemu_options = d.getVar('QEMU_OPTIONS', 1)
+				qemu_options = d.getVar('QEMU_OPTIONS', True)
 
 			cmd = "PSEUDO_RELOADED=YES PATH=\"%s\" I18NPATH=\"%s\" %s -L %s \
 				-E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % \
@@ -307,7 +307,7 @@ python package_do_split_gconvs () {
 	def output_locale(name, locale, encoding):
 		pkgname = d.getVar('MLPREFIX') + 'locale-base-' + legitimize_package_name(name)
 		d.setVar('ALLOW_EMPTY_%s' % pkgname, '1')
-		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES', 1)), d)
+		d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES', True)))
 		rprovides = ' virtual-locale-%s' % legitimize_package_name(name)
 		m = re.match("(.*)_(.*)", name)
 		if m:
@@ -347,7 +347,7 @@ python package_do_split_gconvs () {
 		bb.note("  " + " ".join(non_utf8))
 
 	if use_bin == "compile":
-		makefile = base_path_join(d.getVar("WORKDIR", 1), "locale-tree", "Makefile")
+		makefile = base_path_join(d.getVar("WORKDIR", True), "locale-tree", "Makefile")
 		m = open(makefile, "w")
 		m.write("all: %s\n\n" % " ".join(commands.keys()))
 		for cmd in commands:
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5f25bdd..8f7cc1f 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -121,7 +121,7 @@ python native_virtclass_handler () {
                 newdeps.append(dep + "-native")
             else:
                 newdeps.append(dep)
-        bb.data.setVar(varname, " ".join(newdeps), d)
+        d.setVar(varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data)
     for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
@@ -139,7 +139,7 @@ python native_virtclass_handler () {
             provides = provides.replace(prov, prov + "-native")
     e.data.setVar("PROVIDES", provides)
 
-    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native", e.data)
+    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
 }
 
 addhandler native_virtclass_handler
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ca24efa..e6204c0 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -15,7 +15,7 @@ python () {
     sdkarchs = []
     for arch in archs:
         sdkarchs.append(arch + '-nativesdk')
-    bb.data.setVar('PACKAGE_ARCHS', " ".join(sdkarchs), d)
+    d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
 }
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
@@ -66,7 +66,7 @@ python nativesdk_virtclass_handler () {
     if not pn.endswith("-nativesdk"):
         return
 
-    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk", e.data)
+    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
 }
 
 python () {
@@ -91,7 +91,7 @@ python () {
                 newdeps.append(dep.replace("-nativesdk", "") + "-nativesdk")
             else:
                 newdeps.append(dep)
-        bb.data.setVar(varname, " ".join(newdeps), d)
+        d.setVar(varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", d)
     #for pkg in (d.getVar("PACKAGES", True).split() + [""]):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2a78a8f..256cdc1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -151,7 +151,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 						the_files.append(fp % m.group(1))	
 				else:
 					the_files.append(aux_files_pattern_verbatim % m.group(1))
-			bb.data.setVar('FILES_' + pkg, " ".join(the_files), d)
+			d.setVar('FILES_' + pkg, " ".join(the_files))
 			if extra_depends != '':
 				the_depends = d.getVar('RDEPENDS_' + pkg, True)
 				if the_depends:
@@ -165,11 +165,11 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 			if postrm:
 				d.setVar('pkg_postrm_' + pkg, postrm)
 		else:
-			bb.data.setVar('FILES_' + pkg, oldfiles + " " + os.path.join(root, o), d)
+			d.setVar('FILES_' + pkg, oldfiles + " " + os.path.join(root, o))
 		if callable(hook):
 			hook(f, pkg, file_regex, output_pattern, m.group(1))
 
-	bb.data.setVar('PACKAGES', ' '.join(packages), d)
+	d.setVar('PACKAGES', ' '.join(packages))
 
 PACKAGE_DEPENDS += "file-native"
 
@@ -183,7 +183,7 @@ python () {
         deps = (d.getVarFlag('do_package', 'deptask') or "").split()
         # shlibs requires any DEPENDS to have already packaged for the *.list files
         deps.append("do_package")
-        bb.data.setVarFlag('do_package', 'deptask', " ".join(deps), d)
+        d.setVarFlag('do_package', 'deptask', " ".join(deps))
     elif not bb.data.inherits_class('image', d):
         d.setVar("PACKAGERDEPTASK", "")
 }
@@ -202,7 +202,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
-    workdir = bb.data.expand("${WORKDIR}", d)
+    workdir = d.getVar("WORKDIR", True)
     workparentdir = os.path.dirname(workdir)
     sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
 
@@ -245,7 +245,7 @@ def splitfile2(debugsrcdir, d):
     strip = d.getVar("STRIP", True)
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
-    workdir = bb.data.expand("${WORKDIR}", d)
+    workdir = d.getVar("WORKDIR", True)
     workparentdir = os.path.dirname(workdir)
     workbasedir = os.path.basename(workdir)
     sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
@@ -341,7 +341,7 @@ def runtime_mapping_rename (varname, d):
 		else:
 			new_depends.append(new_depend)
 
-	bb.data.setVar(varname, " ".join(new_depends) or None, d)
+	d.setVar(varname, " ".join(new_depends) or None)
 
 	#bb.note("%s after: %s" % (varname, d.getVar(varname, True)))
 
@@ -399,15 +399,15 @@ python package_do_split_locales() {
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
-		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
-		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln), d)
-		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
-		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)
-		bb.data.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l), d)
+		d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
+		d.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln))
+		d.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln))
+		d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
+		d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
 		if locale_section:
 			d.setVar('SECTION_' + pkg, locale_section)
 
-	bb.data.setVar('PACKAGES', ' '.join(packages), d)
+	d.setVar('PACKAGES', ' '.join(packages))
 
 	# Disabled by RP 18/06/07
 	# Wildcards aren't supported in debian
@@ -417,7 +417,7 @@ python package_do_split_locales() {
 	# Probably breaks since virtual-locale- isn't provided anywhere
 	#rdep = (d.getVar('RDEPENDS_%s' % mainpkg, True) or d.getVar('RDEPENDS', True) or "").split()
 	#rdep.append('%s-locale*' % pn)
-	#bb.data.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep), d)
+	#d.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep))
 }
 
 python perform_packagecopy () {
@@ -1018,7 +1018,7 @@ python populate_packages () {
 						break
 			if found == False:
 				bb.note("%s contains dangling symlink to %s" % (pkg, l))
-		bb.data.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False), d)
+		d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 populate_packages[dirs] = "${D}"
 
@@ -1033,11 +1033,11 @@ python emit_pkgdata() {
 			c = codecs.getencoder("string_escape")
 			return c(str)[0]
 
-		val = bb.data.getVar('%s_%s' % (var, pkg), d, True)
+		val = d.getVar('%s_%s' % (var, pkg), True)
 		if val:
 			f.write('%s_%s: %s\n' % (var, pkg, encode(val)))
 			return
-		val = bb.data.getVar('%s' % (var), d, True)
+		val = d.getVar('%s' % (var), True)
 		if val:
 			f.write('%s: %s\n' % (var, encode(val)))
 		return
@@ -1159,12 +1159,12 @@ python package_do_filedeps() {
 		if len(provides) > 0:
 			provides_files.append(file)
 			key = "FILERPROVIDES_" + file + "_" + pkg
-			bb.data.setVar(key, " ".join(provides), d)
+			d.setVar(key, " ".join(provides))
 
 		if len(requires) > 0:
 			requires_files.append(file)
 			key = "FILERDEPENDS_" + file + "_" + pkg
-			bb.data.setVar(key, " ".join(requires), d)
+			d.setVar(key, " ".join(requires))
 
 	# Determine dependencies
 	for pkg in packages.split():
@@ -1181,8 +1181,8 @@ python package_do_filedeps() {
 
 				process_deps(dep_pipe, pkg, f, provides_files, requires_files)
 
-		bb.data.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files), d)
-		bb.data.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files), d)
+		d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files))
+		d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files))
 }
 
 SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
@@ -1461,7 +1461,7 @@ python package_do_pkgconfig () {
 						if m:
 							name = m.group(1)
 							val = m.group(2)
-							bb.data.setVar(name, bb.data.expand(val, pd), pd)
+							pd.setVar(name, bb.data.expand(val, pd))
 							continue
 						m = field_re.match(l)
 						if m:
@@ -1519,7 +1519,7 @@ python package_do_pkgconfig () {
 python read_shlibdeps () {
 	packages = d.getVar('PACKAGES', True).split()
 	for pkg in packages:
-		rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, 0) or d.getVar('RDEPENDS', 0) or "")
+		rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
 
 		for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
 			depsfile = bb.data.expand("${PKGDEST}/" + pkg + extension, d)
@@ -1529,7 +1529,7 @@ python read_shlibdeps () {
 				fd.close()
 				for l in lines:
 					rdepends[l.rstrip()] = ""
-		bb.data.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False), d)
+		d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
 python package_depchains() {
@@ -1569,7 +1569,7 @@ python package_depchains() {
 				rreclist[pkgname] = ""
 
 		#bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
-		bb.data.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False), d)
+		d.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False))
 
 	def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
 
@@ -1590,7 +1590,7 @@ python package_depchains() {
 				rreclist[pkgname] = ""
 
 		#bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
-		bb.data.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False), d)
+		d.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False))
 
 	def add_dep(list, dep):
 		dep = dep.split(' (')[0].strip()
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 71e46a8..fc28ee1 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -11,7 +11,7 @@ DPKG_ARCH ?= "${TARGET_ARCH}"
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
 python package_deb_fn () {
-    bb.data.setVar('PKGFN', d.getVar('PKG'), d)
+    d.setVar('PKGFN', d.getVar('PKG'))
 }
 
 addtask package_deb_install
@@ -409,7 +409,7 @@ python () {
         deps = (d.getVarFlag('do_package_write_deb', 'depends') or "").split()
         deps.append('dpkg-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        bb.data.setVarFlag('do_package_write_deb', 'depends', " ".join(deps), d)
+        d.setVarFlag('do_package_write_deb', 'depends', " ".join(deps))
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
         d.setVarFlag('do_package_write_deb_setscene', 'fakeroot', "1")
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index df608fc..1633aff 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -11,7 +11,7 @@ PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 OPKGBUILDCMD ??= "opkg-build"
 
 python package_ipk_fn () {
-	bb.data.setVar('PKGFN', d.getVar('PKG'), d)
+	d.setVar('PKGFN', d.getVar('PKG'))
 }
 
 python package_ipk_install () {
@@ -441,7 +441,7 @@ python () {
         deps = (d.getVarFlag('do_package_write_ipk', 'depends') or "").split()
         deps.append('opkg-utils-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        bb.data.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps), d)
+        d.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps))
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
         d.setVarFlag('do_package_write_ipk_setscene', 'fakeroot', "1")
 }
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 75e4f2d..93a4c31 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -8,7 +8,7 @@ RPMBUILD="rpmbuild"
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
 python package_rpm_fn () {
-	bb.data.setVar('PKGFN', d.getVar('PKG'), d)
+	d.setVar('PKGFN', d.getVar('PKG'))
 }
 
 python package_rpm_install () {
@@ -467,7 +467,7 @@ python write_specfile () {
 							ver = ver.replace(pv, reppv)
 				newdeps_dict[dep] = ver
 			depends = bb.utils.join_deps(newdeps_dict)
-			bb.data.setVar(varname, depends.strip(), d)
+			d.setVar(varname, depends.strip())
 
 	# We need to change the style the dependency from BB to RPM
 	# This needs to happen AFTER the mapping_rename_hook
@@ -969,7 +969,7 @@ python () {
         deps = (d.getVarFlag('do_package_write_rpm', 'depends') or "").split()
         deps.append('rpm-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        bb.data.setVarFlag('do_package_write_rpm', 'depends', " ".join(deps), d)
+        d.setVarFlag('do_package_write_rpm', 'depends', " ".join(deps))
         d.setVarFlag('do_package_write_rpm', 'fakeroot', 1)
         d.setVarFlag('do_package_write_rpm_setscene', 'fakeroot', 1)
 }
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index f26a2c0..201bd91 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -69,7 +69,7 @@ python do_package_tar () {
 		if not overrides:
 			raise bb.build.FuncFailed('OVERRIDES not defined')
 		overrides = bb.data.expand(overrides, localdata)
-		bb.data.setVar('OVERRIDES', '%s:%s' % (overrides, pkg), localdata)
+		localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
 
 		bb.data.update_data(localdata)
 
@@ -95,7 +95,7 @@ python () {
         deps = (d.getVarFlag('do_package_write_tar', 'depends') or "").split()
         deps.append('tar-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        bb.data.setVarFlag('do_package_write_tar', 'depends', " ".join(deps), d)
+        d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
 }
 
diff --git a/meta/classes/src_distribute.bbclass b/meta/classes/src_distribute.bbclass
index 2069d65..651e492 100644
--- a/meta/classes/src_distribute.bbclass
+++ b/meta/classes/src_distribute.bbclass
@@ -29,13 +29,13 @@ python do_distribute_sources () {
 				if url.basename == '*':
 					import os.path
 					dest_dir = os.path.basename(os.path.dirname(os.path.abspath(url.localpath)))
-					bb.data.setVar('DEST', "%s_%s/" % (d.getVar('PF', 1), dest_dir), d)
+					d.setVar('DEST', "%s_%s/" % (d.getVar('PF', 1), dest_dir))
 				else:
-					bb.data.setVar('DEST', "%s_%s" % (d.getVar('PF', 1), url.basename), d)
+					d.setVar('DEST', "%s_%s" % (d.getVar('PF', 1), url.basename))
 			else:
 				d.setVar('DEST', '')
 
-			bb.data.setVar('SRC_DISTRIBUTEDIR', "%s/%s" % (sources_dir, license), d)
+			d.setVar('SRC_DISTRIBUTEDIR', "%s/%s" % (sources_dir, license))
 			bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
 }
 
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 951caa3..504b099 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -20,18 +20,18 @@ SSTATEPOSTINSTFUNCS ?= ""
 
 python () {
     if bb.data.inherits_class('native', d):
-        bb.data.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'), d)
+        d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
     elif bb.data.inherits_class('cross', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${TUNE_PKGARCH}", d), d)
-        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d), d)
+        d.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${TUNE_PKGARCH}", d))
+        d.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d))
     elif bb.data.inherits_class('crosssdk', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${PACKAGE_ARCH}", d), d)
+        d.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${PACKAGE_ARCH}", d))
     elif bb.data.inherits_class('nativesdk', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}", d), d)
+        d.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}", d))
     elif bb.data.inherits_class('cross-canadian', d):
-        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${PACKAGE_ARCH}", d), d)
+        d.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${PACKAGE_ARCH}", d))
     else:
-        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d), d)
+        d.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d))
 
     # These classes encode staging paths into their scripts data so can only be
     # reused if we manipulate the paths
diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
index 516d1a1..7891207 100644
--- a/meta/classes/task.bbclass
+++ b/meta/classes/task.bbclass
@@ -22,6 +22,6 @@ python () {
     for pkg in packages:
         for postfix in ['-dbg', '-dev']:
             genpackages.append(pkg+postfix)
-    bb.data.setVar('PACKAGES', ' '.join(packages+genpackages), d)
+    d.setVar('PACKAGES', ' '.join(packages+genpackages))
 }
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 492c5fb..cba44d6 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -45,7 +45,7 @@ python populate_packages_prepend () {
 		bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
 		overrides = localdata.getVar("OVERRIDES", 1)
-		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+		localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
 		bb.data.update_data(localdata)
 
 		"""
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 60f3200..acba388 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -285,7 +285,7 @@ DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir
 
 DEBUGFILEDIRECTORY-dbg = "/usr/lib/debug /usr/src/debug"
 
-FILES_${PN}-dbg = "${@bb.data.getVar(['DOTDEBUG-dbg', 'DEBUGFILEDIRECTORY-dbg'][d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', 1) == 'debug-file-directory'], d, 1)}"
+FILES_${PN}-dbg = "${@d.getVar(['DOTDEBUG-dbg', 'DEBUGFILEDIRECTORY-dbg'][d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-file-directory'], True)}"
 
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
@@ -502,7 +502,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
-SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD', 1) == '1'], d, 1)}"
+SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD', True) == '1'], True)}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"
 
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index ad391e3..630e88d 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -284,19 +284,19 @@ def compare_in_distro_packages_list(distro_check_dir, d):
 
     if pn.find("-native") != -1:
         pnstripped = pn.split("-native")
-        bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     if pn.find("-cross") != -1:
         pnstripped = pn.split("-cross")
-        bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
     if pn.find("-initial") != -1:
         pnstripped = pn.split("-initial")
-        bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True), localdata)
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0b74ea6..b948e2c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -81,17 +81,15 @@ python () {
   if "${OE_DEL}":
     d.setVar('configmangle_append', "${OE_DEL}" + "\n")
   if "${OE_FEATURES}":
-    bb.data.setVar('configmangle_append',
+    d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
-                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))),
-                   d)
-  bb.data.setVar('configmangle_append',
+                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))))
+  d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
                   ("\\n".join(["CONFIG_CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
 			       "CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\""
                         ])
-                  ),
-                 d)
+                  ))
 }
 
 do_prepare_config () {
diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index a74de01..d940e39 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/tasks/task-core-sdk.bb
@@ -80,11 +80,11 @@ RDEPENDS_task-core-sdk = "\
 #                        rreclist.append('%s-dev' % name)
 #
 #            oldrrec = d.getVar('RRECOMMENDS_%s' % newpkg) or ''
-#            bb.data.setVar('RRECOMMENDS_%s' % newpkg, oldrrec + ' ' + ' '.join(rreclist), d)
+#            d.setVar('RRECOMMENDS_%s' % newpkg, oldrrec + ' ' + ' '.join(rreclist))
 #            # bb.note('RRECOMMENDS_%s = "%s"' % (newpkg, d.getVar('RRECOMMENDS_%s' % newpkg)))
 #
 #    # bb.note('pkgs is %s' % pkgs)
-#    bb.data.setVar('PACKAGES', ' '.join(pkgs), d)
+#    d.setVar('PACKAGES', ' '.join(pkgs))
 #}
 #
 #PACKAGES_DYNAMIC = "task-core-sdk-*"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 8438f25..92157bd 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -141,11 +141,10 @@ python () {
   if "${OE_DEL}":
     d.setVar('configmangle_append', "${OE_DEL}" + "\n")
   if "${OE_FEATURES}":
-    bb.data.setVar('configmangle_append',
+    d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
-                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))),
-                   d)
-  bb.data.setVar('configmangle_append',
+                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))))
+  d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
                   ("\\n".join(["CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
                         "UCLIBC_EXTRA_CFLAGS=\"${UCLIBC_EXTRA_CFLAGS}\"",
@@ -154,22 +153,18 @@ python () {
                          "DEVEL_PREFIX=\"/${prefix}\"",
                          "SHARED_LIB_LOADER_PREFIX=\"/lib\"",
                         ])
-                  ),
-                 d)
-  bb.data.setVar('configmangle_append',
+                  ))
+  d.setVar('configmangle_append',
                  "/^### TGT$/a\\\nTARGET_ARCH=\"%s\"\\nTARGET_%s=y\n" %
-                        ("${UCLIBC_ARCH}", "${UCLIBC_ARCH}"),
-                 d)
-  bb.data.setVar('configmangle_append',
-    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][d.getVar('TARGET_FPU', 1) in [ 'soft' ]]), d)
+                        ("${UCLIBC_ARCH}", "${UCLIBC_ARCH}"))
+  d.setVar('configmangle_append',
+    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][d.getVar('TARGET_FPU', True) in [ 'soft' ]]))
   if "${UCLIBC_ENDIAN}":
-    bb.data.setVar('configmangle_append',
-                   "/^### ABI$/a\\\nARCH_WANTS_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"),
-                   d)
+    d.setVar('configmangle_append',
+                   "/^### ABI$/a\\\nARCH_WANTS_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"))
   if "${UCLIBC_ABI}":
-    bb.data.setVar('configmangle_append',
-                   "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"),
-                   d)
+    d.setVar('configmangle_append',
+                   "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"))
 }
 
 do_patch_append() {
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
index 1762829..6106986 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
+FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
 EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 7949058..8ff9f82 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -2,8 +2,8 @@ LIBV = "0.10"
 
 python populate_packages_prepend () {
 	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
-	postinst = d.getVar('plugin_postinst', 1)
-	glibdir = bb.data.expand('${libdir}', d)
+	postinst = d.getVar('plugin_postinst', True)
+	glibdir = d.getVar('libdir', True)
 
 	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
 	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
@@ -19,7 +19,7 @@ python populate_packages_prepend () {
 	for pkg in packages[1:]:
 		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-static'):
 			metapkg_rdepends.append(pkg)
-	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+	d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 	d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
 }
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 82ba637..4dc9a75 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -43,14 +43,14 @@ python __anonymous () {
         pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
-        bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
-        bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s${QT_LIBINFIX}.prl
+        d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals())
+        d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s${QT_LIBINFIX}.prl
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.a
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.la
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.so
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
-                  ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % locals(), d)
-        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so*" % locals(), d)
+                  ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % locals())
+        d.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so*" % locals())
         d.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg")
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
@@ -60,22 +60,22 @@ python __anonymous () {
 
     for name in d.getVar("QT_EXTRA_LIBS", 1).split():
         pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt", "").replace("_", "-") + "4"
-        bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals(), d)
-        bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
+        d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals())
+        d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
                   ${libdir}/lib%(name)s.a
                   ${libdir}/lib%(name)s.la
                   ${libdir}/lib%(name)s.so
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
-                  ${libdir}/pkgconfig/%(name)s.pc""" % locals(), d)
-        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s.so*" % locals(), d)
+                  ${libdir}/pkgconfig/%(name)s.pc""" % locals())
+        d.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s.so*" % locals())
         d.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg")
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
 
-    bb.data.setVar("LIB_PACKAGES", " ".join(lib_packages), d)
-    bb.data.setVar("DEV_PACKAGES", " ".join(dev_packages), d)
-    bb.data.setVar("DBG_PACKAGES", " ".join(dbg_packages), d)
+    d.setVar("LIB_PACKAGES", " ".join(lib_packages))
+    d.setVar("DEV_PACKAGES", " ".join(dev_packages))
+    d.setVar("DBG_PACKAGES", " ".join(dbg_packages))
 }
 
 OTHER_PACKAGES = "\
@@ -261,7 +261,7 @@ python populate_packages_prepend() {
                         packages = "%s %s-dbg" % (packages, package)
                         file_name = os.path.join(plugin_dir_dbg, os.path.basename(file))
                         d.setVar("FILES_%s-dbg" % package, file_name)
-                        bb.data.setVar("DESCRIPTION_%s-dbg" % package, "${PN} %s for %s" % (name, package), d)
+                        d.setVar("DESCRIPTION_%s-dbg" % package, "${PN} %s for %s" % (name, package))
 
                 d.setVar('PACKAGES', packages)
 
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index ddb65b7..fecdb97 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -57,8 +57,8 @@ python __anonymous () {
             packages.append(pkg)
             if not d.getVar("FILES_%s" % pkg, 1):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
-    bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
-    bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
+    d.setVar("BOOST_PACKAGES", " ".join(packages))
+    d.setVar("BJAM_EXTRA", " ".join(extras))
 }
 
 # Override the contents of specific packages




