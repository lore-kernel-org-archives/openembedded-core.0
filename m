Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ED69D75F3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 15:03:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2015 08:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,681,1437462000"; d="scan'208";a="810876355"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2015 08:01:03 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:01:00 +0300
Message-Id: <1444834861-19459-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444834861-19459-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1444834861-19459-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] sign_rpm.bbclass: introduce GPG_PATH variable
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
X-List-Received-Date: Wed, 14 Oct 2015 15:03:01 -0000

This bitbake configuration variable can be used to define the gpg home
directory.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 0aa4cd8..23aea42 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -12,6 +12,8 @@
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
+# GPG_PATH
+#           Optional variable for specifying the gnupg "home" directory:
 #
 inherit sanity
 
@@ -41,6 +43,8 @@ def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
                                "(e.g. in  ~/.oerpmmacros", d)
     if d.getVar('GPG_BIN', True):
         cmd += "--define '%%__gpg %s' " % d.getVar('GPG_BIN', True)
+    if d.getVar('GPG_PATH', True):
+        cmd += "--define '_gpg_path %s' " % d.getVar('GPG_PATH', True)
     cmd += ' '.join(files)
 
     # Need to use pexpect for feeding the passphrase
-- 
2.1.4


