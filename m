Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1A9C636E0
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 16:15:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.436.1724861694509390359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 09:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S0LivZiY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42816ca797fso62743175e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724861692; x=1725466492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRAKajLJgRyzKgcJTo4NsV6ob4+eG4IT8/0vP4jfst8=;
        b=S0LivZiY7n6vMHJ/yoH+l1r0UNCqQiWRrAGtGLpBVTyWU1G9CBJ2e3klvwYfhah/BW
         MuVvGl65n6/VJC7dUDNu9kyEFZTxhZyV5Kjp40kht8Tp5tAO1ajhjdszhAtNnsjKSBpu
         UKweVxDJd8NBmZ+HATTR9HOmUaMrsEO1BhnOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724861692; x=1725466492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRAKajLJgRyzKgcJTo4NsV6ob4+eG4IT8/0vP4jfst8=;
        b=gdonoRnUSsEwgxoRYuIz6Z/wcdeR8BMK2LSCHAMH674Fm46KPfqizZnWrpFUMDV3la
         CiLTqy0ihA8nQG3KO/Avc01wFQYgZ/NZk6ldRl6eTzVbgVgcGfaUZ7gc/9BS2SKS40tM
         TtD+wieJLU1Khtfjx83yY86bqpodEDZMASXWm51G2RDEnu9s0lrRfnjIvapzTK92tlxH
         Kh+fNuLE45s4yvOvmDSDuZJOzdIVaZ5fqONvW12D6jYzDXiG4HBtKwVtm9cjMWMTVfiu
         HYwIfEyLYGrbwbMZS3fTG/M9e75ku2nEDIXNHf5Xj3C0ERkDk0Oqcr/y+SdBD0y7rGmv
         ur/w==
X-Gm-Message-State: AOJu0YzRNo6YlNGcy+Zvw1RJcxcNbf2maCoEetAhV9SBARWZQxQcyldn
	/c54NeupIX52sedB/FSCAFpVS0cHXkAkyqgBVuj6VN1lKNSbLBfWHaDFnrscPWvi4o8UvxruOi+
	v
X-Google-Smtp-Source: AGHT+IGGscj1dFMqGF8sAET77Zwu4SjeUsw5qaKdhUjui5ZpLUF2BkAXzE9MOJho475LXle6tX1kEQ==
X-Received: by 2002:a05:600c:310b:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-42bb01f45cemr1733365e9.32.1724861691922;
        Wed, 28 Aug 2024 09:14:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749b3605b0sm153417f8f.102.2024.08.28.09.14.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 09:14:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Drop oe.qa.add_message usage
Date: Wed, 28 Aug 2024 17:14:50 +0100
Message-ID: <20240828161450.1488792-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 16:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203883

Drop the oe.qa.add_message() usage in favour of oe.qa.handle_error() which has
code allowing it to be optimised with contains usage.

The patch also drops unused return values which we stopped using a while ago
and drops the now unneeded function parameters, generally leading to cleaner
code.

The code should be functionally equivalent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 219 +++++++++++------------------
 meta/lib/oe/qa.py                  |   6 -
 2 files changed, 84 insertions(+), 141 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index a008f21c6ee..3094197804e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -83,7 +83,7 @@ def package_qa_clean_path(path, d, pkg=None):
     return path.replace(d.getVar("TMPDIR"), "/").replace("//", "/")
 
 QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
-def package_qa_check_shebang_size(path, name, d, elf, messages):
+def package_qa_check_shebang_size(path, name, d, elf):
     import stat
     if os.path.islink(path) or stat.S_ISFIFO(os.stat(path).st_mode) or elf:
         return
@@ -102,25 +102,23 @@ def package_qa_check_shebang_size(path, name, d, elf, messages):
             return
 
         if len(stanza) > 129:
