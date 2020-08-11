Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.3619.1597186159888793352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 15:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SovTMjmH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f18so3020407wmc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+SnHbQ489127s6hliMIzLp2hZgdntbk7vAJlDcBduS0=;
        b=SovTMjmH3pXn/fTK6iKjNtkBuCwaBqZoTDZmTpWFCq9s6hEtvoz40sGMuFvYuKtHJ2
         p768H4HmlfU0/xYqkGRCQARuTmwhiQbEq9KwzdJzv2iax3QVfvJoX4b8Q9RJXyvyruXe
         wUzJn320tzoDfwhzdbuMDaSWucAtZBI/3dahM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+SnHbQ489127s6hliMIzLp2hZgdntbk7vAJlDcBduS0=;
        b=QNe5RaDGBAH3igKQMQGeIhYBq850xIIzXgjpw+JAh1n8jAOTh+/l/G5K9cyBKvYUaz
         e9wkoKUAYg5IfYXCjW1qRwebY9ZSiT6/8DRjL5HdLE+8jfTa/g5sFaDR/cRILmh449jG
         +/W39qOjYfDtPGs4qELjhsmdyh4TLmW43zX45L7f4xFOjk2sLfDB2TJcU5afTf87Klzn
         +U1LQ9meRaO297iH5Au3xqWm6lhvzwA86XHWUrpbt65d1gO7p7Mm78k6zA37lU7KhQlI
         j5yV9WGM1foppFypmhJzT4yrYxVegWeahla7jm8AAMsMDU2VVy1BJkRaSszIdO3grBQj
         voYg==
X-Gm-Message-State: AOAM530SLYYNPANlm802+A4hOt8wwMoLje8Gca+35AG1mWdtGVayfCq9
	rnyVZYqII8jP4UzLpitKo2xBT16GqlupNA==
X-Google-Smtp-Source: ABdhPJxtnjDpbW7KIfFPvGKGz6gDjVK/LbdELs6T3cluncJowt6wWkKhpHdfPsPKH64Ql/3JldjByA==
X-Received: by 2002:a1c:7fd3:: with SMTP id a202mr5669739wmd.67.1597186157909;
        Tue, 11 Aug 2020 15:49:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.a.c.c.d.f.6.e.e.7.9.e.9.0.c.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:ec09:e97e:e6fd:cca9])
        by smtp.gmail.com with ESMTPSA id f6sm483752wme.32.2020.08.11.15.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 15:49:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] packagefeed-stability: Remove as obsolete
Date: Tue, 11 Aug 2020 23:49:15 +0100
Message-Id: <20200811224916.895597-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This class had great ideas and potential but now we have hash
equivalence and reproducibility, its effectively obsolete.

