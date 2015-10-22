Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BE05A77168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 2BC10600F5C
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:54 +0100
Message-Id: <aed5b7aef33459f1bb5fa29560920c254a5fd637.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 33/52] oeqa/selftest/manifest.py: Test support for manifests
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:26 -0000

From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>

adding support for tests to verify that manifest contents
contain entries that exist in an specified pkgdata dir

tests added:
 - manifest.VerifyManifest.test_image_manifest_entries
 - manifest.VerifyManifest.test_SDK_manifest_entries
test support written for future tests:
 -adding a setUpClass that supports other manifest tests
 -a get dir from bb var function that verifies if the dir exists
 -a ManifestEntry class defined with missing items list
 -check for the paths and fail gracefully if not there
 -debug prints for failure analysis

[YOCTO#8028]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/manifest.py | 163 +++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/manifest.py

diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/manifest.py
new file mode 100644
index 0000000..c813c1d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/manifest.py
@@ -0,0 +1,163 @@
+import unittest
+import os
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import get_bb_var, bitbake
+from oeqa.utils.decorators import testcase
+
+class ManifestEntry:
+    '''A manifest item of a collection able to list missing packages'''
+    def __init__(self, entry):
+        self.file = entry
+        self.missing = []
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
+
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
+        mfilename = mpath = m_entry = {}
+        # get manifest location based on target to query about
+        d_target= dict(target = self.buildtarget,
+                         host = 'nativesdk-packagegroup-sdk-host')
+        try:
+            mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
+            for k in d_target.keys():
+                mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
+                        get_bb_var("SDK_NAME", self.buildtarget),
+                        get_bb_var("SDK_VERSION", self.buildtarget),
+                        k)
+                mpath[k] = os.path.join(mdir, mfilename[k])
+                if not os.path.isfile(mpath[k]):
+                    self.log.debug("{}: {} does not exist".format(
+                        self.classname, mpath[k]))
+                    raise IOError
+                m_entry[k] = ManifestEntry(mpath[k])
+
+                pkgdata_dir[k] = self.get_dir_from_bb_var('PKGDATA_DIR',
+                        d_target[k])
+                reverse_dir[k] = os.path.join(pkgdata_dir[k],
+                        'runtime-reverse')
+                if not os.path.exists(reverse_dir[k]):
+                    self.log.debug("{}: {} does not exist".format(
+                        self.classname, reverse_dir[k]))
+                    raise IOError
+        except OSError:
+            raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
+                .format(self.classname))
+        except IOError:
+            msg = "{}: Error cannot find manifests in the specified dir:\n{}"\
+                    .format(self.classname, mdir)
+            self.fail(msg)
+
+        for k in d_target.keys():
+            self.log.debug("{}: Check manifest {}".format(
+                self.classname, m_entry[k].file))
+
+            m_entry[k].missing = self.check_manifest_entries(\
+                                               m_entry[k].file,reverse_dir[k])
+            if m_entry[k].missing:
+                msg = '{}: {} Error has the following missing entries'\
+                        .format(self.classname, m_entry[k].file)
+                logmsg = msg+':\n'+'\n'.join(m_entry[k].missing)
+                self.log.debug(logmsg)
+                self.log.info(msg)
+                self.fail(logmsg)
+
+    def test_image_manifest_entries(self):
+        '''Verifying the image manifest entries exist'''
+
+        # get manifest location based on target to query about
+        try:
+            mdir = self.get_dir_from_bb_var('DEPLOY_DIR_IMAGE',
+                                                self.buildtarget)
+            mfilename = get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
+                    + ".manifest"
+            mpath = os.path.join(mdir, mfilename)
+            if not os.path.isfile(mpath): raise IOError
+            m_entry = ManifestEntry(mpath)
+
+            pkgdata_dir = {}
+            pkgdata_dir = self.get_dir_from_bb_var('PKGDATA_DIR',
+                                                self.buildtarget)
+            revdir = os.path.join(pkgdata_dir, 'runtime-reverse')
+            if not os.path.exists(revdir): raise IOError
+        except OSError:
+            raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
+                .format(self.classname))
+        except IOError:
+            msg = "{}: Error cannot find manifests in dir:\n{}"\
+                    .format(self.classname, mdir)
+            self.fail(msg)
+
+        self.log.debug("{}: Check manifest {}"\
+                            .format(self.classname, m_entry.file))
+        m_entry.missing = self.check_manifest_entries(\
+                                                    m_entry.file, revdir)
+        if m_entry.missing:
+            msg = '{}: {} Error has the following missing entries'\
+                    .format(self.classname, m_entry.file)
+            logmsg = msg+':\n'+'\n'.join(m_entry.missing)
+            self.log.debug(logmsg)
+            self.log.info(msg)
+            self.fail(logmsg)
-- 
2.1.4


