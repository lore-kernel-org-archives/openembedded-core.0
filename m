Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5CD71B32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 13:44:10 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2017 06:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,320,1505804400"; d="scan'208";a="168959878"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2017 06:44:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Oct 2017 15:44:15 +0200
Message-Id: <20171030134415.25220-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] lib/oe/patch.py: add a warning if patch context was ignored
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
X-List-Received-Date: Mon, 30 Oct 2017 13:44:11 -0000

Ignoring patch context increases the chances of patches being
applied incorrectly. Depending on what code is being patched, this can go
completely unnoticed and create subtle bugs, sometimes with security implications.

On the other hand, we cannot simply force all patch context to match exactly:
doing this would break a lot of recipes suddenly, across all layers.

So let's try a softer approach: issue a warning, and gently update
patches over a longer span of time. When most of the warnings are eliminated,
we can start enforcing a strict patch application policy.

I do understand that this patch creates a lot of warnings all of a sudden, however
I believe the problem does need to be addressed, and the only way to do it is
through a collective effort.

Sample warning:

WARNING: vulkan-1.0.61.1-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
Please update the patches using 'devtool modify', followed by commit edits (for example, via interactive rebase), followed by 'devtool update-recipe',
so that they contain up to date context.
Details:
Applying patch demos-Don-t-build-tri-or-cube.patch
patching file demos/CMakeLists.txt
Hunk #1 succeeded at 63 (offset 2 lines).
Hunk #2 succeeded at 76 with fuzz 1 (offset 2 lines).

[YOCTO #10450]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/patch.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f1ab3dd8096..491ca870b15 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -35,6 +35,13 @@ def runcmd(args, dir = None):
         (exitstatus, output) = oe.utils.getstatusoutput(cmd)
         if exitstatus != 0:
             raise CmdError(cmd, exitstatus >> 8, output)
+        if "fuzz" in output:
+            bb.warn("""
+Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
+Please update the patches using 'devtool modify', followed by commit edits (for example, via interactive rebase), followed by 'devtool update-recipe',
+so that they contain up to date context.
+Details:
+{}""".format(output))
         return output
 
     finally:
-- 
2.14.2