I'm not aware of any serious use of the class, we certainly don't
get bug reports or patches so remove it and focus on those other
areas.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/packagefeed-stability.bbclass | 252 ---------------------
 1 file changed, 252 deletions(-)
 delete mode 100644 meta/classes/packagefeed-stability.bbclass

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
deleted file mode 100644
index 56486025642..00000000000
--- a/meta/classes/packagefeed-stability.bbclass
+++ /dev/null
@@ -1,252 +0,0 @@
-# Class to avoid copying packages into the feed if they haven't materially changed
-#
-# Copyright (C) 2015 Intel Corporation
-# Released under the MIT license (see COPYING.MIT for details)
-#
-# This class effectively intercepts packages as they are written out by
-# do_package_write_*, causing them to be written into a different
-# directory where we can compare them to whatever older packages might
-# be in the "real" package feed directory, and avoid copying the new
-# package to the feed if it has not materially changed. The idea is to
-# avoid unnecessary churn in the packages when dependencies trigger task
-# reexecution (and thus repackaging). Enabling the class is simple:
-#
-# INHERIT += "packagefeed-stability"
-#
-# Caveats:
-# 1) Latest PR values in the build system may not match those in packages
-#    seen on the target (naturally)
-# 2) If you rebuild from sstate without the existing package feed present,
-#    you will lose the "state" of the package feed i.e. the preserved old
-#    package versions. Not the end of the world, but would negate the
-#    entire purpose of this class.
-#
-# Note that running -c cleanall on a recipe will purposely delete the old
-# package files so they will definitely be copied the next time.
-
-python() {
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d):
-        return
-    # Package backend agnostic intercept
-    # This assumes that the package_write task is called package_write_<pkgtype>
-    # and that the directory in which packages should be written is
-    # pointed to by the variable DEPLOY_DIR_<PKGTYPE>
-    for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
-        if pkgclass.startswith('package_'):
-            pkgtype = pkgclass.split('_', 1)[1]
-            pkgwritefunc = 'do_package_write_%s' % pkgtype
-            sstate_outputdirs = d.getVarFlag(pkgwritefunc, 'sstate-outputdirs', False)
-            deploydirvar = 'DEPLOY_DIR_%s' % pkgtype.upper()
-            deploydirvarref = '${' + deploydirvar + '}'
-            pkgcomparefunc = 'do_package_compare_%s' % pkgtype
-
-            if bb.data.inherits_class('image', d):
-                d.appendVarFlag('do_rootfs', 'recrdeptask', ' ' + pkgcomparefunc)
-
-            if bb.data.inherits_class('populate_sdk_base', d):
-                d.appendVarFlag('do_populate_sdk', 'recrdeptask', ' ' + pkgcomparefunc)
-
-            if bb.data.inherits_class('populate_sdk_ext', d):
-                d.appendVarFlag('do_populate_sdk_ext', 'recrdeptask', ' ' + pkgcomparefunc)
-
-            d.appendVarFlag('do_build', 'recrdeptask', ' ' + pkgcomparefunc)
-
-            if d.getVarFlag(pkgwritefunc, 'noexec') or not d.getVarFlag(pkgwritefunc, 'task'):
-                # Packaging is disabled for this recipe, we shouldn't do anything
-                continue
-
-            if deploydirvarref in sstate_outputdirs:
-                deplor_dir_pkgtype = d.expand(deploydirvarref + '-prediff')
-                # Set intermediate output directory
-                d.setVarFlag(pkgwritefunc, 'sstate-outputdirs', sstate_outputdirs.replace(deploydirvarref, deplor_dir_pkgtype))
-                # Update SSTATE_DUPWHITELIST to avoid shared location conflicted error
-                d.appendVar('SSTATE_DUPWHITELIST', ' %s' % deplor_dir_pkgtype)
-
-            d.setVar(pkgcomparefunc, d.getVar('do_package_compare', False))
-            d.setVarFlags(pkgcomparefunc, d.getVarFlags('do_package_compare', False))
-            d.appendVarFlag(pkgcomparefunc, 'depends', ' build-compare-native:do_populate_sysroot')
-            bb.build.addtask(pkgcomparefunc, 'do_build', 'do_packagedata ' + pkgwritefunc, d)
-}
-
-# This isn't the real task function - it's a template that we use in the
-# anonymous python code above
-fakeroot python do_package_compare () {
-    currenttask = d.getVar('BB_CURRENTTASK')
-    pkgtype = currenttask.rsplit('_', 1)[1]
-    package_compare_impl(pkgtype, d)
-}
-
-def package_compare_impl(pkgtype, d):
-    import errno
-    import fnmatch
-    import glob
-    import subprocess
-    import oe.sstatesig
-
-    pn = d.getVar('PN')
-    deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper())
-    prepath = deploydir + '-prediff/'
-
-    # Find out PKGR values are
-    pkgdatadir = d.getVar('PKGDATA_DIR')
-    packages = []
-    try:
-        with open(os.path.join(pkgdatadir, pn), 'r') as f:
-            for line in f:
-                if line.startswith('PACKAGES:'):
-                    packages = line.split(':', 1)[1].split()
-                    break
-    except IOError as e:
-        if e.errno == errno.ENOENT:
-            pass
-
-    if not packages:
-        bb.debug(2, '%s: no packages, nothing to do' % pn)
-        return
-
-    pkgrvalues = {}
-    rpkgnames = {}
-    rdepends = {}
-    pkgvvalues = {}
-    for pkg in packages:
-        with open(os.path.join(pkgdatadir, 'runtime', pkg), 'r') as f:
-            for line in f:
-                if line.startswith('PKGR:'):
-                    pkgrvalues[pkg] = line.split(':', 1)[1].strip()
-                if line.startswith('PKGV:'):
-                    pkgvvalues[pkg] = line.split(':', 1)[1].strip()
-                elif line.startswith('PKG_%s:' % pkg):
-                    rpkgnames[pkg] = line.split(':', 1)[1].strip()
-                elif line.startswith('RDEPENDS_%s:' % pkg):
-                    rdepends[pkg] = line.split(':', 1)[1].strip()
-
-    # Prepare a list of the runtime package names for packages that were
-    # actually produced
-    rpkglist = []
-    for pkg, rpkg in rpkgnames.items():
-        if os.path.exists(os.path.join(pkgdatadir, 'runtime', pkg + '.packaged')):
-            rpkglist.append((rpkg, pkg))
-    rpkglist.sort(key=lambda x: len(x[0]), reverse=True)
-
-    pvu = d.getVar('PV', False)
-    if '$' + '{SRCPV}' in pvu:
-        pvprefix = pvu.split('$' + '{SRCPV}', 1)[0]
-    else:
-        pvprefix = None
-
-    pkgwritetask = 'package_write_%s' % pkgtype
-    files = []
-    docopy = False
-    manifest, _ = oe.sstatesig.sstate_get_manifest_filename(pkgwritetask, d)
-    mlprefix = d.getVar('MLPREFIX')
-    # Copy recipe's all packages if one of the packages are different to make
-    # they have the same PR.
-    with open(manifest, 'r') as f:
-        for line in f:
-            if line.startswith(prepath):
-                srcpath = line.rstrip()
-                if os.path.isfile(srcpath):
-                    destpath = os.path.join(deploydir, os.path.relpath(srcpath, prepath))
-
-                    # This is crude but should work assuming the output
-                    # package file name starts with the package name
-                    # and rpkglist is sorted by length (descending)
-                    pkgbasename = os.path.basename(destpath)
-                    pkgname = None
-                    for rpkg, pkg in rpkglist:
-                        if mlprefix and pkgtype == 'rpm' and rpkg.startswith(mlprefix):
-                            rpkg = rpkg[len(mlprefix):]
-                        if pkgbasename.startswith(rpkg):
-                            pkgr = pkgrvalues[pkg]
-                            destpathspec = destpath.replace(pkgr, '*')
-                            if pvprefix:
-                                pkgv = pkgvvalues[pkg]
-                                if pkgv.startswith(pvprefix):
-                                    pkgvsuffix = pkgv[len(pvprefix):]
-                                    if '+' in pkgvsuffix:
-                                        newpkgv = pvprefix + '*+' + pkgvsuffix.split('+', 1)[1]
-                                        destpathspec = destpathspec.replace(pkgv, newpkgv)
-                            pkgname = pkg
-                            break
-                    else:
-                        bb.warn('Unable to map %s back to package' % pkgbasename)
-                        destpathspec = destpath
-
-                    oldfile = None
-                    if not docopy:
-                        oldfiles = glob.glob(destpathspec)
-                        if oldfiles:
-                            oldfile = oldfiles[-1]
-                            result = subprocess.call(['pkg-diff.sh', oldfile, srcpath])
-                            if result != 0:
-                                docopy = True
-                                bb.note("%s and %s are different, will copy packages" % (oldfile, srcpath))
-                        else:
-                            docopy = True
-                            bb.note("No old packages found for %s, will copy packages" % pkgname)
-
-                    files.append((pkgname, pkgbasename, srcpath, destpath))
-
-    # Remove all the old files and copy again if docopy
-    if docopy:
-        bb.note('Copying packages for recipe %s' % pn)
-        pcmanifest = os.path.join(prepath, d.expand('pkg-compare-manifest-${MULTIMACH_TARGET_SYS}-${PN}'))
-        try:
-            with open(pcmanifest, 'r') as f:
-                for line in f:
-                    fn = line.rstrip()
-                    if fn:
-                        try:
-                            os.remove(fn)
-                            bb.note('Removed old package %s' % fn)
-                        except OSError as e:
-                            if e.errno == errno.ENOENT:
-                                pass
-        except IOError as e:
-            if e.errno == errno.ENOENT:
-                pass
-
-        # Create new manifest
-        with open(pcmanifest, 'w') as f:
-            for pkgname, pkgbasename, srcpath, destpath in files:
-                destdir = os.path.dirname(destpath)
-                bb.utils.mkdirhier(destdir)
-                # Remove allarch rpm pkg if it is already existed (for
-                # multilib), they're identical in theory, but sstate.bbclass
-                # copies it again, so keep align with that.
-                if os.path.exists(destpath) and pkgtype == 'rpm' \
-                        and d.getVar('PACKAGE_ARCH') == 'all':
-                    os.unlink(destpath)
-                if (os.stat(srcpath).st_dev == os.stat(destdir).st_dev):
-                    # Use a hard link to save space
-                    os.link(srcpath, destpath)
-                else:
-                    shutil.copyfile(srcpath, destpath)
-                f.write('%s\n' % destpath)
-    else:
-        bb.note('Not copying packages for recipe %s' % pn)
-
-do_cleansstate[postfuncs] += "pfs_cleanpkgs"
-python pfs_cleanpkgs () {
-    import errno
-    for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
-        if pkgclass.startswith('package_'):
-            pkgtype = pkgclass.split('_', 1)[1]
-            deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper())
-            prepath = deploydir + '-prediff'
-            pcmanifest = os.path.join(prepath, d.expand('pkg-compare-manifest-${MULTIMACH_TARGET_SYS}-${PN}'))
-            try:
-                with open(pcmanifest, 'r') as f:
-                    for line in f:
-                        fn = line.rstrip()
-                        if fn:
-                            try:
-                                os.remove(fn)
-                            except OSError as e:
-                                if e.errno == errno.ENOENT:
-                                    pass
-                os.remove(pcmanifest)
-            except IOError as e:
-                if e.errno == errno.ENOENT:
-                    pass
-}
-- 
2.25.1

