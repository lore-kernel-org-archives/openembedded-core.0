Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5395960670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9TLS9vT013067; Wed, 29 Oct 2014 21:28:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l_PubhH6uLjb; Wed, 29 Oct 2014 21:28:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9TLS5R7013064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 29 Oct 2014 21:28:06 GMT
Message-ID: <1414618120.7649.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 29 Oct 2014 21:28:40 +0000
In-Reply-To: <1414607656-12144-2-git-send-email-anibal.limon@linux.intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
	<1414607656-12144-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] license_class: Reimplemented manifest creation in python
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
X-List-Received-Date: Wed, 29 Oct 2014 21:28:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-10-29 at 12:34 -0600, Aníbal Limón wrote:
> Reimplemented license_manifest_create from shell to python, in
> order to use oe.license module for handle INCOMPATIBLE_LICENSE
> and add License prorities into OR's evaluation.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 161 ++++++++++++++++++++++++-------------------
>  1 file changed, 90 insertions(+), 71 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index a34ea39..c8a86ce 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -25,78 +25,97 @@ python write_package_manifest() {
>          'w+').write(image_list_installed_packages(d))
>  }
>  
> -license_create_manifest() {
> -        # Test if BUILD_IMAGES_FROM_FEEDS is defined in env
> -        if [ -n "${BUILD_IMAGES_FROM_FEEDS}" ]; then
> -          exit 0
> -        fi
> -
> -	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
> -	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
> -	# remove existing license.manifest file
> -	if [ -f ${LICENSE_MANIFEST} ]; then
> -		rm ${LICENSE_MANIFEST}
> -	fi
> -	touch ${LICENSE_MANIFEST}
> -	for pkg in ${INSTALLED_PKGS}; do
> -		filename=`ls ${PKGDATA_DIR}/runtime-reverse/${pkg}| head -1`
> -		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
> -
> -		# check to see if the package name exists in the manifest. if so, bail.
> -		if grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
> -			continue
> -		fi
> -
> -		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
> -		pkged_name="$(basename $(readlink ${filename}))"
> -		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
> -		if [ -z ${pkged_lic} ]; then
> -			# fallback checking value of LICENSE
> -			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
> -		fi
> -
> -		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
> -		echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
> -		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
> -		printf "LICENSE:" >> ${LICENSE_MANIFEST}
> -		for lic in ${pkged_lic}; do
> -			# to reference a license file trim trailing + symbol
> -			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
> -				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
> -			fi
> -                        printf " ${lic}" >> ${LICENSE_MANIFEST}
> -		done
> -		printf "\n\n" >> ${LICENSE_MANIFEST}
> -	done
> -
> -	# Two options here:
> -	# - Just copy the manifest
> -	# - Copy the manifest and the license directories
> -	# With both options set we see a .5 M increase in core-image-minimal
> -	if [ "${COPY_LIC_MANIFEST}" = "1" ]; then
> -		mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
> -		cp ${LICENSE_MANIFEST} ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
> -		if [ "${COPY_LIC_DIRS}" = "1" ]; then
> -			for pkg in ${INSTALLED_PKGS}; do
> -				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
> -				pkged_pn="$(oe-pkgdata-util lookup-recipe ${PKGDATA_DIR} ${pkg})"
> -				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
> -					# Really don't need to copy the generics as they're 
> -					# represented in the manifest and in the actual pkg licenses
> -					# Doing so would make your image quite a bit larger
> -					if [ "${lic#generic_}" = "${lic}" ]; then
> -						cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
> -					else
> -						if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
> -							cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
> -						fi
> -						ln -sf ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
> -					fi
> -				done
> -			done
> -		fi
> -	fi
> +python license_create_manifest() {
> +    import shutil
> +    import re
>  
> +    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
> +    if build_images_from_feeds == "1":
> +        return 0
> +
> +    pkg_dic = {}
> +    package_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
> +                        d.getVar('IMAGE_NAME', True), 'package.manifest')
> +    with open(package_manifest, "r") as package_file:
> +        pkg_list = package_file.read().split()
> +        for pkg in pkg_list:
> +            pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
> +                                    'runtime-reverse', pkg)
> +            with open(pkg_info, "r") as pkg_info_file:
> +                pkg_dic[pkg] = {}
> +
> +                pkg_lic_name = os.path.basename(os.readlink(pkg_info))
> +
> +                for line in pkg_info_file.read().split("\n"):
> +                    if re.match("^PN: .*$", line):
> +                        pkg_dic[pkg]["PN"] = re.search("PN: (.*)$", line).group(1)
> +
> +                    if re.match("^PV: .*$", line):
> +                        pkg_dic[pkg]["PV"] = re.search("PV: (.*)$", line).group(1)
> +
> +                    if re.match("^LICENSE_%s: (.*)$" % re.escape(pkg_lic_name)
> +                                , line):
> +                        pkg_dic[pkg]["LICENSE"] = re.search("^LICENSE_%s: (.*)$"
> +                                    % pkg_lic_name, line).group(1)
> +                    elif re.match("^LICENSE: (.*)$", line):
> +                        pkg_dic[pkg]["LICENSE"] = re.search("^LICENSE: (.*)$",
> +                                    line).group(1)

