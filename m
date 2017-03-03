Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D6575776ED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:37:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 03 Mar 2017 04:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,237,1484035200"; d="scan'208";a="1117999729"
Received: from manuelal-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.4.231])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2017 04:37:33 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 14:37:27 +0200
Message-Id: <1488544647-31325-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1488544647-31325-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1488544647-31325-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [morty][PATCH 4/4] lib/oe/gpg_sign: fix rpm signing with gpg > 2.1
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
X-List-Received-Date: Fri, 03 Mar 2017 12:37:33 -0000

We need to check the gpg version and alter its command line options
accordingly.

[YOCTO #11054]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 44a44b7e582a5a654baf21829d168568481c13d9)
---
 meta/lib/oe/gpg_sign.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 16eb7f8..ba61f98 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -32,6 +32,8 @@ class LocalSigner(object):
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
         cmd += "--define '_gpg_passphrase %s' " % passphrase
+        if self.gpg_version > (2,1,):
+            cmd += "--define '_gpg_sign_cmd_extra_args --pinentry-mode=loopback' "
         if self.gpg_bin:
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
-- 
2.6.6


