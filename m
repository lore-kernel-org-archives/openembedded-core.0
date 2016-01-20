Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D97CF731DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:34:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K8YRbI024922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 00:34:27 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 00:34:26 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 00:34:23 -0800
Message-ID: <8fa956c546eb52d857dd932b7973736acdeff3c4.1453278829.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453278829.git.liezhi.yang@windriver.com>
References: <cover.1453278829.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] insane.bbclass: print all the QA messages
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
X-List-Received-Date: Wed, 20 Jan 2016 08:34:27 -0000
Content-Type: text/plain

Fixed:
If more than one files have the same QA issue, it only prints the last
one, others are overrided, for example:
messages["host-user-contaminated"] = "foo1"
messages["host-user-contaminated"] = "foo2"
Only foo2 will be printed.

Add package_qa_add_message() to hanlde messages, so that all of them
will be printed. The package_qa_add_message() is from RP.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   60 ++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f7781ce..ec17a48 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -190,6 +190,12 @@ def package_qa_handle_error(error_class, error_msg, d):
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
     return True
 
+def package_qa_add_message(messages, section, new_msg):
+    if section not in messages:
+        messages[section] = new_msg
+    else:
+        messages[section] = messages[section] + "\n" + new_msg
+
 QAPATHTEST[libexec] = "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf, messages):
 
@@ -199,7 +205,7 @@ def package_qa_check_libexec(path,name, d, elf, messages):
         return True
 
     if 'libexec' in path.split(os.path.sep):
-        messages["libexec"] = "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec)
+        package_qa_add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
         return False
 
     return True
@@ -227,7 +233,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
             rpath = m.group(1)
             for dir in bad_dirs:
                 if dir in rpath:
-                    messages["rpaths"] = "package %s contains bad RPATH %s in file %s" % (name, rpath, file)
+                    package_qa_add_message(messages, "rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
 def package_qa_check_useless_rpaths(file, name, d, elf, messages):
@@ -257,7 +263,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                messages["useless-rpaths"] = "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath)
+                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -266,8 +272,8 @@ def package_qa_check_dev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        messages["dev-so"] = "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d))
+        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
 def package_qa_check_staticdev(path, name, d, elf, messages):
@@ -279,8 +285,8 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a"):
-        messages["staticdev"] = "non -staticdev package contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d))
+        package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
 
 def package_qa_check_libdir(d):
     """
@@ -338,8 +344,8 @@ def package_qa_check_dbg(path, name, d, elf, messages):
 
     if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
-            messages["debug-files"] = "non debug package contains .debug directory: %s path %s" % \
-                     (name, package_qa_clean_path(path,d))
+            messages("debug-files", "non debug package contains .debug directory: %s path %s" % \
+                     (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[perms] = "package_qa_check_perm"
 def package_qa_check_perm(path,name,d, elf, messages):
@@ -470,7 +476,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     if target_arch == "allarch":
         pn = d.getVar('PN', True)
-        messages["arch"] = pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries"
+        package_qa_add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
         return
 
     # FIXME: Cross package confuse this check, so just skip them
@@ -490,15 +496,15 @@ def package_qa_check_arch(path,name,d, elf, messages):
     # Check the architecture and endiannes of the binary
     if not ((machine == elf.machine()) or \
         ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
-        messages["arch"] = "Architecture did not match (%d to %d) on %s" % \
-                 (machine, elf.machine(), package_qa_clean_path(path,d))
+        package_qa_add_message(messages, "arch", "Architecture did not match (%d to %d) on %s" % \
+                 (machine, elf.machine(), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or  \
         ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
-        messages["arch"] = "Bit size did not match (%d to %d) %s on %s" % \
-                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d))
+        package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
+                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
-        messages["arch"] = "Endiannes did not match (%d to %d) on %s" % \
-                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d))
+        package_qa_add_message(messages, "arch", "Endiannes did not match (%d to %d) on %s" % \
+                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
 
 QAPATHTEST[desktop] = "package_qa_check_desktop"
 def package_qa_check_desktop(path, name, d, elf, messages):
@@ -510,7 +516,7 @@ def package_qa_check_desktop(path, name, d, elf, messages):
         output = os.popen("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
-            messages["desktop"] = "Desktop file issue: " + l.strip()
+            package_qa_add_message(messages, "desktop", "Desktop file issue: " + l.strip())
 
 QAPATHTEST[textrel] = "package_qa_textrel"
 def package_qa_textrel(path, name, d, elf, messages):
@@ -534,7 +540,7 @@ def package_qa_textrel(path, name, d, elf, messages):
             sane = False
 
     if not sane:
-        messages["textrel"] = "ELF binary '%s' has relocations in .text" % path
+        package_qa_add_message(messages, "textrel", "ELF binary '%s' has relocations in .text" % path)
 
 QAPATHTEST[ldflags] = "package_qa_hash_style"
 def package_qa_hash_style(path, name, d, elf, messages):
@@ -569,7 +575,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
             sane = True
 
     if has_syms and not sane:
-        messages["ldflags"] = "No GNU_HASH in the elf binary: '%s'" % path
+        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the elf binary: '%s'" % path)
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
@@ -589,7 +595,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     with open(path) as f:
         file_content = f.read()
         if tmpdir in file_content:
-            messages["buildpaths"] = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
+            package_qa_add_message(messages, "buildpaths", "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
@@ -608,7 +614,7 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
         for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, True) or ""):
             if rdep.startswith("%sxorg-abi-" % mlprefix):
                 return
-        messages["xorg-driver-abi"] = "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path))
+        package_qa_add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
 
 QAPATHTEST[infodir] = "package_qa_check_infodir"
 def package_qa_check_infodir(path, name, d, elf, messages):
@@ -618,7 +624,7 @@ def package_qa_check_infodir(path, name, d, elf, messages):
     infodir = d.expand("${infodir}/dir")
 
     if infodir in path:
-        messages["infodir"] = "The /usr/share/info/dir file is not meant to be shipped in a particular package."
+        package_qa_add_message(messages, "infodir", "The /usr/share/info/dir file is not meant to be shipped in a particular package.")
 
 QAPATHTEST[symlink-to-sysroot] = "package_qa_check_symlink_to_sysroot"
 def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
@@ -631,7 +637,7 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
             tmpdir = d.getVar('TMPDIR', True)
             if target.startswith(tmpdir):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
-                messages["symlink-to-sysroot"] = "Symlink %s in %s points to TMPDIR" % (trimmed, name)
+                package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
 def package_qa_check_license(workdir, d):
     """
@@ -935,10 +941,10 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
                 # Bitbake expands ${D} within bbvar during the previous step, so we check for its expanded value
                 if expanded_d in bbvar:
                     if var == 'FILES':
-                        messages["expanded-d"] = "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % pak
+                        package_qa_add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % pak)
                         sane = False
                     else:
-                        messages["expanded-d"] = "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pak)
+                        package_qa_add_message(messages, "expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pak))
                         sane = False
     return sane
 
@@ -986,12 +992,12 @@ def package_qa_check_host_user(path, name, d, elf, messages):
         rootfs_path = path[len(dest):]
         check_uid = int(d.getVar('HOST_USER_UID', True))
         if stat.st_uid == check_uid:
-            messages["host-user-contaminated"] = "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_uid)
+            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_uid))
             return False
 
         check_gid = int(d.getVar('HOST_USER_GID', True))
         if stat.st_gid == check_gid:
-            messages["host-user-contaminated"] = "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid)
+            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid))
             return False
     return True
 
-- 
1.7.9.5


