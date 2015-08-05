Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id ABE5A6E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:20:11 +0000 (UTC)
Received: by ykoo205 with SMTP id o205so24502300yko.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZBITKtrwpcpmJMVMtNN7uFcxnAg7kd/AxKlI/Iuwre4=;
	b=aAmvye1V0i+jb6zKC0O6gs+3aqgyo+tD00XQ3VkttC9i3bMRvhwitnDRrD6HbO00UO
	4ug7uJOEz4TnxLLSo3i1DYppsagOkayiwzRgCjglRbR2rrXRs3Mtga6aADya3ahWjcxB
	fcdFtIkBaXrSHcqY8tTgcxyzmfNPQdAy1fapsx83hSabxBpd8AvGGDxaFPPm0IMFu13Q
	wXhZ2MJ7rXkeZrfRcAbVxIBp44dn3PaQ4WejnMTmeDL/FvZYuBsu4YxWMDjdmwy0QN73
	hTJHEspplkKg1R+GhQMH38zbAapgjP2JC13O6ZcecsG/iYwS9ryJ8/SEa+kdzgzGhj00
	8nxQ==
MIME-Version: 1.0
X-Received: by 10.129.130.69 with SMTP id s66mr7113946ywf.62.1438741211635;
	Tue, 04 Aug 2015 19:20:11 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 4 Aug 2015 19:20:11 -0700 (PDT)
In-Reply-To: <1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
Date: Tue, 4 Aug 2015 23:20:11 -0300
Message-ID: <CADkTA4N6M5nnq9Y_eSKKdotUCNkPfpJBLuu5dZnwWSdszVgxuQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel-headers: linux kernel headers
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
X-List-Received-Date: Wed, 05 Aug 2015 02:20:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 3, 2015 at 5:35 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> Header files and scripts for building modules for Linux kernel.
>
> A set of files is needed to allow building new Linux kernel modules
> against an already installed Linux kernel. The files include various
> header files, script files, Makefiles, source code files for several
> utility programs and Linux kerenl .config file.

We already have our kernel devsrc packages. This is simply creating more
copies of the same functionality.

If you have issues with devsrc .. why aren't you fixing it ? It certainly
shouldn't be left as is, while introducing something new.

Bruce

>
> The files may be needed by programs such as:
>     dkms, nvidia-304xx-dkms, virtualbox, acpi_call, audit,
>     bbswitch, ipsec-tools, nvidia-304xx, nvidia-340xx, openssh,
>     r8168, rt3562sta, sysprof, tp_smapi, vhba-module, kmod, ...
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-kernel/linux/kernel-headers.bb | 66 +++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/kernel-headers.bb
>
> diff --git a/meta/recipes-kernel/linux/kernel-headers.bb b/meta/recipes-kernel/linux/kernel-headers.bb
> new file mode 100644
> index 0000000..4be5153
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/kernel-headers.bb
> @@ -0,0 +1,66 @@
> +SUMMARY = "Linux kernel headers"
> +DESCRIPTION = "Files needed to allow building Linux kernel modules against the installed Linux kernel."
> +
> +SECTION = "kernel"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +inherit module-base linux-kernel-base
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +
> +# Install the files once the kernel is done with them.
> +do_install[depends] += "virtual/kernel:do_compile"
> +do_install[depends] += "virtual/kernel:do_populate_sysroot"
> +
> +# Only install is needed
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"
> +
> +S = "${STAGING_KERNEL_DIR}"
> +
> +do_install() {
> +        kerneldir=${D}/lib/modules/${KERNEL_VERSION}/build
> +        install -d $kerneldir
> +
> +        cp -a  ${STAGING_KERNEL_BUILDDIR}/.config $kerneldir
> +        cp -aR ${STAGING_KERNEL_BUILDDIR}/include $kerneldir
> +        cp -aR ${STAGING_KERNEL_BUILDDIR}/arch $kerneldir
> +
> +        cd ${S}
> +
> +        rsync -avm \
> +        --include="*/" \
> +        --include="Makefile*" \
> +        --include="Kconfig*" \
> +        --include="Kbuild*" \
> +        --include="Module.symvers" \
> +        --include=".config" \
> +        --include="*.h" \
> +        --exclude="*" \
> +        . $kerneldir
> +
> +        rsync -avm \
> +        --exclude="*.o"  \
> +        --exclude=".debug" \
> +        ./scripts $kerneldir
> +
> +        # As of Linux kernel version 3.0.1, the clean target removes
> +        # arch/powerpc/lib/crtsavres.o which is present in
> +        # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
> +        if [ ${ARCH} = "powerpc" ]; then
> +                mkdir -p $kerneldir/arch/powerpc/lib/
> +                cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
> +        fi
> +}
> +
> +PACKAGES = "${PN}"
> +FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/build/"
> +RDEPENDS_${PN} = "python bash gawk perl"
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

