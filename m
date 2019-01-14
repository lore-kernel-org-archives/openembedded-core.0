Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6BDF7C080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 23:04:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j2so880704wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QijqqSK6Ev2ZlS5CLCCoDKb6YBlZA45oPAQjTPffK9E=;
	b=KQAhOJn2ERZlBDjybDHfeJqkQmvEBXlQ80AxvIETtKmI6IrCM3wtX1HsLWZVdBdOj2
	VrawWYTdg9gmhxz5F9+zrts8vOb7B6D0Mv+2dVm5wLLZ8XIq37+oKwanuef2PcYjxCIB
	ahyGyW/IA5k2IeYQ3i/2upNPfPRbo/nP79iYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QijqqSK6Ev2ZlS5CLCCoDKb6YBlZA45oPAQjTPffK9E=;
	b=jD2gt+pkcO5Zaw3xAbL6NGrykubl0oeFtHyoptcv4Uyyf02UkFlfDFI1KtM76h1vF/
	ocTQeFlQy4dOr+hnSFpEQ1xbUMtWMwouIzB/VOt7om3WHNlu0DU0cHoAc8QfkFPJNuKT
	r66+cAlVsNveLCwN7pLpJKX0LE9H1/ut5Pchoe7cjTw/dMgMeZGMtvbVF54V7yyPD7fl
	d+5QJ4j4t5s1HBEGTAQjQqigwaz6CCNuj+YPeYAReuDXTPYYZde2nW+ZaT4npJYZLZQV
	iOkSfkWha/6XoFG7ixad8/B4SJ23i6wSSnaH+iBSDaFqpL4vOCvJt7ZAuHGoNa/TGEyC
	fq0g==
X-Gm-Message-State: AJcUukeJE9tGkfTuRNP9Z2yH/YREPXjtRYWSBCJgtRIZfAb6MUZqgvyY
	YPo9hBVaclH4pF6O8oj6iQIqrE6RinU=
X-Google-Smtp-Source: ALg8bN7Kwp9E0a7Bjmu6/WrHyFHCO/ucLxEhTQyAtvYcF9qUauAvYvcDNSvhBDo2JBFZRvE4vBO+GA==
X-Received: by 2002:adf:ca13:: with SMTP id o19mr589075wrh.148.1547507075228; 
	Mon, 14 Jan 2019 15:04:35 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f2sm87732099wre.34.2019.01.14.15.04.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 15:04:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 23:04:31 +0000
Message-Id: <20190114230432.22116-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2 v2] meta: Fix Deprecated warnings from regexs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 23:04:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix handling of escape characters in regexs and hence fix python
Deprecation warnings which will be problematic in python 3.8.

Note that some show up as:

"""
meta/classes/package.bbclass:1293: DeprecationWarning: invalid escape sequence \.  

"""

