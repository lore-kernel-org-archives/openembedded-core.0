Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQY-0006go-Ag
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772196"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:36 -0700
Message-Id: <c8e1d7f6e84cc6292774491154ba7ec06e3053cb.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/36] libc-package: rework ''precompiled' locale handling
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
X-List-Received-Date: Thu, 03 May 2012 02:05:55 -0000

From: Christopher Larson <kergoth@gmail.com>

There were a couple problems with the handling of precompiled locales.

- it gathered the list of locales from the directories - this breaks due to
  the naming mismatch, e.g. en_US.UTF-8 vs en_US.utf8.
- it retained its hardcoded assumption that the non-suffixed locale (en_US, as
  opposed to en_US.*) is UTF-8, while the others are otherwise. Hardcoding
  this is both inflexible and just plain wrong for some toolchains. It's most
  common in desktop distros for 'en_US' to be non-utf8, and ''en_US.UTF-8' is
  utf8, and this is the case in some external toolchains as well.

The code now uses the SUPPORTED file to hold the knowledge it needs. This file
not only holds the list of locales to generate, but also maps the locale names
to the charsets they correspond to. The code now uses this to assemble its
charset map, falling back to the '.' suffix as charset when the locale is not
in the map. For precompiled, it now uses the locale->charset knowledge it has,
thereby allowing non-utf8 non-suffixed locale names, whereas for
non-precompiled, it reverts to the previous assumption, renaming the utf8
locale and forcibly suffixing the others.

So, a person maintaining an external toolchain recipe is responsible for
ensuring that the SUPPORTED file they provide matches up with the compiled
locales in the toolchain, if they want to utilize precompiled locales.

I believe in the long term the compiled case should do the same thing
precompiled does, and use SUPPORTED or a similar mechanism to encode the
knowledge, and if people want all the non-suffixed names to be utf8, they can
change that file to do so. This would avoid the hardcoded assumption in the
code, as well as consolidating the behavior between the compiled and
precompiled cases.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/libc-package.bbclass |   96 +++++++++++++++++-------------------
 1 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index bb4ba68..51edba2 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -207,40 +207,30 @@ python package_do_split_gconvs () {
 
 	dot_re = re.compile("(.*)\.(.*)")
 
-#GLIBC_GENERATE_LOCALES var specifies which locales to be supported, empty or "all" means all locales 
-	if use_bin != "precompiled":
-		supported = d.getVar('GLIBC_GENERATE_LOCALES', True)
-		if not supported or supported == "all":
-			f = open(base_path_join(d.getVar('WORKDIR', True), "SUPPORTED"), "r")
-			supported = f.readlines()
-			f.close()
-		else:
-			supported = supported.split()
-			supported = map(lambda s:s.replace(".", " ") + "\n", supported)
+	# Read in supported locales and associated encodings
+	supported = {}
+	with open(base_path_join(d.getVar('WORKDIR', True), "SUPPORTED")) as f:
+		for line in f.readlines():
+			try:
+				locale, charset = line.rstrip().split()
+			except ValueError:
+				continue
+			supported[locale] = charset
+
+	# GLIBC_GENERATE_LOCALES var specifies which locales to be generated. empty or "all" means all locales
+	to_generate = d.getVar('GLIBC_GENERATE_LOCALES', True)
+	if not to_generate or to_generate == 'all':
+		to_generate = supported.keys()
 	else:
-		supported = []
-		full_bin_path = d.getVar('PKGD', True) + binary_locales_dir
-		for dir in os.listdir(full_bin_path):
-			dbase = dir.split(".")
-			d2 = "  "
-			if len(dbase) > 1:
-				d2 = "." + dbase[1].upper() + "  "
-			supported.append(dbase[0] + d2)
-
-	# Collate the locales by base and encoding
-	utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
-	encodings = {}
-	for l in supported:
-		l = l[:-1]
-		(locale, charset) = l.split(" ")
-		if utf8_only and charset != 'UTF-8':
-			continue
-		m = dot_re.match(locale)
-		if m:
-			locale = m.group(1)
-		if not encodings.has_key(locale):
-			encodings[locale] = []
-		encodings[locale].append(charset)
+		to_generate = to_generate.split()
+		for locale in to_generate:
+			if locale not in supported:
+				if '.' in locale:
+					charset = locale.split('.')[1]
+				else:
+					charset = 'UTF-8'
+					bb.warn("Unsupported locale '%s', assuming encoding '%s'" % (locale, charset))
+				supported[locale] = charset
 
 	def output_locale_source(name, pkgname, locale, encoding):
 		d.setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
@@ -271,7 +261,7 @@ python package_do_split_gconvs () {
 
 		use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", True) or "0"
 		if use_cross_localedef == "1":
-	    		target_arch = d.getVar('TARGET_ARCH', True)
+			target_arch = d.getVar('TARGET_ARCH', True)
 			locale_arch_options = { \
 				"arm":     " --uint32-align=4 --little-endian ", \
 				"powerpc": " --uint32-align=4 --big-endian ",    \
@@ -334,25 +324,29 @@ python package_do_split_gconvs () {
 		bb.note("preparing tree for binary locale generation")
 		bb.build.exec_func("do_prep_locale_tree", d)
 
-	# Reshuffle names so that UTF-8 is preferred over other encodings
-	non_utf8 = []
-	for l in encodings.keys():
-		if len(encodings[l]) == 1:
-			output_locale(l, l, encodings[l][0])
-			if encodings[l][0] != "UTF-8":
-				non_utf8.append(l)
+	utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
+	encodings = {}
+	for locale in to_generate:
+		charset = supported[locale]
+		if utf8_only and charset != 'UTF-8':
+			continue
+
+		m = dot_re.match(locale)
+		if m:
+			base = m.group(1)
 		else:
-			if "UTF-8" in encodings[l]:
-				output_locale(l, l, "UTF-8")
-				encodings[l].remove("UTF-8")
-			else:
-				non_utf8.append(l)
-			for e in encodings[l]:
-				output_locale('%s.%s' % (l, e), l, e)
+			base = locale
 
-	if non_utf8 != [] and use_bin != "precompiled":
-		bb.note("the following locales are supported only in legacy encodings:")
-		bb.note("  " + " ".join(non_utf8))
+		# Precompiled locales are kept as is, obeying SUPPORTED, while
+		# others are adjusted, ensuring that the non-suffixed locales
+		# are utf-8, while the suffixed are not.
+		if use_bin == "precompiled":
+			output_locale(locale, base, charset)
+		else:
+			if charset == 'UTF-8':
+				output_locale(base, base, charset)
+			else:
+				output_locale('%s.%s' % (base, charset), base, charset)
 
 	if use_bin == "compile":
 		makefile = base_path_join(d.getVar("WORKDIR", True), "locale-tree", "Makefile")
-- 
1.7.7.6



