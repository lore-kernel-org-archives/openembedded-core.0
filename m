Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8D6731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:16:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2016 06:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,426,1449561600"; d="scan'208";a="650101544"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2016 06:16:02 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 16:15:56 +0200
Message-Id: <1455113759-3692-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/5] oe/gpg_sign: add 'armor' argument to detach_sign()
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
X-List-Received-Date: Wed, 10 Feb 2016 14:16:06 -0000

[YOCTO #9006]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index a4f310e..16a2364 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -52,13 +52,15 @@ class LocalSigner(object):
             bb.error('rpmsign failed: %s' % proc.before.strip())
             raise bb.build.FuncFailed("Failed to sign RPM packages")
 
-    def detach_sign(self, input_file):
+    def detach_sign(self, input_file, armor=True):
         """Create a detached signature of a file"""
-        cmd = "%s --detach-sign --armor --batch --no-tty --yes " \
+        cmd = "%s --detach-sign --batch --no-tty --yes " \
                   "--passphrase-file '%s' -u '%s' " % \
                   (self.gpg_bin, self.passphrase_file, self.keyid)
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
+        if armor:
+            cmd += "--armor "
         cmd += input_file
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
-- 
2.6.2