where the problem isn't on 1293 in package.bbclass but in some _prepend to a
package.bbclass function in a different file like mesa.inc, often from
do_package_split() calls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/debian.bbclass                   |  6 ++---
 meta/classes/gconf.bbclass                    |  2 +-
 meta/classes/kernel-module-split.bbclass      |  2 +-
 meta/classes/kernel.bbclass                   |  2 +-
 meta/classes/libc-package.bbclass             | 26 +++++++++----------
 meta/classes/package.bbclass                  | 22 ++++++++--------
 meta/lib/oe/license.py                        |  8 +++---
 meta/lib/oe/package.py                        |  2 +-
 meta/lib/oe/package_manager.py                | 24 ++++++++---------
 meta/lib/oe/patch.py                          |  4 +--
 meta/lib/oe/rootfs.py                         | 16 ++++++------
 meta/lib/oe/utils.py                          |  4 +--
 meta/recipes-connectivity/connman/connman.inc |  4 +--
 meta/recipes-core/ncurses/ncurses.inc         |  4 +--
 meta/recipes-core/util-linux/util-linux.inc   |  2 +-
 meta/recipes-devtools/llvm/llvm_git.bb        | 20 +++++++-------
 meta/recipes-devtools/orc/orc_0.4.28.bb       |  2 +-
 .../perl-sanity/perl-ptest.inc                |  2 +-
 .../perl-sanity/perl_5.28.1.bb                | 12 ++++-----
 .../iptables/iptables_1.6.2.bb                |  2 +-
 .../lighttpd/lighttpd_1.4.52.bb               |  2 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb     |  4 +--
 .../gdk-pixbuf/gdk-pixbuf_2.36.11.bb          |  2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc             |  4 +--
 meta/recipes-gnome/gtk+/gtk+_2.24.32.bb       |  4 +--
 meta/recipes-graphics/mesa/mesa.inc           |  4 +--
 .../xorg-lib/libxcb_1.13.1.bb                 |  2 +-
 .../alsa/alsa-plugins_1.1.6.bb                |  2 +-
 .../gstreamer/gst-plugins-package.inc         | 10 +++----
 .../pulseaudio/pulseaudio.inc                 |  4 +--
 30 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 989ea8f8d28..6f8a599ccb6 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -29,11 +29,11 @@ python debian_package_name_hook () {
 
     pkgdest = d.getVar("PKGDEST")
     packages = d.getVar('PACKAGES')
-    so_re = re.compile("lib.*\.so")
+    so_re = re.compile(r"lib.*\.so")
 
     def socrunch(s):
         s = s.lower().replace('_', '-')
-        m = re.match("^(.*)(.)\.so\.(.*)$", s)
+        m = re.match(r"^(.*)(.)\.so\.(.*)$", s)
         if m is None:
             return None
         if m.group(2) in '0123456789':
@@ -79,7 +79,7 @@ python debian_package_name_hook () {
                     try:
                         cmd = [d.expand("${TARGET_PREFIX}objdump"), "-p", f]
                         output = subprocess.check_output(cmd).decode("utf-8")
-                        for m in re.finditer("\s+SONAME\s+([^\s]+)", output):
+                        for m in re.finditer(r"\s+SONAME\s+([^\s]+)", output):
                             if m.group(1) not in sonames:
                                 sonames.append(m.group(1))
                     except subprocess.CalledProcessError:
diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 4e0ee2e7d59..3e3c509d5ff 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -49,7 +49,7 @@ python populate_packages_append () {
     for pkg in packages:
         schema_dir = '%s/%s/etc/gconf/schemas' % (pkgdest, pkg)
         schemas = []
-        schema_re = re.compile(".*\.schemas$")
+        schema_re = re.compile(r".*\.schemas$")
         if os.path.exists(schema_dir):
             for f in os.listdir(schema_dir):
                 if schema_re.match(f):
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e8996cf59ba..e8d3eb51057 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -133,7 +133,7 @@ python split_kernel_module_packages () {
     kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
     kernel_version = d.getVar("KERNEL_VERSION")
 
-    module_regex = '^(.*)\.k?o$'
+    module_regex = r'^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 45cb4fabc18..c0889bd3ee4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -578,7 +578,7 @@ pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='${nonarch_base_libdir}/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='${nonarch_base_libdir}/firmware', file_regex=r'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 82d642e15ed..0b4c666a74e 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -113,8 +113,8 @@ python package_do_split_gconvs () {
     def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
         f = open(fn, "rb")
-        c_re = re.compile('^copy "(.*)"')
-        i_re = re.compile('^include "(\w+)".*')
+        c_re = re.compile(r'^copy "(.*)"')
+        i_re = re.compile(r'^include "(\w+)".*')
         for l in f.readlines():
             l = l.decode("latin-1")
             m = c_re.match(l) or i_re.match(l)
@@ -128,15 +128,15 @@ python package_do_split_gconvs () {
         if bpn != 'glibc':
             d.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'))
 
-    do_split_packages(d, gconv_libdir, file_regex='^(.*)\.so$', output_pattern=bpn+'-gconv-%s', \
+    do_split_packages(d, gconv_libdir, file_regex=r'^(.*)\.so$', output_pattern=bpn+'-gconv-%s', \
         description='gconv module for character set %s', hook=calc_gconv_deps, \
         extra_depends=bpn+'-gconv')
 
     def calc_charmap_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
         f = open(fn, "rb")
-        c_re = re.compile('^copy "(.*)"')
-        i_re = re.compile('^include "(\w+)".*')
+        c_re = re.compile(r'^copy "(.*)"')
+        i_re = re.compile(r'^include "(\w+)".*')
         for l in f.readlines():
             l = l.decode("latin-1")
             m = c_re.match(l) or i_re.match(l)
@@ -150,14 +150,14 @@ python package_do_split_gconvs () {
         if bpn != 'glibc':
             d.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'))
 
-    do_split_packages(d, charmap_dir, file_regex='^(.*)\.gz$', output_pattern=bpn+'-charmap-%s', \
+    do_split_packages(d, charmap_dir, file_regex=r'^(.*)\.gz$', output_pattern=bpn+'-charmap-%s', \
         description='character map for %s encoding', hook=calc_charmap_deps, extra_depends='')
 
     def calc_locale_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
         f = open(fn, "rb")
-        c_re = re.compile('^copy "(.*)"')
-        i_re = re.compile('^include "(\w+)".*')
+        c_re = re.compile(r'^copy "(.*)"')
+        i_re = re.compile(r'^include "(\w+)".*')
         for l in f.readlines():
             l = l.decode("latin-1")
             m = c_re.match(l) or i_re.match(l)
@@ -171,13 +171,13 @@ python package_do_split_gconvs () {
         if bpn != 'glibc':
             d.setVar('RPROVIDES_%s' % pkg, pkg.replace(bpn, 'glibc'))
 
-    do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern=bpn+'-localedata-%s', \
+    do_split_packages(d, locales_dir, file_regex=r'(.*)', output_pattern=bpn+'-localedata-%s', \
         description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
     d.setVar('PACKAGES', d.getVar('PACKAGES', False) + ' ' + d.getVar('MLPREFIX', False) + bpn + '-gconv')
 
     use_bin = d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE")
 
-    dot_re = re.compile("(.*)\.(.*)")
+    dot_re = re.compile(r"(.*)\.(.*)")
 
     # Read in supported locales and associated encodings
     supported = {}
@@ -290,7 +290,7 @@ python package_do_split_gconvs () {
         d.setVar('ALLOW_EMPTY_%s' % pkgname, '1')
         d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES')))
         rprovides = ' %svirtual-locale-%s' % (mlprefix, legitimize_package_name(name))
-        m = re.match("(.*)_(.*)", name)
+        m = re.match(r"(.*)_(.*)", name)
         if m:
             rprovides += ' %svirtual-locale-%s' % (mlprefix, m.group(1))
         d.setVar('RPROVIDES_%s' % pkgname, rprovides)
@@ -356,12 +356,12 @@ python package_do_split_gconvs () {
     if use_bin in ('compile', 'precompiled'):
         lcsplit = d.getVar('GLIBC_SPLIT_LC_PACKAGES')
         if lcsplit and int(lcsplit):
-            do_split_packages(d, binary_locales_dir, file_regex='^(.*/LC_\w+)', \
+            do_split_packages(d, binary_locales_dir, file_regex=r'^(.*/LC_\w+)', \
                 output_pattern=bpn+'-binary-localedata-%s', \
                 description='binary locale definition for %s', recursive=True,
                 hook=metapkg_hook, extra_depends='', allow_dirs=True, match_path=True)
         else:
-            do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
+            do_split_packages(d, binary_locales_dir, file_regex=r'(.*)', \
                 output_pattern=bpn+'-binary-localedata-%s', \
                 description='binary locale definition for %s', extra_depends='', allow_dirs=True)
     else:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7a7bc9e2f05..853735f0c64 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -75,7 +75,7 @@ def legitimize_package_name(s):
             return ('\\u%s' % cp).encode('latin-1').decode('unicode_escape')
 
     # Handle unicode codepoints encoded as <U0123>, as in glibc locale files.
-    s = re.sub('<U([0-9A-Fa-f]{1,4})>', fixutf, s)
+    s = re.sub(r'<U([0-9A-Fa-f]{1,4})>', fixutf, s)
 
     # Remaining package name validity fixes
     return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
@@ -1590,8 +1590,8 @@ python package_do_shlibs() {
         bb.note("not generating shlibs")
         return
 
-    lib_re = re.compile("^.*\.so")
-    libdir_re = re.compile(".*/%s$" % d.getVar('baselib'))
+    lib_re = re.compile(r"^.*\.so")
+    libdir_re = re.compile(r".*/%s$" % d.getVar('baselib'))
 
     packages = d.getVar('PACKAGES')
 
@@ -1632,17 +1632,17 @@ python package_do_shlibs() {
         fd.close()
         rpath = tuple()
         for l in lines:
-            m = re.match("\s+RPATH\s+([^\s]*)", l)
+            m = re.match(r"\s+RPATH\s+([^\s]*)", l)
             if m:
                 rpaths = m.group(1).replace("$ORIGIN", ldir).split(":")
                 rpath = tuple(map(os.path.normpath, rpaths))
         for l in lines:
-            m = re.match("\s+NEEDED\s+([^\s]*)", l)
+            m = re.match(r"\s+NEEDED\s+([^\s]*)", l)
             if m:
                 dep = m.group(1)
                 if dep not in needed:
                     needed.add((dep, file, rpath))
-            m = re.match("\s+SONAME\s+([^\s]*)", l)
+            m = re.match(r"\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
                 prov = (this_soname, ldir, pkgver)
@@ -1722,7 +1722,7 @@ python package_do_shlibs() {
             out, err = p.communicate()
             # process the output, grabbing all .dll names
             if p.returncode == 0:
-                for m in re.finditer("DLL Name: (.*?\.dll)$", out.decode(), re.MULTILINE | re.IGNORECASE):
+                for m in re.finditer(r"DLL Name: (.*?\.dll)$", out.decode(), re.MULTILINE | re.IGNORECASE):
                     dllname = m.group(1)
                     if dllname:
                         needed[pkg].add((dllname, file, tuple()))
@@ -1883,9 +1883,9 @@ python package_do_pkgconfig () {
     shlibs_dirs = d.getVar('SHLIBSDIRS').split()
     shlibswork_dir = d.getVar('SHLIBSWORKDIR')
 
-    pc_re = re.compile('(.*)\.pc$')
-    var_re = re.compile('(.*)=(.*)')
-    field_re = re.compile('(.*): (.*)')
+    pc_re = re.compile(r'(.*)\.pc$')
+    var_re = re.compile(r'(.*)=(.*)')
+    field_re = re.compile(r'(.*): (.*)')
 
     pkgconfig_provided = {}
     pkgconfig_needed = {}
@@ -1933,7 +1933,7 @@ python package_do_pkgconfig () {
         if not os.path.exists(dir):
             continue
         for file in os.listdir(dir):
-            m = re.match('^(.*)\.pclist$', file)
+            m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
                 fd = open(os.path.join(dir, file))
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index ca385d5187a..04f5b316a9b 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -13,8 +13,8 @@ def license_ok(license, dont_want_licenses):
         # will exclude a trailing '+' character from LICENSE in
         # case INCOMPATIBLE_LICENSE is not a 'X+' license.
         lic = license
-        if not re.search('\+$', dwl):
-            lic = re.sub('\+', '', license)
+        if not re.search(r'\+$', dwl):
+            lic = re.sub(r'\+', '', license)
         if fnmatch(lic, dwl):
             return False
     return True
@@ -40,8 +40,8 @@ class InvalidLicense(LicenseError):
         return "invalid characters in license '%s'" % self.license
 
 license_operator_chars = '&|() '
-license_operator = re.compile('([' + license_operator_chars + '])')
-license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
+license_operator = re.compile(r'([' + license_operator_chars + '])')
+license_pattern = re.compile(r'[a-zA-Z0-9.+_\-]+$')
 
 class LicenseVisitor(ast.NodeVisitor):
     """Get elements based on OpenEmbedded license strings"""
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index efd36b3758d..6e83f01f148 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -255,7 +255,7 @@ def read_shlib_providers(d):
 
     shlib_provider = {}
     shlibs_dirs = d.getVar('SHLIBSDIRS').split()
-    list_re = re.compile('^(.*)\.list$')
+    list_re = re.compile(r'^(.*)\.list$')
     # Go from least to most specific since the last one found wins
     for dir in reversed(shlibs_dirs):
         bb.debug(2, "Reading shlib providers in %s" % (dir))
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7ff76c61cdd..1087144d47f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -29,7 +29,7 @@ def opkg_query(cmd_output):
     a dictionary with the information of the packages. This is used
     when the packages are in deb or ipk format.
     """
-    verregex = re.compile(' \([=<>]* [^ )]*\)')
+    verregex = re.compile(r' \([=<>]* [^ )]*\)')
     output = dict()
     pkg = ""
     arch = ""
@@ -252,8 +252,8 @@ class DpkgIndexer(Indexer):
             with open(os.path.join(self.d.expand("${STAGING_ETCDIR_NATIVE}"),
                 "apt", "apt.conf.sample")) as apt_conf_sample:
                 for line in apt_conf_sample.read().split("\n"):
-                    line = re.sub("#ROOTFS#", "/dev/null", line)
-                    line = re.sub("#APTCONF#", self.apt_conf_dir, line)
+                    line = re.sub(r"#ROOTFS#", "/dev/null", line)
+                    line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
                     apt_conf.write(line + "\n")
 
     def write_index(self):
@@ -408,7 +408,7 @@ class PackageManager(object, metaclass=ABCMeta):
         with open(postinst_intercept_hook) as intercept:
             registered_pkgs = None
             for line in intercept.read().split("\n"):
-                m = re.match("^##PKGS:(.*)", line)
+                m = re.match(r"^##PKGS:(.*)", line)
                 if m is not None:
                     registered_pkgs = m.group(1).strip()
                     break
@@ -1217,7 +1217,7 @@ class OpkgPM(OpkgDpkgPM):
                 priority += 5
 
             for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
-                feed_match = re.match("^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
+                feed_match = re.match(r"^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
 
                 if feed_match is not None:
                     feed_name = feed_match.group(1)
@@ -1597,7 +1597,7 @@ class DpkgPM(OpkgDpkgPM):
 
         with open(status_file, "r") as status:
             for line in status.read().split('\n'):
-                m = re.match("^Package: (.*)", line)
+                m = re.match(r"^Package: (.*)", line)
                 if m is not None:
                     installed_pkgs.append(m.group(1))
 
@@ -1662,13 +1662,13 @@ class DpkgPM(OpkgDpkgPM):
         # rename *.dpkg-new files/dirs
         for root, dirs, files in os.walk(self.target_rootfs):
             for dir in dirs:
-                new_dir = re.sub("\.dpkg-new", "", dir)
+                new_dir = re.sub(r"\.dpkg-new", "", dir)
                 if dir != new_dir:
                     os.rename(os.path.join(root, dir),
                               os.path.join(root, new_dir))
 
             for file in files:
-                new_file = re.sub("\.dpkg-new", "", file)
+                new_file = re.sub(r"\.dpkg-new", "", file)
                 if file != new_file:
                     os.rename(os.path.join(root, file),
                               os.path.join(root, new_file))
@@ -1733,7 +1733,7 @@ class DpkgPM(OpkgDpkgPM):
                     sources_file.write("deb %s ./\n" % uri)
 
     def _create_configs(self, archs, base_archs):
-        base_archs = re.sub("_", "-", base_archs)
+        base_archs = re.sub(r"_", r"-", base_archs)
 
         if os.path.exists(self.apt_conf_dir):
             bb.utils.remove(self.apt_conf_dir, True)
@@ -1787,7 +1787,7 @@ class DpkgPM(OpkgDpkgPM):
         with open(self.apt_conf_file, "w+") as apt_conf:
             with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
                 for line in apt_conf_sample.read().split("\n"):
-                    match_arch = re.match("  Architecture \".*\";$", line)
+                    match_arch = re.match(r"  Architecture \".*\";$", line)
                     architectures = ""
                     if match_arch:
                         for base_arch in base_arch_list:
@@ -1795,8 +1795,8 @@ class DpkgPM(OpkgDpkgPM):
                         apt_conf.write("  Architectures {%s};\n" % architectures);
                         apt_conf.write("  Architecture \"%s\";\n" % base_archs)
                     else:
-                        line = re.sub("#ROOTFS#", self.target_rootfs, line)
-                        line = re.sub("#APTCONF#", self.apt_conf_dir, line)
+                        line = re.sub(r"#ROOTFS#", self.target_rootfs, line)
+                        line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
                         apt_conf.write(line + "\n")
 
         target_dpkg_dir = "%s/var/lib/dpkg" % self.target_rootfs
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index e0f0604251a..07a40fc50e6 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -334,8 +334,8 @@ class GitApplyTree(PatchTree):
     @staticmethod
     def interpretPatchHeader(headerlines):
         import re
-        author_re = re.compile('[\S ]+ <\S+@\S+\.\S+>')
-        from_commit_re = re.compile('^From [a-z0-9]{40} .*')
+        author_re = re.compile(r'[\S ]+ <\S+@\S+\.\S+>')
+        from_commit_re = re.compile(r'^From [a-z0-9]{40} .*')
         outlines = []
         author = None
         date = None
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4273891699f..551dcfc75f7 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -354,9 +354,9 @@ class Rootfs(object, metaclass=ABCMeta):
 class RpmRootfs(Rootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
         super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = '(unpacking of archive failed|Cannot find package'\
-                               '|exit 1|ERROR: |Error: |Error |ERROR '\
-                               '|Failed |Failed: |Failed$|Failed\(\d+\):)'
+        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
+                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
+                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
@@ -499,7 +499,7 @@ class DpkgOpkgRootfs(Rootfs):
             pkg_depends_list = []
             # filter version requirements like libc (>= 1.1)
             for dep in pkg_depends.split(', '):
-                m_dep = re.match("^(.*) \(.*\)$", dep)
+                m_dep = re.match(r"^(.*) \(.*\)$", dep)
                 if m_dep:
                     dep = m_dep.group(1)
                 pkg_depends_list.append(dep)
@@ -515,9 +515,9 @@ class DpkgOpkgRootfs(Rootfs):
             data = status.read()
             status.close()
             for line in data.split('\n'):
-                m_pkg = re.match("^Package: (.*)", line)
-                m_status = re.match("^Status:.*unpacked", line)
-                m_depends = re.match("^Depends: (.*)", line)
+                m_pkg = re.match(r"^Package: (.*)", line)
+                m_status = re.match(r"^Status:.*unpacked", line)
+                m_depends = re.match(r"^Depends: (.*)", line)
 
                 #Only one of m_pkg, m_status or m_depends is not None at time
                 #If m_pkg is not None, we started a new package
@@ -771,7 +771,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if allow_replace is None:
             allow_replace = ""
 
-        allow_rep = re.compile(re.sub("\|$", "", allow_replace))
+        allow_rep = re.compile(re.sub(r"\|$", r"", allow_replace))
         error_prompt = "Multilib check error:"
 
         files = {}
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index ee6f0e6647f..7b574ffd30d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -326,7 +326,7 @@ def multiprocess_launch(target, items, d, extraargs=None):
 
 def squashspaces(string):
     import re
-    return re.sub("\s+", " ", string).strip()
+    return re.sub(r"\s+", " ", string).strip()
 
 def format_pkg_list(pkg_dict, ret_format=None):
     output = []
@@ -374,7 +374,7 @@ def host_gcc_version(d, taskcontextonly=False):
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
 
-    match = re.match(".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    match = re.match(r".* (\d\.\d)\.\d.*", output.split('\n')[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 0ba375137d9..0a117e44a42 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -133,14 +133,14 @@ python populate_packages_prepend() {
         add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, False)
     plugin_dir = d.expand('${libdir}/connman/plugins/')
     plugin_name = d.expand('${PN}-plugin-%s')
-    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, \
+    do_split_packages(d, plugin_dir, r'^(.*).so$', plugin_name, \
         '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
 
     hook = lambda file,pkg,x,y,z: \
         add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, True)
     plugin_dir = d.expand('${libdir}/connman/plugins-vpn/')
     plugin_name = d.expand('${PN}-plugin-vpn-%s')
-    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, \
+    do_split_packages(d, plugin_dir, r'^(.*).so$', plugin_name, \
         '${PN} VPN plugin for %s', extra_depends='', hook=hook, prepend=True )
 }
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 99fc47869ea..5f2cc358233 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -260,9 +260,9 @@ python populate_packages_prepend () {
     libdir = d.expand("${libdir}")
     base_libdir = d.expand("${base_libdir}")
     pnbase = d.expand("${PN}-lib%s")
-    do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+    do_split_packages(d, libdir, r'^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
     if libdir is not base_libdir:
-        do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+        do_split_packages(d, base_libdir, r'^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
 }
 
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b5f77f7b6bd..e514041a191 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -314,7 +314,7 @@ python do_package_prepend () {
 }
 
 python populate_packages_prepend() {
-    do_split_packages(d, '${base_libdir}', '^lib(.*)\.so\..*$',
+    do_split_packages(d, '${base_libdir}', r'^lib(.*)\.so\..*$',
                       output_pattern='util-linux-lib%s',
                       description='util-linux lib%s',
                       extra_depends='', prepend=True, allow_links=True)
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 727876303d6..eb0779d6ec9 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -34,13 +34,13 @@ LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 def get_llvm_arch(bb, d, arch_var):
     import re
     a = d.getVar(arch_var)
-    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
-    elif re.match('arm$', a):                          return 'ARM'
-    elif re.match('armeb$', a):                        return 'ARM'
-    elif re.match('aarch64$', a):                      return 'AArch64'
-    elif re.match('aarch64_be$', a):                   return 'AArch64'
-    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
+    if   re.match(r'(i.86|athlon|x86.64)$', a):         return 'X86'
+    elif re.match(r'arm$', a):                          return 'ARM'
+    elif re.match(r'armeb$', a):                        return 'ARM'
+    elif re.match(r'aarch64$', a):                      return 'AArch64'
+    elif re.match(r'aarch64_be$', a):                   return 'AArch64'
+    elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
     else:
         raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
 
@@ -172,9 +172,9 @@ INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm += "dev-so"
 python llvm_populate_packages() {
     libdir = bb.data.expand('${libdir}', d)
     libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
-    split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
-    split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
+    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', r'^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
+    split_packages = do_split_packages(d, libdir, r'^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
+    split_staticdev_packages = do_split_packages(d, libllvm_libdir, r'^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
         pn = d.getVar('PN')
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
diff --git a/meta/recipes-devtools/orc/orc_0.4.28.bb b/meta/recipes-devtools/orc/orc_0.4.28.bb
index 415de64dc42..03cddad8bbd 100644
--- a/meta/recipes-devtools/orc/orc_0.4.28.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.28.bb
@@ -19,7 +19,7 @@ FILES_${PN} = "${bindir}/*"
 
 python populate_packages_prepend () {
     libdir = d.expand('${libdir}')
-    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, libdir, r'^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
 }
 
 do_compile_prepend_class-native () {
diff --git a/meta/recipes-devtools/perl-sanity/perl-ptest.inc b/meta/recipes-devtools/perl-sanity/perl-ptest.inc
index 597e5d841ee..9dd9b7da57f 100644
--- a/meta/recipes-devtools/perl-sanity/perl-ptest.inc
+++ b/meta/recipes-devtools/perl-sanity/perl-ptest.inc
@@ -46,7 +46,7 @@ python populate_packages_prepend() {
     # do_split_packages requires a pair of () in the regex, but we have nothing
     # to match, so use an empty pair.
     if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
-        do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
+        do_split_packages(d, d.expand('${libdir}/perl/${PV}'), r'.*\.t()',
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 0df821d446a..71892a2436c 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -222,12 +222,12 @@ PACKAGESPLITFUNCS_prepend = "split_perl_packages "
 
 python split_perl_packages () {
     libdir = d.expand('${libdir}/perl5/${PV}')
-    do_split_packages(d, libdir, '.*/auto/([^.]*)/[^/]*\.(so|ld|ix|al)', '${PN}-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
-    do_split_packages(d, libdir, '.*linux/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, 'Module/([^\/]*)/.*', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, '.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'.*/auto/([^.]*)/[^/]*\.(so|ld|ix|al)', '${PN}-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'.*linux/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'Module/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'Module/([^\/]*)/.*', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
     # perl-modules should recommend every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
diff --git a/meta/recipes-extended/iptables/iptables_1.6.2.bb b/meta/recipes-extended/iptables/iptables_1.6.2.bb
index e00824f7634..a57cac34eb8 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.2.bb
@@ -39,7 +39,7 @@ PACKAGES += "${PN}-modules"
 PACKAGES_DYNAMIC += "^${PN}-module-.*"
 
 python populate_packages_prepend() {
-    modules = do_split_packages(d, '${libdir}/xtables', 'lib(.*)\.so$', '${PN}-module-%s', '${PN} module %s', extra_depends='')
+    modules = do_split_packages(d, '${libdir}/xtables', r'lib(.*)\.so$', '${PN}-module-%s', '${PN} module %s', extra_depends='')
     if modules:
         metapkg = d.getVar('PN') + '-modules'
         d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
index adf77598d83..fb76a8bbb1a 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
@@ -81,5 +81,5 @@ PACKAGES_DYNAMIC += "^lighttpd-module-.*"
 
 python populate_packages_prepend () {
     lighttpd_libdir = d.expand('${libdir}')
-    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
+    do_split_packages(d, lighttpd_libdir, r'^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
 }
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 3aec2cdb4c3..5c45460c3a8 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -120,7 +120,7 @@ python populate_packages_prepend () {
     pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
     pam_pkgname = mlprefix + 'pam-plugin%s'
 
-    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', pam_pkgname,
+    do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
                       'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
@@ -129,7 +129,7 @@ python populate_packages_prepend () {
     pam_plugin_append_file('%spam-plugin-timestamp' % mlprefix, pam_sbindir, 'pam_timestamp_check')
     pam_plugin_append_file('%spam-plugin-mkhomedir' % mlprefix, pam_sbindir, 'mkhomedir_helper')
     pam_plugin_append_file('%spam-plugin-console' % mlprefix, pam_sbindir, 'pam_console_apply')
-    do_split_packages(d, pam_filterdir, '^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
+    do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
 }
 
 do_install() {
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
index 99c84c6dda4..e4f2eee9764 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
@@ -69,7 +69,7 @@ python populate_packages_prepend () {
 
     loaders_root = d.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders')
 
-    packages = ' '.join(do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s'))
+    packages = ' '.join(do_split_packages(d, loaders_root, r'^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s'))
     d.setVar('PIXBUF_PACKAGES', packages)
 
     # The test suite exercises all the loaders, so ensure they are all
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 519a9840f42..1b0829de075 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -123,11 +123,11 @@ python populate_packages_prepend () {
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-    immodules = do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')
+    immodules = do_split_packages(d, immodules_root, r'^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')
     if immodules:
         d.setVar("GTKIMMODULES_PACKAGES", " ".join(immodules))
 
-    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
+    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-3.0')
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
index 89fca736b25..682d31e49e2 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
@@ -27,8 +27,8 @@ python populate_packages_prepend () {
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
-    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
+    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, r'^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
+    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-2.0')
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0cc0a82de49..06c47e6dd41 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -194,7 +194,7 @@ python mesa_populate_packages() {
         dri_pkgs = os.listdir(dri_drivers_root)
         lib_name = d.expand("${MLPREFIX}mesa-megadriver")
         for p in dri_pkgs:
-            m = re.match('^(.*)_dri\.so$', p)
+            m = re.match(r'^(.*)_dri\.so$', p)
             if m:
                 pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
                 d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
@@ -202,7 +202,7 @@ python mesa_populate_packages() {
                 d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
 
     pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
-    do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
+    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
 PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
index d8cee510ca8..84303e6246f 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
@@ -35,5 +35,5 @@ REQUIRED_DISTRO_FEATURES_class-native = ""
 export PYTHON = "python3"
 
 python populate_packages_prepend () {
-    do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
+    do_split_packages(d, '${libdir}', r'^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
 }
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
index 17c1879f95c..7ede8be98a2 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
@@ -60,7 +60,7 @@ do_install_append() {
 
 python populate_packages_prepend() {
     plugindir = d.expand('${libdir}/alsa-lib/')
-    packages = " ".join(do_split_packages(d, plugindir, '^libasound_module_(.*)\.so$', 'libasound-module-%s', 'Alsa plugin for %s', extra_depends=''))
+    packages = " ".join(do_split_packages(d, plugindir, r'^libasound_module_(.*)\.so$', 'libasound-module-%s', 'Alsa plugin for %s', extra_depends=''))
     d.setVar("RDEPENDS_alsa-plugins", packages)
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 3fdb10e4046..c995e29e09d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -6,11 +6,11 @@ python split_gstreamer10_packages () {
     postinst = d.getVar('plugin_postinst')
     glibdir = d.getVar('libdir')
 
-    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
-    do_split_packages(d, glibdir+'/girepository-1.0', 'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer typelib file for %s', postinst=postinst, extra_depends='')
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends='${PN}-dev')
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends='${PN}-staticdev')
+    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
+    do_split_packages(d, glibdir+'/girepository-1.0', r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer typelib file for %s', postinst=postinst, extra_depends='')
+    do_split_packages(d, gst_libdir, r'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends='${PN}-dev')
+    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends='${PN}-staticdev')
 }
 
 python set_metapkg_rdepends () {
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 8c58c372486..9a95e7c65b1 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -211,8 +211,8 @@ pkg_postinst_${PN}-server() {
 
 python populate_packages_prepend() {
     plugindir = d.expand('${libdir}/pulse-${PV}/modules/')
-    do_split_packages(d, plugindir, '^module-(.*)\.so$', '${PN}-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
-    do_split_packages(d, plugindir, '^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
+    do_split_packages(d, plugindir, r'^module-(.*)\.so$', '${PN}-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
+    do_split_packages(d, plugindir, r'^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
 
 RDEPENDS_pulseaudio-server = " \
-- 
2.19.1


