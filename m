Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TGAlB-00066J-Iq
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:39:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Sep 2012 08:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,476,1344236400"; d="scan'208";a="225795133"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.13])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2012 08:26:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Garman <scott.a.garman@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 16:26:44 +0100
Message-Id: <e31d4b12e58c3acd4c3ce548f8330c40cac9e201.1348500281.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348500281.git.paul.eggleton@linux.intel.com>
References: <cover.1348500281.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1348500281.git.paul.eggleton@linux.intel.com>
References: <cover.1348500281.git.paul.eggleton@linux.intel.com>
Subject: [denzil][PATCH 1/1] classes/cml1: ensure -c menuconfig forces a rebuild next time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 15:39:50 -0000

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

(From OE-Core rev: 9bf6b60e1599cf5dd87089d42584583cdfd6807a)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cml1.bbclass |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index d429188..678d23c 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -10,7 +10,23 @@ addtask configure after do_unpack do_patch before do_compile
 inherit terminal
 
 python do_menuconfig() {
+        try:
+            mtime = os.path.getmtime(".config")
+        except OSError:
+            mtime = 0
+
         oe_terminal("make menuconfig", '${PN} Configuration', d)
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
 do_menuconfig[nostamp] = "1"
 addtask menuconfig after do_configure
-- 
1.7.9.5



