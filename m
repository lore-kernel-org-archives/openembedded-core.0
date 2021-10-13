Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C23C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 10:48:35 +0000 (UTC)
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web12.6456.1634122112762165275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 03:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=LH4j7dm+;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id aboDmtLEOrasdaboEmZrCG; Wed, 13 Oct 2021 11:48:31 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=dIE9ZNRb c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8gfv0ekSlNoA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8 a=mactYJ0YaHommEVyNEAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=jnXoxnrBA6CMwXkjfk46rJqNfAHKUfG1Bks61Yum/C4=; b=LH
	4j7dm+f/L/JN3whOLZwySguEaqMJj7l/CaVXlqAUA4cwcc5P5/vXcdnMU24A5AFRMw2+oHR7wLxs2
	jirL1Kwa1J1j0lnKoEjjM+8PhG8lBqvh7hT6sz667zc6woibUvhHIBAsNBlj8XbxIYaEYkYMSCGfP
	GjWvv0+e3Zp/rR+wgYpMDiNrf/RWJuEyb2AMOgVP3QrxMNAX81z9rE7Thk86/kK5U7efgFizDOch4
	TU3JFbR2PA/QYy8WmfdLXuw++GTP+4V7kvSI2QFc0Fl0HJJAYoAcApMDRj1CjkfSdRD2cT36y1QjE
	5/hlwidhRzOv3GPHic2VIUW7EmhxJCmg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1maboB-001VVl-4g; Wed, 13 Oct 2021 11:48:27 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v3 1/2] lib/oe/qa,insane: Extra error handling functions to
 library
Date: Wed, 13 Oct 2021 11:48:04 +0100
Message-Id: <20211013104805.646626-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4wfHVeTeMriGYuDBd7Zv6TeE3/nvZYuWEmGCbfngmpVfj5UIPrT9wyzT5d22IEw0tws/WkAZGrZLCug2xw1oHveNUmNNm4rYj7tA65uxnVErP+M3BeMnDe
 Vu1eV9J2K8bWakP2yZi2nQoSobHCO/h3cW40ucpXuzzMTy7HMdqv3ePHRGHJT2LpT+u2SqQ+FxHySw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 10:48:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156899

Extract package_qa_write_error, package_qa_handle_error and
package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
drop the package_qa_ prefixes. Add import statements and convert callers
to use oe.qa. prefix.

Inspired by discussion resulting from
https://lists.openembedded.org/g/openembedded-core/message/156793

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/insane.bbclass | 209 +++++++++++++++++++-----------------
 meta/lib/oe/qa.py           |  26 +++++
 2 files changed, 135 insertions(+), 100 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f2d2ca3689..895216d3e8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -59,35 +59,9 @@ def package_qa_clean_path(path, d, pkg=None):
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
-    import stat
+    import stat, oe.qa
     if os.path.islink(path) or stat.S_ISFIFO(os.stat(path).st_mode) or elf:
         return
 
@@ -106,11 +80,12 @@ def package_qa_check_shebang_size(path, name, d, elf, messages):
             return
 
         if len(stanza) > 129:
-            package_qa_add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d)))
+            oe.qa.add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d)))
             return
 
 QAPATHTEST[libexec] = "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf, messages):
+    import oe.qa
 
     # Skip the case where the default is explicitly /usr/libexec
     libexec = d.getVar('libexecdir')
@@ -118,7 +93,7 @@ def package_qa_check_libexec(path,name, d, elf, messages):
         return True
 
     if 'libexec' in path.split(os.path.sep):
-        package_qa_add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
+        oe.qa.add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
         return False
 
     return True
@@ -138,7 +113,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
 
     phdrs = elf.run_objdump("-p", d)
 
-    import re
+    import re, oe.qa
     rpath_re = re.compile(r"\s+RPATH\s+(.*)")
     for line in phdrs.split("\n"):
         m = rpath_re.match(line)
@@ -146,7 +121,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
             rpath = m.group(1)
             for dir in bad_dirs:
                 if dir in rpath:
