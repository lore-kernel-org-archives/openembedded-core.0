Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 41CB272FE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 10:24:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 23 Feb 2017 02:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="68119657"
Received: from mburny-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.22.38])
	by orsmga005.jf.intel.com with ESMTP; 23 Feb 2017 02:24:25 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 12:24:20 +0200
Message-Id: <1487845460-27178-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] lib/oe/gpg_sign: fix rpm signing with gpg > 2.1
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
X-List-Received-Date: Thu, 23 Feb 2017 10:24:24 -0000

We need to check the gpg version and alter its command line options
accordingly.

[YOCTO #11054]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 21dc5ea..b635d8b 100644
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


