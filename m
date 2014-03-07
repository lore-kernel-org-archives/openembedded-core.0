Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 43BBF6E8AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 14:20:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2014 06:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,608,1389772800"; d="scan'208";a="494184141"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2014 06:20:05 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 13E776A4007;
	Fri,  7 Mar 2014 06:19:53 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 16:20:07 +0200
Message-Id: <1394202007-14964-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/utils/qemurunner: search for login string in the entire boot log
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
X-List-Received-Date: Fri, 07 Mar 2014 14:20:08 -0000

If some service is to spammy we might miss the login, so search
in the entire log instead of just the last few lines.
Use qemu in regex too (to avoid a login string from some service).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5366a63..c664d00 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -133,8 +133,7 @@ class QemuRunner:
                         if data:
                             self.log(data)
                             self.bootlog += data
-                            lastlines = "\n".join(self.bootlog.splitlines()[-2:])
-                            if re.search("login:", lastlines):
+                            if re.search("qemu.* login:", self.bootlog):
                                 stopread = True
                                 reachedlogin = True
                                 bb.note("Reached login banner")
-- 
1.8.5.3


