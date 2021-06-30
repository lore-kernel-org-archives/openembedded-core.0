Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.1996.1625082340412923478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 12:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 12B3A20005;
	Wed, 30 Jun 2021 19:45:36 +0000 (UTC)
Date: Wed, 30 Jun 2021 21:45:36 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: douglas.royds@taitradio.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] license_image: Use sstate to populate license directory
Message-ID: <YNzJ4P5cKQxXmhg/@piout.net>
References: <20210629051801.107631-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
In-Reply-To: <20210629051801.107631-1-douglas.royds@taitradio.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

On 29/06/2021 17:18:01+1200, Douglas via lists.openembedded.org wrote:
> We were getting an endlessly-growing list of directories in
> build/tmp/deploy/licenses/ of the form myimage-mymachine-20210629010203.
> Use the normal sstate behaviour to clean them. Brings license_image in
> line with the do_populate_lic behaviour in license.bbclass.
> 
> We must only clean the (new) WORKDIR/license-destdir at do_rootfs time,
> as the write_package_manifest and license_create_manifest rootfs
> postprocess commands write the package.manifest and license.manifest
> files at that time. They get stored in the sstate cache at
> do_populate_lic_deploy time, alongside the image_license.manifest.
> 
> Looks like this:
> 
>     license-destdir/
>     ├── myimage-mymachine -> myimage-mymachine-20210629025723/
>     └── myimage-mymachine-20210629025723/
>         ├── image_license.manifest
>         ├── license.manifest
>         └── package.manifest
> 

Unfortunately, this patch led to the following failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3637/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/3630/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/3613/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/3605/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3594/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/3601/steps/14/logs/stdio


> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/license_image.bbclass | 35 ++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index 73cebb4d55e..4afbb5ed575 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -1,8 +1,9 @@
>  ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
> +LICSSTATEDIR = "${WORKDIR}/license-destdir/"
>  
>  python write_package_manifest() {
>      # Get list of installed packages
> -    license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
> +    license_image_dir = d.expand('${LICSSTATEDIR}/${IMAGE_NAME}')
>      bb.utils.mkdirhier(license_image_dir)
>      from oe.rootfs import image_list_installed_packages
>      from oe.utils import format_pkg_list
> @@ -32,7 +33,7 @@ python license_create_manifest() {
>              pkg_lic_name = "LICENSE_" + pkg_name
>              pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
>  
> -    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
> +    rootfs_license_manifest = os.path.join(d.getVar('LICSSTATEDIR'),
>                          d.getVar('IMAGE_NAME'), 'license.manifest')
>      write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=True)
>  }
> @@ -196,23 +197,15 @@ def license_deployed_manifest(d):
>                  key,val = line.split(": ", 1)
>                  man_dic[dep][key] = val[:-1]
>  
> -    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
> -                                    d.getVar('IMAGE_NAME'))
> -    bb.utils.mkdirhier(lic_manifest_dir)
> -    image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
> +    licsstatedir = d.getVar('LICSSTATEDIR')
> +    image_name = d.getVar('IMAGE_NAME')
> +    image_license_manifest = os.path.join(licsstatedir, image_name, 'image_license.manifest')
>      write_license_files(d, image_license_manifest, man_dic, rootfs=False)
>  
>      link_name = d.getVar('IMAGE_LINK_NAME')
>      if link_name:
> -        lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
> -                                    link_name)
> -        # remove old symlink
> -        if os.path.islink(lic_manifest_symlink_dir):
> -            os.unlink(lic_manifest_symlink_dir)
> -
> -        # create the image dir symlink
> -        if lic_manifest_dir != lic_manifest_symlink_dir:
> -            os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
> +        if image_name != link_name:
> +            os.symlink(image_name, os.path.join(licsstatedir, link_name))
>  
>  def get_deployed_dependencies(d):
>      """
> @@ -260,14 +253,24 @@ def get_deployed_files(man_file):
>      return dep_files
>  
>  ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
> +do_rootfs[cleandirs] += "${LICSSTATEDIR}"
>  do_rootfs[recrdeptask] += "do_populate_lic"
>  
>  python do_populate_lic_deploy() {
>      license_deployed_manifest(d)
>  }
> -
>  addtask populate_lic_deploy before do_build after do_image_complete
> +
> +SSTATETASKS += "do_populate_lic_deploy"
> +do_populate_lic_deploy[dirs] = "${LICSSTATEDIR}/${IMAGE_NAME}"
>  do_populate_lic_deploy[recrdeptask] += "do_populate_lic do_deploy"
> +do_populate_lic_deploy[sstate-inputdirs] = "${LICSSTATEDIR}"
> +do_populate_lic_deploy[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
> +
> +python do_populate_lic_deploy_setscene () {
> +    sstate_setscene(d)
> +}
> +addtask do_populate_lic_deploy_setscene
>  
>  python license_qa_dead_symlink() {
>      import os
> -- 
> 2.25.1
> 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
