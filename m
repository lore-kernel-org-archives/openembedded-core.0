Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C456260034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:43:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0TEhJeZ021646
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Jan 2015 06:43:20 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 29 Jan 2015 06:43:19 -0800
Message-ID: <54CA46F0.2030506@windriver.com>
Date: Thu, 29 Jan 2015 09:42:56 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1422542108.5312.5.camel@linuxfoundation.org>
In-Reply-To: <1422542108.5312.5.camel@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] kernel: Fix depmod for multilib
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
X-List-Received-Date: Thu, 29 Jan 2015 14:43:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-01-29 09:35 AM, Richard Purdie wrote:
> Using populate_sysroot for this data was a nice idea but flawed as it
> doesn't work in multilib builds. Instead we can use PKGDATA_DIR since
> this is consistent over multilib builds. It also turns out to be
> slightly neater code too. Hopefully this resolves the problem once and
> for all.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 29498b4..125ed88 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -231,16 +231,20 @@ kernel_do_install() {
>   	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>   	install -d ${D}${sysconfdir}/modules-load.d
>   	install -d ${D}${sysconfdir}/modprobe.d
> -
> -	# Stash data for depmod
> -	install -d ${D}${datadir}/kernel-depmod/
> -	echo "${KERNEL_VERSION}" > ${D}${datadir}/kernel-depmod/kernel-abiversion
> -	cp System.map ${D}${datadir}/kernel-depmod/System.map-${KERNEL_VERSION}
>   }
>   do_install[prefuncs] += "package_get_auto_pr"
>
>   addtask shared_workdir after do_compile before do_install
>
> +emit_depmod_pkgdata() {
> +	# Stash data for depmod
> +	install -d ${PKGDESTWORK}/kernel-depmod/
> +	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
> +	cp System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
> +}
> +
> +PACKAGEFUNCS += "emit_depmod_pkgdata"
> +
>   do_shared_workdir () {
>   	cd ${B}
>
> @@ -285,21 +289,13 @@ do_shared_workdir () {
>   	fi
>   }
>
> -# Only stage the files we need for depmod, not the modules/firmware
> +# We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
>   sysroot_stage_all () {
> -	sysroot_stage_dir ${D}${datadir}/kernel-depmod ${SYSROOT_DESTDIR}${datadir}/kernel-depmod
> +	:

And we keep this empty staging routine around, to ensure that the
base package stage functions doen't expand and stage parts that we
don't want, and trigger that conflict ? I'm just stating that to try
and make sure I understand this, and don't try to remove the routine
in the future :)

Everthing else seems sane to me, and a grep didn't find me any other
obvious PKGDATA_DIR switches.

Cheers,

Bruce


>   }
>
>   KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
>
> -PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
> -
> -kernel_package_preprocess () {
> -    rm -rf ${PKGD}${datadir}/kernel-depmod
> -    rmdir ${PKGD}${datadir}
> -    rmdir ${PKGD}${exec_prefix}
> -}
> -
>   kernel_do_configure() {
>   	# fixes extra + in /lib/modules/2.6.37+
>   	# $ scripts/setlocalversion . => +
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 0665e0c..5ab81a1 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -211,7 +211,7 @@ class Rootfs(object):
>                                     'new', '-v'])
>
>       def _generate_kernel_module_deps(self):
> -        kernel_abi_ver_file = oe.path.join(self.d.getVar('STAGING_DIR_TARGET', True), self.d.getVar('datadir', True), "kernel-depmod",
> +        kernel_abi_ver_file = oe.path.join(self.d.getVar('PKGDATA_DIR', True), "kernel-depmod",
>                                              'kernel-abiversion')
>           if not os.path.exists(kernel_abi_ver_file):
>               bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index 83a382a..44b7650 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -19,21 +19,21 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>       echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>       exit 1
>   fi
> -if [ ! -r ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion ]; then
> -    echo "Unable to read: ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion" >&2
> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
> +    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" >&2
>   else
> -    kernelabi=\$(cat ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion)
> +    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
>       if [ "\$kernelabi" != "\$4" ]; then
>           echo "Error: Kernel version \$4 does not match kernel-abiversion (\$kernelabi)" >&2
>           exit 1
>       fi
>   fi
>
> -if [ ! -r ${STAGING_DIR_TARHET}${datadir}/kernel-depmod/System.map-\$4 ]; then
> -    echo "Unable to read: ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/System.map-\$4" >&2
> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
> +    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
>       exec env depmod "\$1" "\$2" "\$3" "\$4"
>   else
> -    exec env depmod "\$1" "\$2" "\$3" -F "${STAGING_DIR_TARGET}${datadir}/kernel-depmod/System.map-\$4" "\$4"
> +    exec env depmod "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
>   fi
>   EOF
>   	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
>
>


