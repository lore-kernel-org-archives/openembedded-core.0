Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 52F8773000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 10:24:23 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 23 Feb 2017 02:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="68119654"
Received: from mburny-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.22.38])
	by orsmga005.jf.intel.com with ESMTP; 23 Feb 2017 02:24:24 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 12:24:19 +0200
Message-Id: <1487845460-27178-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] lib/oe/gpg_sign: make gpg version a property of the signer
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
X-List-Received-Date: Thu, 23 Feb 2017 10:24:23 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index dcd1990..21dc5ea 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -10,6 +10,7 @@ class LocalSigner(object):
         self.gpg_bin = d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_path = d.getVar('GPG_PATH')
+        self.gpg_version = self.get_gpg_version()
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
 
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
2.6.6


