Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7B31E6C99F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 08:06:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2013 01:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,941,1371106800"; d="scan'208";a="297206053"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Sep 2013 01:06:17 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 11:06:07 +0300
Message-Id: <313d83d8a64fc904a8c2a60f4aba603c793fa4dc.1379662642.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1379662642.git.laurentiu.palcu@intel.com>
References: <cover.1379662642.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1379662642.git.laurentiu.palcu@intel.com>
References: <cover.1379662642.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] runqemu: set qemuarm memory size back to 128MB
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
X-List-Received-Date: Fri, 20 Sep 2013 08:06:16 -0000

The following commit, 6ccd4d6, increased the RAM size for qemu machines
to 256MB due to some smart sanity tests failing on autobuilder because
more memory was needed.

Unfortunately this leads to various, potentially dangerous, issues like
the one observed during sudoku-savant project compilation:

collect: relinking
collect2: error: '_ZNK6sudoku5ClearINS_6SquareEEclERS1_' was assigned to
'board.rpo', but was not defined during recompilation, or vice versa
board.o:(.rodata+0x8): undefined reference to
`sudoku::Clear<sudoku::Square>::operator()(sudoku::Square&) const'
board.o:(.rodata+0x20): undefined reference to
`sudoku::Clear<sudoku::Sequence>::operator()(sudoku::Sequence&) const'
board.o:(.rodata+0x34): undefined reference to `typeinfo for
sudoku::Action<sudoku::Sequence>'
...AND THE LIST CONTINUES...
collect2: error: ld returned 1 exit status
make: *** [sudoku-savant] Error 1

After some tests, I found that the maximum amount of memory needed for
sudoku to compile properly is 146MB(!?!).

My attempts to create a simpler test case (using templates), in order to
replicate and isolate the issue failed. All the tests compiled just
fine.

So, my guess is that this problem is certainly memory related but the
cause might be hidden in any of the following: qemu versatile hw model,
in the kernel or, highly unlikely but not impossible, the toolchain
itself. The reason I don't really think the cause is in the toolchain is
the fact that the compilation completes just fine for 128MB on qemuarm but
also on other qemu machines (with 256MB of memory).

Since this issue might need lots of time to have a proper fix, I'll revert back
to using 128MB for qemuarm for the time being.

[YOCTO #5133]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 485119f..74b0c35 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -48,7 +48,7 @@ else
             mem_size=256
             ;;
         "qemuarm")
-            mem_size=256
+            mem_size=128
             ;;
         "qemumicroblaze")
             mem_size=64
-- 
1.7.9.5


