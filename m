Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F41AF60797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 22:54:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 28 Dec 2016 14:54:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,423,1477983600"; d="scan'208";a="1105393131"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2016 14:54:40 -0800
Message-ID: <1482965680.106950.67.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 28 Dec 2016 14:54:40 -0800
In-Reply-To: <12e72d8f27d856bcc2007ca5226a693a68fe2ae0.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<12e72d8f27d856bcc2007ca5226a693a68fe2ae0.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Wed, 28 Dec 2016 22:54:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> The recipe now compiles OVMF twice, once without Secure Boot, once
> with. This is the same approach as in
> https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/edk2.spec

Besides the fact that Fedora does it, is there a particular reason to
build twice? On my side, I am able to build with secure boot with a
single build. Also, the Ubuntu documentation does not mention that two
builds are needed [1].

I do see that in Fedora, the build parameters change. OVMF without
secure boot support is built with -a X64 -p OvmfPkg/OvmfPkgX64.dsc while
OVMF with secure boot support is built with -a IA32 -a X64 -p
OvmfPkg/OvmfPkgIa32X64.dsc. Perhaps this is the reason?
> 
> The results are "ovmf.qcow2" and "ovmf.secboot.qcow2" in the
> image deploy directory, so
>   runqemu <machine> <image> ovmf.secboot
> will boot with Secure Boot enabled.
> 
> In contrast to Fedora, no attempt is made to strip potentially patent
> encumbered algorithms out of the OpenSSL archive. OVMF does not use
> the ones considered problematic for Fedora, so this shouldn't be a
> problem.
> 
> Fixes: luv-yocto/#38

Also, I think it would be nice if we could choose between to not have
secure boot at all for OVMF. Maybe this could be achieved by having a
common ovmf.inc and two ovmf_git.bb and ovmf_sb_git.bb with the
different the specific things to support secure boot or not. Maybe all
that is needed in the secure boot recipe are the extra variables for
OpenSSL and a prepend to do_compile_class-target with the OpenSSL
patching. Something to ponder.


> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 67e65b8..c4eedf0 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
>  HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
> -LICENSE = "BSD"
> +LICENSE = "BSD & OpenSSL"
>  LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=343dc88e82ff33d042074f62050c3496"
>  
>  SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
> @@ -10,7 +10,13 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
>  	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
>          "
>  
> +SRC_URI_append_class-target = " \
> +	http://www.openssl.org/source/openssl-1.0.2j.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib \
> +"
> +
>  SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
> +SRC_URI[openssl.md5sum] = "96322138f0b69e61b7212bc53d5e912b"
> +SRC_URI[openssl.sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
>  
>  PARALLEL_MAKE_class-native = ""
>  
> @@ -30,6 +36,10 @@ BUILD_OPTIMIZATION="-pipe"
>  # OVMF supports IA only, although it could conceivably support ARM someday.
>  COMPATIBLE_HOST='(i.86|x86_64).*'
>  
> +# Additional build flags for OVMF with Secure Boot.
> +# Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
> +OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE"
> +
>  do_patch_append_class-native() {
>      bb.build.exec_func('do_fix_iasl', d)
>      bb.build.exec_func('do_fix_toolchain', d)
> @@ -110,8 +120,22 @@ do_compile_class-target() {
>      bbnote FIXED_GCCVER is ${FIXED_GCCVER}
>      build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
>  
> +    bbnote "Building without Secure Boot."
> +    rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
>      ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
>      ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
> +
> +    # See CryptoPkg/Library/OpensslLib/Patch-HOWTO.txt and
> +    # https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/ for
> +    # building with Secure Boot enabled.
> +    bbnote "Building with Secure Boot."
> +    rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
> +    if ! [ -f ${S}/CryptoPkg/Library/OpensslLib/openssl-*/edk2-patch-applied ]; then
> +        ( cd ${S}/CryptoPkg/Library/OpensslLib/openssl-* && patch -p1 <$(echo ../EDKII_openssl-*.patch) && touch edk2-patch-applied )
> +    fi
> +    ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
> +    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
> +    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.secboot.fd

At this point both ${WORKDIR}/ovmf/OVMF.secboot.fd and
${WORKDIR}/ovmf/OVMF.fd will be linked to the same OVMF.fd with secure
boot support. Maybe this could be fixed by copying the files rather than
creating a symbolic link.

>  }
>  
>  do_install_class-native() {
> @@ -131,6 +155,7 @@ do_deploy() {
>  do_deploy_class-target() {
>      # For use with "runqemu ovmf".
>      qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.fd ${DEPLOYDIR}/ovmf.qcow2
> +    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.secboot.fd ${DEPLOYDIR}/ovmf.secboot.qcow2

In the same line as my previous comment, these two images will have
secure boot support.

Thanks and BR,
Ricardo

[1]. https://wiki.ubuntu.com/UEFI/EDK2
>  }
>  addtask do_deploy after do_compile before do_build
>  
> -- 
> 2.1.4
> 



