Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F224D7408F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 18:01:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2015 11:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694972238"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 11:01:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 19:01:40 +0100
Message-Id: <2c84f51ff6f3a5085c37ee261b3a2b4dd445c7c7.1431626401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431626401.git.paul.eggleton@linux.intel.com>
References: <cover.1431626401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431626401.git.paul.eggleton@linux.intel.com>
References: <cover.1431626401.git.paul.eggleton@linux.intel.com>
Subject: [dizzy][PATCH 1/2] meta/lib/oe/package.py: fix files ownership in packages
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
X-List-Received-Date: Thu, 14 May 2015 18:01:56 -0000

From: Fabrice Coulon <fabrice.coulon@axis.com>

This fix solves the problem with the ownership of files in packages.
The do_install task was producing correct and expected output but when
the files were being put in, e.g. a rpm package, the ownership could
be different than that in the do_install task.

[YOCTO #7428]

(From OE-Core master rev: 1a50cc5aeafff0d8ee6c4a41dd2770ecd31455f0)

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index a26a631..db8dc28 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -31,7 +31,7 @@ def runstrip(arg):
         extraflags = "--remove-section=.comment --remove-section=.note"
 
     # Use mv to break hardlinks
-    stripcmd = "'%s' %s '%s' -o '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file)
+    stripcmd = "'%s' %s '%s' -o '%s.tmp' && chown --reference='%s' '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file, file, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     ret = subprocess.call(stripcmd, shell=True)
-- 
2.1.0


