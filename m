Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8BD72F72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:49:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875883"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:49:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:52 +0200
Message-Id: <b79df45d252b5af6a76bf6c774e2814478543a78.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 35/39] gpg_sign.py: fix rpm signing with gpg > 2.1
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
X-List-Received-Date: Tue, 21 Feb 2017 14:49:03 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

We need to check the gpg version and alter its command line options
accordingly.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 725da5a2a5d..10272be4c9a 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -31,7 +31,10 @@ class LocalSigner(object):
         """Sign RPM files"""
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
-        cmd += "--define '_gpg_sign_cmd_extra_args --batch --passphrase=%s --pinentry-mode=loopback' " % passphrase
+        gpg_args = '--batch --passphrase=%s' % passphrase
+        if self.gpg_version > (2,1,):
+            gpg_args += ' --pinentry-mode=loopback'
+        cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
         if self.gpg_bin:
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
-- 
2.11.0


