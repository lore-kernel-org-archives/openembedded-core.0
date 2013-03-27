Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKv0H-0000yp-4K
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:23:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Mar 2013 11:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,920,1355126400"; d="scan'208";a="285386382"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.95])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2013 11:05:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 18:05:50 +0000
Message-Id: <243aaf7951d80bc4b75d9827daf2114a8f65b06f.1364407435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364407435.git.paul.eggleton@linux.intel.com>
References: <cover.1364407435.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1364407435.git.paul.eggleton@linux.intel.com>
References: <cover.1364407435.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] classes/buildhistory: improve SRCREV recording
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 18:23:18 -0000

Collect SRCREV information in a separate task and write it out in a
format which is more consistent with the rest of the buildhistory
output. Using a task means that SRCREV values will also be recorded for
native recipes and not just target ones, and the new formatting also
correctly handles multiple entries in SRC_URI.

Also adds scripts/buildhistory-collect-srcrevs which will report on all
of the recorded SRCREV values in a format suitable for use in global
configuration (e.g. local.conf or a distro inc file) to override AUTOREV
values to a fixed set of revisions. Example output:

 # emenlow-poky-linux
 SRCREV_machine_pn-linux-yocto = "b5c37fe6e24eec194bb29d22fdd55d73bcc709bf"
 SRCREV_emgd_pn-linux-yocto = "caea08c988e0f41103bbe18eafca20348f95da02"
 SRCREV_meta_pn-linux-yocto = "c2ed0f16fdec628242a682897d5d86df4547cf24"
 # core2-poky-linux
 SRCREV_pn-kmod = "62081c0f68905b22f375156d4532fd37fa5c8d33"
 SRCREV_pn-blktrace = "d6918c8832793b4205ed3bfede78c2f915c23385"
 SRCREV_pn-opkg = "649"

Some notes on using this script:
* By default only values where the SRCREV was not hardcoded (usually
  i.e. AUTOREV was used) are reported - use the -a option to see all
  SRCREV values.
* The output statements may not have any effect in the face of overrides
  applied elsewhere; use the -f option to add the forcevariable override
  to each output line to work around this.
* The script does not do any special handling for multiple machines;
  however it does place a comment before each set of values specifying
  which triplet they belong to as shown above.

