Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 430687711D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 11:57:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 04:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,688,1437462000"; d="scan'208";a="812530221"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2015 04:57:39 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 14:57:32 +0300
Message-Id: <1444996657-4301-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/5] sign_rpm.bbclass: be more verbose in case of error
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
X-List-Received-Date: Fri, 16 Oct 2015 11:57:41 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 23aea42..39f877a 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -55,8 +55,11 @@ def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
         proc.expect(pexpect.EOF, timeout=900)
         proc.close()
     except pexpect.TIMEOUT as err:
-        bb.debug('rpmsign timeout: %s' % err)
+        bb.warn('rpmsign timeout: %s' % err)
         proc.terminate()
+    else:
+        if os.WEXITSTATUS(proc.status) or not os.WIFEXITED(proc.status):
+            bb.warn('rpmsign failed: %s' % proc.before.strip())
     return proc.exitstatus
 
 
-- 
2.1.4


