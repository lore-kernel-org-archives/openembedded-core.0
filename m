Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E757265C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:04:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 08:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,490,1437462000"; d="scan'208";a="764739380"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 08:03:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 08 Sep 2015 16:03:04 +0100
Message-ID: <2973794.9aN4LpP0uE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55EEEC1E.1030401@windriver.com>
References: <cover.1441719081.git.paul.eggleton@linux.intel.com>
	<6b6d4faae6721915597cd9da2a2d1b1b69fa8c11.1441719081.git.paul.eggleton@linux.intel.com>
	<55EEEC1E.1030401@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 3/3] WIP: classes/packagefeed-stability: add class to help reduce package feed churn
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
X-List-Received-Date: Tue, 08 Sep 2015 15:04:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mark,

On Tuesday 08 September 2015 09:09:34 Mark Hatle wrote:
> I've got some scripts where I do this externally of the build system.  So a
> few comments on the stuff below based on what I found working on those
> scripts.
> 
> (Basically the system deploys as normal.. then we run the scripts to copy
> the deploy directory contents to a release directory... we do the
> build-compare as part of that copy...)

Ah ok, interesting. I meant to mention as part of the cover letter actually 
that Randy and I had considered the approach of doing it separately and Randy 
actually got some way down the path of implementing it, until I realised that 
it would be problematic in that the images you'd generate out of the same 
process as the package feed would have the newer packages in them instead of 
the ones that were in the feed.

