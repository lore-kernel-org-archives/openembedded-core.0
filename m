Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7596E7028C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:25:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1PBXr024882
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:25:11 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 10 Jul 2014 18:25:11 -0700
Message-ID: <53BF3CF3.609@windriver.com>
Date: Fri, 11 Jul 2014 09:25:07 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1404869333.git.Chong.Lu@windriver.com>
	<b7aeaae2912f4cbaf11091a64c8c620574ec4e2d.1404869333.git.Chong.Lu@windriver.com>
In-Reply-To: <b7aeaae2912f4cbaf11091a64c8c620574ec4e2d.1404869333.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] classes/insane: Show QA check name
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
X-List-Received-Date: Fri, 11 Jul 2014 01:25:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 07/09/2014 09:39 AM, Chong Lu wrote:
> QA errors/warnings would show the name of the QA failure in the error/warning message.
> The format is listed:
>
> 	[The name of QA] QA Issue: messages
>
> You can see which QA check you need to disable if you want to disable it.
>
> [YOCTO #6160]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/classes/insane.bbclass | 66 ++++++++++++++++++++++-----------------------
>   1 file changed, 32 insertions(+), 34 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index c8fa711..5bb8115 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -154,24 +154,24 @@ def package_qa_clean_path(path,d):
>       """ Remove the common prefix from the path. In this case it is the TMPDIR"""
>       return path.replace(d.getVar('TMPDIR',True),"")
>   
> -def package_qa_write_error(error, d):
> +def package_qa_write_error(type, error, d):
>       logfile = d.getVar('QA_LOGFILE', True)
>       if logfile:
>           p = d.getVar('P', True)
>           f = file( logfile, "a+")
> -        print >> f, "%s: %s" % (p, error)
> +        print >> f, "%s: [%s] %s" % (p, type, error)
>           f.close()
>   
>   def package_qa_handle_error(error_class, error_msg, d):
> -    package_qa_write_error(error_msg, d)
> +    package_qa_write_error(error_class, error_msg, d)
>       if error_class in (d.getVar("ERROR_QA", True) or "").split():
> -        bb.error("QA Issue: %s" % error_msg)
> +        bb.error("[%s] QA Issue: %s" % (error_class, error_msg))
>           d.setVar("QA_SANE", False)
>           return False
>       elif error_class in (d.getVar("WARN_QA", True) or "").split():
> -        bb.warn("QA Issue: %s" % error_msg)
> +        bb.warn("[%s] QA Issue: %s" % (error_class, error_msg))
>       else:
> -        bb.note("QA Issue: %s" % error_msg)
> +        bb.note("[%s] QA Issue: %s" % (error_class, error_msg))
>       return True
>   
>   QAPATHTEST[libexec] = "package_qa_check_libexec"
> @@ -183,7 +183,7 @@ def package_qa_check_libexec(path,name, d, elf, messages):
>           return True
>   
>       if 'libexec' in path.split(os.path.sep):
> -        messages.append("%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
> +        messages["libexec"] = "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec)
>           return False
>   
>       return True
> @@ -211,7 +211,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
>               rpath = m.group(1)
>               for dir in bad_dirs:
>                   if dir in rpath:
> -                    messages.append("package %s contains bad RPATH %s in file %s" % (name, rpath, file))
> +                    messages["rpaths"] = "package %s contains bad RPATH %s in file %s" % (name, rpath, file)
>   
>   QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
>   def package_qa_check_useless_rpaths(file, name, d, elf, messages):
> @@ -241,7 +241,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
>               if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
>                   # The dynamic linker searches both these places anyway.  There is no point in
>                   # looking there again.
> -                messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
> +                messages["useless-rpaths"] = "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath)
>   
>   QAPATHTEST[dev-so] = "package_qa_check_dev"
>   def package_qa_check_dev(path, name, d, elf, messages):
> @@ -250,8 +250,8 @@ def package_qa_check_dev(path, name, d, elf, messages):
>       """
>   
>       if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
> -        messages.append("non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
> -                 (name, package_qa_clean_path(path,d)))
> +        messages["dev-so"] = "non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
> +                 (name, package_qa_clean_path(path,d))
>   
>   QAPATHTEST[staticdev] = "package_qa_check_staticdev"
>   def package_qa_check_staticdev(path, name, d, elf, messages):
> @@ -263,8 +263,8 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
>       """
>   
>       if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a"):
> -        messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
> -                 (name, package_qa_clean_path(path,d)))
> +        messages["staticdev"] = "non -staticdev package contains static .a library: %s path '%s'" % \
> +                 (name, package_qa_clean_path(path,d))
>   
>   def package_qa_check_libdir(d):
>       """
> @@ -318,8 +318,8 @@ def package_qa_check_dbg(path, name, d, elf, messages):
>   
>       if not "-dbg" in name and not "-ptest" in name:
>           if '.debug' in path.split(os.path.sep):
> -            messages.append("non debug package contains .debug directory: %s path %s" % \
> -                     (name, package_qa_clean_path(path,d)))
> +            messages["debug-files"] = "non debug package contains .debug directory: %s path %s" % \
> +                     (name, package_qa_clean_path(path,d))
>   
>   QAPATHTEST[perms] = "package_qa_check_perm"
>   def package_qa_check_perm(path,name,d, elf, messages):
> @@ -465,15 +465,15 @@ def package_qa_check_arch(path,name,d, elf, messages):
>       # Check the architecture and endiannes of the binary
>       if not ((machine == elf.machine()) or \
>           ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32"))):
> -        messages.append("Architecture did not match (%d to %d) on %s" % \
> -                 (machine, elf.machine(), package_qa_clean_path(path,d)))
> +        messages["arch"] = "Architecture did not match (%d to %d) on %s" % \
> +                 (machine, elf.machine(), package_qa_clean_path(path,d))
>       elif not ((bits == elf.abiSize()) or  \
>           ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32"))):
> -        messages.append("Bit size did not match (%d to %d) %s on %s" % \
> -                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
> +        messages["arch"] = "Bit size did not match (%d to %d) %s on %s" % \
> +                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d))
>       elif not littleendian == elf.isLittleEndian():
> -        messages.append("Endiannes did not match (%d to %d) on %s" % \
> -                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
> +        messages["arch"] = "Endiannes did not match (%d to %d) on %s" % \
> +                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d))
>   
>   QAPATHTEST[desktop] = "package_qa_check_desktop"
>   def package_qa_check_desktop(path, name, d, elf, messages):
> @@ -485,7 +485,7 @@ def package_qa_check_desktop(path, name, d, elf, messages):
>           output = os.popen("%s %s" % (desktop_file_validate, path))
>           # This only produces output on errors
>           for l in output:
> -            messages.append("Desktop file issue: " + l.strip())
> +            messages["desktop"] = "Desktop file issue: " + l.strip()
>   
>   QAPATHTEST[textrel] = "package_qa_textrel"
>   def package_qa_textrel(path, name, d, elf, messages):
> @@ -509,7 +509,7 @@ def package_qa_textrel(path, name, d, elf, messages):
>               sane = False
>   
>       if not sane:
> -        messages.append("ELF binary '%s' has relocations in .text" % path)
> +        messages["textrel"] = "ELF binary '%s' has relocations in .text" % path
>   
>   QAPATHTEST[ldflags] = "package_qa_hash_style"
>   def package_qa_hash_style(path, name, d, elf, messages):
> @@ -544,7 +544,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
>               sane = True
>   
>       if has_syms and not sane:
> -        messages.append("No GNU_HASH in the elf binary: '%s'" % path)
> +        messages["ldflags"] = "No GNU_HASH in the elf binary: '%s'" % path
>   
>   
>   QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
> @@ -564,7 +564,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
>       with open(path) as f:
>           file_content = f.read()
>           if tmpdir in file_content:
> -            messages.append("File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
> +            messages["buildpaths"] = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
>   
>   
>   QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
> @@ -583,7 +583,7 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
>           for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, True) or ""):
>               if rdep.startswith("%sxorg-abi-" % mlprefix):
>                   return
> -        messages.append("Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
> +        messages["xorg-driver-abi"] = "Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path))
>   
>   QAPATHTEST[infodir] = "package_qa_check_infodir"
>   def package_qa_check_infodir(path, name, d, elf, messages):
> @@ -593,7 +593,7 @@ def package_qa_check_infodir(path, name, d, elf, messages):
>       infodir = d.expand("${infodir}/dir")
>   
>       if infodir in path:
> -        messages.append("The /usr/share/info/dir file is not meant to be shipped in a particular package.")
> +        messages["infodir"] = "The /usr/share/info/dir file is not meant to be shipped in a particular package."
>   
>   QAPATHTEST[symlink-to-sysroot] = "package_qa_check_symlink_to_sysroot"
>   def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
> @@ -606,7 +606,7 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
>               tmpdir = d.getVar('TMPDIR', True)
>               if target.startswith(tmpdir):
>                   trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
> -                messages.append("Symlink %s in %s points to TMPDIR" % (trimmed, name))
> +                messages["symlink-to-sysroot"] = "Symlink %s in %s points to TMPDIR" % (trimmed, name)
>   
>   def package_qa_check_license(workdir, d):
>       """
> @@ -738,8 +738,8 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
>       target_os   = d.getVar('TARGET_OS', True)
>       target_arch = d.getVar('TARGET_ARCH', True)
>   
> -    warnings = []
> -    errors = []
> +    warnings = {}
> +    errors = {}
>       for path in pkgfiles[package]:
>               elf = oe.qa.ELFFile(path)
>               try:
> @@ -752,11 +752,9 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
>                   func(path, package, d, elf, errors)
>   
>       for w in warnings:
> -        bb.warn("QA Issue: %s" % w)
> -        package_qa_write_error(w, d)
> +        package_qa_handle_error(w, warnings[w], d)
>       for e in errors:
> -        bb.error("QA Issue: %s" % e)
> -        package_qa_write_error(e, d)
> +        package_qa_handle_error(e, errors[e], d)
>   
>       return len(errors) == 0
>   


