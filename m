Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9A96960043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:27:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 18 Aug 2015 06:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,701,1432623600"; d="scan'208";a="786328967"
Received: from jburrows-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.34])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2015 06:27:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Tue, 18 Aug 2015 14:27:16 +0100
Message-ID: <6182540.HgHPSCFIUP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1438865345-39231-2-git-send-email-mariano.lopez@linux.intel.com>
References: <1438865345-39231-1-git-send-email-mariano.lopez@linux.intel.com>
	<1438865345-39231-2-git-send-email-mariano.lopez@linux.intel.com>
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
X-List-Received-Date: Tue, 18 Aug 2015 13:27:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mariano,

So aside from the error due to blank lines in the package list that I know
you're looking into, I did have a couple of comments:

On Thursday 06 August 2015 12:49:05 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This adds a new manifest file for the packages that were
> deployed but not included into rootfs. The new manifest file
> is in the same directory as the rootfs manifest but the name is
> image_license.manifest.
> 
> It also creates the directory structure for the packages and
> add the license file in such directories.
> 
> The bootloader is an example of such packages.
> 
> [YOCTO #6772]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 126
> ++++++++++++++++++++++++++++++++++++++----- 1 file changed, 113
> insertions(+), 13 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 32e172a..d4ad263 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -26,18 +26,14 @@ python write_package_manifest() {
>  }
> 
>  python license_create_manifest() {
> -    import re
>      import oe.packagedata
>      from oe.rootfs import image_list_installed_packages
> 
> -    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
> -    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
> -    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> -
>      build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
>      if build_images_from_feeds == "1":
>          return 0
> 
> +    # Files that are installed in the rootfs
>      pkg_dic = {}
>      for pkg in image_list_installed_packages(d).split("\n"):
>          pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
> @@ -49,8 +45,109 @@ python license_create_manifest() {
>              pkg_lic_name = "LICENSE_" + pkg_name
>              pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
> 
> -    license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
> +    # Files that are part of the image but no installed in rootfs
> +    imgpkg_dic = {}
> +    for pkg in list_deployed_packages(d, pkg_dic.keys()).split("\n"):
> +        pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
> +                                'runtime', pkg)
> +        pkg_name = os.path.basename(pkg_info)
> +        imgpkg_dic[pkg] = oe.packagedata.read_pkgdatafile(pkg_info)
> +        if not "LICENSE" in imgpkg_dic[pkg].keys():
> +            pkg_lic_name = "LICENSE_%s" % pkg
> +            imgpkg_dic[pkg]["LICENSE"] = imgpkg_dic[pkg][pkg_lic_name]
> +
> +    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY',
> True), d.getVar('IMAGE_NAME', True), 'license.manifest') 
> +    image_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY',
> True),
> +                        d.getVar('IMAGE_NAME', True),
> 'image_license.manifest') 

Rather than image_license.manifest can we call this "image_extra.manifest"?
Then it's just a little bit more clear what this file is for.


