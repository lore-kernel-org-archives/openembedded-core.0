Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC0E78351
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 17:36:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Sep 2017 10:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,459,1498546800"; d="scan'208";a="147188801"
Received: from swold-mobl2.jf.intel.com ([10.254.126.139])
	by fmsmga006.fm.intel.com with ESMTP; 01 Sep 2017 10:36:56 -0700
Message-ID: <1504287416.27472.345.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Sep 2017 10:36:56 -0700
In-Reply-To: <1504285648.27472.343.camel@linux.intel.com>
References: <20170831213435.16487-1-otavio@ossystems.com.br>
	<1504285648.27472.343.camel@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [PATCH] kernel: Stop using update-alternatives
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
X-List-Received-Date: Fri, 01 Sep 2017 17:36:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-01 at 10:07 -0700, Saul Wold wrote:
> On Thu, 2017-08-31 at 18:34 -0300, Otavio Salvador wrote:
> > 
> > The update-alternatives where using relative links so not being
> > really
> > in use since December 2016 (see OE-Core:c7bc46b9 "kernel: Fix
> > symlinks") so instead we now generate the relative symlinks during
> > the
> > do_install task and drop the update-alternatives use at all.
> > 
> Is there a reason not to fix the U-A usage of the relative links?
> 
> How will this affect the installation of multiple kernels?
> for example with Haris's patch: http://lists.openembedded.org/piperma
> il
> /openembedded-core/2017-August/140996.html
> 
> Sau!
> 
I chatted with Otavio and we agree this is correct.

Acked-by: Saul Wold <sgw@linux.intel.com>

Sau!

> 
> > 
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > 
> >  meta/classes/kernel.bbclass             | 16 +++------------
> >  meta/recipes-kernel/linux/linux-dtb.inc | 36 ++++-----------------
> > --
> > ----------
> >  2 files changed, 7 insertions(+), 45 deletions(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass
> > b/meta/classes/kernel.bbclass
> > index 3cc0432fcf..02a5e961cb 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -2,7 +2,7 @@ inherit linux-kernel-base kernel-module-split
> >  
> >  PROVIDES += "virtual/kernel"
> >  DEPENDS += "virtual/${TARGET_PREFIX}binutils
> > virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
> > -PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-
> > alternatives-native"
> > +PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> >  
> >  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
> >  
> > @@ -57,7 +57,7 @@ python __anonymous () {
> >  
> >          d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
> >  
> > -        d.setVar('FILES_kernel-image-' + typelower, '/' +
> > imagedest
> > + '/' + type + '-${KERNEL_VERSION_NAME}')
> > +        d.setVar('FILES_kernel-image-' + typelower, '/' +
> > imagedest
> > + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' +
> > type)
> >  
> >          d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' 
> > +
> > typelower)
> >  
> > @@ -65,13 +65,6 @@ python __anonymous () {
> >  
> >          d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
> >  
> > -        priority = d.getVar('KERNEL_PRIORITY')
> > -        postinst = '#!/bin/sh\n' + 'update-alternatives --install
> > /'
> > + imagedest + '/' + type + ' ' + type + ' ' + type + '-
> > ${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> > -        d.setVar('pkg_postinst_kernel-image-' + typelower,
> > postinst)
> > -
> > -        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' +
> > '
> > ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> > -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
> > -
> >      image = d.getVar('INITRAMFS_IMAGE')
> >      if image:
> >          d.appendVarFlag('do_bundle_initramfs', 'depends', '
> > ${INITRAMFS_IMAGE}:do_image_complete')
> > @@ -137,10 +130,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
> >  export KBUILD_BUILD_USER = "oe-user"
> >  export KBUILD_BUILD_HOST = "oe-host"
> >  
> > -KERNEL_PRIORITY ?= "${@int(d.getVar('PV').split('-
> > ')[0].split('+')[0].split('.')[0]) * 10000 + \
> > -                       int(d.getVar('PV').split('-
> > ')[0].split('+')[0].split('.')[1]) * 100 + \
> > -                       int(d.getVar('PV').split('-
> > ')[0].split('+')[0].split('.')[-1])}"
> > -
> >  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
> >  
> >  # The directory where built kernel lies in the kernel tree
> > @@ -350,6 +339,7 @@ kernel_do_install() {
> >  	install -d ${D}/boot
> >  	for type in ${KERNEL_IMAGETYPES} ; do
> >  		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
> > ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
> > +		ln -sf ${type}-${KERNEL_VERSION}
> > ${D}/${KERNEL_IMAGEDEST}/${type}
> >  	done
> >  	install -m 0644 System.map ${D}/boot/System.map-
> > ${KERNEL_VERSION}
> >  	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> > b/meta/recipes-
> > kernel/linux/linux-dtb.inc
> > index 0174c80d85..6e6f39e640 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -1,7 +1,5 @@
> >  # Support for device tree generation
> > -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
> > -
> > -PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
> > +FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
> > /${KERNEL_IMAGEDEST}/*.dtbo"
> >  
> >  python __anonymous () {
> >      d.appendVar("PACKAGES", " kernel-devicetree")
> > @@ -36,12 +34,13 @@ do_install_append() {
> >  	for DTB in ${KERNEL_DEVICETREE}; do
> >  		DTB=`normalize_dtb "${DTB}"`
> >  		DTB_EXT=${DTB##*.}
> > +		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> >  		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> > +		install -m 0644 ${DTB_PATH}
> > ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
> >  		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> >  			symlink_name=${type}"-
> > "${KERNEL_IMAGE_SYMLINK_NAME}
> >  			DTB_SYMLINK_NAME=`echo ${symlink_name} |
> > sed
> > "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> > -			DTB_PATH=`get_real_dtb_path_in_kernel
> > "${DTB}"`
> > -			install -m 0644 ${DTB_PATH}
> > ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> > +			ln -sf ${DTB_BASE_NAME}.${DTB_EXT}
> > ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> >  		done
> >  	done
> >  }
> > @@ -59,33 +58,6 @@ do_deploy_append() {
> >  			DTB_PATH=`get_real_dtb_path_in_kernel
> > "${DTB}"`
> >  			install -d ${DEPLOYDIR}
> >  			install -m 0644 ${DTB_PATH}
> > ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
> > -			ln -sf ${DTB_NAME}.${DTB_EXT}
> > ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
> > -		done
> > -	done
> > -}
> > -
> > -pkg_postinst_kernel-devicetree () {
> > -	cd /${KERNEL_IMAGEDEST}
> > -	for DTB in ${KERNEL_DEVICETREE}; do
> > -		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> > -			symlink_name=${type}"-
> > "${KERNEL_IMAGE_SYMLINK_NAME}
> > -			DTB_EXT=${DTB##*.}
> > -			DTB_BASE_NAME=`basename ${DTB}
> > ."${DTB_EXT}"`
> > -			DTB_SYMLINK_NAME=`echo ${symlink_name} |
> > sed
> > "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> > -			update-alternatives --install
> > /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
> > ${DTB_BASE_NAME}.${DTB_EXT} devicetree-
> > ${DTB_SYMLINK_NAME}.${DTB_EXT} 
> > ${KERNEL_PRIORITY} || true
> > -		done
> > -	done
> > -}
> > -
> > -pkg_postrm_kernel-devicetree () {
> > -	cd /${KERNEL_IMAGEDEST}
> > -	for DTB in ${KERNEL_DEVICETREE}; do
> > -		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> > -			symlink_name=${type}"-
> > "${KERNEL_IMAGE_SYMLINK_NAME}
> > -			DTB_EXT=${DTB##*.}
> > -			DTB_BASE_NAME=`basename ${DTB}
> > ."${DTB_EXT}"`
> > -			DTB_SYMLINK_NAME=`echo ${symlink_name} |
> > sed
> > "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> > -			update-alternatives --remove
> > ${DTB_BASE_NAME}.${DTB_EXT} devicetree-
> > ${DTB_SYMLINK_NAME}.${DTB_EXT} 
> > ${KERNEL_PRIORITY} || true
> >  		done
> >  	done
> >  }
> > -- 
> > 2.14.1
> > 

