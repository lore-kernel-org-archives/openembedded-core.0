Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.8753.1617890613241119137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 07:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBOUX86o;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: wallinux@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g8so4184254lfv.12
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vWIlecl9PgWUQPqdGQOB8ZNnTmBcMwkJrAYiD8iKfrw=;
        b=OBOUX86onsx1cJFYPB28PeV4R45ZZRtzdth40eK+w8Nmv0fh+jrcMTsBMaIF0fWgjI
         MNdg++abFrC9rLKtwI70t5Wt2mNdxgV7hFUQ6hzMZEUG4VlORYliT7JU2QByPSxn+wW8
         E+Nx1u5n5RxjwBuJGAlZqyS1Mi1RH5fLpyhJC4S7L/u1a3RvrVn0LxY0kYTTqEEumB79
         SgxYbxXmE4n18Tl3sKPw98Uo7QxR/kuMWXtH7H2QiVLGmKB73Ui+8YM+Z2JY7JHlGkFu
         6xdKKedWOQ+G1RMiI0Qs0kDhrRh1Fn9UnzdmJJKW2JT3mYVZUkBPtBzD6dmxgEFm1QgT
         ldcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vWIlecl9PgWUQPqdGQOB8ZNnTmBcMwkJrAYiD8iKfrw=;
        b=LNZqb/GYJrXLE3XEHSCk6qS0iKH93sjMUJ23uoCcGz/JAPSwN9cp6fpkD747cgrEAa
         xfO99KK0QkKrhSiLDgBZ0JONR8jVIgldZ7jCcP5dEwRY/JhjHZC970zHpbQVfJBvzeLq
         urqeN3F/mOJ5+G0GKHTRwvrac519GVio+fuuTeryCobq+q3Ws56O0xqUmAjC69tO7qFc
         Mc6863OwwxrO/ymI6gZ/8aPcZ67vtGoX88JnAnrUhwwpkfarLYT4P387O/dGrDs+i5yJ
         1fPJh/83X+BTAgBUM+PB3cdGw1+yAx/CJ7NIdg3XR+SiU0K580lT8DQupi7PFzAQSuw3
         tEEA==
X-Gm-Message-State: AOAM531l74nioiRf1akqjnqvunshbbPnMNdwbSrH2vc00Z68nHOSimyD
	FlODOEh23CsUXnYryrJkymHHUoaPz/yGWA==
X-Google-Smtp-Source: ABdhPJyE9Xg5oNBBsCWBoiccmVXD7vlcIiMvnHJxRBPZ2MPT6XcLXyeS7oQim2lrPYTPOJefdvkILA==
X-Received: by 2002:a05:6512:3af:: with SMTP id v15mr3060605lfp.129.1617890607366;
        Thu, 08 Apr 2021 07:03:27 -0700 (PDT)
Return-Path: <wallinux@gmail.com>
Received: from arn-awallin-linux-l5.corp.ad.wrs.com (h-82-196-111-243.NA.cust.bahnhof.se. [82.196.111.243])
        by smtp.gmail.com with ESMTPSA id o18sm2842526lft.265.2021.04.08.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 07:03:26 -0700 (PDT)
From: "Anders Wallin" <wallinux@gmail.com>
X-Google-Original-From: Anders Wallin <anders.wallin@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anders Wallin <anders.wallin@windriver.com>
Subject: [OE-core][PATCH] scripts/contrib/image-manifest: add new script
Date: Thu,  8 Apr 2021 16:03:05 +0200
Message-Id: <20210408140305.268345-1-anders.wallin@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Script to collect package information from a manifest file.
Main subcommand is manifest-info that collects package information and
store the information in a tarball. manifest-info can be configured using
a json configuration file. The default configuration including all
possible options can be dumped using the dump-config subcommand.

image-manifest takes an image manifest file as input to get the runtime
dependencies.
As an option image-manifest can also use the build dependency file,
pn-buildlist, to get the build dependencies excluding native packages

------------------------------------------------------
usage: image-manifest [-h] [-d] [-q] <subcommand> ...

