Return-Path: <omar.ocampo.coronado@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 259B97905D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 19:39:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2018 12:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,239,1531810800"; d="scan'208";a="248837437"
Received: from unknown (HELO kairos.zpn.intel.com) ([10.219.80.29])
	by orsmga005.jf.intel.com with ESMTP; 14 Aug 2018 12:38:36 -0700
From: omar.ocampo.coronado@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 17:33:21 -0500
Message-Id: <20180814223321.158068-1-omar.ocampo.coronado@intel.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCHv4] package: skip strip on signed kernel modules
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
X-List-Received-Date: Tue, 14 Aug 2018 19:39:18 -0000

From: foocampo <omar.ocampo.coronado@intel.com>

Kernel module signatures are outside the defined ELF container,
executing strip action on kernel modules removes the signature.
In order to keep the signature on kernel modules, avoid any strip
action on signed modules.

Fore more information check kernel.org admin-guide/module-signing.

Signed-off-by: Omar Ocampo <omar.ocampo.coronado@intel.com>
---
 meta/lib/oe/package.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index fa3428ad61..e7eac19762 100644
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
@@ -46,6 +51,15 @@ def is_kernel_module(path):
     with open(path) as f:
         return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
 
+# Detect if .ko module is signed
+def is_kernel_module_signed(path):
+    with open(path, "rb") as f:
+        # 'Module signature appended' the string confirms a signature is present.
+        # 28 bytes is the size of the string, regardless of the architecture.
+        f.seek(-28, 2)
+        module_tail = f.read()
+        return "Module signature appended" in "".join(chr(c) for c in bytearray(module_tail))
+
 # Return type (bits):
 # 0 - not elf
 # 1 - ELF
-- 
2.18.0


