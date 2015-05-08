Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vn0-f50.google.com (mail-vn0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 373E560034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 17:30:15 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so5880373vnb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 10:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/JUXylXOZyO8IzSjAEVWy0bdyzL/B72Bt2Ya/cQOrlM=;
	b=PeSbG2yz6hGrA8u9UuLGZK+Wt411a9gg9G0k8OLweNdk8jLACnj72ST6SS0ZUiyv0s
	/WRt+1FHmekShpgNkqd8ZsO4mKTyMAuRIsv7S9mN6B4xir2acqyyhFBStENtfscBPklk
	p/2gGLg3O7qnkdqbz1VAXm1g7kYjlBgUXp360zEoQt3OhSgNu2YB4uB2lnJJ3IdMQNrI
	7Bb0hGSVMTIZZS/mqVSITWe/dYwrGmQjr6KV1JtP+YrSq0KfFSyky3ynp3lpPXbzS7PU
	7MFldsxCVvoCb8omXgFWUDptJx+3CWzjeYfB+dd2Djgddm3en3mZjWjNxj/QAENTxESz
	9Mjw==
X-Gm-Message-State: ALoCoQmHMel1b2ZKuW5n1Hnzv0yoSOPF3WlH2mOFJdZ0oQLUE5veIz65+t7Y3OcMNc17Jc9cudpa
MIME-Version: 1.0
X-Received: by 10.52.32.34 with SMTP id f2mr3713223vdi.11.1431106216653; Fri,
	08 May 2015 10:30:16 -0700 (PDT)
Received: by 10.52.231.33 with HTTP; Fri, 8 May 2015 10:30:16 -0700 (PDT)
In-Reply-To: <a7f0f31023f0f267d0d7b3ff7f6e99d56b88841b.1430923708.git.anibal.limon@linux.intel.com>
References: <cover.1430923708.git.anibal.limon@linux.intel.com>
	<a7f0f31023f0f267d0d7b3ff7f6e99d56b88841b.1430923708.git.anibal.limon@linux.intel.com>
Date: Fri, 8 May 2015 18:30:16 +0100
Message-ID: <CAPhnLPDnUyLb1U=EpE-yV8rgGh+amVddjNDzbExWGgD0TNmOQg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] license_class: Reimplemented manifest creation in python
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
X-List-Received-Date: Fri, 08 May 2015 17:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 May 2015 at 15:52, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.co=
m> wrote:
> Reimplemented license_manifest_create from shell to python for
> INCOMPATIBLE_LICENSE handle using oe.license module.
>
> Optimizations are made to avoid license copy now uses a hardlink
> and symbolic link this helps to save space during build.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 163 ++++++++++++++++++++++---------------=
------
>  1 file changed, 82 insertions(+), 81 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index d9409a9..975867d 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -25,87 +25,88 @@ python write_package_manifest() {
>          'w+').write(image_list_installed_packages(d))
>  }
>
> -license_create_manifest() {
> -        # Test if BUILD_IMAGES_FROM_FEEDS is defined in env
> -        if [ -n "${BUILD_IMAGES_FROM_FEEDS}" ]; then
> -          exit 0
> -        fi
> -
> -       INSTALLED_PKGS=3D`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.=
manifest`
> -       LICENSE_MANIFEST=3D"${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.ma=
nifest"
> -       # remove existing license.manifest file
> -       if [ -f ${LICENSE_MANIFEST} ]; then
> -               rm ${LICENSE_MANIFEST}
> -       fi
> -       touch ${LICENSE_MANIFEST}
> -       for pkg in ${INSTALLED_PKGS}; do
> -               filename=3D`ls ${PKGDATA_DIR}/runtime-reverse/${pkg}| hea=
d -1`
> -               pkged_pn=3D"$(sed -n 's/^PN: //p' ${filename})"
> -
> -               # check to see if the package name exists in the manifest=
. if so, bail.
> -               if grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; t=
hen
> -                       continue
> -               fi
> -
> -               pkged_pv=3D"$(sed -n 's/^PV: //p' ${filename})"
> -               pkged_name=3D"$(basename $(readlink ${filename}))"
> -               pkged_lic=3D"$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LIC=
ENSE_${pkged_name}: //; p }" ${filename})"
> -               pkged_size=3D"$(sed -n "/^PKGSIZE_${pkged_name}: /{ s/^PK=
GSIZE_${pkged_name}: //; p }" ${filename})"
> -               if [ -z "${pkged_lic}" ]; then
> -                       # fallback checking value of LICENSE
> -                       pkged_lic=3D"$(sed -n "/^LICENSE: /{ s/^LICENSE: =
//; p }" ${filename})"
> -               fi
> -
> -               echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
> -               echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST=
}
> -               echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
> -               echo "LICENSE:" ${pkged_lic} >> ${LICENSE_MANIFEST}
> -               echo "" >> ${LICENSE_MANIFEST}
> -
> -               # If the package doesn't contain any file, that is, its s=
ize is 0, the license
> -               # isn't relevant as far as the final image is concerned. =
So doing license check
> -               # doesn't make much sense, skip it.
> -               if [ "$pkged_size" =3D "0" ]; then
> -                       continue
> -               fi
> -
> -               lics=3D"$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "=
s/  */ /g" )"
> -               for lic in ${lics}; do
> -                       # to reference a license file trim trailing + sym=
bol
> -                       if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/gener=
ic_${lic%+}" ]; then
> -                               bbwarn "The license listed ${lic} was not=
 in the licenses collected for ${pkged_pn}"
> -                       fi
> -               done
> -       done
> -
> -       # Two options here:
> -       # - Just copy the manifest
> -       # - Copy the manifest and the license directories
> -       # With both options set we see a .5 M increase in core-image-mini=
mal
> -       if [ "${COPY_LIC_MANIFEST}" =3D "1" ]; then
> -               mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
> -               cp ${LICENSE_MANIFEST} ${IMAGE_ROOTFS}/usr/share/common-l=
icenses/license.manifest
> -               if [ "${COPY_LIC_DIRS}" =3D "1" ]; then
> -                       for pkg in ${INSTALLED_PKGS}; do
> -                               mkdir -p ${IMAGE_ROOTFS}/usr/share/common=
-licenses/${pkg}
> -                               pkged_pn=3D"$(oe-pkgdata-util -p ${PKGDAT=
A_DIR} lookup-recipe ${pkg})"
> -                               for lic in `ls ${LICENSE_DIRECTORY}/${pkg=
ed_pn}`; do
> -                                       # Really don't need to copy the g=
enerics as they're
> -                                       # represented in the manifest and=
 in the actual pkg licenses