-            oe.qa.add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d, name)))
+            oe.qa.handle_error("shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d, name)), d)
             return
 
 QAPATHTEST[libexec] = "package_qa_check_libexec"
-def package_qa_check_libexec(path,name, d, elf, messages):
+def package_qa_check_libexec(path,name, d, elf):
 
     # Skip the case where the default is explicitly /usr/libexec
     libexec = d.getVar('libexecdir')
     if libexec == "/usr/libexec":
-        return True
+        return
 
     if 'libexec' in path.split(os.path.sep):
-        oe.qa.add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d, name), libexec))
-        return False
-
-    return True
+        oe.qa.handle_error("libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d, name), libexec), d)
+        return
 
 QAPATHTEST[rpaths] = "package_qa_check_rpath"
-def package_qa_check_rpath(file,name, d, elf, messages):
+def package_qa_check_rpath(file,name, d, elf):
     """
     Check for dangerous RPATHs
     """
@@ -142,10 +140,10 @@ def package_qa_check_rpath(file,name, d, elf, messages):
             rpath = m.group(1)
             for dir in bad_dirs:
                 if dir in rpath:
-                    oe.qa.add_message(messages, "rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file))
+                    oe.qa.handle_error("rpaths", "package %s contains bad RPATH %s in file %s" % (name, rpath, file), d)
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
-def package_qa_check_useless_rpaths(file, name, d, elf, messages):
+def package_qa_check_useless_rpaths(file, name, d, elf):
     """
     Check for RPATHs that are useless but not dangerous
     """
@@ -172,31 +170,31 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                oe.qa.add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
+                oe.qa.handle_error("useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath), d)
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
-def package_qa_check_dev(path, name, d, elf, messages):
+def package_qa_check_dev(path, name, d, elf):
     """
     Check for ".so" library symlinks in non-dev packages
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        oe.qa.add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
-                 (name, package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)), d)
 
 QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
-def package_qa_check_dev_elf(path, name, d, elf, messages):
+def package_qa_check_dev_elf(path, name, d, elf):
     """
     Check that -dev doesn't contain real shared libraries.  The test has to
     check that the file is not a link and is an ELF object as some recipes
     install link-time .so files that are linker scripts.
     """
     if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
-        oe.qa.add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
-                 (name, package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)), d)
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
-def package_qa_check_staticdev(path, name, d, elf, messages):
+def package_qa_check_staticdev(path, name, d, elf):
     """
     Check for ".a" library in non-staticdev packages
     There are a number of exceptions to this rule, -pic packages can contain
@@ -205,22 +203,22 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
-        oe.qa.add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)), d)
 
 QAPATHTEST[mime] = "package_qa_check_mime"
-def package_qa_check_mime(path, name, d, elf, messages):
+def package_qa_check_mime(path, name, d, elf):
     """
     Check if package installs mime types to /usr/share/mime/packages
     while no inheriting mime.bbclass
     """
 
     if d.getVar("datadir") + "/mime/packages" in path and path.endswith('.xml') and not bb.data.inherits_class("mime", d):
-        oe.qa.add_message(messages, "mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
-                 (name, package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)), d)
 
 QAPATHTEST[mime-xdg] = "package_qa_check_mime_xdg"
-def package_qa_check_mime_xdg(path, name, d, elf, messages):
+def package_qa_check_mime_xdg(path, name, d, elf):
     """
     Check if package installs desktop file containing MimeType and requires
     mime-types.bbclass to create /usr/share/applications/mimeinfo.cache
@@ -243,10 +241,10 @@ def package_qa_check_mime_xdg(path, name, d, elf, messages):
             if name == d.getVar('PN'):
                 pkgname = '${PN}'
             wstr += "If yes: add \'inhert mime-xdg\' and \'MIME_XDG_PACKAGES += \"%s\"\' / if no add \'INSANE_SKIP:%s += \"mime-xdg\"\' to recipe." % (pkgname, pkgname)
-            oe.qa.add_message(messages, "mime-xdg", wstr)
+            oe.qa.handle_error("mime-xdg", wstr, d)
         if mime_type_found:
-            oe.qa.add_message(messages, "mime-xdg", "%s: contains desktop file with key 'MimeType' but does not inhert mime-xdg: %s" % \
-                    (name, package_qa_clean_path(path, d, name)))
+            oe.qa.handle_error("mime-xdg", "%s: contains desktop file with key 'MimeType' but does not inhert mime-xdg: %s" % \
+                    (name, package_qa_clean_path(path, d, name)), d)
 
 def package_qa_check_libdir(d):
     """
@@ -312,18 +310,18 @@ def package_qa_check_libdir(d):
         oe.qa.handle_error("libdir", "\n".join(messages), d)
 
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
-def package_qa_check_dbg(path, name, d, elf, messages):
+def package_qa_check_dbg(path, name, d, elf):
     """
     Check for ".debug" files or directories outside of the dbg package
     """
 
     if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