> +    write_license_files(d,
> rootfs_license_manifest, pkg_dic)
> +    write_license_files(d, image_license_manifest, imgpkg_dic)
> +}
> +
> +
> +def list_deployed_packages(d, installed_packages):
> +    """
> +    Get all the deployed packages (not installed on rootfs) of an image
> +
> +    This function needs the BB_TASKDEPDATA from do_rootfs.
> +    This won't work outside do_rootfs.
> +    """
> +    import oe.packagedata
> +
> +    packages = []
> +    taskdepdata = d.getVar("BB_TASKDEPDATA", True)
> +    all_depends = imagetypes_getdepends(d)
> +    all_depends += " %s" % d.getVar("EXTRA_IMAGEDEPENDS", True)
> +    for depend in all_depends.split():
> +        # Get package name without task
> +        depend = depend.split(":")[0]
> +        if not depend.endswith("native"):
> +            pkgs_file = os.path.join(
> +                    d.getVar('PKGDATA_DIR', True), depend)
> +            # Search for the file on the installed packages with the
> +            # same name as depend if not found fallback to search
> +            # the provider for that depend.
> +            if not os.path.isfile(pkgs_file):
> +                pkgs_file = ""
> +                for taskdep in taskdepdata.itervalues():
> +                    # The fifth field of BB_TASKDEPDATA is PROVIDES
> +                    if depend in taskdep[4]:
> +                        pkgs_file = os.path.join(
> +                                d.getVar('PKGDATA_DIR', True),
> +                                taskdep[0])
> +                        if os.path.isfile(pkgs_file):
> +                            break
> +                        else:
> +                            pkgs_file = ""
> +            if pkgs_file:
> +                pkgs_dep = oe.packagedata.read_pkgdatafile(pkgs_file)
> +                # There is no need to duplicate license info for
> +                # derivated packages or packages in the other
> +                # license manifest
> +                for pkg in pkgs_dep['PACKAGES'].split():
> +                    if (pkg.endswith("-dbg") or
> +                            pkg.endswith("-dev") or
> +                            pkg.endswith("-doc") or
> +                            pkg.endswith("-locale") or
> +                            pkg.endswith("-localedata") or
> +                            pkg.endswith("-staticdev") or

This kind of hardcoded list rings alarm bells. Are we really looking at
the right thing here if we have to do this kind of filtering?


> +                            pkg in installed_packages):
> +                        continue
> +                    pkg_data_file = os.path.join(
> +                            d.getVar('PKGDATA_DIR', True),
> +                            "runtime", pkg)
> +                    pkg_data =  oe.packagedata.read_pkgdatafile(
> +                            pkg_data_file)
> +                    pkg_pe = pkg_data.get("PE","0")
> +                    if pkg_pe is "0":
> +                        pkg_pf = "%s-%s" % (pkg_data["PV"], pkg_data["PR"])
> +                    else:
> +                        pkg_pf = "%s_%s-%s" % (pkg_pe,
> +                                pkg_data["PV"], pkg_data["PR"])
> +                    # There is no need to add the license for
> +                    # packages that were not deployed
> +                    pkg_deploy = os.path.join(
> +                            d.getVar("TMPDIR", True), "work",
> +                            d.getVar("MULTIMACH_TARGET_SYS", True),
> +                            pkg_data["PN"], pkg_pf, "temp",
> "run.do_deploy") +                    if os.path.isfile(pkg_deploy):
> +                        packages.append(pkg)
> +            # If for some reason, couldn't find the provider
> +            # print a warning to add the license manually
> +            else:
> +                bb.warn("Couldn't find packages that provides "
> +                        "%s, please add licenses manually" % depend)
> +
> +    return "\n".join(packages)
> +
> +
> +def write_license_files(d, license_manifest, pkg_dic):
> +    import re
> +
> +    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
> +    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
> +    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> +
>      with open(license_manifest, "w") as license_file:
>          for pkg in sorted(pkg_dic):
>              if bad_licenses:
> @@ -98,15 +195,16 @@ python license_create_manifest() {
>      if copy_lic_manifest == "1":
>          rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS', 'True'),
> 'usr', 'share', 'common-licenses') -        os.makedirs(rootfs_license_dir)
> +        bb.utils.mkdirhier(rootfs_license_dir)
>          rootfs_license_manifest = os.path.join(rootfs_license_dir,
> -                                                'license.manifest')
> +                os.path.split(license_manifest)[1])
> +
>          os.link(license_manifest, rootfs_license_manifest)
> 
>          if copy_lic_dirs == "1":
>              for pkg in sorted(pkg_dic):
>                  pkg_rootfs_license_dir = os.path.join(rootfs_license_dir,
> pkg) -                os.makedirs(pkg_rootfs_license_dir)
> +                bb.utils.mkdirhier(pkg_rootfs_license_dir)
>                  pkg_license_dir =
> os.path.join(d.getVar('LICENSE_DIRECTORY', True), pkg_dic[pkg]["PN"])
>                  licenses = os.listdir(pkg_license_dir)
> @@ -124,14 +222,16 @@ python license_create_manifest() {
>                          if not os.path.exists(rootfs_license):
>                              os.link(pkg_license, rootfs_license)
> 
> -                        os.symlink(os.path.join('..', lic),
> pkg_rootfs_license) +                        if not
> os.path.exists(pkg_rootfs_license): +                           
> os.symlink(os.path.join('..', lic), pkg_rootfs_license) else:
> -                        if oe.license.license_ok(canonical_license(d,
> -                            lic), bad_licenses) == False:
> +                        if ((oe.license.license_ok(canonical_license(d,
> +                            lic), bad_licenses) == False) or
> +                            os.path.exists(pkg_rootfs_license)):
>                              continue
> 
>                          os.link(pkg_license, pkg_rootfs_license)
> -}
> +
> 
>  python do_populate_lic() {
>      """



-- 

Paul Eggleton
Intel Open Source Technology Centre

