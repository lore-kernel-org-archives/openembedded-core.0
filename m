Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BF72860017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 18:26:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2014 11:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,514,1406617200"; d="scan'208";a="572426753"
Received: from new-host-2.jf.intel.com ([10.7.201.163])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2014 11:25:14 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 11:25:12 -0700
Message-Id: <1410546312-5402-2-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1410546312-5402-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1410546312-5402-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH] sstatesig.py: Replace '_'s with '-'s in SSTATE_LOCKEDSIGS* names.
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
X-List-Received-Date: Fri, 12 Sep 2014 18:26:41 -0000

Using underscores in the "types" parts of the variable names can cause
unexpected issues with overrides. For example, if you have both
SSTATE_LOCKEDSIGS_x86_64 and SSTATE_LOCKEDSIGS_x86_64_i586, and i586
is in OVERRIDES, then you lose all of the contents in
SSTATE_LOCKEDSIGS_x86_64 and thus don't get some of the locked sstate.

Using '-'s in the variable names instead, eliminates these issues.
---
 meta/lib/oe/sstatesig.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index add2619..a0bdaad 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -136,6 +136,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         for k in self.runtaskdeps:
             fn = k.rsplit(".",1)[0]
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
+            t = t.replace('_', '-')
             if t not in types:
                 types[t] = []
             types[t].append(k)
-- 
1.9.3