-            oe.qa.add_message(messages, "debug-files", "%s: non debug package contains .debug directory %s" % \
-                     (name, package_qa_clean_path(path, d, name)))
+            oe.qa.handle_error("debug-files", "%s: non debug package contains .debug directory %s" % \
+                     (name, package_qa_clean_path(path, d, name)), d)
 
 QAPATHTEST[arch] = "package_qa_check_arch"
-def package_qa_check_arch(path,name,d, elf, messages):
+def package_qa_check_arch(path,name,d, elf):
     """
     Check if archs are compatible
     """
@@ -339,7 +337,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     if host_arch == "allarch":
         pn = d.getVar('PN')
-        oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
+        oe.qa.handle_error("arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries", d)
         return
 
     # avoid following links to /usr/bin (e.g. on udev builds)
@@ -357,17 +355,17 @@ def package_qa_check_arch(path,name,d, elf, messages):
             host_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
     is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
     if not ((machine == elf.machine()) or is_32 or is_bpf):
-        oe.qa.add_message(messages, "arch", "Architecture did not match (%s, expected %s) in %s" % \
-                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("arch", "Architecture did not match (%s, expected %s) in %s" % \
+                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path, d, name)), d)
     elif not ((bits == elf.abiSize()) or is_32 or is_bpf):