-                    package_qa_add_message(messages, "rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file))
+                    oe.qa.add_message(messages, "rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
 def package_qa_check_useless_rpaths(file, name, d, elf, messages):
@@ -167,7 +142,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
 
     phdrs = elf.run_objdump("-p", d)
 
-    import re
+    import re, oe.qa
     rpath_re = re.compile(r"\s+RPATH\s+(.*)")
     for line in phdrs.split("\n"):
         m = rpath_re.match(line)
@@ -176,7 +151,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
+                oe.qa.add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -184,8 +159,9 @@ def package_qa_check_dev(path, name, d, elf, messages):
     Check for ".so" library symlinks in non-dev packages
     """
 
+    import oe.qa
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
+        oe.qa.add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
                  (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
@@ -195,8 +171,10 @@ def package_qa_check_dev_elf(path, name, d, elf, messages):
     check that the file is not a link and is an ELF object as some recipes
     install link-time .so files that are linker scripts.
     """
+
+    import oe.qa
     if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
-        package_qa_add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
+        oe.qa.add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
                  (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
@@ -208,8 +186,9 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
     libgcc.a, libgcov.a will be skipped in their packages
     """
 
+    import oe.qa
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
-        package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
+        oe.qa.add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[mime] = "package_qa_check_mime"
@@ -219,8 +198,9 @@ def package_qa_check_mime(path, name, d, elf, messages):
     while no inheriting mime.bbclass
     """
 
+    import oe.qa
     if d.getVar("datadir") + "/mime/packages" in path and path.endswith('.xml') and not bb.data.inherits_class("mime", d):
-        package_qa_add_message(messages, "mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
+        oe.qa.add_message(messages, "mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[mime-xdg] = "package_qa_check_mime_xdg"
@@ -230,6 +210,7 @@ def package_qa_check_mime_xdg(path, name, d, elf, messages):
     mime-types.bbclass to create /usr/share/applications/mimeinfo.cache
     """
 
+    import oe.qa
     if d.getVar("datadir") + "/applications" in path and path.endswith('.desktop') and not bb.data.inherits_class("mime-xdg", d):
         mime_type_found = False
         try:
@@ -247,9 +228,9 @@ def package_qa_check_mime_xdg(path, name, d, elf, messages):
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
@@ -258,7 +239,7 @@ def package_qa_check_libdir(d):
     recipes installing /lib/bar.so when ${base_libdir}="lib32" or
     installing in /usr/lib64 when ${libdir}="/usr/lib"
     """
-    import re
+    import re, oe.qa
 
     pkgdest = d.getVar('PKGDEST')
     base_libdir = d.getVar("base_libdir") + os.sep
@@ -313,7 +294,7 @@ def package_qa_check_libdir(d):
                             pass
 
     if messages:
-        package_qa_handle_error("libdir", "\n".join(messages), d)
+        oe.qa.handle_error("libdir", "\n".join(messages), d)
 
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
 def package_qa_check_dbg(path, name, d, elf, messages):
@@ -321,9 +302,10 @@ def package_qa_check_dbg(path, name, d, elf, messages):
     Check for ".debug" files or directories outside of the dbg package
     """
 
+    import oe.qa
     if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
-            package_qa_add_message(messages, "debug-files", "non debug package contains .debug directory: %s path %s" % \
+            oe.qa.add_message(messages, "debug-files", "non debug package contains .debug directory: %s path %s" % \
                      (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[arch] = "package_qa_check_arch"
@@ -331,7 +313,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
     """
     Check if archs are compatible
     """
-    import re, oe.elf
+    import re, oe.elf, oe.qa
 
     if not elf:
         return
@@ -343,7 +325,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     if target_arch == "allarch":
         pn = d.getVar('PN')
-        package_qa_add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
+        oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
         return
 
     # FIXME: Cross package confuse this check, so just skip them
@@ -366,13 +348,13 @@ def package_qa_check_arch(path,name,d, elf, messages):
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
@@ -380,12 +362,13 @@ def package_qa_check_desktop(path, name, d, elf, messages):
     """
     Run all desktop files through desktop-file-validate.
     """
+    import oe.qa
     if path.endswith(".desktop"):
         desktop_file_validate = os.path.join(d.getVar('STAGING_BINDIR_NATIVE'),'desktop-file-validate')
         output = os.popen("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
-            package_qa_add_message(messages, "desktop", "Desktop file issue: " + l.strip())
+            oe.qa.add_message(messages, "desktop", "Desktop file issue: " + l.strip())
 
 QAPATHTEST[textrel] = "package_qa_textrel"
 def package_qa_textrel(path, name, d, elf, messages):
@@ -402,7 +385,7 @@ def package_qa_textrel(path, name, d, elf, messages):
     phdrs = elf.run_objdump("-p", d)
     sane = True
 
-    import re
+    import re, oe.qa
     textrel_re = re.compile(r"\s+TEXTREL\s+")
     for line in phdrs.split("\n"):
         if textrel_re.match(line):
@@ -411,7 +394,7 @@ def package_qa_textrel(path, name, d, elf, messages):
 
     if not sane:
         path = package_qa_clean_path(path, d, name)
-        package_qa_add_message(messages, "textrel", "%s: ELF binary %s has relocations in .text" % (name, path))
+        oe.qa.add_message(messages, "textrel", "%s: ELF binary %s has relocations in .text" % (name, path))
 
 QAPATHTEST[ldflags] = "package_qa_hash_style"
 def package_qa_hash_style(path, name, d, elf, messages):
@@ -419,6 +402,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
     Check if the binary has the right hash style...
     """
 
+    import oe.qa
     if not elf:
         return
 
@@ -446,7 +430,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
             sane = True
     if has_syms and not sane:
         path = package_qa_clean_path(path, d, name)
-        package_qa_add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
+        oe.qa.add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
@@ -454,6 +438,8 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
     Check for build paths inside target files and error if not found in the whitelist
     """
+
+    import oe.qa
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
         return
@@ -467,7 +453,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
         file_content = f.read()
         if tmpdir in file_content:
             trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
-            package_qa_add_message(messages, "buildpaths", "File %s in package %s contains reference to TMPDIR" % (trimmed, name))
+            oe.qa.add_message(messages, "buildpaths", "File %s in package %s contains reference to TMPDIR" % (trimmed, name))
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
@@ -476,6 +462,7 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
     Check that all packages containing Xorg drivers have ABI dependencies
     """
 
+    import oe.qa
     # Skip dev, dbg or nativesdk packages
     if name.endswith("-dev") or name.endswith("-dbg") or name.startswith("nativesdk-"):
         return
@@ -486,30 +473,34 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
         for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS:' + name) or ""):
             if rdep.startswith("%sxorg-abi-" % mlprefix):
                 return
-        package_qa_add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
+        oe.qa.add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
 
 QAPATHTEST[infodir] = "package_qa_check_infodir"
 def package_qa_check_infodir(path, name, d, elf, messages):
     """
     Check that /usr/share/info/dir isn't shipped in a particular package
     """
+
+    import oe.qa
     infodir = d.expand("${infodir}/dir")
 
     if infodir in path:
-        package_qa_add_message(messages, "infodir", "The /usr/share/info/dir file is not meant to be shipped in a particular package.")
+        oe.qa.add_message(messages, "infodir", "The /usr/share/info/dir file is not meant to be shipped in a particular package.")
 
 QAPATHTEST[symlink-to-sysroot] = "package_qa_check_symlink_to_sysroot"
 def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
     """
     Check that the package doesn't contain any absolute symlinks to the sysroot.
     """
+
+    import oe.qa
     if os.path.islink(path):
         target = os.readlink(path)
         if os.path.isabs(target):
             tmpdir = d.getVar('TMPDIR')
             if target.startswith(tmpdir):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
-                package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
+                oe.qa.add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
@@ -517,6 +508,8 @@ python populate_lic_qa_checksum() {
     """
     Check for changes in the license files.
     """
+
+    import oe.qa
     sane = True
 
     lic_files = d.getVar('LIC_FILES_CHKSUM') or ''
@@ -527,7 +520,7 @@ python populate_lic_qa_checksum() {
         return
 
     if not lic_files and d.getVar('SRC_URI'):
-        sane &= package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
+        sane &= oe.qa.handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S')
     corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
@@ -535,11 +528,11 @@ python populate_lic_qa_checksum() {
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
+            sane &= oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
             continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
+            sane &= oe.qa.handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
             continue
 
         if (srclicfile == corebase_licensefile):
@@ -607,7 +600,7 @@ python populate_lic_qa_checksum() {
             else:
                 msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                 msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
-            sane &= package_qa_handle_error("license-checksum", msg, d)
+            sane &= oe.qa.handle_error("license-checksum", msg, d)
 
     if not sane:
         bb.fatal("Fatal QA errors found, failing task.")
@@ -622,6 +615,7 @@ def qa_check_staged(path,d):
     responsible for the errors easily even if we look at every .pc and .la file.
     """
 
+    import oe.qa
     sane = True
     tmpdir = d.getVar('TMPDIR')
     workdir = os.path.join(tmpdir, "work")
@@ -655,19 +649,20 @@ def qa_check_staged(path,d):
                     file_content = file_content.replace(recipesysroot, "")
                     if workdir in file_content:
                         error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
-                        sane &= package_qa_handle_error("la", error_msg, d)
+                        sane &= oe.qa.handle_error("la", error_msg, d)
             elif file.endswith(".pc") and not skip_pkgconfig:
                 with open(path) as f:
                     file_content = f.read()
                     file_content = file_content.replace(recipesysroot, "")
                     if pkgconfigcheck in file_content:
                         error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
-                        sane &= package_qa_handle_error("pkgconfig", error_msg, d)
+                        sane &= oe.qa.handle_error("pkgconfig", error_msg, d)
 
     return sane
 
 # Run all package-wide warnfuncs and errorfuncs
 def package_qa_package(warnfuncs, errorfuncs, package, d):
+    import oe.qa
     warnings = {}
     errors = {}
 
@@ -677,14 +672,15 @@ def package_qa_package(warnfuncs, errorfuncs, package, d):
         func(package, d, errors)
 
     for w in warnings:
-        package_qa_handle_error(w, warnings[w], d)
+        oe.qa.handle_error(w, warnings[w], d)
     for e in errors:
-        package_qa_handle_error(e, errors[e], d)
+        oe.qa.handle_error(e, errors[e], d)
 
     return len(errors) == 0
 
 # Run all recipe-wide warnfuncs and errorfuncs
 def package_qa_recipe(warnfuncs, errorfuncs, pn, d):
+    import oe.qa
     warnings = {}
     errors = {}
 
@@ -694,9 +690,9 @@ def package_qa_recipe(warnfuncs, errorfuncs, pn, d):
         func(pn, d, errors)
 
     for w in warnings:
-        package_qa_handle_error(w, warnings[w], d)
+        oe.qa.handle_error(w, warnings[w], d)
     for e in errors:
-        package_qa_handle_error(e, errors[e], d)
+        oe.qa.handle_error(e, errors[e], d)
 
     return len(errors) == 0
 
@@ -724,11 +720,13 @@ def package_qa_walk(warnfuncs, errorfuncs, package, d):
                 func(path, package, d, elf, errors)
 
     for w in warnings:
-        package_qa_handle_error(w, warnings[w], d)
+        oe.qa.handle_error(w, warnings[w], d)
     for e in errors:
-        package_qa_handle_error(e, errors[e], d)
+        oe.qa.handle_error(e, errors[e], d)
 
 def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
+    import oe.qa
+
     # Don't do this check for kernel/module recipes, there aren't too many debug/development
     # packages and you can get false positives e.g. on kernel-module-lirc-dev
     if bb.data.inherits_class("kernel", d) or bb.data.inherits_class("module-base", d):
@@ -746,10 +744,10 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
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
@@ -770,7 +768,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                         error_msg = "%s rdepends on %s, but it isn't a build dependency, missing %s in DEPENDS or PACKAGECONFIG?" % (pkg, rdepend, rdep_data['PN'])
                     else:
                         error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
-                    package_qa_handle_error("build-deps", error_msg, d)
+                    oe.qa.handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
             ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
@@ -823,10 +821,11 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 for key in filerdepends:
                     error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS:%s?" % \
                             (filerdepends[key].replace(":%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
-                    package_qa_handle_error("file-rdeps", error_msg, d)
+                    oe.qa.handle_error("file-rdeps", error_msg, d)
 package_qa_check_rdepends[vardepsexclude] = "OVERRIDES"
 
 def package_qa_check_deps(pkg, pkgdest, d):
+    import oe.qa
 
     localdata = bb.data.createCopy(d)
     localdata.setVar('OVERRIDES', pkg)
@@ -840,7 +839,7 @@ def package_qa_check_deps(pkg, pkgdest, d):
             for v in rvar[dep]:
                 if v and not v.startswith(('< ', '= ', '> ', '<= ', '>=')):
                     error_msg = "%s:%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, v)
-                    package_qa_handle_error("dep-cmp", error_msg, d)
+                    oe.qa.handle_error("dep-cmp", error_msg, d)
 
     check_valid_deps('RDEPENDS')
     check_valid_deps('RRECOMMENDS')
@@ -851,13 +850,15 @@ def package_qa_check_deps(pkg, pkgdest, d):
 
 QAPKGTEST[usrmerge] = "package_qa_check_usrmerge"
 def package_qa_check_usrmerge(pkg, d, messages):
+    import oe.qa
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
 
@@ -868,7 +869,7 @@ def package_qa_check_perllocalpod(pkg, d, messages):
     installed in a distribution package.  cpan.bbclass sets NO_PERLLOCAL=1 to
     handle this for most recipes.
     """
-    import glob
+    import glob, oe.qa
     pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
     podpath = oe.path.join(pkgd, d.getVar("libdir"), "perl*", "*", "*", "perllocal.pod")
 
@@ -876,7 +877,7 @@ def package_qa_check_perllocalpod(pkg, d, messages):
     if matches:
         matches = [package_qa_clean_path(path, d, pkg) for path in matches]
         msg = "%s contains perllocal.pod (%s), should not be installed" % (pkg, " ".join(matches))
-        package_qa_add_message(messages, "perllocalpod", msg)
+        oe.qa.add_message(messages, "perllocalpod", msg)
 
 QAPKGTEST[expanded-d] = "package_qa_check_expanded_d"
 def package_qa_check_expanded_d(package, d, messages):
@@ -884,6 +885,8 @@ def package_qa_check_expanded_d(package, d, messages):
     Check for the expanded D (${D}) value in pkg_* and FILES
     variables, warn the user to use it correctly.
     """
+    import oe.qa
+
     sane = True
     expanded_d = d.getVar('D')
 
@@ -891,10 +894,10 @@ def package_qa_check_expanded_d(package, d, messages):
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
 
@@ -903,6 +906,8 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
     """
     Check that all licenses for a package are among the licenses for the recipe.
     """
+    import oe.qa
+
     pkg_lics = d.getVar('LICENSE:' + package)
     if not pkg_lics:
         return True
@@ -912,13 +917,14 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
     if not unlisted:
         return True
 
-    package_qa_add_message(messages, "unlisted-pkg-lics",
+    oe.qa.add_message(messages, "unlisted-pkg-lics",
                            "LICENSE:%s includes licenses (%s) that are not "
                            "listed in LICENSE" % (package, ' '.join(unlisted)))
     return False
 
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
+        import oe.qa
         sane = True
         value = d.getVar(key)
         if value:
@@ -927,7 +933,7 @@ def package_qa_check_encoding(keys, encode, d):
             except UnicodeDecodeError as e:
                 error_msg = "%s has non %s characters" % (key,enc)
                 sane = False
-                package_qa_handle_error("invalid-chars", error_msg, d)
+                oe.qa.handle_error("invalid-chars", error_msg, d)
         return sane
 
     for key in keys:
@@ -941,6 +947,7 @@ HOST_USER_GID := "${@os.getgid()}"
 QAPATHTEST[host-user-contaminated] = "package_qa_check_host_user"
 def package_qa_check_host_user(path, name, d, elf, messages):
     """Check for paths outside of /home which are owned by the user running bitbake."""
+    import oe.qa
 
     if not os.path.lexists(path):
         return
@@ -960,28 +967,29 @@ def package_qa_check_host_user(path, name, d, elf, messages):
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
 
 QARECIPETEST[src-uri-bad] = "package_qa_check_src_uri"
 def package_qa_check_src_uri(pn, d, messages):
-    import re
+    import re, oe.qa
 
     if "${PN}" in d.getVar("SRC_URI", False):
-        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
+        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
     for url in d.getVar("SRC_URI").split():
         if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
-            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
+            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
 QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
 def package_qa_check_unhandled_features_check(pn, d, messages):
+    import oe.qa
     if not bb.data.inherits_class('features_check', d):
         var_set = False
         for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
@@ -989,15 +997,16 @@ def package_qa_check_unhandled_features_check(pn, d, messages):
                 if d.getVar(var) is not None or d.overridedata.get(var) is not None:
                     var_set = True
         if var_set:
-            package_qa_handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
+            oe.qa.handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
 QARECIPETEST[missing-update-alternatives] = "package_qa_check_missing_update_alternatives"
 def package_qa_check_missing_update_alternatives(pn, d, messages):
+    import oe.qa
     # Look at all packages and find out if any of those sets ALTERNATIVE variable
     # without inheriting update-alternatives class
     for pkg in (d.getVar('PACKAGES') or '').split():
         if d.getVar('ALTERNATIVE:%s' % pkg) and not bb.data.inherits_class('update-alternatives', d):
-            package_qa_handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE:%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
+            oe.qa.handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE:%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
 
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
@@ -1073,7 +1082,7 @@ python do_package_qa () {
         bb.note("Checking Package: %s" % package)
         # Check package name
         if not pkgname_pattern.match(package):
-            package_qa_handle_error("pkgname",
+            oe.qa.handle_error("pkgname",
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
         warn_checks, error_checks = parse_test_matrix("QAPATHTEST")
@@ -1126,7 +1135,7 @@ python do_qa_staging() {
 }
 
 python do_qa_patch() {
-    import subprocess
+    import subprocess, oe.qa
 
     ###########################################################################
     # Check patch.log for fuzz warnings
@@ -1170,11 +1179,11 @@ python do_qa_patch() {
             elif 'patch-fuzz' in d.getVar('WARN_QA'):
                 bb.warn(msg)
             msg = "Patch log indicates that patches do not apply cleanly."
-            package_qa_handle_error("patch-fuzz", msg, d)
+            oe.qa.handle_error("patch-fuzz", msg, d)
 }
 
 python do_qa_configure() {
-    import subprocess
+    import subprocess, oe.qa
 
     ###########################################################################
     # Check config.log for cross compile issues
@@ -1198,7 +1207,7 @@ python do_qa_configure() {
                 if subprocess.call(statement, shell=True) == 0:
                     error_msg = """This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
 Rerun configure task after fixing this."""
-                    package_qa_handle_error("configure-unsafe", error_msg, d)
+                    oe.qa.handle_error("configure-unsafe", error_msg, d)
 
             if "configure.ac" in files:
                 configs.append(os.path.join(root,"configure.ac"))
@@ -1228,7 +1237,7 @@ Rerun configure task after fixing this."""
                 gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
                 if subprocess.call(gnu, shell=True) == 0:
                     error_msg = "AM_GNU_GETTEXT used but no inherit gettext"
-                    package_qa_handle_error("configure-gettext", error_msg, d)
+                    oe.qa.handle_error("configure-gettext", error_msg, d)
 
     ###########################################################################
     # Check unrecognised configure options (with a white list)
@@ -1251,7 +1260,7 @@ Rerun configure task after fixing this."""
             if options:
                 pn = d.getVar('PN')
                 error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
-                package_qa_handle_error("unknown-configure-option", error_msg, d)
+                oe.qa.handle_error("unknown-configure-option", error_msg, d)
         except subprocess.CalledProcessError:
             pass
 
@@ -1263,7 +1272,7 @@ Rerun configure task after fixing this."""
             if pconfig not in pkgconfigflags:
                 pn = d.getVar('PN')
                 error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
-                package_qa_handle_error("invalid-packageconfig", error_msg, d)
+                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
     qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
@@ -1293,7 +1302,7 @@ do_configure[postfuncs] += "do_qa_configure "
 do_unpack[postfuncs] += "do_qa_unpack"
 
 python () {
-    import re
+    import re, oe.qa
     
     tests = d.getVar('ALL_QA').split()
     if "desktop" in tests:
@@ -1320,15 +1329,15 @@ python () {
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
@@ -1345,7 +1354,7 @@ python () {
     else:
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
-        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
+        oe.qa.handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE"), i), d)
 
     if 'native-last' not in (d.getVar('INSANE_SKIP') or "").split():
         for native_class in ['native', 'nativesdk']:
@@ -1373,7 +1382,7 @@ python () {
                     else:
                         break
                 if broken_order:
-                    package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
+                    oe.qa.handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
                                              "Classes inherited after native/nativesdk: %s" % (pn, " ".join(broken_order)), d)
 
 
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index e8a854a302..c198e3597c 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -171,6 +171,32 @@ def elf_machine_to_string(machine):
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
+        d.setVar("QA_SANE", False)
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
 if __name__ == "__main__":
     import sys
 
-- 
2.30.2