Image manifest utility

options:
  -h, --help     show this help message and exit
  -d, --debug    Enable debug output
  -q, --quiet    Print only errors

subcommands:
  recipe-info    Get recipe info
  list-depends   List dependencies
  list-recipes   List recipes producing packages within an image
  list-packages  List packages within an image
  list-layers    List included layers
  dump-config    Dump default config
  manifest-info  Export recipe info for a manifest
Use image-manifest <subcommand> --help to get help on a specific command

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
---
 scripts/contrib/image-manifest | 523 +++++++++++++++++++++++++++++++++
 1 file changed, 523 insertions(+)
 create mode 100755 scripts/contrib/image-manifest

diff --git a/scripts/contrib/image-manifest b/scripts/contrib/image-manifest
new file mode 100755
index 0000000000..3c07a73a4e
--- /dev/null
+++ b/scripts/contrib/image-manifest
@@ -0,0 +1,523 @@
+#!/usr/bin/env python3
+
+# Script to extract information from image manifests
+#
+# Copyright (C) 2018 Intel Corporation
+# Copyright (C) 2021 Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import sys
+import os
+import argparse
+import logging
+import json
+import shutil
+import tempfile
+import tarfile
+from collections import OrderedDict
+
+scripts_path = os.path.dirname(__file__)
+lib_path = scripts_path + '/../lib'
+sys.path = sys.path + [lib_path]
+
+import scriptutils
+logger = scriptutils.logger_create(os.path.basename(__file__))
+
+import argparse_oe
+import scriptpath
+bitbakepath = scriptpath.add_bitbake_lib_path()
+if not bitbakepath:
+    logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+    sys.exit(1)
+logger.debug('Using standard bitbake path %s' % bitbakepath)
+scriptpath.add_oe_lib_path()
+
+import bb.tinfoil
+import bb.utils
+import oe.utils
+import oe.recipeutils
+
+def get_pkg_list(manifest):
+    pkglist = []
+    with open(manifest, 'r') as f:
+        for line in f:
+            linesplit = line.split()
+            if len(linesplit) == 3:
+                # manifest file
+                pkglist.append(linesplit[0])
+            elif len(linesplit) == 1:
+                # build dependency file
+                pkglist.append(linesplit[0])
+    return sorted(pkglist)
+
+def list_packages(args):
+    pkglist = get_pkg_list(args.manifest)
+    for pkg in pkglist:
+        print('%s' % pkg)
+
+def pkg2recipe(tinfoil, pkg):
+    if "-native" in pkg:
+        logger.info('skipping %s' % pkg)
+        return None
+
+    pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
+    pkgdatafile = os.path.join(pkgdata_dir, 'runtime-reverse', pkg)
+    logger.debug('pkgdatafile %s' % pkgdatafile)
+    try:
+        f = open(pkgdatafile, 'r')
+        for line in f:
+            if line.startswith('PN:'):
+                recipe = line.split(':', 1)[1].strip()
+                return recipe
+    except Exception:
+        logger.warning('%s is missing' % pkgdatafile)
+        return None
+
+def get_recipe_list(manifest, tinfoil):
+    pkglist = get_pkg_list(manifest)
+    recipelist = []
+    for pkg in pkglist:
+        recipe = pkg2recipe(tinfoil,pkg)
+        if recipe:
+            if not recipe in recipelist:
+                recipelist.append(recipe)
+
+    return sorted(recipelist)
+
+def list_recipes(args):
+    import bb.tinfoil
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        tinfoil.prepare(config_only=True)
+        recipelist = get_recipe_list(args.manifest, tinfoil)
+        for recipe in sorted(recipelist):
+            print('%s' % recipe)
+
+def list_layers(args):
+
+    def find_git_repo(pth):
+        checkpth = pth
+        while checkpth != os.sep:
+            if os.path.exists(os.path.join(checkpth, '.git')):
+                return checkpth
+            checkpth = os.path.dirname(checkpth)
+        return None
+
+    def get_git_remote_branch(repodir):
+        try:
+            stdout, _ = bb.process.run(['git', 'rev-parse', '--abbrev-ref', '--symbolic-full-name', '@{u}'], cwd=repodir)
+        except bb.process.ExecutionError as e:
+            stdout = None
+        if stdout:
+            return stdout.strip()
+        else:
+            return None
+
+    def get_git_head_commit(repodir):
+        try:
+            stdout, _ = bb.process.run(['git', 'rev-parse', 'HEAD'], cwd=repodir)
+        except bb.process.ExecutionError as e:
+            stdout = None
+        if stdout:
+            return stdout.strip()
+        else:
+            return None
+
+    def get_git_repo_url(repodir, remote='origin'):
+        import bb.process
+        # Try to get upstream repo location from origin remote
+        try:
+            stdout, _ = bb.process.run(['git', 'remote', '-v'], cwd=repodir)
+        except bb.process.ExecutionError as e:
+            stdout = None
+        if stdout:
+            for line in stdout.splitlines():
+                splitline = line.split()
+                if len(splitline) > 1:
+                    if splitline[0] == remote and scriptutils.is_src_url(splitline[1]):
+                        return splitline[1]
+        return None
+
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        tinfoil.prepare(config_only=False)
+        layers = OrderedDict()
+        for layerdir in tinfoil.config_data.getVar('BBLAYERS').split():
+            layerdata = OrderedDict()
+            layername = os.path.basename(layerdir)
+            logger.debug('layername %s, layerdir %s' % (layername, layerdir))
+            if layername in layers:
+                logger.warning('layername %s is not unique in configuration' % layername)
+                layername = os.path.basename(os.path.dirname(layerdir)) + '_' + os.path.basename(layerdir)
+                logger.debug('trying layername %s' % layername)
+                if layername in layers:
+                    logger.error('Layer name %s is not unique in configuration' % layername)
+                    sys.exit(2)
+            repodir = find_git_repo(layerdir)
+            if repodir:
+                remotebranch = get_git_remote_branch(repodir)
+                remote = 'origin'
+                if remotebranch and '/' in remotebranch:
+                    rbsplit = remotebranch.split('/', 1)
+                    layerdata['actual_branch'] = rbsplit[1]
+                    remote = rbsplit[0]
+                layerdata['vcs_url'] = get_git_repo_url(repodir, remote)
+                if os.path.abspath(repodir) != os.path.abspath(layerdir):
+                    layerdata['vcs_subdir'] = os.path.relpath(layerdir, repodir)
+                commit = get_git_head_commit(repodir)
+                if commit:
+                    layerdata['vcs_commit'] = commit
+            layers[layername] = layerdata
+
+    json.dump(layers, args.output, indent=2)
+
+def get_recipe(args):
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        tinfoil.prepare(config_only=True)
+
+        recipe = pkg2recipe(tinfoil, args.package)
+        print(' %s package provided by %s' % (args.package, recipe))
+
+def pkg_dependencies(args):
+    def get_recipe_info(tinfoil, recipe):
+        try:
+            info = tinfoil.get_recipe_info(recipe)
+        except Exception:
+            logger.error('Failed to get recipe info for: %s' % recipe)
+            sys.exit(1)
+        if not info:
+            logger.warning('No recipe info found for: %s' % recipe)
+            sys.exit(1)
+        append_files = tinfoil.get_file_appends(info.fn)
+        appends = True
+        data = tinfoil.parse_recipe_file(info.fn, appends, append_files)
+        data.pn = info.pn
+        data.pv = info.pv
+        return data
+
+    def find_dependencies(tinfoil, assume_provided, recipe_info, packages, rn, order):
+        spaces = '  ' * order
+        data = recipe_info[rn]
+        if args.native:
+            logger.debug('%s- %s' % (spaces, data.pn))
+        elif "-native" not in data.pn:
+            if "cross" not in data.pn:
+                logger.debug('%s- %s' % (spaces, data.pn))
+
+        depends = []
+        for dep in data.depends:
+            if dep not in assume_provided:
+                depends.append(dep)
+
+        # First find all dependencies not in package list.
+        for dep in depends:
+            if dep not in packages:
+                packages.append(dep)
+                dep_data = get_recipe_info(tinfoil, dep)
+                # Do this once now to reduce the number of bitbake calls.
+                dep_data.depends = dep_data.getVar('DEPENDS').split()
+                recipe_info[dep] = dep_data
+
+        # Then recursively analyze all of the dependencies for the current recipe.
+        for dep in depends:
+            find_dependencies(tinfoil, assume_provided, recipe_info, packages, dep, order + 1)
+
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        tinfoil.prepare()
+
+        assume_provided = tinfoil.config_data.getVar('ASSUME_PROVIDED').split()
+        logger.debug('assumed provided:')
+        for ap in sorted(assume_provided):
+            logger.debug(' - %s' % ap)
+
+        recipe = pkg2recipe(tinfoil, args.package)
+        data = get_recipe_info(tinfoil, recipe)
+        data.depends = []
+        depends = data.getVar('DEPENDS').split()
+        for dep in depends:
+            if dep not in assume_provided:
+                data.depends.append(dep)
+
+        recipe_info = dict([(recipe, data)])
+        packages = []
+        find_dependencies(tinfoil, assume_provided, recipe_info, packages, recipe, order=1)
+
+        print('\nThe following packages are required to build %s' % recipe)
+        for p in sorted(packages):
+            data = recipe_info[p]
+            if "-native" not in data.pn:
+                if "cross" not in data.pn:
+                    print(" %s (%s)" % (data.pn,p))
+
+        if args.native:
+            print('\nThe following native packages are required to build %s' % recipe)
+            for p in sorted(packages):
+                data = recipe_info[p]
+                if "-native" in data.pn:
+                    print(" %s(%s)" % (data.pn,p))
+                if "cross" in data.pn:
+                    print(" %s(%s)" % (data.pn,p))
+
+def default_config():
+    vlist = OrderedDict()
+    vlist['PV'] = 'yes'
+    vlist['SUMMARY'] = 'no'
+    vlist['DESCRIPTION'] = 'no'
+    vlist['SECTION'] = 'no'
+    vlist['LICENSE'] = 'yes'
+    vlist['HOMEPAGE'] = 'no'
+    vlist['BUGTRACKER'] = 'no'
+    vlist['PROVIDES'] = 'no'
+    vlist['BBCLASSEXTEND'] = 'no'
+    vlist['DEPENDS'] = 'no'
+    vlist['PACKAGECONFIG'] = 'no'
+    vlist['SRC_URI'] = 'yes'
+    vlist['SRCREV'] = 'yes'
+    vlist['EXTRA_OECONF'] = 'no'
+    vlist['EXTRA_OESCONS'] = 'no'
+    vlist['EXTRA_OECMAKE'] = 'no'
+    vlist['EXTRA_OEMESON'] = 'no'
+
+    clist = OrderedDict()
+    clist['variables'] = vlist
+    clist['filepath'] = 'no'
+    clist['sha256sum'] = 'no'
+    clist['layerdir'] = 'no'
+    clist['layer'] = 'no'
+    clist['inherits'] = 'no'
+    clist['source_urls'] = 'no'
+    clist['packageconfig_opts'] = 'no'
+    clist['patches'] = 'no'
+    clist['packagedir'] = 'no'
+    return clist
+
+def dump_config(args):
+    config = default_config()
+    f = open('default_config.json', 'w')
+    json.dump(config, f, indent=2)
+    logger.info('Default config list dumped to default_config.json')
+
+def export_manifest_info(args):
+
+    def handle_value(value):
+        if value:
+            return oe.utils.squashspaces(value)
+        else:
+            return value
+
+    if args.config:
+        logger.debug('config: %s' % args.config)
+        f = open(args.config, 'r')
+        config = json.load(f, object_pairs_hook=OrderedDict)
+    else:
+        config = default_config()
+    if logger.isEnabledFor(logging.DEBUG):
+        print('Configuration:')
+        json.dump(config, sys.stdout, indent=2)
+        print('')
+
+    tmpoutdir = tempfile.mkdtemp(prefix=os.path.basename(__file__)+'-')
+    logger.debug('tmp dir: %s' % tmpoutdir)
+
+    # export manifest
+    shutil.copy2(args.manifest,os.path.join(tmpoutdir, "manifest"))
+
+    with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
+        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        tinfoil.prepare(config_only=False)
+
+        pkglist = get_pkg_list(args.manifest)
+        # export pkg list
+        f = open(os.path.join(tmpoutdir, "pkgs"), 'w')
+        for pkg in pkglist:
+            f.write('%s\n' % pkg)
+        f.close()
+
+        recipelist = []
+        for pkg in pkglist:
+            recipe = pkg2recipe(tinfoil,pkg)
+            if recipe:
+                if not recipe in recipelist:
+                    recipelist.append(recipe)
+        recipelist.sort()
+        # export recipe list
+        f = open(os.path.join(tmpoutdir, "recipes"), 'w')
+        for recipe in recipelist:
+            f.write('%s\n' % recipe)
+        f.close()
+
+        try:
+            rvalues = OrderedDict()
+            for pn in sorted(recipelist):
+                logger.debug('Package: %s' % pn)
+                rd = tinfoil.parse_recipe(pn)
+
+                rvalues[pn] = OrderedDict()
+
+                for varname in config['variables']:
+                    if config['variables'][varname] == 'yes':
+                        rvalues[pn][varname] = handle_value(rd.getVar(varname))
+
+                fpth = rd.getVar('FILE')
+                layerdir = oe.recipeutils.find_layerdir(fpth)
+                if config['filepath'] == 'yes':
+                    rvalues[pn]['filepath'] = os.path.relpath(fpth, layerdir)
+                    if config['sha256sum'] == 'yes':
+                        rvalues[pn]['sha256sum'] = bb.utils.sha256_file(fpth)
+
+                if config['layerdir'] == 'yes':
+                    rvalues[pn]['layerdir'] = layerdir
+
+                if config['layer'] == 'yes':
+                    rvalues[pn]['layer'] = os.path.basename(layerdir)
+
+                if config['inherits'] == 'yes':
+                    gr = set(tinfoil.config_data.getVar("__inherit_cache") or [])
+                    lr = set(rd.getVar("__inherit_cache") or [])
+                    rvalues[pn]['inherits'] = sorted({os.path.splitext(os.path.basename(r))[0] for r in lr if r not in gr})
+
+                if config['source_urls'] == 'yes':
+                    rvalues[pn]['source_urls'] = []
+                    for url in (rd.getVar('SRC_URI') or '').split():
+                        if not url.startswith('file://'):
+                            url = url.split(';')[0]
+                            rvalues[pn]['source_urls'].append(url)
+
+                if config['packageconfig_opts'] == 'yes':
+                    rvalues[pn]['packageconfig_opts'] = OrderedDict()
+                    for key in rd.getVarFlags('PACKAGECONFIG').keys():
+                        if key == 'doc':
+                            continue
+                        rvalues[pn]['packageconfig_opts'][key] = rd.getVarFlag('PACKAGECONFIG', key, True)
+
+                if config['patches'] == 'yes':
+                    patches = oe.recipeutils.get_recipe_patches(rd)
+                    rvalues[pn]['patches'] = []
+                    if patches:
+                        recipeoutdir = os.path.join(tmpoutdir, pn, 'patches')
+                        bb.utils.mkdirhier(recipeoutdir)
+                        for patch in patches:
+                            # Patches may be in other layers too
+                            patchlayerdir = oe.recipeutils.find_layerdir(patch)
+                            # patchlayerdir will be None for remote patches, which we ignore
+                            # (since currently they are considered as part of sources)
+                            if patchlayerdir:
+                                rvalues[pn]['patches'].append((os.path.basename(patchlayerdir), os.path.relpath(patch, patchlayerdir)))
+                                shutil.copy(patch, recipeoutdir)
+
+                if config['packagedir'] == 'yes':
+                    pn_dir = os.path.join(tmpoutdir, pn)
+                    bb.utils.mkdirhier(pn_dir)
+                    f = open(os.path.join(pn_dir, 'recipe.json'), 'w')
+                    json.dump(rvalues[pn], f, indent=2)
+                    f.close()
+
+            with open(os.path.join(tmpoutdir, 'recipes.json'), 'w') as f:
+                json.dump(rvalues, f, indent=2)
+
+            if args.output:
+                outname = os.path.basename(args.output)
+            else:
+                outname = os.path.splitext(os.path.basename(args.manifest))[0]
+            if outname.endswith('.tar.gz'):
+                outname = outname[:-7]
+            elif outname.endswith('.tgz'):
+                outname = outname[:-4]
+
+            tarfn = outname
+            if tarfn.endswith(os.sep):
+                tarfn = tarfn[:-1]
+            if not tarfn.endswith(('.tar.gz', '.tgz')):
+                tarfn += '.tar.gz'
+            with open(tarfn, 'wb') as f:
+                with tarfile.open(None, "w:gz", f) as tar:
+                    tar.add(tmpoutdir, outname)
+        finally:
+            shutil.rmtree(tmpoutdir)
+
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="Image manifest utility",
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
+
+    # get recipe info
+    parser_get_recipes = subparsers.add_parser('recipe-info',
+                                          help='Get recipe info',
+                                          description='Get recipe information for a package')
+    parser_get_recipes.add_argument('package', help='Package name')
+    parser_get_recipes.set_defaults(func=get_recipe)
+
+    # list runtime dependencies
+    parser_pkg_dep = subparsers.add_parser('list-depends',
+                                          help='List dependencies',
+                                          description='List dependencies required to build the package')
+    parser_pkg_dep.add_argument('--native', help='also print native  and cross packages', action='store_true')
+    parser_pkg_dep.add_argument('package', help='Package name')
+    parser_pkg_dep.set_defaults(func=pkg_dependencies)
+
+    # list recipes
+    parser_recipes = subparsers.add_parser('list-recipes',
+                                          help='List recipes producing packages within an image',
+                                          description='Lists recipes producing the packages that went into an image, using the manifest and pkgdata')
+    parser_recipes.add_argument('manifest', help='Manifest file')
+    parser_recipes.set_defaults(func=list_recipes)
+
+    # list packages
+    parser_packages = subparsers.add_parser('list-packages',
+                                          help='List packages within an image',
+                                          description='Lists packages that went into an image, using the manifest')
+    parser_packages.add_argument('manifest', help='Manifest file')
+    parser_packages.set_defaults(func=list_packages)
+
+    # list layers
+    parser_layers = subparsers.add_parser('list-layers',
+                                          help='List included layers',
+                                          description='Lists included layers')
+    parser_layers.add_argument('-o', '--output', help='Output file - defaults to stdout if not specified',
+                                default=sys.stdout, type=argparse.FileType('w'))
+    parser_layers.set_defaults(func=list_layers)
+
+    # dump default configuration file
+    parser_dconfig = subparsers.add_parser('dump-config',
+                                          help='Dump default config',
+                                          description='Dump default config to default_config.json')
+    parser_dconfig.set_defaults(func=dump_config)
+
+    # export recipe info for packages in manifest
+    parser_export = subparsers.add_parser('manifest-info',
+                                          help='Export recipe info for a manifest',
+                                          description='Export recipe information using the manifest')
+    parser_export.add_argument('-c', '--config', help='load config from json file')
+    parser_export.add_argument('-o', '--output', help='Output file (tarball) - defaults to manifest name if not specified')
+    parser_export.add_argument('manifest', help='Manifest file')
+    parser_export.set_defaults(func=export_manifest_info)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+        logger.debug("Debug Enabled")
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    ret = args.func(args)
+
+    return ret
+
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
-- 
2.31.1