-        oe.qa.add_message(messages, "arch", "Bit size did not match (%d, expected %d) in %s" % \
-                 (elf.abiSize(), bits, package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("arch", "Bit size did not match (%d, expected %d) in %s" % \
+                 (elf.abiSize(), bits, package_qa_clean_path(path, d, name)), d)
     elif not ((littleendian == elf.isLittleEndian()) or is_bpf):
-        oe.qa.add_message(messages, "arch", "Endiannes did not match (%d, expected %d) in %s" % \
-                 (elf.isLittleEndian(), littleendian, package_qa_clean_path(path, d, name)))
+        oe.qa.handle_error("arch", "Endiannes did not match (%d, expected %d) in %s" % \
+                 (elf.isLittleEndian(), littleendian, package_qa_clean_path(path, d, name)), d)
 
 QAPATHTEST[desktop] = "package_qa_check_desktop"
-def package_qa_check_desktop(path, name, d, elf, messages):
+def package_qa_check_desktop(path, name, d, elf):
     """
     Run all desktop files through desktop-file-validate.
     """
@@ -376,10 +374,10 @@ def package_qa_check_desktop(path, name, d, elf, messages):
         output = os.popen("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
-            oe.qa.add_message(messages, "desktop", "Desktop file issue: " + l.strip())
+            oe.qa.handle_error("desktop", "Desktop file issue: " + l.strip(), d)
 
 QAPATHTEST[textrel] = "package_qa_textrel"
-def package_qa_textrel(path, name, d, elf, messages):
+def package_qa_textrel(path, name, d, elf):
     """
     Check if the binary contains relocations in .text
     """
@@ -391,21 +389,17 @@ def package_qa_textrel(path, name, d, elf, messages):
         return
 
     phdrs = elf.run_objdump("-p", d)
-    sane = True
 
     import re
     textrel_re = re.compile(r"\s+TEXTREL\s+")
     for line in phdrs.split("\n"):
         if textrel_re.match(line):
-            sane = False
-            break
-
-    if not sane:
-        path = package_qa_clean_path(path, d, name)
-        oe.qa.add_message(messages, "textrel", "%s: ELF binary %s has relocations in .text" % (name, path))
+            path = package_qa_clean_path(path, d, name)
+            oe.qa.handle_error("textrel", "%s: ELF binary %s has relocations in .text" % (name, path), d)
+            return
 
 QAPATHTEST[ldflags] = "package_qa_hash_style"
-def package_qa_hash_style(path, name, d, elf, messages):
+def package_qa_hash_style(path, name, d, elf):
     """
     Check if the binary has the right hash style...
     """
@@ -437,11 +431,11 @@ def package_qa_hash_style(path, name, d, elf, messages):
             sane = True
     if has_syms and not sane:
         path = package_qa_clean_path(path, d, name)
-        oe.qa.add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
+        oe.qa.handle_error("ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name), d)
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
-def package_qa_check_buildpaths(path, name, d, elf, messages):
+def package_qa_check_buildpaths(path, name, d, elf):
     """
     Check for build paths inside target files and error if paths are not
     explicitly ignored.
@@ -458,11 +452,11 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
         file_content = f.read()
         if tmpdir in file_content:
             path = package_qa_clean_path(path, d, name)
-            oe.qa.add_message(messages, "buildpaths", "File %s in package %s contains reference to TMPDIR" % (path, name))
+            oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to TMPDIR" % (path, name), d)
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
-def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
+def package_qa_check_xorg_driver_abi(path, name, d, elf):
     """
     Check that all packages containing Xorg drivers have ABI dependencies
     """
@@ -477,20 +471,20 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
         for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS:' + name) or ""):
             if rdep.startswith("%sxorg-abi-" % mlprefix):
                 return
-        oe.qa.add_message(messages, "xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
+        oe.qa.handle_error("xorg-driver-abi", "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)), d)
 
 QAPATHTEST[infodir] = "package_qa_check_infodir"
-def package_qa_check_infodir(path, name, d, elf, messages):
+def package_qa_check_infodir(path, name, d, elf):
     """
     Check that /usr/share/info/dir isn't shipped in a particular package
     """
     infodir = d.expand("${infodir}/dir")
 
     if infodir in path:
-        oe.qa.add_message(messages, "infodir", "The %s file is not meant to be shipped in a particular package." % infodir)
+        oe.qa.handle_error("infodir", "The %s file is not meant to be shipped in a particular package." % infodir, d)
 
 QAPATHTEST[symlink-to-sysroot] = "package_qa_check_symlink_to_sysroot"
-def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
+def package_qa_check_symlink_to_sysroot(path, name, d, elf):
     """
     Check that the package doesn't contain any absolute symlinks to the sysroot.
     """
@@ -500,10 +494,10 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
             tmpdir = d.getVar('TMPDIR')
             if target.startswith(tmpdir):
                 path = package_qa_clean_path(path, d, name)
-                oe.qa.add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (path, name))
+                oe.qa.handle_error("symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (path, name), d)
 
 QAPATHTEST[32bit-time] = "check_32bit_symbols"
-def check_32bit_symbols(path, packagename, d, elf, messages):
+def check_32bit_symbols(path, packagename, d, elf):
     """
     Check that ELF files do not use any 32 bit time APIs from glibc.
     """
@@ -622,11 +616,8 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
             if not allowed:
                 msgformat = elfpath + " uses 32-bit api '%s'"
                 for sym in usedapis:
-                    oe.qa.add_message(messages, '32bit-time', msgformat % sym)
-                oe.qa.add_message(
-                    messages, '32bit-time',
-                    'Suppress with INSANE_SKIP = "32bit-time"'
-                )
+                    oe.qa.handle_error('32bit-time', msgformat % sym, d)
+                oe.qa.handle_error('32bit-time', 'Suppress with INSANE_SKIP = "32bit-time"', d)
 
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
@@ -787,53 +778,23 @@ def qa_check_staged(path,d):
                         oe.qa.handle_error("pkgconfig", error_msg, d)
 
             if not skip_shebang_size:
-                errors = {}
                 package_qa_check_shebang_size(path, "", d, None, errors)
-                if "shebang-size" in errors:
-                    oe.qa.handle_error("shebang-size", errors["shebang-size"], d)
 
-# Run all package-wide warnfuncs and errorfuncs
-def package_qa_package(warnfuncs, errorfuncs, package, d):
-    warnings = {}
-    errors = {}
-
-    for func in warnfuncs:
-        func(package, d, warnings)
-    for func in errorfuncs:
-        func(package, d, errors)
 
-    for w in warnings:
-        oe.qa.handle_error(w, warnings[w], d)
-    for e in errors:
-        oe.qa.handle_error(e, errors[e], d)
-
-    return len(errors) == 0
 
 # Run all recipe-wide warnfuncs and errorfuncs
 def package_qa_recipe(warnfuncs, errorfuncs, pn, d):
-    warnings = {}
-    errors = {}
-
     for func in warnfuncs:
         func(pn, d, warnings)
     for func in errorfuncs:
         func(pn, d, errors)
 
-    for w in warnings:
-        oe.qa.handle_error(w, warnings[w], d)
-    for e in errors:
-        oe.qa.handle_error(e, errors[e], d)
-
-    return len(errors) == 0
-
 def prepopulate_objdump_p(elf, d):
     output = elf.run_objdump("-p", d)
     return (elf.name, output)
 
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, package, d):
-    warnings = {}
-    errors = {}
     elves = {}
     for path in pkgfiles[package]:
             elf = None
@@ -855,17 +816,12 @@ def package_qa_walk(warnfuncs, errorfuncs, package, d):
             if path in elves:
                 elves[path].open()
             for func in warnfuncs:
-                func(path, package, d, elves.get(path), warnings)
+                func(path, package, d, elves.get(path))
             for func in errorfuncs:
-                func(path, package, d, elves.get(path), errors)
+                func(path, package, d, elves.get(path))
             if path in elves:
                 elves[path].close()
 
-    for w in warnings:
-        oe.qa.handle_error(w, warnings[w], d)
-    for e in errors:
-        oe.qa.handle_error(e, errors[e], d)
-
 def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
     # Don't do this check for kernel/module recipes, there aren't too many debug/development
     # packages and you can get false positives e.g. on kernel-module-lirc-dev
@@ -986,7 +942,7 @@ def package_qa_check_deps(pkg, pkgdest, d):
     check_valid_deps('RCONFLICTS')
 
 QAPKGTEST[usrmerge] = "package_qa_check_usrmerge"
-def package_qa_check_usrmerge(pkg, d, messages):
+def package_qa_check_usrmerge(pkg, d):
 
     pkgdest = d.getVar('PKGDEST')
     pkg_dir = pkgdest + os.sep + pkg + os.sep
@@ -994,12 +950,12 @@ def package_qa_check_usrmerge(pkg, d, messages):
     for f in merged_dirs:
         if os.path.exists(pkg_dir + f) and not os.path.islink(pkg_dir + f):
             msg = "%s package is not obeying usrmerge distro feature. /%s should be relocated to /usr." % (pkg, f)
-            oe.qa.add_message(messages, "usrmerge", msg)
-            return False
-    return True
+            oe.qa.handle_error("usrmerge", msg, d)
+            return
+    return
 
 QAPKGTEST[perllocalpod] = "package_qa_check_perllocalpod"
-def package_qa_check_perllocalpod(pkg, d, messages):
+def package_qa_check_perllocalpod(pkg, d):
     """
     Check that the recipe didn't ship a perlocal.pod file, which shouldn't be
     installed in a distribution package.  cpan.bbclass sets NO_PERLLOCAL=1 to
@@ -1013,54 +969,47 @@ def package_qa_check_perllocalpod(pkg, d, messages):
     if matches:
         matches = [package_qa_clean_path(path, d, pkg) for path in matches]
         msg = "%s contains perllocal.pod (%s), should not be installed" % (pkg, " ".join(matches))
-        oe.qa.add_message(messages, "perllocalpod", msg)
+        oe.qa.handle_error("perllocalpod", msg, d)
 
 QAPKGTEST[expanded-d] = "package_qa_check_expanded_d"
-def package_qa_check_expanded_d(package, d, messages):
+def package_qa_check_expanded_d(package, d):
     """
     Check for the expanded D (${D}) value in pkg_* and FILES
     variables, warn the user to use it correctly.
     """
-    sane = True
     expanded_d = d.getVar('D')
 
     for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
         bbvar = d.getVar(var + ":" + package) or ""
         if expanded_d in bbvar:
             if var == 'FILES':
-                oe.qa.add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % package)
-                sane = False
+                oe.qa.handle_error("expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % package, d)
             else:
-                oe.qa.add_message(messages, "expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, package))
-                sane = False
-    return sane
+                oe.qa.handle_error("expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, package), d)
 
 QAPKGTEST[unlisted-pkg-lics] = "package_qa_check_unlisted_pkg_lics"
-def package_qa_check_unlisted_pkg_lics(package, d, messages):
+def package_qa_check_unlisted_pkg_lics(package, d):
     """
     Check that all licenses for a package are among the licenses for the recipe.
     """
     pkg_lics = d.getVar('LICENSE:' + package)
     if not pkg_lics:
-        return True
+        return
 
     recipe_lics_set = oe.license.list_licenses(d.getVar('LICENSE'))
     package_lics = oe.license.list_licenses(pkg_lics)
     unlisted = package_lics - recipe_lics_set
     if unlisted:
-        oe.qa.add_message(messages, "unlisted-pkg-lics",
+        oe.qa.handle_error("unlisted-pkg-lics",
                                "LICENSE:%s includes licenses (%s) that are not "
-                               "listed in LICENSE" % (package, ' '.join(unlisted)))
-        return False
+                               "listed in LICENSE" % (package, ' '.join(unlisted)), d)
     obsolete = set(oe.license.obsolete_license_list()) & package_lics - recipe_lics_set
     if obsolete:
-        oe.qa.add_message(messages, "obsolete-license",
-                               "LICENSE:%s includes obsolete licenses %s" % (package, ' '.join(obsolete)))
-        return False
-    return True
+        oe.qa.handle_error(messages, "obsolete-license",
+                               "LICENSE:%s includes obsolete licenses %s" % (package, ' '.join(obsolete)), d)
 
 QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
-def package_qa_check_empty_dirs(pkg, d, messages):
+def package_qa_check_empty_dirs(pkg, d):
     """
     Check for the existence of files in directories that are expected to be
     empty.
@@ -1073,7 +1022,7 @@ def package_qa_check_empty_dirs(pkg, d, messages):
             recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
                               "but it is expected to be empty")
             msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
-            oe.qa.add_message(messages, "empty-dirs", msg)
+            oe.qa.handle_error("empty-dirs", msg, d)
 
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
@@ -1097,7 +1046,7 @@ HOST_USER_UID := "${@os.getuid()}"
 HOST_USER_GID := "${@os.getgid()}"
 
 QAPATHTEST[host-user-contaminated] = "package_qa_check_host_user"
-def package_qa_check_host_user(path, name, d, elf, messages):
+def package_qa_check_host_user(path, name, d, elf):
     """Check for paths outside of /home which are owned by the user running bitbake."""
 
     if not os.path.lexists(path):
@@ -1118,17 +1067,14 @@ def package_qa_check_host_user(path, name, d, elf, messages):
     else:
         check_uid = int(d.getVar('HOST_USER_UID'))
         if stat.st_uid == check_uid:
-            oe.qa.add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid))
-            return False
+            oe.qa.handle_error("host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid), d)
 
         check_gid = int(d.getVar('HOST_USER_GID'))
         if stat.st_gid == check_gid:
-            oe.qa.add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid))
-            return False
-    return True
+            oe.qa.handle_error("host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid), d)
 
 QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
-def package_qa_check_unhandled_features_check(pn, d, messages):
+def package_qa_check_unhandled_features_check(pn, d):
     if not bb.data.inherits_class('features_check', d):
         var_set = False
         for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
@@ -1139,7 +1085,7 @@ def package_qa_check_unhandled_features_check(pn, d, messages):
             oe.qa.handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
 QARECIPETEST[missing-update-alternatives] = "package_qa_check_missing_update_alternatives"
-def package_qa_check_missing_update_alternatives(pn, d, messages):
+def package_qa_check_missing_update_alternatives(pn, d):
     # Look at all packages and find out if any of those sets ALTERNATIVE variable
     # without inheriting update-alternatives class
     for pkg in (d.getVar('PACKAGES') or '').split():
@@ -1235,7 +1181,10 @@ python do_package_qa () {
         package_qa_walk(warn_checks, error_checks, package, d)
 
         warn_checks, error_checks = parse_test_matrix("QAPKGTEST")
-        package_qa_package(warn_checks, error_checks, package, d)
+        for func in warn_checks:
+            func(package, d)
+        for func in error_checks:
+            func(package, d)
 
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, d)
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 2c558673701..d8834d4d13a 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -210,12 +210,6 @@ else:
     self.execs.add(name)
 """
 
-def add_message(messages, section, new_msg):
-    if section not in messages:
-        messages[section] = new_msg
-    else:
-        messages[section] = messages[section] + "\n" + new_msg
-
 def exit_with_message_if_errors(message, d):
     qa_fatal_errors = bb.utils.to_boolean(d.getVar("QA_ERRORS_FOUND"), False)
     if qa_fatal_errors:

