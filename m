Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 77DC07317E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900461995"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:27 +1300
Message-Id: <cea40b7dd326fc8f8e128ba523232fb5a1fe4609.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/11] classes/externalsrc: create symlinks for workdir and logs
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:15 -0000

Auto-create symlinks in the source directory to the work directory
(${WORKDIR}) and logs directory (${T}) so that they are easier for the
user to find. This is particularly useful within the extensible SDK
where the user is less likely to be familiar enough with the structure
of the build system to know where to find these things, but otherwise
they are a useful shortcut for anyone.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 9d7ab00..b608bd0 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -25,6 +25,7 @@
 #
 
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
+EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC', True)
@@ -82,6 +83,7 @@ python () {
             bb.build.deltask(task, d)
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
+        d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
         # Ensure compilation happens every time
         d.setVarFlag('do_compile', 'nostamp', '1')
@@ -101,6 +103,24 @@ python () {
             d.setVarFlag('do_configure', 'file-checksums', configstamp + ':True')
 }
 
+python externalsrc_configure_prefunc() {
+    # Create desired symlinks
+    symlinks = (d.getVar('EXTERNALSRC_SYMLINKS', True) or '').split()
+    for symlink in symlinks:
+        symsplit = symlink.split(':', 1)
+        lnkfile = os.path.join(d.getVar('S', True), symsplit[0])
+        target = d.expand(symsplit[1])
+        if len(symsplit) > 1:
+            if os.path.islink(lnkfile):
+                # Link already exists, leave it if it points to the right location already
+                if os.readlink(lnkfile) == target:
+                    continue
+            elif os.path.exists(lnkfile):
+                # File/dir exists with same name as link, just leave it alone
+                continue
+            os.symlink(target, lnkfile)
+}
+
 python externalsrc_compile_prefunc() {
     # Make it obvious that this is happening, since forgetting about it could lead to much confusion
     bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN', True), d.getVar('EXTERNALSRC', True)))
-- 
2.5.0