> See below inline...
> 
> On 9/8/15 8:41 AM, Paul Eggleton wrote:
> > When a dependency causes a recipe to effectively be rebuilt, its output
> > may in fact not change; but new packages (with an increased PR value, if
> > using the PR server) will be generated nonetheless. There's no practical
> > way for us to predict whether or not this is going to be the case based
> > solely on the inputs, but we can compare the package output and see if
> > that is materially different and based upon that decide to replace the
> > old package with the new one.
> > 
> > This class effectively intercepts packages as they are written out by
> > do_package_write_*, causing them to be written into a different
> > directory where we can compare them to whatever older packages might
> > be in the "real" package feed directory, and avoid copying the new
> > package to the feed if it has not materially changed. We use
> > build-compare to do the package comparison.
> > 
> > (NOTE: this is still a work in progress and there are no doubt
> > unresolved issues.)
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/classes/packagefeed-stability.bbclass | 270
> >  +++++++++++++++++++++++++++++ 1 file changed, 270 insertions(+)
> >  create mode 100644 meta/classes/packagefeed-stability.bbclass
> > 
> > diff --git a/meta/classes/packagefeed-stability.bbclass
> > b/meta/classes/packagefeed-stability.bbclass new file mode 100644
> > index 0000000..b5207d9
> > --- /dev/null
> > +++ b/meta/classes/packagefeed-stability.bbclass
> > @@ -0,0 +1,270 @@
> > +# Class to avoid copying packages into the feed if they haven't
> > materially changed +#
> > +# Copyright (C) 2015 Intel Corporation
> > +# Released under the MIT license (see COPYING.MIT for details)
> > +#
> > +# This class effectively intercepts packages as they are written out by
> > +# do_package_write_*, causing them to be written into a different
> > +# directory where we can compare them to whatever older packages might
> > +# be in the "real" package feed directory, and avoid copying the new
> > +# package to the feed if it has not materially changed. The idea is to
> > +# avoid unnecessary churn in the packages when dependencies trigger task
> > +# reexecution (and thus repackaging). Enabling the class is simple:
> > +#
> > +# INHERIT += "packagefeed-stability"
> > +#
> > +# Caveats:
> > +# 1) Latest PR values in the build system may not match those in packages
> > +#    seen on the target (naturally)
> > +# 2) If you rebuild from sstate without the existing package feed
> > present,
> > +#    you will lose the "state" of the package feed i.e. the preserved old
> > +#    package versions. Not the end of the world, but would negate the
> > +#    entire purpose of this class.
> > +#
> > +# Note that running -c cleanall on a recipe will purposely delete the old
> > +# package files so they will definitely be copied the next time.
> > +
> > +python() {
> > +    # Package backend agnostic intercept
> > +    # This assumes that the package_write task is called
> > package_write_<pkgtype> +    # and that the directory in which packages
> > should be written is +    # pointed to by the variable
> > DEPLOY_DIR_<PKGTYPE>
> > +    for pkgclass in (d.getVar('PACKAGE_CLASSES', True) or '').split():
> > +        if pkgclass.startswith('package_'):
> > +            pkgtype = pkgclass.split('_', 1)[1]
> > +            pkgwritefunc = 'do_package_write_%s' % pkgtype
> > +            sstate_outputdirs = d.getVarFlag(pkgwritefunc,
> > 'sstate-outputdirs', False) +            deploydirvar = 'DEPLOY_DIR_%s' %
> > pkgtype.upper()
> > +            deploydirvarref = '${' + deploydirvar + '}'
> > +            pkgcomparefunc = 'do_package_compare_%s' % pkgtype
> > +
> > +            if bb.data.inherits_class('image', d):
> > +                d.appendVarFlag('do_rootfs', 'recrdeptask', ' ' +
> > pkgcomparefunc) +
> > +            if bb.data.inherits_class('populate_sdk_base', d):
> > +                d.appendVarFlag('do_populate_sdk', 'recrdeptask', ' ' +
> > pkgcomparefunc) +
> > +            if bb.data.inherits_class('populate_sdk_ext', d):
> > +                d.appendVarFlag('do_populate_sdk_ext', 'recrdeptask', ' '
> > + pkgcomparefunc) +
> > +            d.appendVarFlag('do_build', 'recrdeptask', ' ' +
> > pkgcomparefunc) +
> > +            if d.getVarFlag(pkgwritefunc, 'noexec', True) or (not
> > d.getVarFlag(pkgwritefunc, 'task', True)) or pkgwritefunc in
> > (d.getVar('__BBDELTASKS', True) or []): +                # Packaging is
> > disabled for this recipe, we shouldn't do anything +               
> > continue
> > +
> > +            if deploydirvarref in sstate_outputdirs:
> > +                # Set intermediate output directory
> > +                d.setVarFlag(pkgwritefunc, 'sstate-outputdirs',
> > sstate_outputdirs.replace(deploydirvarref, deploydirvarref + '-prediff'))
> > +
> > +            d.setVar(pkgcomparefunc, d.getVar('do_package_compare',
> > False)) +            d.setVarFlags(pkgcomparefunc,
> > d.getVarFlags('do_package_compare', False)) +           
> > d.appendVarFlag(pkgcomparefunc, 'depends', '
> > build-compare-native:do_populate_sysroot') +           
> > bb.build.addtask(pkgcomparefunc, 'do_build', 'do_packagedata ' +
> > pkgwritefunc, d) +}
> > +
> > +# This isn't the real task function - it's a template that we use in the
> > +# anonymous python code above
> > +fakeroot python do_package_compare () {
> > +    currenttask = d.getVar('BB_CURRENTTASK', True)
> > +    pkgtype = currenttask.rsplit('_', 1)[1]
> > +    package_compare_impl(pkgtype, d)
> > +}
> > +
> > +def package_compare_impl(pkgtype, d):
> > +    import errno
> > +    import fnmatch
> > +    import glob
> > +    import subprocess
> > +    import oe.sstatesig
> > +
> > +    pn = d.getVar('PN', True)
> > +    deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), True)
> > +    prepath = deploydir + '-prediff/'
> > +
> > +    # Find out PKGR values are
> > +    pkgdatadir = d.getVar('PKGDATA_DIR', True)
> > +    packages = []
> > +    try:
> > +        with open(os.path.join(pkgdatadir, pn), 'r') as f:
> > +            for line in f:
> > +                if line.startswith('PACKAGES:'):
> > +                    packages = line.split(':', 1)[1].split()
> > +                    break
> > +    except IOError as e:
> > +        if e.errno == errno.ENOENT:
> > +            pass
> > +
> > +    if not packages:
> > +        bb.debug(2, '%s: no packages, nothing to do' % pn)
> > +        return
> > +
> > +    pkgrvalues = {}
> > +    rpkgnames = {}
> > +    rdepends = {}
> > +    pkgvvalues = {}
> > +    for pkg in packages:
> > +        with open(os.path.join(pkgdatadir, 'runtime', pkg), 'r') as f:
> > +            for line in f:
> > +                if line.startswith('PKGR:'):
> > +                    pkgrvalues[pkg] = line.split(':', 1)[1].strip()
> > +                if line.startswith('PKGV:'):
> > +                    pkgvvalues[pkg] = line.split(':', 1)[1].strip()
> > +                elif line.startswith('PKG_%s:' % pkg):
> > +                    rpkgnames[pkg] = line.split(':', 1)[1].strip()
> > +                elif line.startswith('RDEPENDS_%s:' % pkg):
> > +                    rdepends[pkg] = line.split(':', 1)[1].strip()
> > +
> > +    # Prepare a list of the runtime package names for packages that were
> > +    # actually produced
> > +    rpkglist = []
> > +    for pkg, rpkg in rpkgnames.iteritems():
> > +        if os.path.exists(os.path.join(pkgdatadir, 'runtime', pkg +
> > '.packaged')): +            rpkglist.append((rpkg, pkg))
> > +    rpkglist.sort(key=lambda x: len(x[0]), reverse=True)
> > +
> > +    pvu = d.getVar('PV', False)
> > +    if '$' + '{SRCPV}' in pvu:
> > +        pvprefix = pvu.split('$' + '{SRCPV}', 1)[0]
> > +    else:
> > +        pvprefix = None
> > +
> > +    pkgwritetask = 'package_write_%s' % pkgtype
> > +    files = []
> > +    copypkgs = []
> > +    manifest, _ = oe.sstatesig.sstate_get_manifest_filename(pkgwritetask,
> > d) +    with open(manifest, 'r') as f:
> > +        for line in f:
> 
> > +            if line.startswith(prepath):
>
> Is this comparing the -packages- or the -files-?  I ask, because if you
> process the packages you can short-cut some of the comparisons.. it makes a
> huge improvement in speed.