Relates to [YOCTO #3041].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    |   58 +++++++++++++++++--
 scripts/buildhistory-collect-srcrevs |  104 ++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 6 deletions(-)
 create mode 100755 scripts/buildhistory-collect-srcrevs

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4b6be22..82d0bf8 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -259,12 +259,6 @@ def write_recipehistory(rcpinfo, d):
         f.write("DEPENDS = %s\n" %  rcpinfo.depends)
         f.write("PACKAGES = %s\n" %  rcpinfo.packages)
 
-    if rcpinfo.srcrev:
-        srcrevfile = os.path.join(pkghistdir, "latest_srcrev")
-        with open(srcrevfile, "w") as f:
-            f.write(','.join([rcpinfo.bbfile, rcpinfo.src_uri, rcpinfo.srcrev,
-                        rcpinfo.srcrev_autorev]))
-
 
 def write_pkghistory(pkginfo, d):
     bb.debug(2, "Writing package history for package %s" % pkginfo.name)
@@ -528,3 +522,55 @@ python buildhistory_eventhandler() {
 }
 
 addhandler buildhistory_eventhandler
+
+
+# FIXME this ought to be moved into the fetcher
+def _get_srcrev_values(d):
+    """
+    Return the version strings for the current recipe
+    """
+
+    scms = []
+    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI', True).split(), d)
+    urldata = fetcher.ud
+    for u in urldata:
+        if urldata[u].method.supports_srcrev():
+            scms.append(u)
+
+    autoinc_templ = 'AUTOINC+'
+    dict = {}
+    for scm in scms:
+        ud = urldata[scm]
+        for name in ud.names:
+            rev = ud.method.sortable_revision(scm, ud, d, name)
+            if rev.startswith(autoinc_templ):
+                rev = rev[len(autoinc_templ):]
+            dict[name] = rev
+    return dict
+
+python do_write_srcrev() {
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
+
+    srcrevs = _get_srcrev_values(d)
+    if srcrevs:
+        if not os.path.exists(pkghistdir):
+            os.makedirs(pkghistdir)
+        with open(srcrevfile, 'w') as f:
+            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
+            if orig_srcrev != 'INVALID':
+                f.write('# SRCREV = "%s"\n' % orig_srcrev)
+            if len(srcrevs) > 1:
+                for name, srcrev in srcrevs.items():
+                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
+                    if orig_srcrev:
+                        f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
+                    f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
+            else:
+                f.write('SRCREV = "%s"\n' % srcrevs.itervalues().next())
+    else:
+        if os.path.exists(srcrevfile):
+            os.remove(srcrevfile)
+}
+
+addtask write_srcrev after do_fetch before do_build
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
new file mode 100755
index 0000000..7f65c90
--- /dev/null
+++ b/scripts/buildhistory-collect-srcrevs
@@ -0,0 +1,104 @@
+#!/usr/bin/env python
+#
+# Collects the recorded SRCREV values from buildhistory and reports on them
+#
+# Copyright 2013 Intel Corporation
+# Authored-by:  Paul Eggleton <paul.eggleton@intel.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import os, sys
+import optparse
+import logging
+
+def logger_create():
+    logger = logging.getLogger("buildhistory")
+    loggerhandler = logging.StreamHandler()
+    loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+    logger.addHandler(loggerhandler)
+    logger.setLevel(logging.INFO)
+    return logger
+
+logger = logger_create()
+
+def main():
+    parser = optparse.OptionParser(
+        usage = """
+    %prog [options] <buildhistory-dir>""")
+
+    parser.add_option("-a", "--report-all",
+            help = "Report all SRCREV values, not just ones where AUTOREV has been used",
+            action="store_true", dest="reportall")
+    parser.add_option("-f", "--forcevariable",
+            help = "Use forcevariable override for all output lines",
+            action="store_true", dest="forcevariable")
+
+    options, args = parser.parse_args(sys.argv)
+
+    if len(args) != 2:
+        parser.print_help()
+        sys.exit(1)
+
+    buildhistory_dir = args[1]
+    if not os.path.exists(buildhistory_dir):
+        logger.error('specified buildhistory path %s could not be found' % buildhistory_dir)
+        sys.exit(1)
+
+    if options.forcevariable:
+        forcevariable = '_forcevariable'
+    else:
+        forcevariable = ''
+
+    lastdir = ''
+    for root, dirs, files in os.walk(buildhistory_dir):
+        if '.git' in dirs:
+            dirs.remove('.git')
+        for fn in files:
+            if fn == 'latest_srcrev':
+                curdir = os.path.basename(os.path.dirname(root))
+                if lastdir != curdir:
+                    print('# %s' % curdir)
+                    lastdir = curdir
+                fullpath = os.path.join(root, fn)
+                pn = os.path.basename(root)
+                srcrev = None
+                orig_srcrev = None
+                orig_srcrevs = {}
+                srcrevs = {}
+                with open(fullpath) as f:
+                    for line in f:
+                        if '=' in line:
+                            splitval = line.split('=')
+                            value = splitval[1].strip('" \t\n\r')
+                        if line.startswith('# SRCREV = '):
+                            orig_srcrev = value
+                        elif line.startswith('# SRCREV_'):
+                            splitval = line.split('=')
+                            name = splitval[0].split('_')[1].strip()
+                            orig_srcrevs[name] = value
+                        elif line.startswith('SRCREV ='):
+                            srcrev = value
+                        elif line.startswith('SRCREV_'):
+                            name = splitval[0].split('_')[1].strip()
+                            srcrevs[name] = value
+                if srcrev and (options.reportall or srcrev != orig_srcrev):
+                    print('SRCREV_pn-%s%s = "%s"' % (pn, forcevariable, srcrev))
+                for name, value in srcrevs.items():
+                    orig = orig_srcrevs.get(name, orig_srcrev)
+                    if options.reportall or value != orig:
+                        print('SRCREV_%s_pn-%s%s = "%s"' % (name, pn, forcevariable, value))
+
+
+if __name__ == "__main__":
+    main()
-- 
1.7.10.4



