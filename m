Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9797277E71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C51B62E230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4fXg2c4WWxWR
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 81EEB2E288
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63E181A08D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5815A1A08B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 4D0953107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 4771540965; Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 16:58:16 +0200
Message-Id: <20170828145816.17208-2-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170828145816.17208-1-olani@axis.com>
References: <20170828145816.17208-1-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes for virtclasses
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
X-List-Received-Date: Mon, 28 Aug 2017 15:07:12 -0000

There was a race condifion in externalsrc_configure_prefuncs when the
same source folder is used for several variants of the same recipe,
like this:

EXTERNALSRC_pn-foo = "..."
EXTERNALSRC_pn-foo-native = "..."

The symlinks were created once for each variant of the recipe, and
where they led in the end depended on which do_configure task executed
last.  Create one set of symlinks for each variant by adding an EXTSRC_SUFFIX
variable to the end of the link names.
Tries to handle all known virtclasses and multilib variants.

Use a lockfile for externalsrc_configure_prefuncs to protect the
.git/info/exclude file.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/externalsrc.bbclass        | 16 ++++++++++-
 meta/lib/oeqa/selftest/cases/devtool.py | 48 +++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 8141f25e04..980e339cdc 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -24,8 +24,21 @@
 # EXTERNALSRC_BUILD_pn-myrecipe = "/path/to/my/source/tree"
 #
 
+def get_symlink_suffix(var, suffixes, d):
+    # Like oe.utils.prune_suffix but return the suffix instead
+    for suffix in suffixes:
+        if var.endswith(suffix):
+            return suffix
+    if var.startswith('nativesdk-'):
+        return '-nativesdk'
+    prefix = d.getVar("MLPREFIX")
+    if prefix and var.startswith(prefix):
+        return '-' + prefix[:-1]
+    return ''
+
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
-EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
+EXTSRC_SUFFIX = "${@get_symlink_suffix(d.getVar('PN'), d.getVar('SPECIAL_PKGSUFFIX').split(), d)}"
+EXTERNALSRC_SYMLINKS ?= "oe-workdir${EXTSRC_SUFFIX}:${WORKDIR} oe-logs${EXTSRC_SUFFIX}:${T}"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC')
@@ -128,6 +141,7 @@ python () {
             d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')
 }
 
+externalsrc_configure_prefunc[lockfiles] += " ${S}/conf_prefunc.lock"
 python externalsrc_configure_prefunc() {
     s_dir = d.getVar('S')
     # Create desired symlinks
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 88d69724f9..4119280b48 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -491,6 +491,54 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
 
+    def test_devtool_modify_configure_prefunc(self):
+        self.write_config("""
+MACHINE = "qemux86-64"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+""")
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.write_recipeinc('emptytest', '''
+BBCLASSEXTEND = "native nativesdk"
+do_patch[noexec] = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+''')
+        self.track_for_cleanup(self.recipeinc('emptytest'))
+        targets = 'emptytest emptytest-native nativesdk-emptytest lib32-emptytest'
+        self.add_command_to_tearDown('bitbake -c clean ' + targets)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        runCmd('devtool modify emptytest -x %s' % tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.append_recipeinc('emptytest', 'EXTERNALSRC_pn-emptytest-native = "%s"\n' % tempdir)
+        self.append_recipeinc('emptytest', 'EXTERNALSRC_pn-nativesdk-emptytest = "%s"\n' % tempdir)
+        self.append_recipeinc('emptytest', 'EXTERNALSRC_pn-lib32-emptytest = "%s"\n' % tempdir)
+        bitbake('-c cleansstate ' + targets)
+        bitbake('-c configure ' + targets)
+
+        def assert_link(linkname, destdir):
+            linkname = os.path.join(tempdir, linkname)
+            self.assertExists(linkname)
+            self.assertTrue(os.path.islink(linkname))
+            dst = os.readlink(linkname)
+            self.assertEqual(dst, destdir)
+
+        bbvars = {'': get_bb_vars(['WORKDIR', 'T'], 'emptytest'),
+                  '-native': get_bb_vars(['WORKDIR', 'T'], 'emptytest-native'),
+                  '-lib32': get_bb_vars(['WORKDIR', 'T'], 'lib32-emptytest'),
+                  '-nativesdk': get_bb_vars(['WORKDIR', 'T'], 'nativesdk-emptytest')}
+        for variant in bbvars:
+            assert_link('oe-logs' + variant, bbvars[variant]['T'])
+            assert_link('oe-workdir' + variant, bbvars[variant]['WORKDIR'])
+
+        with open(os.path.join(tempdir, '.git/info/exclude')) as efile:
+            lines = set(efile.readlines())
+            expected = {'/%s%s\n' % (base, sfx)
+                        for base in ['oe-logs', 'oe-workdir']
+                        for sfx in bbvars}
+            self.assertTrue(expected <= lines)
+
     @OETestID(1620)
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
-- 
2.11.0


