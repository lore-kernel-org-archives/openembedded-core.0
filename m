Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9148E6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 14:40:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2015 07:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="569518097"
Received: from skothar1-mobl6.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.52.41])
	by orsmga003.jf.intel.com with ESMTP; 11 May 2015 07:40:42 -0700
Message-ID: <5550BF6A.3050900@linux.intel.com>
Date: Mon, 11 May 2015 07:40:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Juro Bystricky <juro.bystricky@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1431124779-28516-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1431124779-28516-1-git-send-email-juro.bystricky@intel.com>
Subject: Re: [PATCH] Add support for VirtualBox VDI images
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
X-List-Received-Date: Mon, 11 May 2015 14:40:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2015 03:39 PM, Juro Bystricky wrote:
> Yocto does not support VirtualBox sparse image VDI file format.
> This could be achieved by the attached patch. The support mimics
> the VMDK support for VMware. The only subtle difference is that
> qemu-native has be be built with uuid enabled, as VDI images
> need a valid UUID in order to be recognized by VirtualBox.
>
> [YOCTO #7374]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>   meta/classes/boot-directdisk.bbclass |  3 ++-
>   meta/classes/image-vdi.bbclass       | 30 ++++++++++++++++++++++++++++++
>   meta/classes/image.bbclass           |  5 ++++-
>   meta/classes/image_types.bbclass     |  5 +++--
>   meta/classes/sanity.bbclass          |  4 ++++
>   meta/conf/documentation.conf         |  1 +
>   meta/lib/oe/image.py                 |  4 ++--
>   meta/recipes-devtools/qemu/qemu.inc  |  2 +-
>   8 files changed, 47 insertions(+), 7 deletions(-)
>   create mode 100644 meta/classes/image-vdi.bbclass
>
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 44f738b..d2727c4 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -64,6 +64,7 @@ SYSLINUX_ROOT ?= "root=/dev/sda2"
>   SYSLINUX_TIMEOUT ?= "10"
>
>   IS_VMDK = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
> +IS_VDI  = '${@bb.utils.contains("IMAGE_FSTYPES", "vdi",  "true", "false", d)}'
>
>   boot_direct_populate() {
>   	dest=$1
> @@ -101,7 +102,7 @@ build_boot_dd() {
>   		efi_hddimg_populate $HDDDIR
>   	fi
>
> -	if [ "${IS_VMDK}" = "true" ]; then
> +	if [ "${IS_VMDK}" = "true" ] || [ "${IS_VDI}" = "true" ]; then
>   		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
>   			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
>   			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
> diff --git a/meta/classes/image-vdi.bbclass b/meta/classes/image-vdi.bbclass
> new file mode 100644
> index 0000000..5a145a9
> --- /dev/null
> +++ b/meta/classes/image-vdi.bbclass
> @@ -0,0 +1,30 @@
> +
> +SYSLINUX_ROOT ?= "root=/dev/sda2"
> +SYSLINUX_PROMPT ?= "0"
> +SYSLINUX_TIMEOUT ?= "10"
> +SYSLINUX_LABELS = "boot"
> +LABELS_append = " ${SYSLINUX_LABELS} "
> +
> +# need to define the dependency and the ROOTFS for directdisk
> +do_bootdirectdisk[depends] += "${PN}:do_rootfs"
> +ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
> +
> +# creating VDI relies on having a hddimg so ensure we inherit it here.
> +inherit boot-directdisk
> +
> +IMAGE_TYPEDEP_vdi = "ext3"
> +IMAGE_TYPES_MASKED += "vdi"
> +
> +create_vdi_image () {
> +	qemu-img convert -O vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vdi
> +	ln -sf ${IMAGE_NAME}.vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vdi
> +}
> +
> +python do_vdiimg() {
> +        bb.build.exec_func('create_vdi_image', d)
> +}
> +
> +addtask vdiimg after do_bootdirectdisk before do_build
> +
> +do_vdiimg[depends] += "qemu-native:do_populate_sysroot"
> +

Is there any way that we can create a shared class for vmdk and vdi 
since the difference between the two classes is vmdk -> vdi?  Can this 
be a variable and/or parameter-ized some how?

I know it's a small class, but the code duplication could cause other 
problems down the line.

Sau!


> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index dc9bd80..578747f 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -127,11 +127,14 @@ def build_live(d):
>       return "image-live"
>
>   IMAGE_TYPE_live = "${@build_live(d)}"
> -
>   inherit ${IMAGE_TYPE_live}
> +
>   IMAGE_TYPE_vmdk = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
>   inherit ${IMAGE_TYPE_vmdk}
>
> +IMAGE_TYPE_vdi = '${@bb.utils.contains("IMAGE_FSTYPES", "vdi", "image-vdi", "", d)}'
> +inherit ${IMAGE_TYPE_vdi}
> +
>   python () {
>       deps = " " + imagetypes_getdepends(d)
>       d.appendVarFlag('do_rootfs', 'depends', deps)
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 72c7337..d86d108 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -13,7 +13,7 @@ def imagetypes_getdepends(d):
>       deps = []
>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>       for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
> -        if type in ["vmdk", "live", "iso", "hddimg"]:
> +        if type in ["vmdk", "vdi", "live", "iso", "hddimg"]:
>               type = "ext3"
>           basetype = type
>           for ctype in ctypes:
> @@ -155,6 +155,7 @@ IMAGE_TYPES = " \
>       tar tar.gz tar.bz2 tar.xz tar.lz4 \
>       cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>       vmdk \
> +    vdi \
>       elf \
>   "
>
> @@ -181,5 +182,5 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
>   IMAGE_EXTENSION_live = "hddimg iso"
>
>   # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
> -# images that will not be built at do_rootfs time: vmdk, hddimg, iso, etc.
> +# images that will not be built at do_rootfs time: vmdk, vdi, hddimg, iso, etc.
>   IMAGE_TYPES_MASKED ?= ""
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index cca39c9..3d4bae5 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -822,6 +822,10 @@ def check_sanity_everybuild(status, d):
>       # Check vmdk and live can't be built together.
>       if 'vmdk' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
>           status.addresult("Error, IMAGE_FSTYPES vmdk and live can't be built together\n")
> +
> +    # Check vdi and live can't be built together.
> +    if 'vdi' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
> +        status.addresult("Error, IMAGE_FSTYPES vdi and live can't be built together\n")
>
>   def check_sanity(sanity_data):
>       import subprocess
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 3a918e8..1305c32 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -58,6 +58,7 @@ do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the U-Boot bo
>   do_unpack[doc] = "Unpacks the source code into a working directory"
>   do_validate_branches[doc] = "Ensures that the source/meta branches are on the locations specified by their SRCREV values for a linux-yocto style kernel"
>   do_vmdkimg[doc] = "Creates a .vmdk image for use with VMware and compatible virtual machine hosts"
> +do_vdiimg[doc] = "Creates a .vdi image for use with VirtualBox and compatible virtual machine hosts"
>
>   # DESCRIPTIONS FOR VARIABLES #
>
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index 0ce303d..40f6151 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -66,7 +66,7 @@ class ImageDepGraph(object):
>           return graph
>
>       def _clean_graph(self):
> -        # Live and VMDK images will be processed via inheriting
> +        # Live and VMDK/VDI images will be processed via inheriting
>           # bbclass and does not get processed here. Remove them from the fstypes
>           # graph. Their dependencies are already added, so no worries here.
>           remove_list = (self.d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
> @@ -76,7 +76,7 @@ class ImageDepGraph(object):
>
>       def _image_base_type(self, type):
>           ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
> -        if type in ["vmdk", "live", "iso", "hddimg"]:
> +        if type in ["vmdk", "vdi", "live", "iso", "hddimg"]:
>               type = "ext3"
>           basetype = type
>           for ctype in ctypes:
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 4225db7..cbe9425 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -90,7 +90,7 @@ PACKAGECONFIG ??= " \
>   	fdt sdl alsa \
>   	${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen', '', d)} \
>   	"
> -PACKAGECONFIG_class-native ??= "fdt alsa"
> +PACKAGECONFIG_class-native ??= "fdt alsa uuid"
>   PACKAGECONFIG_class-nativesdk ??= "fdt sdl"
>   NATIVEDEPS = ""
>   NATIVEDEPS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxext-native', '',d)}"
>

