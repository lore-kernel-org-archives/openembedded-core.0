Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0259772F3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:49:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875873"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:49:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:51 +0200
Message-Id: <5afae34ed7c057bef3827d5f304009f1f70efddb.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 34/39] lib/oe/gpg_sign: make gpg version a property of the signer
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
X-List-Received-Date: Tue, 21 Feb 2017 14:49:02 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 4b87ddde57a..725da5a2a5d 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -10,6 +10,7 @@ class LocalSigner(object):
         self.gpg_bin = d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_path = d.getVar('GPG_PATH')
+        self.gpg_version = self.get_gpg_version()
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
 
     def export_pubkey(self, output_file, keyid, armor=True):
@@ -58,9 +59,7 @@ class LocalSigner(object):
 
         #gpg > 2.1 supports password pipes only through the loopback interface
         #gpg < 2.1 errors out if given unknown parameters
-        dots = self.get_gpg_version().split('.')
-        assert len(dots) >= 2
-        if int(dots[0]) >= 2 and int(dots[1]) >= 1:
+        if self.gpg_version > (2,1,):
             cmd += ['--pinentry-mode', 'loopback']
 
         cmd += [input_file]
@@ -87,10 +86,11 @@ class LocalSigner(object):
 
 
     def get_gpg_version(self):
-        """Return the gpg version"""
+        """Return the gpg version as a tuple of ints"""
         import subprocess
         try:
-            return subprocess.check_output((self.gpg_bin, "--version")).split()[2].decode("utf-8")
+            ver_str = subprocess.check_output((self.gpg_bin, "--version")).split()[2].decode("utf-8")
+            return tuple([int(i) for i in ver_str.split('.')])
         except subprocess.CalledProcessError as e:
             raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
 
-- 
2.11.0


