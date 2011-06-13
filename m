Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW163-0002Fr-H9
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500601"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:15 -0700
Message-Id: <6b3b2c8d48ea7dd01db95578866555fd75a25004.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [*RFC CONSOLIDATED PULL RFC* 05/23] import recipe_sanity.bbclass from oe master
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:04 -0000

From: Phil Blundell <pb@pbcl.net>

This is a verbatim copy of the corresponding class from oe master.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/recipe_sanity.bbclass |  179 ++++++++++++++++++++++++++++++++++++
 1 files changed, 179 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/recipe_sanity.bbclass

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
new file mode 100644
index 0000000..bb60ffa
--- /dev/null
+++ b/meta/classes/recipe_sanity.bbclass
@@ -0,0 +1,179 @@
+def __note(msg, d):
+    bb.note("%s: recipe_sanity: %s" % (d.getVar("P", 1), msg))
+
+__recipe_sanity_badruntimevars = "RDEPENDS RPROVIDES RRECOMMENDS RCONFLICTS"
+def bad_runtime_vars(cfgdata, d):
+    if bb.data.inherits_class("native", d) or \
+       bb.data.inherits_class("cross", d):
+        return
+
+    for var in d.getVar("__recipe_sanity_badruntimevars", 1).split():
+        val = d.getVar(var, 0)
+        if val and val != cfgdata.get(var):
+            __note("%s should be %s_${PN}" % (var, var), d)
+
+__recipe_sanity_reqvars = "DESCRIPTION"
+__recipe_sanity_reqdiffvars = "LICENSE"
+def req_vars(cfgdata, d):
+    for var in d.getVar("__recipe_sanity_reqvars", 1).split():
+        if not d.getVar(var, 0):
+            __note("%s should be set" % var, d)
+
+    for var in d.getVar("__recipe_sanity_reqdiffvars", 1).split():
+        val = d.getVar(var, 0)
+        cfgval = cfgdata.get(var)
+
+        # Hardcoding is bad, but I'm lazy.  We don't care about license being
+        # unset if the recipe has no sources!
+        if var == "LICENSE" and d.getVar("SRC_URI", 1) == cfgdata.get("SRC_URI"):
+            continue
+
+        if not val:
+            __note("%s should be set" % var, d)
+        elif val == cfgval:
+            __note("%s should be defined to something other than default (%s)" % (var, cfgval), d)
+
+def var_renames_overwrite(cfgdata, d):
+    renames = d.getVar("__recipe_sanity_renames", 0)
+    if renames:
+        for (key, newkey, oldvalue, newvalue) in renames:
+            if oldvalue != newvalue and oldvalue != cfgdata.get(newkey):
+                __note("rename of variable '%s' to '%s' overwrote existing value '%s' with '%s'." % (key, newkey, oldvalue, newvalue), d)
+
+def incorrect_nonempty_PACKAGES(cfgdata, d):
+    if bb.data.inherits_class("native", d) or \
+       bb.data.inherits_class("cross", d):
+        if d.getVar("PACKAGES", 1):
+            return True
+
+def can_use_autotools_base(cfgdata, d):
+    cfg = d.getVar("do_configure", 1)
+    if not bb.data.inherits_class("autotools", d):
+        return False
+
+    for i in ["autoreconf"] + ["%s_do_configure" % cls for cls in ["gnomebase", "gnome", "e", "autotools", "efl", "gpephone", "openmoko", "openmoko2", "xfce", "xlibs"]]:
+        if cfg.find(i) != -1:
+            return False
+
+    import os
+    for clsfile in d.getVar("__inherit_cache", 0):
+        (base, _) = os.path.splitext(os.path.basename(clsfile))
+        if cfg.find("%s_do_configure" % base) != -1:
+            __note("autotools_base usage needs verification, spotted %s_do_configure" % base, d)
+
+    return True
+
+def can_remove_FILESPATH(cfgdata, d):
+    expected = cfgdata.get("FILESPATH")
+    #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
+    expectedpaths = bb.data.expand(expected, d)
+    unexpanded = d.getVar("FILESPATH", 0)
+    filespath = d.getVar("FILESPATH", 1).split(":")
+    filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
+    for fp in filespath:
+        if not fp in expectedpaths:
+            # __note("Path %s in FILESPATH not in the expected paths %s" %
+            # (fp, expectedpaths), d)
+            return False
+    return expected != unexpanded
+
+def can_remove_FILESDIR(cfgdata, d):
+    expected = cfgdata.get("FILESDIR")
+    #expected = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
+    unexpanded = d.getVar("FILESDIR", 0)
+    if unexpanded is None:
+        return False
+
+    expanded = os.path.normpath(d.getVar("FILESDIR", 1))
+    filespath = d.getVar("FILESPATH", 1).split(":")
+    filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
+
+    return unexpanded != expected and \
+           os.path.exists(expanded) and \
+           (expanded in filespath or
+            expanded == bb.data.expand(expected, d))
+
+def can_remove_others(p, cfgdata, d):
+    for k in ["S", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
+              "SECTION", "PACKAGES", "EXTRA_OECONF", "EXTRA_OEMAKE"]:
+    #for k in cfgdata:
+        unexpanded = d.getVar(k, 0)
+        cfgunexpanded = cfgdata.get(k)
+        if not cfgunexpanded:
+            continue
+
+        try:
+            expanded = d.getVar(k, 1)
+            cfgexpanded = bb.data.expand(cfgunexpanded, d)
+        except bb.fetch.ParameterError:
+            continue
+
+        if unexpanded != cfgunexpanded and \
+           cfgexpanded == expanded:
+           __note("candidate for removal of %s" % k, d)
+           bb.debug(1, "%s: recipe_sanity:   cfg's '%s' and d's '%s' both expand to %s" %
+                       (p, cfgunexpanded, unexpanded, expanded))
+
+python do_recipe_sanity () {
+    p = d.getVar("P", 1)
+    p = "%s %s %s" % (d.getVar("PN", 1), d.getVar("PV", 1), d.getVar("PR", 1))
+
+    sanitychecks = [
+        (can_remove_FILESDIR, "candidate for removal of FILESDIR"),
+        (can_remove_FILESPATH, "candidate for removal of FILESPATH"),
+        #(can_use_autotools_base, "candidate for use of autotools_base"),
+        (incorrect_nonempty_PACKAGES, "native or cross recipe with non-empty PACKAGES"),
+    ]
+    cfgdata = d.getVar("__recipe_sanity_cfgdata", 0)
+
+    for (func, msg) in sanitychecks:
+        if func(cfgdata, d):
+            __note(msg, d)
+
+    can_remove_others(p, cfgdata, d)
+    var_renames_overwrite(cfgdata, d)
+    req_vars(cfgdata, d)
+    bad_runtime_vars(cfgdata, d)
+}
+do_recipe_sanity[nostamp] = "1"
+#do_recipe_sanity[recrdeptask] = "do_recipe_sanity"
+addtask recipe_sanity
+
+do_recipe_sanity_all[nostamp] = "1"
+do_recipe_sanity_all[recrdeptask] = "do_recipe_sanity"
+do_recipe_sanity_all () {
+    :
+}
+addtask recipe_sanity_all after do_recipe_sanity
+
+python recipe_sanity_eh () {
+    from bb.event import getName
+
+    if getName(e) != "ConfigParsed":
+        return
+
+    d = e.data
+
+    cfgdata = {}
+    for k in d.keys():
+    #for k in ["S", "PR", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
+    #          "SECTION"]:
+        cfgdata[k] = d.getVar(k, 0)
+
+    d.setVar("__recipe_sanity_cfgdata", cfgdata)
+    #d.setVar("__recipe_sanity_cfgdata", d)
+
+    # Sick, very sick..
+    from bb.data_smart import DataSmart
+    old = DataSmart.renameVar
+    def myrename(self, key, newkey):
+        oldvalue = self.getVar(newkey, 0)
+        old(self, key, newkey)
+        newvalue = self.getVar(newkey, 0)
+        if oldvalue:
+            renames = self.getVar("__recipe_sanity_renames", 0) or set()
+            renames.add((key, newkey, oldvalue, newvalue))
+            self.setVar("__recipe_sanity_renames", renames)
+    DataSmart.renameVar = myrename
+}
+addhandler recipe_sanity_eh
-- 
1.7.3.4



