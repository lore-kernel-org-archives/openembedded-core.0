Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 03DF26F865
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 23:13:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2014 16:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,673,1389772800"; d="scan'208";a="493948217"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.82])
	by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2014 16:13:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 23:13:37 +0000
Message-Id: <f990b34e31ca5c2fdbdf5253ee1473b134d2d1e9.1395097868.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395097868.git.paul.eggleton@linux.intel.com>
References: <cover.1395097868.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395097868.git.paul.eggleton@linux.intel.com>
References: <cover.1395097868.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/1] sstate: Drop 'SafeDep' code from setscene validation function
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
X-List-Received-Date: Mon, 17 Mar 2014 23:13:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I have a feeling this code exists from the time before we had proper
coverage of one sstate task by another task. At that time it was a
"poor" persons version of that idea, we now have much better
code internal to bitbake which handles this.

Worse, this code actually breaks certain rebuild scenarios,
e.g.:

bitbake libtool-cross
bitbake libtool-cross -c cleansstate
rm tmp -rf
bitbake libtool-cross

would fail as binutils-cross wasn't installed from sstate.

The easiest fix is to remove the obsolete/broken code.

[YOCTO #5773]

(From OE-Core master rev: ccad07f35fb7f959e24fd50d04c7d10dd5cf20d0)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0358d14..13abf33 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -639,19 +639,12 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         return x.endswith("-native")
     def isNativeCross(x):
         return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
-    def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
-            return True
-        return False
+
     def isPostInstDep(x):
         if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-update-icon-cache-native"]:
             return True
         return False
 
-    # We can skip these "safe" dependencies since the aren't runtime dependencies, just build time
-    if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] == "do_populate_sysroot":
-        return True
-
     # We only need to trigger populate_lic through direct dependencies
     if taskdependees[task][1] == "do_populate_lic":
         return True
-- 
1.8.5.3