Well the manifest for do_package_write is each package file that it writes out, 
so it is packages and not their contents (at this point in the code).
 
> Specifically, skip processing all '-dev' and '-dbg' packages.  (Not
> -staticdev). The -dev and -dbg components need to match the runtime items. 
> If the runtime items have no changed then there is no reason that the -dev
> and -dbg items would have changed -- other then timestamps and file paths..
> which the build-compare filters out anyway.

For -dbg I guess I was considering any case where debugging symbol generation 
had changed in some way; I'm not familiar enough with the format of those 
symbols to know whether that could really happen in practice or not. For -dev, 
what if someone patches a header alone (would be unusual, but not impossible 
to imagine)?
 
> > +                srcpath = line.rstrip()
> > +                if os.path.isfile(srcpath):
> > +                    destpath = os.path.join(deploydir,
> > os.path.relpath(srcpath, prepath)) +
> > +                    # This is crude but should work assuming the output
> > +                    # package file name starts with the package name
> > +                    # and rpkglist is sorted by length (descending)
> > +                    pkgbasename = os.path.basename(destpath)
> > +                    pkgname = None
> > +                    for rpkg, pkg in rpkglist:
> > +                        if pkgbasename.startswith(rpkg):
> > +                            pkgr = pkgrvalues[pkg]
> > +                            destpathspec = destpath.replace(pkgr, '*')
> > +                            if pvprefix:
> > +                                pkgv = pkgvvalues[pkg]
> > +                                if pkgv.startswith(pvprefix):
> > +                                    pkgvsuffix = pkgv[len(pvprefix):]
> > +                                    if '+' in pkgvsuffix:
> > +                                        newpkgv = pvprefix + '*+' +
> > pkgvsuffix.split('+', 1)[1] +                                       
> > destpathspec = destpathspec.replace(pkgv, newpkgv) +                     
> >       pkgname = pkg
> > +                            break
> > +                    else:
> > +                        bb.warn('Unable to map %s back to package' %
> > pkgbasename) +                        destpathspec = destpath
> > +
> > +                    oldfiles = glob.glob(destpathspec)
> > +                    oldfile = None
> > +                    docopy = True
> > +                    if oldfiles:
> > +                        oldfile = oldfiles[-1]
> > +                        result = subprocess.call(['pkg-diff.sh', oldfile,
> > srcpath]) +                        if result == 0:
> > +                            docopy = False
> > +
> 
> If any of the packages differ, then -all- of the packages differ.  You can
> drop out of the loop at that point and simply copy the full set of packages
> over at this point.

Right, that would be a lot simpler. I had imagined there might be an advantage 
in terms of reduced on-target upgrading if you'd only for example patched the 
source for one or two kernel modules and then rebuilt the kernel, but that 
might not justify the extra complexity.
 
> The reason for this is that the packages from a single recipe may (and often
> do) have PN-PV-PR dependencies in them -- so they have to be kept as a
> unit.  Also the -dbg package contains the overall debug information for the
> full set of packages produced by a recipe.. so if you change a package the
> -dbg has to be updated -- since the -dbg was updated, everything has to be
> updated.

That's why I had the versioned dependency check, though it would be much 
simpler (and faster) not to do any of that and just keep it all in lock-step. 

> So drop the loop, abort the compares and copy the full manifest set over in
> one shot..  For large packages like perl and python it makes a HUGH
> difference to avoid all of the extra comparisons.
> 
> (I also did this because there is some concern in my mind if releasing only
> part of a recipe build ever makes sense..  because I've not gotten into the
> situation where the only way to reproduce the released feed would be to
> build the old version first, then come in and build the new version next.. 
> this isn't a typical workflow and greatly complicates things.)

Right, there is a potential risk (and potential for confusion) there.

> > +                    files.append((pkgname, pkgbasename, srcpath, oldfile,
> > destpath)) +                    bb.debug(2, '%s: package %s %s' % (pn,
> > files[-1], docopy)) +                    if docopy:
> > +                        copypkgs.append(pkgname)
> > +
> 
> Making the change above would eliminate the need for the code below.. and
> reduce the possibility of things getting out of sync.

Indeed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

