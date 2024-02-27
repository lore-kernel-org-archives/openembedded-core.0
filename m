Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9400C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 09:31:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.8848.1709026262343617681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 01:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IuJ6WI+f;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so5602046e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709026260; x=1709631060; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9nM/ggpqmpU39eVsszmIyw1qk+U7FkIDhiIrCfn8i2U=;
        b=IuJ6WI+fO3XPnAV0fG06ACXwlCRBGr68+mGPXdsUOrbyqRYTcRpVsqkeCHwrGF2f2i
         kUMfeWLR++QBb5/zZ368YolVlxSP7qbiPaQgEbvyd/UVxFHgyW+9i8NGT/6gSPidkU8+
         UUQquUelmxoyvzE+AUCYdyNvEvk1lf/0j+ri0PvAQVbImTz9mkg6TpSx5yW3g9xpEiyd
         zax5FblZ87AlZyM41iVHyOyvxre3gMDtaIu7tWiLryEI88tizNrWQsRKMc8hZNCf5hEg
         ZGDnYlwRaAxMYw7H+XQ4Sl0fNUuMSnzeIq1+RcT/shuBCyDb0ZhyBQf7r+ZPBNQcX7l5
         aOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026260; x=1709631060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nM/ggpqmpU39eVsszmIyw1qk+U7FkIDhiIrCfn8i2U=;
        b=Y1W0zdA1uXdUwtuZ5P1LqD+NUtDoHdxKDyDCNknQVdsAkuD97Db4YmFRoIovrnHRyg
         s104cNP+nR/9kKrtJAz2GZd7nF0xhD2oCoD5UVvIoBLwc1VHzcRqtP70++HWRgQge9zi
         ZUx0/E16Cgc6cnpLeig9w4joYGHq+MCYcWfWdhObTTnRWhbajkz0RbNj2KxfQR4/B9iI
         BgcPRotuV4oV0gKFZiWClEezIEv58Jt4Xq3BH09FgYd3DzOSs33I9E5MzNcf23tIiGXT
         bM4n9bHYQ6qCe495C2mtcTWlPNSjyESJgqObDtFsX6B2ge62bVDueFzvthAu5lax2loo
         Y+4w==
X-Gm-Message-State: AOJu0YyDoAPS46bgTYlaZLeEfDZeyiTqGszn1iGrtLZGAYk4ETRQRA8m
	SjEy249i6oEvK2LaqxvQSyGGKfJ6+hiB0Nch9levWXhhqygit3kTBx70ehchyRyeSaPtK+3DGlh
	rj6pYLz3pI3UxPodr+99r7/XtGxM=
X-Google-Smtp-Source: AGHT+IGeQZSXqLTjBZhdd0UtUbX2pbZfjB0YAV6xF87ayZX0+uTK+Mtk6yU4WCFJpyOH0DrJorOFmxjk3XdejOaDbjA=
X-Received: by 2002:ac2:4c36:0:b0:512:ae9b:559 with SMTP id
 u22-20020ac24c36000000b00512ae9b0559mr5036080lfq.34.1709026260035; Tue, 27
 Feb 2024 01:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com> <20240226144040.2007482-2-lukas.funke-oss@weidmueller.com>
In-Reply-To: <20240226144040.2007482-2-lukas.funke-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Feb 2024 10:30:48 +0100
Message-ID: <CANNYZj8NQUg0vgXTx=yZGDgOmrK+RfC8si4SyZoaupJ9xA7_cQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] classes: go-vendor: improve handling of go vendoring
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Vyacheslav Yurkov <uvv.mail@gmail.com>, Lukas Funke <lukas.funke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196247

We are in a feature freeze now.

This is a lot of new code, and it looks like it needs tests. Can you
add those, or maybe tweak existing tests?

Alex