Could you have a look at oe.packagedata.read_pkgdatafile(x) and see if
the above could use that instead please?

> +    license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
> +                        d.getVar('IMAGE_NAME', True), 'license.manifest')
> +    with open(license_manifest, "w") as license_file:
> +        for pkg in sorted(pkg_dic):
> +            license_file.write("PACKAGE NAME: %s\n" % pkg)
> +            license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
> +            license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
> +            license_file.write("LICENSE:")
> +
> +            licenses = re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
> +            licenses = re.sub('  *', ' ', licenses)
> +            for lic in licenses.split():
> +                lic = re.sub('\+', '', lic)
> +                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
> +                                        pkg_dic[pkg]["PN"], "generic_%s" % lic)
> +                if not os.path.exists(lic_file):
> +                   bb.warn("The license listed %s was not in the "\ 
> +                            "licenses collected for recipe %s" 
> +                            % (lic, pkg_dic[pkg]["PN"]))
> +                license_file.write(" %s" % lic)
> +            license_file.write("\n\n")
> +
> +    # Two options here:
> +    # - Just copy the manifest
> +    # - Copy the manifest and the license directories
> +    # With both options set we see a .5 M increase in core-image-minimal
> +    copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST', True)
> +    copy_lic_dirs = d.getVar('COPY_LIC_DIRS', True)
> +    if copy_lic_manifest == "1":
> +        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS', 'True'), 
> +                                'usr', 'share', 'common-licenses')
> +        os.makedirs(rootfs_license_dir)
> +        rootfs_license_manifest = os.path.join(rootfs_license_dir,
> +                                                'license.manifest')
> +        shutil.copyfile(license_manifest, rootfs_license_manifest)
> +
> +        if copy_lic_dirs == "1":
> +            for pkg in sorted(pkg_dic):
> +                pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
> +                os.makedirs(pkg_rootfs_license_dir)
> +                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
> +                                            pkg_dic[pkg]["PN"]) 
> +                licenses = os.listdir(pkg_license_dir)
> +                for lic in licenses:
> +                    rootfs_license = os.path.join(rootfs_license_dir, lic)
> +                    pkg_license = os.path.join(pkg_license_dir, lic)
> +                    pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
> +
> +                    if re.match("^generic_.*$", lic):
> +                        if not os.path.exists(pkg_rootfs_license):
> +                            shutil.copyfile(pkg_license, rootfs_license)
> +
> +                        os.symlink(os.path.join('..', lic), pkg_rootfs_license)
> +                    else:
> +                        shutil.copyfile(pkg_license, pkg_rootfs_license)

One small tweak we could make here is to hardlink these files. There are
several copies of many of them and it would reduce image size a bit. I
appreciate the original doesn't but I've been doing this in other places
and this is probably another we should put on the list...

Otherwise looks good, thanks.

Richard





