Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02F34608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 09:52:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 02:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,709,1432623600"; d="scan'208";a="544642426"
Received: from iaizik-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.140])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2015 02:52:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Date: Wed, 19 Aug 2015 10:52:07 +0100
Message-ID: <3541998.nHz8tHO3Ly@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55D350E5.3060709@linux.intel.com>
References: <1438865345-39231-1-git-send-email-mariano.lopez@linux.intel.com>
	<6182540.HgHPSCFIUP@peggleto-mobl.ger.corp.intel.com>
	<55D350E5.3060709@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] license.bbclass: Add support for deployed packages not in rootfs
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
X-List-Received-Date: Wed, 19 Aug 2015 09:52:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 18 August 2015 10:36:05 Mariano Lopez wrote:
> On 08/18/2015 08:27 AM, Paul Eggleton wrote:
> > So aside from the error due to blank lines in the package list that I know
> > you're looking into, I did have a couple of comments:
> > 
> > On Thursday 06 August 2015 12:49:05 mariano.lopez@linux.intel.com wrote:
> >> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> >> 
> >> This adds a new manifest file for the packages that were
> >> deployed but not included into rootfs. The new manifest file
> >> is in the same directory as the rootfs manifest but the name is
> >> image_license.manifest.
> >> 
> >> It also creates the directory structure for the packages and
> >> add the license file in such directories.
> >> 
> >> The bootloader is an example of such packages.
> >> 
> >> [YOCTO #6772]
> >> 
> >> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> >> ---
> >> 
> >>   meta/classes/license.bbclass | 126
> >> 
> >> ++++++++++++++++++++++++++++++++++++++----- 1 file changed, 113
> >> insertions(+), 13 deletions(-)
> >> 
> >> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> >> index 32e172a..d4ad263 100644
> >> --- a/meta/classes/license.bbclass
> >> +++ b/meta/classes/license.bbclass
> >> @@ -26,18 +26,14 @@ python write_package_manifest() {
> >> 
> >>   }
> >>   
> >>   python license_create_manifest() {
> >> 
> >> -    import re
> >> 
> >>       import oe.packagedata
> >>       from oe.rootfs import image_list_installed_packages
> >> 
> >> -    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or
> >> "").split()
> >> -    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
> >> -    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> >> -
> >> 
> >>       build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
> >>       
> >>       if build_images_from_feeds == "1":
> >>           return 0
> >> 
> >> +    # Files that are installed in the rootfs
> >> 
> >>       pkg_dic = {}
> >>       
> >>       for pkg in image_list_installed_packages(d).split("\n"):
> >>           pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
> >> 
> >> @@ -49,8 +45,109 @@ python license_create_manifest() {
> >> 
> >>               pkg_lic_name = "LICENSE_" + pkg_name
> >>               pkg_dic[pkg_name]["LICENSE"] =
> >>               pkg_dic[pkg_name][pkg_lic_name]
> >> 
> >> -    license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
> >> +    # Files that are part of the image but no installed in rootfs
> >> +    imgpkg_dic = {}
> >> +    for pkg in list_deployed_packages(d, pkg_dic.keys()).split("\n"):
> >> +        pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
> >> +                                'runtime', pkg)
> >> +        pkg_name = os.path.basename(pkg_info)
> >> +        imgpkg_dic[pkg] = oe.packagedata.read_pkgdatafile(pkg_info)
> >> +        if not "LICENSE" in imgpkg_dic[pkg].keys():
> >> +            pkg_lic_name = "LICENSE_%s" % pkg
> >> +            imgpkg_dic[pkg]["LICENSE"] = imgpkg_dic[pkg][pkg_lic_name]
> >> +
> >> +    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY',
> >> True), d.getVar('IMAGE_NAME', True), 'license.manifest')
> >> +    image_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY',
> >> True),
> >> +                        d.getVar('IMAGE_NAME', True),
> >> 'image_license.manifest')
> > 
> > Rather than image_license.manifest can we call this
> > "image_extra.manifest"?
> > Then it's just a little bit more clear what this file is for.
> 
> Sure
> 
> >> +    write_license_files(d,
> >> rootfs_license_manifest, pkg_dic)
> >> +    write_license_files(d, image_license_manifest, imgpkg_dic)
> >> +}
> >> +
> >> +
> >> +def list_deployed_packages(d, installed_packages):
> >> +    """
> >> +    Get all the deployed packages (not installed on rootfs) of an image
> >> +
> >> +    This function needs the BB_TASKDEPDATA from do_rootfs.
> >> +    This won't work outside do_rootfs.
> >> +    """
> >> +    import oe.packagedata
> >> +
> >> +    packages = []
> >> +    taskdepdata = d.getVar("BB_TASKDEPDATA", True)
> >> +    all_depends = imagetypes_getdepends(d)
> >> +    all_depends += " %s" % d.getVar("EXTRA_IMAGEDEPENDS", True)
> >> +    for depend in all_depends.split():
> >> +        # Get package name without task
> >> +        depend = depend.split(":")[0]
> >> +        if not depend.endswith("native"):
> >> +            pkgs_file = os.path.join(
> >> +                    d.getVar('PKGDATA_DIR', True), depend)
> >> +            # Search for the file on the installed packages with the
> >> +            # same name as depend if not found fallback to search
> >> +            # the provider for that depend.
> >> +            if not os.path.isfile(pkgs_file):
> >> +                pkgs_file = ""
> >> +                for taskdep in taskdepdata.itervalues():
> >> +                    # The fifth field of BB_TASKDEPDATA is PROVIDES
> >> +                    if depend in taskdep[4]:
> >> +                        pkgs_file = os.path.join(
> >> +                                d.getVar('PKGDATA_DIR', True),
> >> +                                taskdep[0])
> >> +                        if os.path.isfile(pkgs_file):
> >> +                            break
> >> +                        else:
> >> +                            pkgs_file = ""
> >> +            if pkgs_file:
> >> +                pkgs_dep = oe.packagedata.read_pkgdatafile(pkgs_file)
> >> +                # There is no need to duplicate license info for
> >> +                # derivated packages or packages in the other
> >> +                # license manifest
> >> +                for pkg in pkgs_dep['PACKAGES'].split():
> >> +                    if (pkg.endswith("-dbg") or
> >> +                            pkg.endswith("-dev") or
> >> +                            pkg.endswith("-doc") or
> >> +                            pkg.endswith("-locale") or
> >> +                            pkg.endswith("-localedata") or
> >> +                            pkg.endswith("-staticdev") or
> > 
> > This kind of hardcoded list rings alarm bells. Are we really looking at
> > the right thing here if we have to do this kind of filtering?
> 
> When there is a virtual dependency in IMAGE_DEPENDS the
> pkgdata file can have several installed packages in there
> (an example is the kernel in raspberry pi), so we need to get
> the list of the packages that were installed, but also filter
> those that are redundant.

Looking at the code, I'm not quite understanding how packages even come into 
it. You're looking at PROVIDES, not RPROVIDES, right?

Also I just noticed this:

> +                    # There is no need to add the license for
> +                    # packages that were not deployed
> +                    pkg_deploy = os.path.join(
> +                            d.getVar("TMPDIR", True), "work",
> +                            d.getVar("MULTIMACH_TARGET_SYS", True),
> +                            pkg_data["PN"], pkg_pf, "temp",
> "run.do_deploy")
> +                    if os.path.isfile(pkg_deploy):
> +                        packages.append(pkg)

This is not a good way of figuring out that the deploy task ran - the logs 
aren't guaranteed to be there. As we discussed earlier I think the proper way 
to do this is to look in sstate-control (more appropriately the path pointed 
to by SSTATE_MANIFESTS) and check if a manifest file exists for the recipe that 
has put files in DEPLOY_DIR_IMAGE.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

