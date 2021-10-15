Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A641CC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 14:40:06 +0000 (UTC)
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web09.10346.1634308803734952138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=cgP7NpPz;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id bONMmPkrbzwAFbONNmUKd2; Fri, 15 Oct 2021 15:40:02 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=FKGAO9gs c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8gfv0ekSlNoA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8 a=5fjBFGSVRHazx7oV-jwA:9
 a=3wMgzaNx_n4E4XEa:21 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=eDahySTojKqmAeiQk+UlIzqGaplKDcd68MUcgQJ1jOY=; b=cg
	P7NpPzzjEug4dxbAWBcsiHrXfLM1zNXUH/j/10ijtgJhJ7XcHYFzf4ODbA1jfIWkmNJQ6zsYlytJq
	F0cFbJE8v636Fr3zRsv+suCTztEClFvXog/DaX+zsK37se2F4smFgPGoULeaBQG10Bd9mFijuHwrH
	HEW8hitmQ35kfGPx14SqFw6j8uSYzHi3Wuw/Cql9iVeOLukj9kw1TbriABGYkNkg2+EnKZJokLeli
	7kiCARsW4/BHK9vOyUI1OuMgCF8UCYwzLSBz+3OcgLyRtY93vSswCT+r1wIN06lVpLnkOvD6jhuSK
	iPfaEbLrGaIqIXpMSdytI5fULfhnc08g==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mbONJ-004dR3-Pu; Fri, 15 Oct 2021 15:39:57 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v5 1/2] lib/oe/qa,insane: Move extra error handling functions
 to library
Date: Fri, 15 Oct 2021 15:39:53 +0100
Message-Id: 
 <60b9c916b1bbd7488abd9366749efea9766aa3fe.1634308643.git.mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4wfAzCaSRGVSN9hqE4qS5aV7EJAhuaUGZjvGg84wcThuguVym13oy16P6D3hanat7SaX3xEowKjbiQOQPXkU1X75AEqRn6WMgrFFrzbzoP0dHgi+45oUae
 vMnvGq0Eu/ro4SGtqSfEy2Y1n9wDkLIW+I8VhPd+QIJiGFR+CfgqMlxbcHLQ0YS5z2kha3MoWxEWsw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 14:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157000

Extract package_qa_write_error, package_qa_handle_error and
package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
drop the package_qa_ prefixes.

Update various bbclasses to use the new functions. No import is required
since base.bbclass puts oe.qa in OE_IMPORTS.

Stop requiring callers to manually track whether a fatal error has been
encountered via a "sane" flag. Instead replace the QA_SANE variable with
QA_ERRORS_FOUND and call oe.qa.exit_if_errors or
oe.qa.exit_with_message_if_errors at the end of each task.

Inspired by discussion resulting from
https://lists.openembedded.org/g/openembedded-core/message/156793 and
https://lists.openembedded.org/g/openembedded-core/message/156900

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/buildhistory.bbclass |   3 +-
 meta/classes/insane.bbclass       | 180 ++++++++++++------------------
 meta/classes/multilib.bbclass     |   3 +-
 meta/classes/package.bbclass      |  26 ++---
 meta/classes/ptest.bbclass        |   2 +-
 meta/lib/oe/qa.py                 |  34 ++++++
 6 files changed, 120 insertions(+), 128 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7c44fec2d1..62d0d781a1 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -287,7 +287,7 @@ python buildhistory_emit_pkghistory() {
             r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
             if r < 0:
                 msg = "Package version for package %s went backwards which would break package feeds (from %s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
-                package_qa_handle_error("version-going-backwards", msg, d)
+                oe.qa.handle_error("version-going-backwards", msg, d)
 
         pkginfo = PackageInfo(pkg)
         # Apparently the version can be different on a per-package basis (see Python)
@@ -321,6 +321,7 @@ python buildhistory_emit_pkghistory() {
 
     # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
     bb.build.exec_func("buildhistory_list_pkg_files", d)
+    oe.qa.exit_if_errors(d)
 }
 
 python buildhistory_emit_outputsigs() {
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 433e4dfa33..9ad9771dfa 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -18,8 +18,6 @@
 #   files under exec_prefix
 #  -Check if the package name is upper case
 
-QA_SANE = "True"
-
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
 WARN_QA ?= " libdir xorg-driver-abi \
@@ -59,32 +57,6 @@ def package_qa_clean_path(path, d, pkg=None):
         path = path.replace(os.path.join(d.getVar("PKGDEST"), pkg), "/")
     return path.replace(d.getVar("TMPDIR"), "/").replace("//", "/")
 
-def package_qa_write_error(type, error, d):
-    logfile = d.getVar('QA_LOGFILE')
-    if logfile:
-        p = d.getVar('P')
-        with open(logfile, "a+") as f:
-            f.write("%s: %s [%s]\n" % (p, error, type))
-
-def package_qa_handle_error(error_class, error_msg, d):
-    if error_class in (d.getVar("ERROR_QA") or "").split():
-        package_qa_write_error(error_class, error_msg, d)
-        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
-        d.setVar("QA_SANE", False)
-        return False
-    elif error_class in (d.getVar("WARN_QA") or "").split():
-        package_qa_write_error(error_class, error_msg, d)
-        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
-    else:
-        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
-    return True
-
-def package_qa_add_message(messages, section, new_msg):
-    if section not in messages:
-        messages[section] = new_msg
-    else:
-        messages[section] = messages[section] + "\n" + new_msg
-
 QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
 def package_qa_check_shebang_size(path, name, d, elf, messages):
     import stat
@@ -106,7 +78,7 @@ def package_qa_check_shebang_size(path, name, d, elf, messages):
             return
 
         if len(stanza) > 129:
-            package_qa_add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d)))
+            oe.qa.add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d)))
             return
 
 QAPATHTEST[libexec] = "package_qa_check_libexec"
