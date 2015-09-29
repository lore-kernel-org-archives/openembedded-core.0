Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 20E7A76FED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:48:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Sep 2015 10:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,609,1437462000"; d="scan'208";a="815632637"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 29 Sep 2015 10:48:22 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 17:45:37 +0000
Message-Id: <64ff08ec839f8d92b942c846bc2975362275aed2.1443548707.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443548707.git.alejandro.hernandez@linux.intel.com>
References: <cover.1443548707.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] archiver.bbclass: Fix archiver for gcc packages using patched sources
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
X-List-Received-Date: Tue, 29 Sep 2015 17:48:24 -0000

gcc packages use a shared source directory, this causes an issue since
the archiver will try to patch the same source several times (one for
each gcc package), producing an error, the archiver class used stamp-base
to check this, nonetheless our gcc packages no longer use stamp-base,
they use gcc-shared instead, which is what broke this functionality
this patch adds a check to see whether or not the source should be patched,
avoiding patching the source when it shouldnt.

[YOCTO #8378]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index eec8024..c3e0f43 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -270,7 +270,9 @@ python do_unpack_and_patch() {
         src = d.getVar('S', True).rstrip('/')
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
-    bb.build.exec_func('do_patch', d)
+    # Special case for gcc-shared packages
+    if d.getVar('SRC_URI', True) != "":
+        bb.build.exec_func('do_patch', d)
     # Create the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
         bb.note('Creating diff gz...')
-- 
1.8.4.5


