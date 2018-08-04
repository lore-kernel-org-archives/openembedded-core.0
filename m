Return-Path: <omar.ocampo.coronado@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05B0878DCE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 21:44:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2018 14:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,440,1526367600"; d="scan'208";a="78214725"
Received: from unknown (HELO kairos.zpn.intel.com) ([10.219.80.29])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2018 14:44:21 -0700
From: omar.ocampo.coronado@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 19:39:27 -0500
Message-Id: <20180804003927.99502-1-omar.ocampo.coronado@intel.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCHv2] package: skip strip on signed kernel modules
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
X-List-Received-Date: Fri, 03 Aug 2018 21:44:21 -0000

From: foocampo <omar.ocampo.coronado@intel.com>

Executing strip action on kernel modules removes the signature.
Is not possible to strip and keep the signature, therefore avoid
strip signed kernel modules.

Signed-off-by: foocampo <omar.ocampo.coronado@intel.com>
Signed-off-by: Omar Ocmapo <omar.ocampo.coronado@intel.com>
---
 meta/lib/oe/package.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index fa3428ad61..21c80aaa38 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -21,11 +21,15 @@ def runstrip(arg):
         os.chmod(file, newmode)
 
     stripcmd = [strip]
-
+    skip_strip = False
     # kernel module    
     if elftype & 16:
-        stripcmd.extend(["--strip-debug", "--remove-section=.comment",
-            "--remove-section=.note", "--preserve-dates"])
+        if is_kernel_module_signed(file):
+            bb.debug(1, "Skip strip on signed module %s" % file)
+            skip_strip = True
+        else:
+            stripcmd.extend(["--strip-debug", "--remove-section=.comment",
+                "--remove-section=.note", "--preserve-dates"])
     # .so and shared library
     elif ".so" in file and elftype & 8:
         stripcmd.extend(["--remove-section=.comment", "--remove-section=.note", "--strip-unneeded"])
@@ -36,7 +40,8 @@ def runstrip(arg):
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
-    output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
+    if not skip_strip:
+        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
 
     if newmode:
         os.chmod(file, origmode)
@@ -46,6 +51,13 @@ def is_kernel_module(path):
     with open(path) as f:
         return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
 
+# Detect if .ko module is signed
+def is_kernel_module_signed(path):
+    with open(path, "rb") as f:
+        f.seek(-28, 2)
+        module_tail = f.read()
+        return "Module signature appended" in "".join(chr(c) for c in bytearray(module_tail))
+
 # Return type (bits):
 # 0 - not elf
 # 1 - ELF
-- 
2.18.0