@@ -118,7 +90,7 @@ def package_qa_check_libexec(path,name, d, elf, messages):
         return True
 
     if 'libexec' in path.split(os.path.sep):
-        package_qa_add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
+        oe.qa.add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
         return False
 
     return True
@@ -146,7 +118,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
             rpath = m.group(1)
             for dir in bad_dirs:
                 if dir in rpath:
-                    package_qa_add_message(messages, "rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file))
+                    oe.qa.add_message(messages, "rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
 def package_qa_check_useless_rpaths(file, name, d, elf, messages):
@@ -176,7 +148,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
+                oe.qa.add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -185,7 +157,7 @@ def package_qa_check_dev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
+        oe.qa.add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
                  (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
@@ -196,7 +168,7 @@ def package_qa_check_dev_elf(path, name, d, elf, messages):
     install link-time .so files that are linker scripts.
     """
     if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
-        package_qa_add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
+        oe.qa.add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
                  (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
@@ -209,7 +181,7 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
-        package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
+        oe.qa.add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[mime] = "package_qa_check_mime"
@@ -220,7 +192,7 @@ def package_qa_check_mime(path, name, d, elf, messages):
     """
 
     if d.getVar("datadir") + "/mime/packages" in path and path.endswith('.xml') and not bb.data.inherits_class("mime", d):
-        package_qa_add_message(messages, "mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
+        oe.qa.add_message(messages, "mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[mime-xdg] = "package_qa_check_mime_xdg"
@@ -247,9 +219,9 @@ def package_qa_check_mime_xdg(path, name, d, elf, messages):
             if name == d.getVar('PN'):
                 pkgname = '${PN}'
             wstr += "If yes: add \'inhert mime-xdg\' and \'MIME_XDG_PACKAGES += \"%s\"\' / if no add \'INSANE_SKIP:%s += \"mime-xdg\"\' to recipe." % (pkgname, pkgname)
-            package_qa_add_message(messages, "mime-xdg", wstr)
+            oe.qa.add_message(messages, "mime-xdg", wstr)
         if mime_type_found:
-            package_qa_add_message(messages, "mime-xdg", "package contains desktop file with key 'MimeType' but does not inhert mime-xdg: %s path '%s'" % \
+            oe.qa.add_message(messages, "mime-xdg", "package contains desktop file with key 'MimeType' but does not inhert mime-xdg: %s path '%s'" % \
                     (name, package_qa_clean_path(path,d)))
 
 def package_qa_check_libdir(d):
@@ -313,7 +285,7 @@ def package_qa_check_libdir(d):
                             pass
 
     if messages:
-        package_qa_handle_error("libdir", "\n".join(messages), d)
+        oe.qa.handle_error("libdir", "\n".join(messages), d)
 
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
 def package_qa_check_dbg(path, name, d, elf, messages):
@@ -323,7 +295,7 @@ def package_qa_check_dbg(path, name, d, elf, messages):
 
     if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
-            package_qa_add_message(messages, "debug-files", "non debug package contains .debug directory: %s path %s" % \
+            oe.qa.add_message(messages, "debug-files", "non debug package contains .debug directory: %s path %s" % \
                      (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[arch] = "package_qa_check_arch"
@@ -343,7 +315,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     if target_arch == "allarch":
         pn = d.getVar('PN')
-        package_qa_add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
+        oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
         return
 
     # FIXME: Cross package confuse this check, so just skip them
@@ -366,13 +338,13 @@ def package_qa_check_arch(path,name,d, elf, messages):
             target_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
     is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
     if not ((machine == elf.machine()) or is_32 or is_bpf):
-        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) in %s" % \
+        oe.qa.add_message(messages, "arch", "Architecture did not match (%s, expected %s) in %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path, d, name)))
     elif not ((bits == elf.abiSize()) or is_32 or is_bpf):
-        package_qa_add_message(messages, "arch", "Bit size did not match (%d, expected %d) in %s" % \
+        oe.qa.add_message(messages, "arch", "Bit size did not match (%d, expected %d) in %s" % \
                  (elf.abiSize(), bits, package_qa_clean_path(path, d, name)))
     elif not ((littleendian == elf.isLittleEndian()) or is_bpf):
-        package_qa_add_message(messages, "arch", "Endiannes did not match (%d, expected %d) in %s" % \
+        oe.qa.add_message(messages, "arch", "Endiannes did not match (%d, expected %d) in %s" % \
                  (elf.isLittleEndian(), littleendian, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[desktop] = "package_qa_check_desktop"
@@ -385,7 +357,7 @@ def package_qa_check_desktop(path, name, d, elf, messages):
         output = os.popen("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
-            package_qa_add_message(messages, "desktop", "Desktop file issue: " + l.strip())
+            oe.qa.add_message(messages, "desktop", "Desktop file issue: " + l.strip())
 
 QAPATHTEST[textrel] = "package_qa_textrel"
 def package_qa_textrel(path, name, d, elf, messages):
@@ -411,7 +383,7 @@ def package_qa_textrel(path, name, d, elf, messages):
 
     if not sane:
         path = package_qa_clean_path(path, d, name)
-        package_qa_add_message(messages, "textrel", "%s: ELF binary %s has relocations in .text" % (name, path))
+        oe.qa.add_message(messages, "textrel", "%s: ELF binary %s has relocations in .text" % (name, path))
 
 QAPATHTEST[ldflags] = "package_qa_hash_style"
 def package_qa_hash_style(path, name, d, elf, messages):
@@ -446,7 +418,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
             sane = True
     if has_syms and not sane:
         path = package_qa_clean_path(path, d, name)
-        package_qa_add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
+        oe.qa.add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
@@ -467,7 +439,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
         file_content = f.read()
         if tmpdir in file_content:
             trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
-            package_qa_add_message(messages, "buildpaths", "File %s in package %s contains reference to TMPDIR" % (trimmed, name))
+            oe.qa.add_message(messages, "buildpaths", "File %s in package %s contains reference to TMPDIR" % (trimmed, name))
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
@@ -486,7 +458,7 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
         for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS:' + name) or ""):
             if rdep.startswith("%sxorg-abi-" % mlprefix):
                 return
-        package_qa_add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
+        oe.qa.add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
 
 QAPATHTEST[infodir] = "package_qa_check_infodir"
 def package_qa_check_infodir(path, name, d, elf, messages):
@@ -496,7 +468,7 @@ def package_qa_check_infodir(path, name, d, elf, messages):
     infodir = d.expand("${infodir}/dir")
 
     if infodir in path:
-        package_qa_add_message(messages, "infodir", "The /usr/share/info/dir file is not meant to be shipped in a particular package.")
+        oe.qa.add_message(messages, "infodir", "The /usr/share/info/dir file is not meant to be shipped in a particular package.")
 
 QAPATHTEST[symlink-to-sysroot] = "package_qa_check_symlink_to_sysroot"
 def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
@@ -509,7 +481,7 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
             tmpdir = d.getVar('TMPDIR')
             if target.startswith(tmpdir):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
-                package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
+                oe.qa.add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
@@ -517,7 +489,6 @@ python populate_lic_qa_checksum() {
     """
     Check for changes in the license files.
     """
-    sane = True
 
     lic_files = d.getVar('LIC_FILES_CHKSUM') or ''
     lic = d.getVar('LICENSE')
@@ -527,7 +498,7 @@ python populate_lic_qa_checksum() {
         return
 
     if not lic_files and d.getVar('SRC_URI'):
-        sane &= package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
+        oe.qa.handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S')
     corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
@@ -535,11 +506,11 @@ python populate_lic_qa_checksum() {
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
+            oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
             continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
+            oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
 
         if (srclicfile == corebase_licensefile):
@@ -607,10 +578,9 @@ python populate_lic_qa_checksum() {
             else:
                 msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                 msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
-            sane &= package_qa_handle_error("license-checksum", msg, d)
+            oe.qa.handle_error("license-checksum", msg, d)
 
-    if not sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
 
 def qa_check_staged(path,d):
@@ -622,7 +592,6 @@ def qa_check_staged(path,d):
     responsible for the errors easily even if we look at every .pc and .la file.
     """
 
-    sane = True
     tmpdir = d.getVar('TMPDIR')
     workdir = os.path.join(tmpdir, "work")
     recipesysroot = d.getVar("RECIPE_SYSROOT")
@@ -655,16 +624,14 @@ def qa_check_staged(path,d):
                     file_content = file_content.replace(recipesysroot, "")
                     if workdir in file_content:
                         error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
-                        sane &= package_qa_handle_error("la", error_msg, d)
+                        oe.qa.handle_error("la", error_msg, d)
             elif file.endswith(".pc") and not skip_pkgconfig:
                 with open(path) as f:
                     file_content = f.read()
                     file_content = file_content.replace(recipesysroot, "")
                     if pkgconfigcheck in file_content:
                         error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
-                        sane &= package_qa_handle_error("pkgconfig", error_msg, d)
-
-    return sane
+                        oe.qa.handle_error("pkgconfig", error_msg, d)
 
 # Run all package-wide warnfuncs and errorfuncs
 def package_qa_package(warnfuncs, errorfuncs, package, d):
@@ -677,9 +644,9 @@ def package_qa_package(warnfuncs, errorfuncs, package, d):
         func(package, d, errors)
 
     for w in warnings:
-        package_qa_handle_error(w, warnings[w], d)
+        oe.qa.handle_error(w, warnings[w], d)
     for e in errors:
-        package_qa_handle_error(e, errors[e], d)
+        oe.qa.handle_error(e, errors[e], d)
 
     return len(errors) == 0
 
@@ -694,9 +661,9 @@ def package_qa_recipe(warnfuncs, errorfuncs, pn, d):
         func(pn, d, errors)
 
     for w in warnings:
-        package_qa_handle_error(w, warnings[w], d)
+        oe.qa.handle_error(w, warnings[w], d)
     for e in errors:
-        package_qa_handle_error(e, errors[e], d)
+        oe.qa.handle_error(e, errors[e], d)
 
     return len(errors) == 0
 
@@ -722,9 +689,9 @@ def package_qa_walk(warnfuncs, errorfuncs, package, d):
                 func(path, package, d, elf, errors)
 
     for w in warnings:
-        package_qa_handle_error(w, warnings[w], d)
+        oe.qa.handle_error(w, warnings[w], d)
     for e in errors:
-        package_qa_handle_error(e, errors[e], d)
+        oe.qa.handle_error(e, errors[e], d)
 
 def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
     # Don't do this check for kernel/module recipes, there aren't too many debug/development
@@ -744,10 +711,10 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
             for rdepend in rdepends:
                 if "-dbg" in rdepend and "debug-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg,rdepend)
-                    package_qa_handle_error("debug-deps", error_msg, d)
+                    oe.qa.handle_error("debug-deps", error_msg, d)
                 if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg, rdepend)
-                    package_qa_handle_error("dev-deps", error_msg, d)
+                    oe.qa.handle_error("dev-deps", error_msg, d)
                 if rdepend not in packages:
                     rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
@@ -768,7 +735,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                         error_msg = "%s rdepends on %s, but it isn't a build dependency, missing %s in DEPENDS or PACKAGECONFIG?" % (pkg, rdepend, rdep_data['PN'])
                     else:
                         error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
-                    package_qa_handle_error("build-deps", error_msg, d)
+                    oe.qa.handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
             ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
@@ -821,7 +788,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 for key in filerdepends:
                     error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS:%s?" % \
                             (filerdepends[key].replace(":%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
-                    package_qa_handle_error("file-rdeps", error_msg, d)
+                    oe.qa.handle_error("file-rdeps", error_msg, d)
 package_qa_check_rdepends[vardepsexclude] = "OVERRIDES"
 
 def package_qa_check_deps(pkg, pkgdest, d):
@@ -838,7 +805,7 @@ def package_qa_check_deps(pkg, pkgdest, d):
             for v in rvar[dep]:
                 if v and not v.startswith(('< ', '= ', '> ', '<= ', '>=')):
                     error_msg = "%s:%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, v)
-                    package_qa_handle_error("dep-cmp", error_msg, d)
+                    oe.qa.handle_error("dep-cmp", error_msg, d)
 
     check_valid_deps('RDEPENDS')
     check_valid_deps('RRECOMMENDS')
@@ -849,13 +816,14 @@ def package_qa_check_deps(pkg, pkgdest, d):
 
 QAPKGTEST[usrmerge] = "package_qa_check_usrmerge"
 def package_qa_check_usrmerge(pkg, d, messages):
+
     pkgdest = d.getVar('PKGDEST')
     pkg_dir = pkgdest + os.sep + pkg + os.sep
     merged_dirs = ['bin', 'sbin', 'lib'] + d.getVar('MULTILIB_VARIANTS').split()
     for f in merged_dirs:
         if os.path.exists(pkg_dir + f) and not os.path.islink(pkg_dir + f):
             msg = "%s package is not obeying usrmerge distro feature. /%s should be relocated to /usr." % (pkg, f)
-            package_qa_add_message(messages, "usrmerge", msg)
+            oe.qa.add_message(messages, "usrmerge", msg)
             return False
     return True
 
@@ -874,7 +842,7 @@ def package_qa_check_perllocalpod(pkg, d, messages):
     if matches:
         matches = [package_qa_clean_path(path, d, pkg) for path in matches]
         msg = "%s contains perllocal.pod (%s), should not be installed" % (pkg, " ".join(matches))
-        package_qa_add_message(messages, "perllocalpod", msg)
+        oe.qa.add_message(messages, "perllocalpod", msg)
 
 QAPKGTEST[expanded-d] = "package_qa_check_expanded_d"
 def package_qa_check_expanded_d(package, d, messages):
@@ -889,10 +857,10 @@ def package_qa_check_expanded_d(package, d, messages):
         bbvar = d.getVar(var + ":" + package) or ""
         if expanded_d in bbvar:
             if var == 'FILES':
-                package_qa_add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % package)
+                oe.qa.add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % package)
                 sane = False
             else:
-                package_qa_add_message(messages, "expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, package))
+                oe.qa.add_message(messages, "expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, package))
                 sane = False
     return sane
 
@@ -910,7 +878,7 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
     if not unlisted:
         return True
 
-    package_qa_add_message(messages, "unlisted-pkg-lics",
+    oe.qa.add_message(messages, "unlisted-pkg-lics",
                            "LICENSE:%s includes licenses (%s) that are not "
                            "listed in LICENSE" % (package, ' '.join(unlisted)))
     return False
@@ -925,7 +893,7 @@ def package_qa_check_encoding(keys, encode, d):
             except UnicodeDecodeError as e:
                 error_msg = "%s has non %s characters" % (key,enc)
                 sane = False
-                package_qa_handle_error("invalid-chars", error_msg, d)
+                oe.qa.handle_error("invalid-chars", error_msg, d)
         return sane
 
     for key in keys:
@@ -958,12 +926,12 @@ def package_qa_check_host_user(path, name, d, elf, messages):
     else:
         check_uid = int(d.getVar('HOST_USER_UID'))
         if stat.st_uid == check_uid:
-            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid))
+            oe.qa.add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid))
             return False
 
         check_gid = int(d.getVar('HOST_USER_GID'))
         if stat.st_gid == check_gid:
-            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid))
+            oe.qa.add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid))
             return False
     return True
 
@@ -972,11 +940,11 @@ def package_qa_check_src_uri(pn, d, messages):
     import re
 
     if "${PN}" in d.getVar("SRC_URI", False):
-        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
+        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
     for url in d.getVar("SRC_URI").split():
         if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
-            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
+            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
 QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
 def package_qa_check_unhandled_features_check(pn, d, messages):
@@ -987,7 +955,7 @@ def package_qa_check_unhandled_features_check(pn, d, messages):
                 if d.getVar(var) is not None or d.overridedata.get(var) is not None:
                     var_set = True
         if var_set:
-            package_qa_handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
+            oe.qa.handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
 QARECIPETEST[missing-update-alternatives] = "package_qa_check_missing_update_alternatives"
 def package_qa_check_missing_update_alternatives(pn, d, messages):
@@ -995,7 +963,7 @@ def package_qa_check_missing_update_alternatives(pn, d, messages):
     # without inheriting update-alternatives class
     for pkg in (d.getVar('PACKAGES') or '').split():
         if d.getVar('ALTERNATIVE:%s' % pkg) and not bb.data.inherits_class('update-alternatives', d):
-            package_qa_handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE:%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
+            oe.qa.handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE:%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
 
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
@@ -1071,7 +1039,7 @@ python do_package_qa () {
         bb.note("Checking Package: %s" % package)
         # Check package name
         if not pkgname_pattern.match(package):
-            package_qa_handle_error("pkgname",
+            oe.qa.handle_error("pkgname",
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
         warn_checks, error_checks = parse_test_matrix("QAPATHTEST")
@@ -1089,10 +1057,7 @@ python do_package_qa () {
     if 'libdir' in d.getVar("ALL_QA").split():
         package_qa_check_libdir(d)
 
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("QA run found fatal errors. Please consider fixing them.")
-    bb.note("DONE with PACKAGE QA")
+    oe.qa.exit_if_errors(d)
 }
 
 # binutils is used for most checks, so need to set as dependency
@@ -1119,8 +1084,8 @@ addtask do_package_qa_setscene
 
 python do_qa_staging() {
     bb.note("QA checking staging")
-    if not qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d):
-        bb.fatal("QA staging was broken by the package built above")
+    qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d)
+    oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
 }
 
 python do_qa_patch() {
@@ -1168,7 +1133,7 @@ python do_qa_patch() {
             elif 'patch-fuzz' in d.getVar('WARN_QA'):
                 bb.warn(msg)
             msg = "Patch log indicates that patches do not apply cleanly."
-            package_qa_handle_error("patch-fuzz", msg, d)
+            oe.qa.handle_error("patch-fuzz", msg, d)
 }
 
 python do_qa_configure() {
@@ -1196,7 +1161,7 @@ python do_qa_configure() {
                 if subprocess.call(statement, shell=True) == 0:
                     error_msg = """This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
 Rerun configure task after fixing this."""
-                    package_qa_handle_error("configure-unsafe", error_msg, d)
+                    oe.qa.handle_error("configure-unsafe", error_msg, d)
 
             if "configure.ac" in files:
                 configs.append(os.path.join(root,"configure.ac"))
@@ -1226,7 +1191,7 @@ Rerun configure task after fixing this."""
                 gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
                 if subprocess.call(gnu, shell=True) == 0:
                     error_msg = "AM_GNU_GETTEXT used but no inherit gettext"
-                    package_qa_handle_error("configure-gettext", error_msg, d)
+                    oe.qa.handle_error("configure-gettext", error_msg, d)
 
     ###########################################################################
     # Check unrecognised configure options (with a white list)
@@ -1249,7 +1214,7 @@ Rerun configure task after fixing this."""
             if options:
                 pn = d.getVar('PN')
                 error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
-                package_qa_handle_error("unknown-configure-option", error_msg, d)
+                oe.qa.handle_error("unknown-configure-option", error_msg, d)
         except subprocess.CalledProcessError:
             pass
 
@@ -1261,11 +1226,9 @@ Rerun configure task after fixing this."""
             if pconfig not in pkgconfigflags:
                 pn = d.getVar('PN')
                 error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
-                package_qa_handle_error("invalid-packageconfig", error_msg, d)
+                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
 
 python do_qa_unpack() {
@@ -1318,15 +1281,15 @@ python () {
     pn = d.getVar('PN')
     if pn in overrides:
         msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE"), pn)
-        package_qa_handle_error("pn-overrides", msg, d)
+        oe.qa.handle_error("pn-overrides", msg, d)
     prog = re.compile(r'[A-Z]')
     if prog.search(pn):
-        package_qa_handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
+        oe.qa.handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
     # Some people mistakenly use DEPENDS:${PN} instead of DEPENDS and wonder
     # why it doesn't work.
     if (d.getVar(d.expand('DEPENDS:${PN}'))):
-        package_qa_handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, should use DEPENDS", d)
+        oe.qa.handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, should use DEPENDS", d)
 
     issues = []
     if (d.getVar('PACKAGES') or "").split():
@@ -1343,7 +1306,7 @@ python () {
     else:
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
-        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
+        oe.qa.handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
 
     if 'native-last' not in (d.getVar('INSANE_SKIP') or "").split():
         for native_class in ['native', 'nativesdk']:
@@ -1371,11 +1334,8 @@ python () {
                     else:
                         break
                 if broken_order:
-                    package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
+                    oe.qa.handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
                                              "Classes inherited after native/nativesdk: %s" % (pn, " ".join(broken_order)), d)
 
-
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index b210c49c0c..9b5bf174ec 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -210,7 +210,7 @@ python do_package_qa_multilib() {
         if len(candidates) > 0:
             msg = "%s package %s - suspicious values '%s' in %s" \
                    % (d.getVar('PN'), pkg, ' '.join(candidates), var)
-            package_qa_handle_error("multilib", msg, d)
+            oe.qa.handle_error("multilib", msg, d)
 
     ml = d.getVar('MLPREFIX')
     if not ml:
@@ -228,4 +228,5 @@ python do_package_qa_multilib() {
         check_mlprefix(pkg, 'RSUGGESTS', ml)
         check_mlprefix(pkg, 'RREPLACES', ml)
         check_mlprefix(pkg, 'RCONFLICTS', ml)
+   oe.qa.exit_if_errors(d)
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 985dfacd09..92eba98892 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -41,8 +41,6 @@
 inherit packagedata
 inherit chrpath
 inherit package_pkgdata
-
-# Need the package_qa_handle_error() in insane.bbclass
 inherit insane
 
 PKGD    = "${WORKDIR}/package"
@@ -865,7 +863,7 @@ python fixup_perms () {
                 self._setdir(lsplit[0], lsplit[1], lsplit[2], lsplit[3], lsplit[4], lsplit[5], lsplit[6], lsplit[7])
             else:
                 msg = "Fixup Perms: invalid config line %s" % line
-                package_qa_handle_error("perm-config", msg, d)
+                oe.qa.handle_error("perm-config", msg, d)
                 self.path = None
                 self.link = None
 
@@ -1005,7 +1003,7 @@ python fixup_perms () {
                     continue
                 if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
                     msg = "Fixup perms: %s invalid line: %s" % (conf, line)
-                    package_qa_handle_error("perm-line", msg, d)
+                    oe.qa.handle_error("perm-line", msg, d)
                     continue
                 entry = fs_perms_entry(d.expand(line))
                 if entry and entry.path:
@@ -1042,7 +1040,7 @@ python fixup_perms () {
             ptarget = os.path.join(os.path.dirname(dir), link)
         if os.path.exists(target):
             msg = "Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget)
-            package_qa_handle_error("perm-link", msg, d)
+            oe.qa.handle_error("perm-link", msg, d)
             continue
 
         # Create path to move directory to, move it, and then setup the symlink
@@ -1202,7 +1200,7 @@ python split_and_strip_files () {
                         bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
                     else:
                         msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
-                        package_qa_handle_error("already-stripped", msg, d)
+                        oe.qa.handle_error("already-stripped", msg, d)
                     continue
 
                 # At this point we have an unstripped elf file. We need to:
@@ -1362,7 +1360,7 @@ python populate_packages () {
     for i, pkg in enumerate(packages):
         if pkg in package_dict:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
-            package_qa_handle_error("packages-list", msg, d)
+            oe.qa.handle_error("packages-list", msg, d)
         # Ensure the source package gets the chance to pick up the source files
         # before the debug package by ordering it first in PACKAGES. Whether it
         # actually picks up any source files is controlled by
@@ -1399,7 +1397,7 @@ python populate_packages () {
         filesvar = d.getVar('FILES:%s' % pkg) or ""
         if "//" in filesvar:
             msg = "FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg
-            package_qa_handle_error("files-invalid", msg, d)
+            oe.qa.handle_error("files-invalid", msg, d)
             filesvar.replace("//", "/")
 
         origfiles = filesvar.split()
@@ -1468,7 +1466,7 @@ python populate_packages () {
         licenses = d.getVar('LICENSE_EXCLUSION-' + pkg)
         if licenses:
             msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
-            package_qa_handle_error("incompatible-license", msg, d)
+            oe.qa.handle_error("incompatible-license", msg, d)
         else:
             package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
@@ -1492,7 +1490,7 @@ python populate_packages () {
                 msg = msg + "\n  " + f
             msg = msg + "\nPlease set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.\n"
             msg = msg + "%s: %d installed and not shipped files." % (pn, len(unshipped))
-            package_qa_handle_error("installed-vs-shipped", msg, d)
+            oe.qa.handle_error("installed-vs-shipped", msg, d)
 }
 populate_packages[dirs] = "${D}"
 
@@ -1838,7 +1836,7 @@ python package_do_shlibs() {
     ver = d.getVar('PKGV')
     if not ver:
         msg = "PKGV not defined"
-        package_qa_handle_error("pkgv-undefined", msg, d)
+        oe.qa.handle_error("pkgv-undefined", msg, d)
         return
 
     pkgdest = d.getVar('PKGDEST')
@@ -2402,7 +2400,7 @@ python do_package () {
 
     if not workdir or not outdir or not dest or not dvar or not pn:
         msg = "WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package"
-        package_qa_handle_error("var-undefined", msg, d)
+        oe.qa.handle_error("var-undefined", msg, d)
         return
 
     bb.build.exec_func("package_convert_pr_autoinc", d)
@@ -2455,9 +2453,7 @@ python do_package () {
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
-    qa_sane = d.getVar("QA_SANE")
-    if not qa_sane:
-        bb.fatal("Fatal QA errors found, failing task.")
+    oe.qa.exit_if_errors(d)
 }
 
 do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 77614ae860..1ec23c0923 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -129,4 +129,4 @@ def package_qa_check_missing_ptest(pn, d, messages):
 
     enabled_ptests = " ".join([d.getVar('PTESTS_FAST'), d.getVar('PTESTS_SLOW'), d.getVar('PTESTS_PROBLEMS')]).split()
     if (pn + "-ptest").replace(d.getVar('MLPREFIX'), '') not in enabled_ptests:
-        package_qa_handle_error("missing-ptest", "supports ptests but is not included in oe-core's ptest-packagelists.inc", d)
+        oe.qa.handle_error("missing-ptest", "supports ptests but is not included in oe-core's ptest-packagelists.inc", d)
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index e8a854a302..efab7e8564 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -171,6 +171,40 @@ def elf_machine_to_string(machine):
     except:
         return "Unknown (%s)" % repr(machine)
 
+def write_error(type, error, d):
+    logfile = d.getVar('QA_LOGFILE')
+    if logfile:
+        p = d.getVar('P')
+        with open(logfile, "a+") as f:
+            f.write("%s: %s [%s]\n" % (p, error, type))
+
+def handle_error(error_class, error_msg, d):
+    if error_class in (d.getVar("ERROR_QA") or "").split():
+        write_error(error_class, error_msg, d)
+        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
+        d.setVar("QA_ERRORS_FOUND", "True")
+        return False
+    elif error_class in (d.getVar("WARN_QA") or "").split():
+        write_error(error_class, error_msg, d)
+        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
+    else:
+        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
+    return True
+
+def add_message(messages, section, new_msg):
+    if section not in messages:
+        messages[section] = new_msg
+    else:
+        messages[section] = messages[section] + "\n" + new_msg
+
+def exit_with_message_if_errors(message, d):
+    qa_fatal_errors = bb.utils.to_boolean(d.getVar("QA_ERRORS_FOUND"), False)
+    if qa_fatal_errors:
+        bb.fatal(message)
+
+def exit_if_errors(d):
+    exit_with_message_if_errors("Fatal QA errors were found, failing task.", d)
+
 if __name__ == "__main__":
     import sys
 
-- 
2.30.2


