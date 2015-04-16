Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5346AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 07:49:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3G7nCpl003373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 00:49:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 16 Apr 2015 00:49:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Apr 2015 15:49:19 +0800
Message-ID: <c1c7339199e08085ed82ffed0d80356d5b177807.1429170493.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429170493.git.Qi.Chen@windriver.com>
References: <cover.1429170493.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] layer_extra_sanity.bbclass: add new bbclass
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
X-List-Received-Date: Thu, 16 Apr 2015 07:49:12 -0000
Content-Type: text/plain

Add a new bbclass for extra sanity check for layers.

These sanity checks include:
*) conf/machine and conf/distro don't appear in the same layer.
   The rational is that distro specific changes and BSP specific changes
   should be splitted into different layers for better maintenance.
   The meta layer is an exception.
*) A BSP layer is not included if MACHINE is not set to any of the conf file
   it provides.
   The rational is that BSP layer, by design, is supposed to make changes
   specific for the BSPs it covers. Including a BSP layer which doesn't contain
   a conf file matching the MACHINE setting might cause potential problem.
*) Configuration files under conf/machine don't set distro specific variables
   such as DISTRO_FEATURES.
   The rational is that machine configuration files should not set things
   related to machine.

[YOCTO #5427]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/layer_extra_sanity.bbclass | 91 +++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta/classes/layer_extra_sanity.bbclass

diff --git a/meta/classes/layer_extra_sanity.bbclass b/meta/classes/layer_extra_sanity.bbclass
new file mode 100644
index 0000000..17671c3
--- /dev/null
+++ b/meta/classes/layer_extra_sanity.bbclass
@@ -0,0 +1,91 @@
+# Check conf/distro and conf/machine don't appear in the same layer
+def check_machine_distro_dir(sanity_data):
+    bblayers = sanity_data.getVar('BBLAYERS', True).split()
+    for bblayer in bblayers:
+        bblayer = bblayer.rstrip('/')
+        # skip checking of the meta layer, it's special
+        if bblayer.endswith('meta'):
+            continue
+        if os.path.exists(bblayer + '/' + 'conf/machine') and os.path.exists(bblayer + '/' + 'conf/distro'):
+            bb.warn("Layer %s is providing both distro configurations and machine configurations. It's recommended that a layer should provide at most one of them." % bblayer)
+
+# Check that distro variables such as DISTRO_FEATURES are not being set in machine conf files
+def check_distro_vars_machine(sanity_data):
+    import re
+
+    bblayers = sanity_data.getVar('BBLAYERS', True).split()
+    distro_regex = re.compile("^DISTRO_.*=.*")
+    distro_var_match = False
+
+    for bblayer in bblayers:
+        bblayer = bblayer.rstrip('/')
+        if bblayer.endswith('meta'):
+            continue
+        # Check .inc and .conf files under machine/conf don't set DISTRO_xxx vars
+        for dirpath, dirnames, filenames in os.walk('%s/conf/machine' % bblayer):
+            for f in filenames:
+                fpath = os.path.join(dirpath, f)
+                if fpath.endswith(".inc") or fpath.endswith(".conf"):
+                    with open(fpath) as fopen:
+                        for line in fopen:
+                            if distro_regex.match(line):
+                                distro_var_match = True
+                                break
+                if distro_var_match:
+                    break
+            if distro_var_match:
+                break
+        if distro_var_match:
+            bb.warn("Layer %s is setting distro specific variables in its machine conf files." % bblayer)
+        distro_var_match = False
+
+# Check that a disto/bsp layer is being included but MACHINE or DISTRO is not set to any conf
+# file that it provides.
+#
+# The rational here is that if a BSP layer is supposed to have recipes or bbappend files that
+# are only specific for the BSPs it provides. So if MACHINE is not set to any of the
+# conf/machine/*.conf file in that layer, very likely the user is accidently including a BSP layer.
+# The same logic goes for distro layers.
+def check_unneedded_bsp_distro_layer(sanity_data):
+    machine = sanity_data.getVar('MACHINE', True)
+    distro = sanity_data.getVar('DISTRO', True)
+    bblayers = sanity_data.getVar('BBLAYERS', True).split()
+
+    for bblayer in bblayers:
+        bblayer = bblayer.rstrip('/')
+        if bblayer.endswith('meta'):
+            continue
+        is_bsp = os.path.exists(bblayer + '/' + 'conf/machine')
+        is_distro = os.path.exists(bblayer + '/' + 'conf/distro')
+        if is_bsp and not is_distro:
+            if not os.path.exists(bblayer + '/' + 'conf/machine/' + machine + '.conf'):
+                bb.warn("BSP layer %s is included but MACHINE is not set to any conf file it provides." % bblayer)
+        elif not is_bsp and is_distro:
+           if not os.path.exists(bblayer + '/' + 'conf/distro/' + distro + '.conf'):
+                bb.warn("Distro layer %s is included but DISTRO is not set to any conf file it provides." % bblayer)
+
+# Create a copy of the datastore and finalise it to ensure appends and 
+# overrides are set - the datastore has yet to be finalised at ConfigParsed
+def copy_data(e):
+    sanity_data = bb.data.createCopy(e.data)
+    sanity_data.finalize()
+    return sanity_data
+
+def layer_extra_check_sanity(sanity_data):
+    check_machine_distro_dir(sanity_data)
+    check_unneedded_bsp_distro_layer(sanity_data)
+    check_distro_vars_machine(sanity_data)
+
+addhandler check_layer_extra_sanity_eventhandler
+check_layer_extra_sanity_eventhandler[eventmask] = "bb.event.SanityCheck"
+python check_layer_extra_sanity_eventhandler() {
+    if bb.event.getName(e) == "SanityCheck":
+        sanity_data = copy_data(e)
+        if e.generateevents:
+            sanity_data.setVar("SANITY_USE_EVENTS", "1")
+        layer_extra_check_sanity(sanity_data)
+        e.data.setVar("BB_INVALIDCONF", False)
+        bb.event.fire(bb.event.SanityCheckPassed(), e.data)
+
+    return
+}
-- 
1.9.1


