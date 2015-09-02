Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B80C377022
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 04:23:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2015 21:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,459,1437462000"; d="scan'208";a="781667117"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2015 21:23:06 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 20:18:05 +0000
Message-Id: <1441225085-2988-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1675897.By6dee7Xjq@peggleto-mobl.ger.corp.intel.com>
References: <1675897.By6dee7Xjq@peggleto-mobl.ger.corp.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] selftest/manifest.py: Test support for manifests
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
X-List-Received-Date: Thu, 03 Sep 2015 04:23:08 -0000

adding support for tests to verify manifest collections
(i.e. all the manifests found in a given dir) checking them
to provide entries that exist in an specified pkgdata dir

tests added:
 -adding an SDK manifest test
 -adding a core-image-minimal manifest test
test support written for future tests:
 -adding a setUpClass that supports other tests
 -a get dir from bb var function that verifies if the dir exists
 -an initial ManifestCollection and ManifestEntry classes defined
 -check for the paths and fail gracefully if not there
 -debug prints for failure analysis

[YOCTO#8028]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/manifest.py | 165 +++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/manifest.py

diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/manifest.py
new file mode 100644
index 0000000..4843622
--- /dev/null
+++ b/meta/lib/oeqa/selftest/manifest.py
@@ -0,0 +1,165 @@
+import unittest
+import os
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import get_bb_var, bitbake
+from oeqa.utils.decorators import testcase
+from glob import glob
+
+class ManifestEntry:
+    '''A manifest item of a collection able to list missing packages'''
+    def __init__(self, entry):
+        self.entry = entry
+        self.missing = []
+
+class ManifestCollection:
+    '''A manifest collection definition with error check and manifest entries'''
+    def __init__(self, mfiles_path = os.getcwd()):
+        self.entries = glob("%s/*.manifest" % mfiles_path)
+        if not self.entries: raise OSError
+        self.entry = {}
+        for e in self.entries:
+            self.entry[e] = ManifestEntry(e)
+        self.errors = False
+
+class VerifyManifest(oeSelfTest):
+    '''Tests for the manifest files and contents of an image'''
+
+    @classmethod
+    def check_manifest_entries(self, manifest, path):
+        manifest_errors = []
+        try:
+            with open(manifest, "r") as mfile:
+                for line in mfile:
+                    manifest_entry = os.path.join(path, line.split()[0])
+                    self.log.debug("{}: looking for {}"\
+                                    .format(self.classname, manifest_entry))
+                    if not os.path.isfile(manifest_entry):
+                        manifest_errors.append(manifest_entry)
+                        self.log.debug("{}: {} not found"\
+                                    .format(self.classname, manifest_entry))
+        except OSError as e:
+            self.log.debug("{}: checking of {} failed"\
+                    .format(self.classname, manifest))
+            raise e
+
+        return manifest_errors
+
+    #this will possibly move from here
+    @classmethod
+    def get_dir_from_bb_var(self, bb_var, target = None):
+        target == self.buildtarget if target == None else target
+        directory = get_bb_var(bb_var, target);
+        if not directory or not os.path.isdir(directory):
+            self.log.debug("{}: {} points to {} when target = {}"\
+                    .format(self.classname, bb_var, directory, target))
+            raise OSError
+        return directory
+
+    @classmethod
+    def setUpClass(self):
+
+        self.buildtarget = 'core-image-minimal'
+        self.classname = 'VerifyManifest'
+
+        self.log.info("{}: doing bitbake {} as a prerequisite of the test"\
+                .format(self.classname, self.buildtarget))
+        if bitbake(self.buildtarget).status:
+            self.log.debug("{} Failed to setup {}"\
+                    .format(self.classname, self.buildtarget))
+            unittest.SkipTest("{}: Cannot setup testing scenario"\
+                    .format(self.classname))
+
+    def test_SDK_manifest_entries(self):
+        '''Verifying the SDK manifest entries exist, this may take a build'''
+        self.testname = self.id().split('.')[-1]
+        # the setup should bitbake core-image-minimal and here it is required
+        # to do an additional setup for the sdk
+        sdktask = '-c populate_sdk'
+        bbargs = sdktask + ' ' + self.buildtarget
+        self.log.debug("{}: doing bitbake {} as a prerequisite of the test"\
+                .format(self.classname, bbargs))
+        if bitbake(bbargs).status:
+            self.log.debug("{} Failed to bitbake {}"\
+                    .format(self.classname, bbargs))
+            unittest.SkipTest("{}: Cannot setup testing scenario"\
+                    .format(self.classname))
+
+
+        pkgdata_dir = reverse_dir = {}
+        # get manifest location based on target to query about
+        try:
+            mdir = self.get_dir_from_bb_var('SDK_DEPLOY',
+                                                self.buildtarget)
+            pkgdata_dir['target'] = self.get_dir_from_bb_var('PKGDATA_DIR',
+                                                        self.buildtarget)
+            reverse_dir['target'] = os.path.join(pkgdata_dir['target'],
+                                            'runtime-reverse')
+            pkgdata_dir['host'] = self.get_dir_from_bb_var('PKGDATA_DIR',
+                                             'nativesdk-packagegroup-sdk-host')
+            reverse_dir['host'] = os.path.join(pkgdata_dir['host'],
+                                            'runtime-reverse')
+        except OSError:
+            raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
+                .format(self.classname))
+
+        m_collection = ManifestCollection(mdir)
+
+        for mfile in m_collection.entries:
+            self.log.debug("{}: Check manifest {}"\
+                                .format(self.classname, mfile))
+            #assume target
+            revdir = reverse_dir['target']
+            # if this doesn't end with host.manifest then we need another
+            # consistent way of checking what is this manifest for?
+            if mfile.endswith('host.manifest'):
+                revdir = reverse_dir['host']
+
+            if not os.path.exists(revdir):
+                self.fail("unable to find {} to work on it".format(revdir))
+
+            m_collection.entry[mfile].missing = self.check_manifest_entries(\
+                                                        mfile,revdir)
+            if m_collection.entry[mfile].missing:
+                m_collection.errors = True
+                msg = '{}: {} has missing entries'\
+                        .format(self.classname, mfile)
+                logmsg = msg+':\n'+'\n'.join(m_collection.entry[mfile].missing)
+                self.log.debug(logmsg)
+                self.log.info(msg)
+
+        if m_collection.errors: self.fail()
+
+    def test_image_manifest_entries(self):
+        '''Verifying the image manifest entries exist'''
+        self.testname = self.id().split('.')[-1]
+
+        # get manifest location based on target to query about
+        try:
+            mdir = self.get_dir_from_bb_var('DEPLOY_DIR_IMAGE',
+                                                self.buildtarget)
+            pkgdata_dir = {}
+            pkgdata_dir = self.get_dir_from_bb_var('PKGDATA_DIR',
+                                                self.buildtarget)
+            revdir = os.path.join(pkgdata_dir, 'runtime-reverse')
+            if not os.path.exists(revdir): raise OSError
+        except OSError:
+            raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
+                .format(self.classname))
+
+        m_collection = ManifestCollection(mdir)
+
+        for mfile in m_collection.entries:
+            self.log.debug("{}: Check manifest {}"\
+                                .format(self.classname, mfile))
+            m_collection.entry[mfile].missing = self.check_manifest_entries(\
+                                                        mfile,revdir)
+            if m_collection.entry[mfile].missing:
+                m_collection.errors = True
+                msg = '{}: {} has missing entries'\
+                        .format(self.classname, mfile)
+                logmsg = msg+':\n'+'\n'.join(m_collection.entry[mfile].missing)
+                self.log.debug(logmsg)
+                self.log.info(msg)
+
+        if m_collection.errors: self.fail()
-- 
2.3.0