On Mon, 26 Feb 2024 at 15:40, Lukas Funke
<lukas.funke-oss@weidmueller.com> wrote:
>
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> This commit deals with some specialties around go:
>
>  - Enable the use of //go:embed directives:
>      Using this directive it is possible to include additional sournce
>      files into your go source-code. Since these are no listed in the
>      vendor manifest, we have to check for the pattern in the actual
>      source code
>
>  - Do not vendor //go:build ignore files
>      Do not vendor source files which should be ignored during the build
>
> In addition to the changes above the behaviour of the vendoring folder
> is changed: the vendor folder is not linked any longer into the source
> directory, the files are rather copied directly into the projects
> vendor folder. Because the link was removed before packaging, yocto was
> unable to copie the listed licenses
>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/classes/go-vendor.bbclass | 324 ++++++++++++++++++++++++---------
>  1 file changed, 240 insertions(+), 84 deletions(-)
>
> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
> index 1bbb99ac79..d4a7d7c224 100644
> --- a/meta/classes/go-vendor.bbclass
> +++ b/meta/classes/go-vendor.bbclass
> @@ -40,18 +40,159 @@ def go_src_uri(repo, version, path=None, subdir=None, \
>
>      return src_uri
>
> -python do_vendor_unlink() {
> -    go_import = d.getVar('GO_IMPORT')
> -    source_dir = d.getVar('S')
> -    linkname = os.path.join(source_dir, *['src', go_import, 'vendor'])
>
> -    os.unlink(linkname)
> -}
> +def read_vendor_manifest(fname):
> +    vendoredModulePaths = dict()
> +    replacedPaths = dict()
> +
> +    with open(fname) as _file:
> +        content = _file.readlines()
> +        modPath = ""
> +        version = ""
> +        for line in content:
> +            # Modules starts with a single hash tag
> +            # followed by the modules path
> +            if line.startswith("# ", 0, 2):
> +                t = line[2:].strip()
> +                if "=>" in t:
> +                    lhs, rhs = t.split("=>")
> +
> +                    # This module has been replaced, use a local path
> +                    # we parse the line that has a pattern "# module-name [module-version] => local-path
> +                    lhs = lhs.strip().split()
> +                    rhs = rhs.strip().split()
> +
> +                    # Check for version replacement
> +                    # "# module versionABC => module versionXZY"
> +                    if len(lhs) == 2 and len(rhs) == 2:
> +                        lhsModPath = lhs[0]
> +                        rhsModPath = rhs[0]
> +                        if lhsModPath == rhsModPath:
> +                            modPath = lhsModPath
> +                            version = rhs[1]
> +
> +                    elif (len(lhs) == 1 or len(lhs) == 2) \
> +                            and len(rhs) == 1:
> +                        replacedPaths[modPath] = rhs[0]
> +
> +                else:
> +                    modPath, version = t.split()
> +                if modPath not in vendoredModulePaths:
> +                    vendoredModulePaths[modPath] = {'version': version,
> +                                                    'pkgs': set()}
> +
> +            if not line.startswith("#"):
> +                pkg = line.strip()
> +                bb.debug(2, "manifest: module %s: add pkg %s" % (modPath, pkg))
> +                vendoredModulePaths[modPath]['pkgs'].add(pkg)
> +
> +    return vendoredModulePaths, replacedPaths
> +
> +
> +def should_build(fname):
> +
> +    with open(fname) as _file:
> +        goBuildDirectivePos = -1
> +        endpos = -1
> +        content = _file.readlines()
> +
> +        for i, line in enumerate(content):
> +            if len(line.strip()) == 0 \
> +                    or line.startswith("//"):
> +                continue
> +            endpos = i
> +            break
> +
> +        for i, line in enumerate(content):
> +            if i == endpos:
> +                break
> +            if line.startswith("//go:build"):
> +                goBuildDirectivePos = i
> +                continue
> +            if goBuildDirectivePos >= 0 and len(line.strip()) == 0:
> +                directive = content[goBuildDirectivePos].strip().split()
> +                if len(directive) > 1 and directive[1] == "ignore":
> +                    return False
> +    return True
> +
> +
> +def match_potential_source_file(fname):
> +
> +    basename = os.path.basename(fname)
> +
> +    if basename.endswith("_test.go"):
> +        return False
> +
> +    # We assume that go version >= 1.17
> +    # (See https://golang.org/issue/42970.)
> +    if basename == "go.mod" or basename == "go.sum":
> +        return False
> +
> +    if basename.endswith(".go"):
> +        if not should_build(fname):
> +            return False
> +
> +    return True
> +
> +
> +def resolve_embed(fname, dst):
> +    import glob
> +    import re
> +    import shutil
> +
> +    go_embed_re = re.compile("//go:embed (.*)")
> +
> +    basedir = os.path.dirname(fname)
> +
> +    with open(fname) as _file:
> +        for i, line in enumerate(_file.readlines()):
> +            m = go_embed_re.search(line)
> +            if not m:
> +                continue
> +            embeddedpaths = m.group(1).split()
> +            for embeddedpath in embeddedpaths:
> +
> +                p = os.path.join(basedir, embeddedpath)
> +
> +                for f in glob.glob(p, recursive=True):
> +
> +                    relpath_embed_dst = os.path.relpath(f, basedir)
> +                    embed_dst = os.path.join(dst, relpath_embed_dst)
> +
> +                    embed_dst_dir = os.path.dirname(embed_dst)
> +
> +                    if not os.path.exists(embed_dst_dir):
> +                        bb.utils.mkdirhier(embed_dst_dir)
> +
> +                    bb.debug(1, "cp embedded file '%s' for source '%s' to '%s'" %
> +                                (f, fname, embed_dst))
> +                    shutil.copy2(f, embed_dst)
> +
> +
> +def match_metadata_prefix(fname):
> +    metaPrefixes = {
> +        "AUTHORS",
> +        "CONTRIBUTORS",
> +        "COPYLEFT",
> +        "COPYING",
> +        "COPYRIGHT",
> +        "LEGAL",
> +        "LICENSE",
> +        "NOTICE",
> +        "PATENTS"
> +    }
> +
> +    for p in metaPrefixes:
> +        if os.path.basename(fname).startswith(p):
> +            return True
> +
> +    return False
>
> -addtask vendor_unlink before do_package after do_install
>
>  python do_go_vendor() {
>      import shutil
> +    import re
> +    import glob
>
>      src_uri = (d.getVar('SRC_URI') or "").split()
>
> @@ -63,15 +204,12 @@ python do_go_vendor() {
>      go_import = d.getVar('GO_IMPORT')
>      source_dir = d.getVar('S')
>
> -    linkname = os.path.join(source_dir, *['src', go_import, 'vendor'])
> -    vendor_dir = os.path.join(source_dir, *['src', 'import', 'vendor'])
> +    vendor_dir = os.path.join(source_dir, *['src', go_import, 'vendor'])
>      import_dir = os.path.join(source_dir, *['src', 'import', 'vendor.fetch'])
>
>      if os.path.exists(vendor_dir):
> -        # Nothing to do except re-establish link to actual vendor folder
>          if not os.path.exists(linkname):
> -            os.symlink(vendor_dir, linkname)
> -        return
> +            return
>
>      bb.utils.mkdirhier(vendor_dir)
>
> @@ -86,7 +224,7 @@ python do_go_vendor() {
>
>          destsuffix = fetcher.ud[url].parm.get('destsuffix')
>          # We derive the module repo / version in the following manner (exmaple):
> -        #
> +        #
>          # destsuffix = git/src/import/vendor.fetch/github.com/foo/bar@v1.2.3
>          # p = github.com/foo/bar@v1.2.3
>          # repo = github.com/foo/bar
> @@ -103,14 +241,25 @@ python do_go_vendor() {
>          pathMajor = fetcher.ud[url].parm.get('go_pathmajor')
>          pathMajor = None if not pathMajor else pathMajor.strip('/')
>
> -        if not (repo, version) in modules:
> -            modules[(repo, version)] =   {
> -                                "repo_path": os.path.join(import_dir, p),
> -                                "module_path": module_path,
> -                                "subdir": subdir,
> -                                "pathMajor": pathMajor }
> +        if not (repo, version, subdir) in modules:
> +            modules[(repo, version, subdir)] = {
> +                "repo_path": os.path.join(import_dir, p),
> +                "module_path": module_path,
> +                "subdir": subdir,
> +                "pathMajor": pathMajor}
>
> -    for module_key, module in modules.items():
> +    # Copy vendor manifest
> +    modules_txt_src = os.path.join(d.getVar('WORKDIR'), "modules.txt")
> +    if not os.path.exists(modules_txt_src):
> +        bb.fatal("No vendor manifest present")
> +
> +    manifest, replaced_paths = read_vendor_manifest(modules_txt_src)
> +
> +    bb.debug(1, "copy vendoring manifest %s -> %s" %
> +             (modules_txt_src, vendor_dir))
> +    shutil.copy2(modules_txt_src, vendor_dir)
> +
> +    for _, module in modules.items():
>
>          # only take the version which is explicitly listed
>          # as a dependency in the go.mod
> @@ -119,10 +268,12 @@ python do_go_vendor() {
>          subdir = module['subdir']
>          pathMajor = module['pathMajor']
>
> -        src = rootdir
> +        bb.debug(2, "processing module: %s" % module_path)
> +
> +        modSrcDir = rootdir
>
>          if subdir:
> -            src = os.path.join(rootdir, subdir)
> +            modSrcDir = os.path.join(rootdir, subdir)
>
>          # If the module is released at major version 2 or higher, the module
>          # path must end with a major version suffix like /v2.
> @@ -130,82 +281,87 @@ python do_go_vendor() {
>          #
>          # https://go.dev/ref/mod#modules-overview
>          if pathMajor:
> -            tmp = os.path.join(src, pathMajor)
> +            tmp = os.path.join(modSrcDir, pathMajor)
>              # source directory including major version path may or may not exist
>              if os.path.exists(tmp):
> -                src = tmp
> +                modSrcDir = tmp
>
> -        dst = os.path.join(vendor_dir, module_path)
> +        modDstDir = os.path.join(vendor_dir, module_path)
> +        modDstLicense = os.path.join(modDstDir, "LICENSE")
>
> -        bb.debug(1, "cp %s --> %s" % (src, dst))
> -        shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
> -            ignore=shutil.ignore_patterns(".git", \
> -                                            "vendor", \
> -                                            "*._test.go"))
> +        bb.utils.mkdirhier(modDstDir)
>
> -        # If the root directory has a LICENSE file but not the subdir
> -        # we copy the root license to the sub module since the license
> -        # applies to all modules in the repository
> -        # see https://go.dev/ref/mod#vcs-license
> -        if subdir:
> -            rootdirLicese = os.path.join(rootdir, "LICENSE")
> -            subdirLicense = os.path.join(src, "LICENSE")
> +        bb.debug(2, "module source dir: %s" % modSrcDir)
> +        bb.debug(2, "module dest dir: %s" % modDstDir)
>
> -            if not os.path.exists(subdir) and \
> -                os.path.exists(rootdirLicese):
> -                shutil.copy2(rootdirLicese, subdirLicense)
> +        # Copy main license to package if it does not exist yet
> +        licenseSearchPaths = [modSrcDir, rootdir]
> +        if not os.path.exists(modDstLicense):
> +            for p in licenseSearchPaths:
> +                lic = os.path.join(p, "LICENSE")
> +                if os.path.exists(lic):
> +                    shutil.copyfile(lic, modDstLicense)
> +                    break
>
> -    # Copy vendor manifest
> -    modules_txt_src = os.path.join(d.getVar('WORKDIR'), "modules.txt")
> -    bb.debug(1, "cp %s --> %s" % (modules_txt_src, vendor_dir))
> -    shutil.copy2(modules_txt_src, vendor_dir)
> +        # Copy source files
> +        exclude = ["vendor", ".git", ".github"]
> +        for root, dirs, files in os.walk(modSrcDir, topdown=True):
>
> -    # Clean up vendor dir
> -    # We only require the modules in the modules_txt file
> -    fetched_paths = set([os.path.relpath(x[0], vendor_dir) for x in os.walk(vendor_dir)])
> +            dirs[:] = [d for d in dirs if d not in exclude]
>
> -    # Remove toplevel dir
> -    fetched_paths.remove('.')
> +            pkgRelpath = os.path.relpath(root, modSrcDir)
> +            pkg = os.path.join(module_path, pkgRelpath)
>
> -    vendored_paths = set()
> -    replaced_paths = dict()
> -    with open(modules_txt_src) as f:
> -        for line in f:
> -            if not line.startswith("#"):
> -                line = line.strip()
> -                vendored_paths.add(line)
> -
> -                # Add toplevel dirs into vendored dir, as we want to keep them
> -                topdir = os.path.dirname(line)
> -                while len(topdir):
> -                    if not topdir in vendored_paths:
> -                        vendored_paths.add(topdir)
> -
> -                    topdir = os.path.dirname(topdir)
> -            else:
> -                replaced_module = line.split("=>")
> -                if len(replaced_module) > 1:
> -                    # This module has been replaced, use a local path
> -                    # we parse the line that has a pattern "# module-name [module-version] => local-path
> -                    actual_path = replaced_module[1].strip()
> -                    vendored_name = replaced_module[0].split()[1]
> -                    bb.debug(1, "added vendored name %s for actual path %s" % (vendored_name, actual_path))
> -                    replaced_paths[vendored_name] = actual_path
> +            # normalize the path, otherwise we get a "x/y/z/."
> +            # for the main module path itself
> +            pkg = os.path.normpath(pkg)
> +            bb.debug(2, "  processing pkg %s" % pkg)
> +
> +            if not module_path in manifest:
> +                bb.fatal("Module is not listed in manifest: %s" % module_path)
> +
> +            # if the folder is not a package, we can skip it
> +            if not pkg in manifest[module_path]['pkgs']:
> +                bb.debug(2, "  skipping pkg %s: not in manifest" % pkg)
> +                continue
>
> -    for path in fetched_paths:
> -        if path not in vendored_paths:
> -            realpath = os.path.join(vendor_dir, path)
> -            if os.path.exists(realpath):
> -                shutil.rmtree(realpath)
> +            dst = os.path.join(vendor_dir, pkg)
> +            bb.utils.mkdirhier(dst)
> +
> +            for f in files:
> +                srcfile = os.path.join(root, f)
> +                dstfile = os.path.join(dst, f)
> +
> +                bb.debug(2, "cp %s -> %s" % (srcfile, dstfile))
> +
> +                if match_potential_source_file(srcfile):
> +                    shutil.copyfile(srcfile, dstfile)
> +
> +                    if srcfile.endswith(".go"):
> +                        resolve_embed(srcfile, os.path.dirname(dstfile))
> +
> +            # copy metadata files
> +            src = root
> +            while pkg != module_path:
> +                pkg = os.path.dirname(pkg)
> +                dst = os.path.dirname(dst)
> +                src = os.path.dirname(root)
> +
> +                for f in os.listdir(src):
> +                    srcfile = os.path.join(src, f)
> +                    if match_metadata_prefix(srcfile):
> +                        dstfile = os.path.join(dst, f)
> +                        if not os.path.exists(dstfile):
> +                            shutil.copyfile(srcfile, dstfile)
>
>      for vendored_name, replaced_path in replaced_paths.items():
> -        symlink_target = os.path.join(source_dir, *['src', go_import, replaced_path])
> +        symlink_target = os.path.join(
> +            source_dir, *['src', go_import, replaced_path])
>          symlink_name = os.path.join(vendor_dir, vendored_name)
> -        bb.debug(1, "vendored name %s, symlink name %s" % (vendored_name, symlink_name))
> -        os.symlink(symlink_target, symlink_name)
> -
> -    # Create a symlink to the actual directory
> -    os.symlink(vendor_dir, linkname)
> +        bb.debug(1, "vendored name %s, symlink name %s, symlink target %s"
> +                 % (vendored_name, symlink_name, symlink_target))
> +        if not os.path.exists(symlink_name):
> +            os.symlink(symlink_target, symlink_name)
>  }
>
>  addtask go_vendor before do_patch after do_unpack
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196208): https://lists.openembedded.org/g/openembedded-core/message/196208
> Mute This Topic: https://lists.openembedded.org/mt/104582949/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

