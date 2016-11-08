Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34E9A60797
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 08:12:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2016 00:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,609,1473145200"; d="scan'208";a="898942219"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Nov 2016 00:12:03 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 658A96A4080;
	Tue,  8 Nov 2016 00:11:23 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 10:11:44 +0200
Message-Id: <1478592704-10596-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0LbZ=dQWK7XyUOz5My8iKje8DYgCMmkLPCTXeEicWoj9xg@mail.gmail.com>
References: <CAJTo0LbZ=dQWK7XyUOz5My8iKje8DYgCMmkLPCTXeEicWoj9xg@mail.gmail.com>
Subject: [PATCH v2] uninative: rebuild uninative for gcc 4.8 and 4.9
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
X-List-Received-Date: Tue, 08 Nov 2016 08:12:04 -0000

Some c++ libraries fail to build if uninative is built
with gcc 5.x and host gcc version is either 4.8 or 4.9.

The issue should be solved by making separate uninative sstate
directory structure sstate-cache/universal-<gcc version> for host gcc
versions 4.8 and 4.9. This causes rebuilds of uninative if host gcc
is either 4.8 or 4.9 and it doesn't match gcc version used to build
uninative.

[YOCTO #10441]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/uninative.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 89cec07..3862b31 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -95,11 +95,25 @@ python uninative_event_enable() {
     enable_uninative(d)
 }
 
+def gcc_version(d):
+    compiler = d.getVar("BUILD_CC", True)
+    retval, output = oe.utils.getstatusoutput("%s --version" % compiler)
+    if retval:
+        bb.fatal("Error running %s --version: %s" % (compiler, output))
+
+    import re
+    match = re.match(".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    if not match:
+        bb.fatal("Can't get compiler version from %s --version output" % compiler)
+
+    version = match.group(1)
+    return "-%s" % version if version in ("4.8", "4.9") else ""
+
 def enable_uninative(d):
     loader = d.getVar("UNINATIVE_LOADER", True)
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
-        d.setVar("NATIVELSBSTRING", "universal")
+        d.setVar("NATIVELSBSTRING", "universal%s" % gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
-- 
2.1.4


