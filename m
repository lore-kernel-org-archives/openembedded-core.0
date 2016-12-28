Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4864B600BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 21:38:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 28 Dec 2016 13:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,423,1477983600"; d="scan'208";a="1087599027"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2016 13:38:44 -0800
Message-ID: <1482961124.106950.55.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 28 Dec 2016 13:38:44 -0800
In-Reply-To: <ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Wed, 28 Dec 2016 21:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> When used with '-drive if=pflash', qemu will store UEFI variables
> inside the firmware image file. That is unexpected for a file located in
> the sysroot, which should be read-only, while it is normal for image
> files in the deploy/images directory. Therefore that directory is a
> better place for use with runqemu.
> 
> The name was chose so that "runqemu ovmf" can be used as shorthand for
> "runqemu <full path>/ovmf.qcow2" by treating "ovmf" as the base name
> of the BIOS file. "ovmf_secboot.qcow2" is meant to be used for the
> Secure Boot enabled BIOS. qcow2 is used because it is needed for
> "savevm" snapshots of a virtual machine.
> 
> Alternatively, OVMF_CODE.fd (read-only) and OVMF_VARS.fd (read/write)
> could be used. That would then allow updating the firmware of an
> existing machine without wiping out the variables set
> earlier. Configuring that in qemu would be more complicated, so for
> now the simpler approach with combined code and variable store is
> used.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 13b583b..d0441d1 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -16,7 +16,7 @@ PARALLEL_MAKE = ""
>  
>  S = "${WORKDIR}/git"
>  
> -DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
> +DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native qemu-native"
>  
>  DEPENDS_class-target="ovmf-native"
>  
> @@ -97,9 +97,20 @@ do_compile_class-target() {
>          OVMF_ARCH="IA32"
>      fi
>  
> +    # ${WORKDIR}/ovmf is a well-known location where do_install and
> +    # do_deploy will be able to find the files.
> +    rm -rf ${WORKDIR}/ovmf
> +    mkdir ${WORKDIR}/ovmf
> +    OVMF_DIR_SUFFIX="X64"
> +    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
> +        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
> +    fi
>      FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
> -    echo FIXED_GCCVER is ${FIXED_GCCVER}
> +    bbnote FIXED_GCCVER is ${FIXED_GCCVER}
> +    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
> +
>      ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
> +    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
>  }
>  
>  do_install_class-native() {
> @@ -108,16 +119,18 @@ do_install_class-native() {
>  }
>  
>  do_install_class-target() {
> -    OVMF_DIR_SUFFIX="X64"
> -    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
> -        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
> -    fi
> +    # Traditional location.
>      install -d ${D}${datadir}/ovmf
> +    install -m 0755 ${WORKDIR}/ovmf/OVMF.fd ${D}${datadir}/ovmf/bios.bin

Now that I think about it. Installing here does not sever any purpose.
Thus, I think this can be removed by perhaps doing do_install[noexec] =
"1"

> +}
>  
> -    FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
> -    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
> -    install -m 0755 ${build_dir}/FV/OVMF.fd \
> -	${D}${datadir}/ovmf/bios.bin
> +inherit deploy

I am not sure if there is a right way for inheriting in bitbake.
However, a quick grep -n inherit reveals that the majority of the
recipes put their inheritances towards the top of the recipe.

Thanks and BR,
Ricardo
> +do_deploy() {
> +}
> +do_deploy_class-target() {
> +    # For use with "runqemu ovmf".
> +    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.fd ${DEPLOYDIR}/ovmf.qcow2
>  }
> +addtask do_deploy after do_compile before do_build
>  
>  BBCLASSEXTEND = "native"



