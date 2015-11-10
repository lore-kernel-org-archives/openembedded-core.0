Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 83F2F74197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:42:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 10 Nov 2015 02:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="597475130"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2015 02:42:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Tue, 10 Nov 2015 10:42:29 +0000
Message-ID: <3148403.VDOZ21eHXB@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <99b6fb84c9cff5cb2cb9656e2b17260a76b5cafc.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
	<99b6fb84c9cff5cb2cb9656e2b17260a76b5cafc.1447077439.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 6/6] license.bbclass: Create image license manifest
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
X-List-Received-Date: Tue, 10 Nov 2015 10:42:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 November 2015 14:04:43 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This change adds the license_deployed_manifest function
> that will create the manifest for the packages deployed
> in the image but not installed in rootfs.

Again, not "in the image" but "next to the image". I'd suggest giving an 
example or two here so that it's clear what's being referred to.

> This new function was added to ROOTFS_POSTPROCESS_COMMAND
> so it will run after every rootfs task. Because of this
> it could run few times for a single build and get different
> dependencies. Sometimes this dependencies won't include all
> the deployed packages, in order to avoid missing licenses a
> tmp file is create during the build and deleted after the
> build (LICENSE_TMP_JSON).
> 
> This change also modify the write_license_files because
> the image manifest is different from the root manifest.
> 
> [YOCTO #6772]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 78
> +++++++++++++++++++++++++++++++++++++++++--- 1 file changed, 73
> insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 463dd54..fa8807e 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -11,6 +11,7 @@ LICENSE_CREATE_PACKAGE[type] = "boolean"
>  LICENSE_CREATE_PACKAGE ??= "0"
>  LICENSE_PACKAGE_SUFFIX ??= "-lic"
>  LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
> +LICENSE_TMP_JSON ?= "${LICENSE_DIRECTORY}/deploy_packages.json"
> 
>  addtask populate_lic after do_patch before do_build
>  do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
> @@ -49,6 +50,59 @@ python license_create_manifest() {
>      write_license_files(d, rootfs_license_manifest, pkg_dic)
>  }
> 
> +python license_deployed_manifest_task() {
> +    license_deployed_manifest(d)
> +}
> +
> +def license_deployed_manifest(d):
> +    """ Write the license manifest for the deployed packages.
> +        The deployed packages usually includes the bootloader
> +        and extra files to boot the target.
> +    """
> +    import json
> +
> +    packages = ""
> +    dep_dic = {}
> +    pkg_dic = {}
> +    info_dir = os.path.join(d.getVar("PKGDATA_DIR",True), "runtime")
> +
> +    # Sometimes the initramfs image is build and it doesn't have
> +    # the boot dependencies. In order to overcome this it is
> +    # necessary to get save previous dependencies found. This is
> +    # why the json_file is used (and deleted once the build is done)
> +    json_file = d.getVar("LICENSE_TMP_JSON", True)
> +    json_lock = bb.utils.lockfile("%s.lock" % json_file)
> +    if os.path.exists(json_file):
> +        with open(json_file) as f:
> +            pkg_dic = json.loads(f.read())
> +
> +    dep_dic = get_deployed_dependencies(d)
> +    for dep in dep_dic.keys():
> +        # At least one package of the deployed dependency is needed
> +        # to get the version.
> +        pkg = get_package_from_deployed(d, dep)
> +        if pkg and pkg not in pkg_dic.keys():
> +            data_file = os.path.join(info_dir, pkg)
> +            pkg_dic[pkg] = oe.packagedata.read_pkgdatafile(data_file)
> +            # It is necessary to mark this will be used for image manifest
> +            pkg_dic[pkg]["IMAGE_MANIFEST"] = True
> +            pkg_dic[pkg]["FILES"] = \
> +                    get_deployed_files(d, dep_dic[dep])
> +            if not "LICENSE" in pkg_dic[pkg].keys():
> +                pkg_lic = "LICENSE_" + pkg
> +                pkg_dic[pkg]["LICENSE"] = pkg_dic[pkg][pkg_lic]
> +
> +    with open(json_file, "w") as f:
> +        json.dump(pkg_dic, f, indent=4)
> +    bb.utils.unlockfile(json_lock)
> +
> +    # Because it might be called several times we lock the license file
> +    image_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY',
> True), +            d.getVar('IMAGE_NAME', True), 'image_license.manifest')
> +    manifest_lock = bb.utils.lockfile("%s.lock" % image_license_manifest)
> +    write_license_files(d, image_license_manifest, pkg_dic)
> +    bb.utils.unlockfile(manifest_lock)
> +
>  def get_deployed_dependencies(d):
>      """ Get all the deployed dependencies of an image """
> 
> @@ -154,6 +208,11 @@ def get_deployed_files(d, man_file):
>              dep_files = "%s %s" % (dep_files, os.path.basename(f))
>      return dep_files
> 
> +python license_delete_tmp_files () {
> +    json_file = d.getVar("LICENSE_TMP_JSON", True)
> +    os.remove(json_file)
> +}
> +
>  def write_license_files(d, license_manifest, pkg_dic):
>      import re
> 
> @@ -175,10 +234,18 @@ def write_license_files(d, license_manifest, pkg_dic):
> pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
> pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
> 
> -            license_file.write("PACKAGE NAME: %s\n" % pkg)
> -            license_file.write("PACKAGE VERSION: %s\n" %
> pkg_dic[pkg]["PV"]) -            license_file.write("RECIPE NAME: %s\n" %
> pkg_dic[pkg]["PN"]) -            license_file.write("LICENSE: %s\n\n" %
> pkg_dic[pkg]["LICENSE"]) +            if not "IMAGE_MANIFEST" in
> pkg_dic[pkg]:
> +                # Rootfs manifest
> +                license_file.write("PACKAGE NAME: %s\n" % pkg)
> +                license_file.write("PACKAGE VERSION: %s\n" %
> pkg_dic[pkg]["PV"]) +                license_file.write("RECIPE NAME: %s\n"
> % pkg_dic[pkg]["PN"]) +                license_file.write("LICENSE: %s\n\n"
> % pkg_dic[pkg]["LICENSE"]) +            else:
> +                # Image manifest
> +                license_file.write("RECIPE NAME: %s\n" %
> pkg_dic[pkg]["PN"]) +                license_file.write("VERSION: %s\n" %
> pkg_dic[pkg]["PV"]) +                license_file.write("LICENSE: %s\n" %
> pkg_dic[pkg]["LICENSE"]) +                license_file.write("FILES:%s\n\n"
> % pkg_dic[pkg]["FILES"])
> 
>              # If the package doesn't contain any file, that is, its size is
> 0, the license # isn't relevant as far as the final image is concerned. So
> doing license check @@ -586,7 +653,8 @@ SSTATETASKS += "do_populate_lic"
>  do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
>  do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
> 
> -ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest;
> license_create_manifest; " +ROOTFS_POSTPROCESS_COMMAND_prepend =
> "write_package_manifest; license_create_manifest;
> license_deployed_manifest_task; " +IMAGE_POSTPROCESS_COMMAND_prepend = "
> license_delete_tmp_files; "
> 
>  do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
>  do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"

A couple of things:

1) Please take care to use the appropriate terminology. "package" has a 
specific meaning; what we are dealing with here is files deployed directly from 
recipes, packages aren't involved (or shouldn't be).

2) You're looking into PKGDATA_DIR, as I mentioned in one of my other replies 
I don't think this is right. The risk is that if a recipe doesn't actually 
write out any packages, the manifest will be incomplete. We need a different 
approach here where pkgdata isn't involved at all. IIRC my earlier suggestion 
was to use what is written out by do_populate_lic, i.e. tmp/deploy/licenses/ - 
if that isn't practical we can have that task write out the LICENSE value to a 
separate file, and that will then work for any recipe.

Cheers,
Paul 

-- 

Paul Eggleton
Intel Open Source Technology Centre

