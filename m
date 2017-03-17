Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA2077A46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489765996; x=1521301996; h=from:to:subject:date:message-id;
	bh=IwR3GyB4XzYgIHLELVuj1o8xRojItbfudLRvveMhzRI=;
	b=PaPDV/69t8yeTYUx3mGiRSJb/HbICXeU68Bx6n+p2cRQ1Hzyd0O7jHRO
	2FYXGfM9ULHCcDLJ/tUmKRbKj+HDZA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 08:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,177,1486454400"; d="scan'208";a="1109585799"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.34.237])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2017 08:53:13 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:53:09 +0000
Message-Id: <20170317155309.4355-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] meta: replace uses of bb.data.expand(VARNAME, d) with d.expand(VARNAME)
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
X-List-Received-Date: Fri, 17 Mar 2017 15:53:14 -0000

bb.data.expand(x, d) is deprecated API.

[YOCTO #10678]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/archiver.bbclass                      | 2 +-
 meta/classes/package.bbclass                       | 4 ++--
 meta/classes/utility-tasks.bbclass                 | 2 +-
 meta/lib/oe/patch.py                               | 2 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb          | 2 +-
 meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ee4790d..2c04557 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -365,7 +365,7 @@ python do_ar_recipe () {
         elif include_re.match(line):
             incfile = include_re.match(line).group(1)
         if incfile:
-            incfile = bb.data.expand(incfile, d)
+            incfile = d.expand(incfile)
             incfile = bb.utils.which(bbpath, incfile)
             if incfile:
                 shutil.copy(incfile, outdir)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 871263f..b23458b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -778,7 +778,7 @@ python fixup_perms () {
         dir = d.getVar(path) or ""
         if dir == "":
             continue
-        fs_perms_table[dir] = fs_perms_entry(bb.data.expand("%s 0755 root root false - - -" % (dir), d))
+        fs_perms_table[dir] = fs_perms_entry(d.expand("%s 0755 root root false - - -" % (dir)))
 
     # Now we actually load from the configuration files
     for conf in get_fs_perms_list(d).split():
@@ -1801,7 +1801,7 @@ python package_do_pkgconfig () {
                         m = field_re.match(l)
                         if m:
                             hdr = m.group(1)
-                            exp = bb.data.expand(m.group(2), pd)
+                            exp = pd.expand(m.group(2))
                             if hdr == 'Requires':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
 
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index da69c3a..587bfd4 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -28,7 +28,7 @@ python do_clean() {
     bb.note("Removing " + dir)
     oe.path.remove(dir)
 
-    dir = "%s.*" % bb.data.expand(d.getVar('STAMP', False), d)
+    dir = "%s.*" % d.getVar('STAMP')
     bb.note("Removing " + dir)
     oe.path.remove(dir)
 
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index aaa2d3a..f1ab3dd 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -81,7 +81,7 @@ class PatchSet(object):
                 patch[param] = PatchSet.defaults[param]
 
         if patch.get("remote"):
-            patch["file"] = bb.data.expand(bb.fetch2.localpath(patch["remote"], self.d), self.d)
+            patch["file"] = self.d.expand(bb.fetch2.localpath(patch["remote"], self.d))
 
         patch["filemd5"] = bb.utils.md5_file(patch["file"])
 
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 67b9d53..df56d27 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -116,7 +116,7 @@ python populate_packages_prepend () {
         d.setVar('RPROVIDES_' + pkg, provides)
 
     mlprefix = d.getVar('MLPREFIX') or ''
-    dvar = bb.data.expand('${WORKDIR}/package', d, True)
+    dvar = d.expand('${WORKDIR}/package')
     pam_libdir = d.expand('${base_libdir}/security')
     pam_sbindir = d.expand('${sbindir}')
     pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
index 3928fb1..16686a0 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
@@ -59,7 +59,7 @@ do_install_append() {
 }
 
 python populate_packages_prepend() {
-    plugindir = bb.data.expand('${libdir}/alsa-lib/', d)
+    plugindir = d.expand('${libdir}/alsa-lib/')
     packages = " ".join(do_split_packages(d, plugindir, '^libasound_module_(.*)\.so$', 'libasound-module-%s', 'Alsa plugin for %s', extra_depends=''))
     d.setVar("RDEPENDS_alsa-plugins", packages)
 }
-- 
2.9.3


