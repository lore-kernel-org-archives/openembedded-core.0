Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UQkfy-0005dY-1F
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 22:34:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Apr 2013 13:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,465,1363158000"; d="scan'208";a="317416421"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2013 13:16:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 21:16:51 +0100
Message-Id: <30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365797632.git.paul.eggleton@linux.intel.com>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365797632.git.paul.eggleton@linux.intel.com>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Fri, 12 Apr 2013 20:34:35 -0000

Fix the fairly long-standing problem of treating a newer bblayers.conf
in the same manner as an older one (reporting that it had been updated
even if nothing was done). The recent work to do a reparse without
having to manually re-run bitbake turned this from an annoyance into an
endless loop, so it had to be fixed.

As part of fixing this the following changes have been made:
* Extensions are now implemented using a function list, so distro layers
  can add their own functions which should either succeed (indicating
  they have successfully updated the file) or raise an exception
  (indicating nothing could be done). The functions are called in
  succession until one succeeds, at which point we reparse.
* If we can't do the update, the error message now says "older/newer"
  instead of just "older" since we only know the version is different.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |   77 +++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ecc0a43..ac2314f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -4,8 +4,34 @@
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
 
-python check_bblayers_conf() {
-    bblayers_fn = os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
+def bblayers_conf_file(d):
+    return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
+
+def sanity_conf_read(fn):
+    with open(fn, 'r') as f:
+        lines = f.readlines()
+    return lines
+
+def sanity_conf_find_line(pattern, lines):
+    import re
+    return next(((index, line)
+        for index, line in enumerate(lines)
+        if re.search(pattern, line)), (None, None))
+
+def sanity_conf_update(fn, lines, version_var_name, new_version):
+    index, line = sanity_conf_find_line(version_var_name, lines)
+    lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
+    with open(fn, "w") as f:
+        f.write(''.join(lines))
+
+EXPORT_FUNCTIONS bblayers_conf_file sanity_conf_read sanity_conf_find_line sanity_conf_update
+
+# Functions added to this variable MUST throw an exception (or sys.exit()) unless they
+# successfully changed LCONF_VERSION in bblayers.conf
+BBLAYERS_CONF_UPDATE_FUNCS += "oecore_update_bblayers"
+
+python oecore_update_bblayers() {
+    # bblayers.conf is out of date, so see if we can resolve that
 
     current_lconf = int(d.getVar('LCONF_VERSION', True))
     if not current_lconf:
@@ -13,21 +39,15 @@ python check_bblayers_conf() {
     lconf_version = int(d.getVar('LAYER_CONF_VERSION', True))
     lines = []
 
-    import re
-    def find_line(pattern, lines):
-        return next(((index, line)
-            for index, line in enumerate(lines)
-            if re.search(pattern, line)), (None, None))
-
     if current_lconf < 4:
         sys.exit()
 
-    with open(bblayers_fn, 'r') as f:
-        lines = f.readlines()
+    bblayers_fn = bblayers_conf_file(d)
+    lines = sanity_conf_read(bblayers_fn)
 
-    if current_lconf == 4:
+    if current_lconf == 4 and lconf_version > 4:
         topdir_var = '$' + '{TOPDIR}'
-        index, bbpath_line = find_line('BBPATH', lines)
+        index, bbpath_line = sanity_conf_find_line('BBPATH', lines)
         if bbpath_line:
             start = bbpath_line.find('"')
             if start != -1 and (len(bbpath_line) != (start + 1)):
@@ -41,17 +61,17 @@ python check_bblayers_conf() {
             else:
                 sys.exit()
         else:
-            index, bbfiles_line = find_line('BBFILES', lines)
+            index, bbfiles_line = sanity_conf_find_line('BBFILES', lines)
             if bbfiles_line:
                 lines.insert(index, 'BBPATH = "' + topdir_var + '"\n')
             else:
                 sys.exit()
 
-        index, line = find_line('LCONF_VERSION', lines)
         current_lconf += 1
-        lines[index] = 'LCONF_VERSION = "%d"\n' % current_lconf
-        with open(bblayers_fn, "w") as f:
-            f.write(''.join(lines))
+        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        return
+
+    sys.exit()
 }
 
 def raise_sanity_error(msg, d, network_error=False):
@@ -387,18 +407,25 @@ def check_sanity(sanity_data):
     conf_version =  sanity_data.getVar('LOCALCONF_VERSION', True)
 
     if current_conf != conf_version:
-        messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way to visualise the changes.\n"
+        messages = messages + "Your version of local.conf was generated from an older/newer version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way to visualise the changes.\n"
 
     # Check bblayers.conf is valid
     current_lconf = sanity_data.getVar('LCONF_VERSION', True)
     lconf_version = sanity_data.getVar('LAYER_CONF_VERSION', True)
     if current_lconf != lconf_version:
-        try:
-            bb.build.exec_func("check_bblayers_conf", sanity_data)
-            bb.note("Your conf/bblayers.conf has been automatically updated.")
-            reparse = True
-        except Exception:
-            messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
+        funcs = sanity_data.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
+        for func in funcs:
+            success = True
+            try:
+                bb.build.exec_func(func, sanity_data)
+            except Exception:
+                success = False
+            if success:
+                bb.note("Your conf/bblayers.conf has been automatically updated.")
+                reparse = True
+                break
+        if not reparse:
+            messages = messages + "Your version of bblayers.conf was generated from an older/newer version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
 
     # If we have a site.conf, check it's valid
     if check_conf_exists("conf/site.conf", sanity_data):
@@ -454,7 +481,7 @@ def check_sanity(sanity_data):
         messages = messages + "Parsed PATH is " + str(paths) + "\n"
 
     bbpaths = sanity_data.getVar('BBPATH', True).split(":")
-    if "." in bbpaths or "" in bbpaths:
+    if ("." in bbpaths or "" in bbpaths) and not reparse:
         # TODO: change the following message to fatal when all BBPATH issues
         # are fixed
         bb.warn("BBPATH references the current directory, either through "    \
-- 
1.7.10.4



