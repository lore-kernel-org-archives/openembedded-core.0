Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D319A62135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 00:27:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 30 Mar 2016 17:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,419,1455004800"; d="scan'208";a="922197679"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2016 17:27:55 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 17:13:54 -0700
Message-Id: <1459383234-17222-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH] relocate_sdk: additional error checks
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
X-List-Received-Date: Thu, 31 Mar 2016 00:27:55 -0000

When installing SDK in a non-default location and the path length
of the SDK install location is longer than the path length of the
default SDK location, relocation of .ldsochache section will overwrite
file location outside of the .ldsocache section size.
In addition, additional checks were added to ensure that any
path in sections .gccrelocprefix and .ldsochache will not exceed
the space allocated for it within the file, which would also result
in file corruption.

[YOCTO #9268]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/relocate_sdk.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index ceca1f2..99fca86 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -112,7 +112,7 @@ def change_interpreter(elf_file_name):
             f.write(dl_path)
             break
 
-def change_dl_sysdirs():
+def change_dl_sysdirs(elf_file_name):
     if arch == 32:
         sh_fmt = "<IIIIIIIIII"
     else:
@@ -156,6 +156,11 @@ def change_dl_sysdirs():
             elif name == b(".ldsocache"):
                 ldsocache_path = f.read(sh_size)
                 new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
+                new_ldsocache_path = new_ldsocache_path.rstrip(b("\0"))
+                if (len(new_ldsocache_path) >= sh_size):
+                    print("ERROR: could not relocate %s, .ldsocache section size = %i and %i is needed." \
+                    % (elf_file_name, sh_size, len(new_ldsocache_path)))
+                    sys.exit(-1)
                 # pad with zeros
                 new_ldsocache_path += b("\0") * (sh_size - len(new_ldsocache_path))
                 # write it back
@@ -167,6 +172,10 @@ def change_dl_sysdirs():
                     path = f.read(4096)
                     new_path = old_prefix.sub(new_prefix, path)
                     new_path = new_path.rstrip(b("\0"))
+                    if (len(new_path) >= 4096):
+                        print("ERROR: could not relocate %s, max path size = 4096 and %i is needed." \
+                        % (elf_file_name, len(new_path)))
+                        sys.exit(-1)
                     # pad with zeros
                     new_path += b("\0") * (4096 - len(new_path))
                     #print "Changing %s to %s at %s" % (str(path), str(new_path), str(offset))
@@ -241,7 +250,7 @@ for e in executables_list:
         if arch:
             parse_elf_header()
             change_interpreter(e)
-            change_dl_sysdirs()
+            change_dl_sysdirs(e)
 
     """ change permissions back """
     if perms:
-- 
1.9.1


