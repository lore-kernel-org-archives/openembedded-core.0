Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5F97889B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 16:56:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 09:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,462,1515484800"; d="scan'208";a="23835532"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2018 09:56:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 18:49:44 +0200
Message-Id: <20180312164944.39923-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] lib/oe/patch.py: add a warning if patch context was ignored
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
X-List-Received-Date: Mon, 12 Mar 2018 16:56:22 -0000

Ignoring patch context increases the chances of patches being
applied incorrectly. Depending on what code is being patched, this can go
completely unnoticed and create subtle bugs, sometimes with security implications.

Please see here for a specific example:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450

On the other hand, we cannot simply force all patch context to match exactly:
doing this would break a lot of recipes suddenly, across all layers.

So let's try a softer approach: issue a warning, and gently update
patches over a longer span of time. When most of the warnings are eliminated,
we can start enforcing a strict patch application policy.

I do understand that this patch creates a lot of warnings all of a sudden, however
I believe the problem does need to be addressed. All of oe-core recipes have their
context already fixed.

Sample warning:

WARNING: vulkan-1.0.61.1-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored).
Details:
Applying patch demos-Don-t-build-tri-or-cube.patch
patching file demos/CMakeLists.txt
Hunk #1 succeeded at 63 (offset 2 lines).
Hunk #2 succeeded at 76 with fuzz 1 (offset 2 lines).

[YOCTO #10450]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/patch.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f02dee8d27d..bfa7d218792 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -36,6 +36,22 @@ def runcmd(args, dir = None):
         (exitstatus, output) = oe.utils.getstatusoutput(cmd)
         if exitstatus != 0:
             raise CmdError(cmd, exitstatus >> 8, output)
+        if " fuzz " in output:
+            bb.warn("""
+Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
+The context lines in the patches can be updated with devtool:
+
+    devtool modify <recipe>
+    devtool finish --force-patch-refresh <recipe> <layer_path>
+
+Then the updated patches and the source tree (in devtool's workspace)
+should be reviewed to make sure the patches apply in the correct place
+and don't introduce duplicate lines (which can, and does happen
+when some of the context is ignored). Further information:
+http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
+Details:
+{}""".format(output))
         return output
 
     finally:
-- 
2.16.1