> -                                       # Doing so would make your image =
quite a bit larger
> -                                       if [ "${lic#generic_}" =3D "${lic=
}" ]; then
> -                                               cp ${LICENSE_DIRECTORY}/$=
{pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
> -                                       else
> -                                               if [ ! -f ${IMAGE_ROOTFS}=
/usr/share/common-licenses/${lic} ]; then
> -                                                       cp ${LICENSE_DIRE=
CTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
> -                                               fi
> -                                               ln -sf ../${lic} ${IMAGE_=
ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
> -                                       fi
> -                               done
> -                       done
> -               fi
> -       fi
> -
> +python license_create_manifest() {
> +    import re
> +    import oe.packagedata
> +
> +    build_images_from_feeds =3D d.getVar('BUILD_IMAGES_FROM_FEEDS', True=
)
> +    if build_images_from_feeds =3D=3D "1":
> +        return 0
> +
> +    pkg_dic =3D {}
> +    package_manifest =3D os.path.join(d.getVar('LICENSE_DIRECTORY', True=
),
> +                        d.getVar('IMAGE_NAME', True), 'package.manifest'=
)

Why aren't you using [image|sdk]_list_installed_packages to get the
package list here?

> +    with open(package_manifest, "r") as package_file:
> +        pkg_list =3D package_file.read().split()
> +        for pkg in pkg_list:
> +            pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR', True),
> +                                    'runtime-reverse', pkg)
> +            pkg_name =3D os.path.basename(os.readlink(pkg_info))
> +
> +            pkg_dic[pkg_name] =3D oe.packagedata.read_pkgdatafile(pkg_in=
fo)
> +            if not "LICENSE" in pkg_dic[pkg_name].keys():
> +                pkg_lic_name =3D "LICENSE_" + pkg_name
> +                pkg_dic[pkg_name]["LICENSE"] =3D pkg_dic[pkg_name][pkg_l=
ic_name]
> +
> +    license_manifest =3D os.path.join(d.getVar('LICENSE_DIRECTORY', True=
),
> +                        d.getVar('IMAGE_NAME', True), 'license.manifest'=
)
> +    with open(license_manifest, "w") as license_file:
> +        for pkg in sorted(pkg_dic):
> +            license_file.write("PACKAGE NAME: %s\n" % pkg)
> +            license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["P=
V"])
> +            license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
> +            license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE=
"])
> +
> +            # If the package doesn't contain any file, that is, its size=
 is 0, the license
> +            # isn't relevant as far as the final image is concerned. So =
doing license check
> +            # doesn't make much sense, skip it.
> +            if pkg_dic[pkg]["PKGSIZE_%s" % pkg] =3D=3D "0":
> +                continue
> +
> +            licenses =3D re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
> +            licenses =3D re.sub('  *', ' ', licenses)
> +            for lic in licenses.split():
> +                lic_file =3D os.path.join(d.getVar('LICENSE_DIRECTORY', =
True),
> +                                        pkg_dic[pkg]["PN"], "generic_%s"=
 %
> +                                        re.sub('\+', '', lic))
> +                if not os.path.exists(lic_file):
> +                   bb.warn("The license listed %s was not in the "\
> +                            "licenses collected for recipe %s"
> +                            % (lic, pkg_dic[pkg]["PN"]))
> +
> +    # Two options here:
> +    # - Just copy the manifest
> +    # - Copy the manifest and the license directories
> +    # With both options set we see a .5 M increase in core-image-minimal
> +    copy_lic_manifest =3D d.getVar('COPY_LIC_MANIFEST', True)
> +    copy_lic_dirs =3D d.getVar('COPY_LIC_DIRS', True)
> +    if copy_lic_manifest =3D=3D "1":
> +        rootfs_license_dir =3D os.path.join(d.getVar('IMAGE_ROOTFS', 'Tr=
ue'),
> +                                'usr', 'share', 'common-licenses')
> +        os.makedirs(rootfs_license_dir)
> +        rootfs_license_manifest =3D os.path.join(rootfs_license_dir,
> +                                                'license.manifest')
> +        os.link(license_manifest, rootfs_license_manifest)
> +
> +        if copy_lic_dirs =3D=3D "1":
> +            for pkg in sorted(pkg_dic):
> +                pkg_rootfs_license_dir =3D os.path.join(rootfs_license_d=
ir, pkg)
> +                os.makedirs(pkg_rootfs_license_dir)
> +                pkg_license_dir =3D os.path.join(d.getVar('LICENSE_DIREC=
TORY', True),
> +                                            pkg_dic[pkg]["PN"])
> +                licenses =3D os.listdir(pkg_license_dir)
> +                for lic in licenses:
> +                    rootfs_license =3D os.path.join(rootfs_license_dir, =
lic)
> +                    pkg_license =3D os.path.join(pkg_license_dir, lic)
> +                    pkg_rootfs_license =3D os.path.join(pkg_rootfs_licen=
se_dir, lic)
> +
> +                    if re.match("^generic_.*$", lic):
> +                        if not os.path.exists(rootfs_license):
> +                            os.link(pkg_license, rootfs_license)
> +
> +                        os.symlink(os.path.join('..', lic), pkg_rootfs_l=
icense)
> +                    else:
> +                        os.link(pkg_license, pkg_rootfs_license)
>  }
>
>  python do_populate_lic() {
> --
> 1.8.4.5
>



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

