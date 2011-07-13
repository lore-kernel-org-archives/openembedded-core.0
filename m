Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qh0pL-0000Ih-Ph
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:54:16 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qh0lX-0004eh-MO
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:50:19 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 15:50:18 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310568619.2378.14.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] insane: make GNU_HASH check slightly more robust (avoids false negatives with gold); add check for useless rpaths
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
X-List-Received-Date: Wed, 13 Jul 2011 14:54:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It isn't safe to make assumptions about the order of the entries in the
dynamic section.  Fix the ldflags test to cope with the case where
GNU_HASH comes before NEEDED and/or INIT, which seems to happen with
binaries linked by gold.

Also, add a new warning for binaries which contain useless (but benign)
rpath entries pointing to the default search locations.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/insane.bbclass |   44 ++++++++++++++++++++++++++++++++----------
 1 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8d5da00..3e355bf 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -92,7 +92,7 @@ def package_qa_get_machine_dict():
        }
 
 
-WARN_QA ?= "dev-so rpaths debug-deps dev-deps debug-files arch la2 pkgconfig desktop la ldflags perms"
+WARN_QA ?= "dev-so rpaths debug-deps dev-deps debug-files arch la2 pkgconfig desktop la ldflags perms useless-rpaths"
 ERROR_QA ?= ""
 #ERROR_QA ?= "rpaths debug-deps dev-deps debug-files arch pkgconfig perms"
 
@@ -141,6 +141,31 @@ def package_qa_check_rpath(file,name, d, elf, messages):
             if dir in line:
                 messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
 
+QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
+def package_qa_check_useless_rpaths(file,name, d, elf, messages):
+    """
+    Check for RPATHs that are useless but not dangerous
+    """
+    if not elf:
+        return
+
+    objdump = bb.data.getVar('OBJDUMP', d, True)
+    env_path = bb.data.getVar('PATH', d, True)
+
+    libdir = bb.data.getVar("libdir", d, True)
+    base_libdir = bb.data.getVar("base_libdir", d, True)
+
+    import re
+    rpath_re = re.compile("\s+RPATH\s+(.*)")
+    for line in os.popen("LC_ALL=C PATH=%s %s -p '%s' 2> /dev/null" % (env_path, objdump, file), "r"):
+    	m = rpath_re.match(line)
+	if m:
+	   rpath = m.group(1)
+	   if rpath == libdir or rpath == baselibdir:
+	      # The dynamic linker searches both these places anyway.  There is no point in
+	      # looking there again.
+	      messages.append("dynamic section contains probably-redundant RPATH %s" % rpath)
+
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
     """
@@ -238,22 +263,19 @@ def package_qa_hash_style(path, name, d, elf, messages):
     objdump = bb.data.getVar('OBJDUMP', d, True)
     env_path = bb.data.getVar('PATH', d, True)
 
-    sane = True
-    elf = False
-    # A bit hacky. We do not know if path is an elf binary or not
-    # we will search for 'NEEDED' or 'INIT' as this should be printed...
-    # and come before the HASH section (guess!!!) and works on split out
-    # debug symbols too
+    sane = False
+    has_syms = False
+
+    # If this binary has symbols, we expect it to have GNU_HASH too.
     for line in os.popen("LC_ALL=C PATH=%s %s -p '%s' 2> /dev/null" % (env_path, objdump, path), "r"):
-        if "NEEDED" in line or "INIT" in line:
-            sane = False
-            elf = True
+        if "SYMTAB" in line:
+            has_syms = True
         if "GNU_HASH" in line:
             sane = True
         if "[mips32]" in line or "[mips64]" in line:
 	    sane = True
 
-    if elf and not sane:
+    if has_syms and not sane:
         messages.append("No GNU_HASH in the elf binary: '%s'" % path)
 
 
-- 
1.7.4.1





