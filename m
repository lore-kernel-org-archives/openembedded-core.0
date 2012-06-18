Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SgeOk-0001Am-E2
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 18:01:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2012 08:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="159057533"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.122])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2012 08:50:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 16:50:50 +0100
Message-Id: <24c85c99d46225bedd33abb52c4fe638842c3ca3.1340034490.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340034490.git.paul.eggleton@linux.intel.com>
References: <cover.1340034490.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1340034490.git.paul.eggleton@linux.intel.com>
References: <cover.1340034490.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/cml1: ensure -c menuconfig forces a rebuild next time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 16:01:50 -0000

Ensure the following results in the kernel being rebuilt, repackaged and
re-deployed in the final step:

bitbake virtual/kernel
bitbake -c menuconfig virtual/kernel
[ make changes to the kernel configuration and save ]
bitbake virtual/kernel

If there are no changes to the configuration saved, the rebuild will not
be triggered.

Note that this relies on a function recently added to BitBake and
requires full hashing (i.e. BB_SIGNATURE_HANDLER must be set to a
signature handler that inherits from BasicHash) - if this is not the
case or the function is not available in the version of BitBake being
used this change will do nothing.

Fixes [YOCTO #2256].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/cml1.bbclass |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index bd25311..fd80c18 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -15,7 +15,23 @@ HOSTLDFLAGS = "${BUILD_LDFLAGS}"
 HOST_LOADLIBES = "-lncurses"
 
 python do_menuconfig() {
+        try:
+            mtime = os.path.getmtime(".config")
+        except OSError:
+            mtime = 0
+
         oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)
+
+        # FIXME this check can be removed when the minimum bitbake version has been bumped
+        if hasattr(bb.build, 'write_taint'):
+            try:
+                newmtime = os.path.getmtime(".config")
+            except OSError:
+                newmtime = 0
+
+            if newmtime > mtime:
+                bb.note("Configuration changed, recompile will be forced")
+                bb.build.write_taint('do_compile', d)
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
-- 
1.7.9.5



