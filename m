Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 984CC728FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:52:13 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6B431F811FE; Fri, 19 Dec 2014 10:52:14 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 48F99F811E3;
	Fri, 19 Dec 2014 10:52:12 -0700 (MST)
Message-ID: <549465D3.6060306@mlbassoc.com>
Date: Fri, 19 Dec 2014 10:52:19 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1419011187.13316.27.camel@linuxfoundation.org>
In-Reply-To: <1419011187.13316.27.camel@linuxfoundation.org>
Subject: Re: [PATCH] kernel: Fix non linux-yocto builds
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
X-List-Received-Date: Fri, 19 Dec 2014 17:52:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-19 10:46, Richard Purdie wrote:
> After the recent kernel changes, non linux-yocto builds stopped working
> properly for two reasons:
>
> a) ${S} was being reset to ${WORKDIR}/git for example and STAGING_KERNEL_DIR
>     did not contain the source
>
> b) Most builds were using ${B} == ${S}
>
> This patch adds a fixup to the unpack function to handle the case where
> ${S} != ${STAGING_KERNEL_DIR} and also set up the infrastrcture so that
> B != S for kernel builds from now on. The kernel build system is one of the
> best for supporting this and there is no good reason to take advantage of it.
                                                       ^not to^

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 94b5661..9a77a8a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -3,9 +3,10 @@ inherit linux-kernel-base kernel-module-split
>   PROVIDES += "virtual/kernel"
>   DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
>
> -S = "${STAGING_DIR_TARGET}/${KERNEL_SRC_PATH}"
> -
> -do_unpack[cleandirs] = "${S}"
> +S = "${STAGING_KERNEL_DIR}"
> +B = "${WORKDIR}/build"
> +KBUILD_OUTPUT = "${B}"
> +OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>
>   # we include gcc above, we dont need virtual/libc
>   INHIBIT_DEFAULT_DEPS = "1"
> @@ -35,6 +36,22 @@ python __anonymous () {
>           d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>   }
>
> +# Old style kernels may set ${S} = ${WORKDIR}/git for example
> +# We need to move these over to STAGING_KERNEL_DIR. We can't just
> +# create the symlink in advance as the git fetcher can't cope with
> +# the symlink.
> +do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR}"
> +base_do_unpack_append () {
> +    s = d.getVar("S", True)
> +    kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
> +    if s != kernsrc:
> +        bb.utils.mkdirhier(kernsrc)
> +        bb.utils.remove(kernsrc, recurse=True)
> +        import subprocess
> +        subprocess.call(d.expand("mv ${S} ${STAGING_KERNEL_DIR}"), shell=True)
> +        os.symlink(kernsrc, s)
> +}
> +
>   inherit kernel-arch deploy
>
>   PACKAGES_DYNAMIC += "^kernel-module-.*"
> @@ -255,7 +272,7 @@ python sysroot_stage_all () {
>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>   }
>
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call oldnoconfig || yes '' | oe_runmake oldconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake oldconfig"
>
>   kernel_do_configure() {
>   	# fixes extra + in /lib/modules/2.6.37+
> @@ -264,6 +281,10 @@ kernel_do_configure() {
>   	# $ make kernelrelease => 2.6.37+
>   	touch ${B}/.scmversion ${S}/.scmversion
>
> +	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
> +		mv "${S}/.config" "${B}/.config"
> +	fi
> +
>   	# Copy defconfig to .config if .config does not exist. This allows
>   	# recipes to manage the .config themselves in do_configure_prepend().
>   	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

