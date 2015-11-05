Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5254770EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 01:48:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA51m3V3001461
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Nov 2015 17:48:03 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 4 Nov 2015 17:48:03 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1446645475.git.liezhi.yang@windriver.com>
	<3da4fc0c20bf2ab7ac4c489aaa37d707e769d6c3.1446645475.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <563AB551.3090305@windriver.com>
Date: Thu, 5 Nov 2015 09:48:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <3da4fc0c20bf2ab7ac4c489aaa37d707e769d6c3.1446645475.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Thu, 05 Nov 2015 01:48:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/04/2015 09:58 PM, Robert Yang wrote:
> The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
> this makes multilib sdk doesn't work, for example:
>
> MACHINE = qemuarm64
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>
> $ bitbake core-image-minimal -cpopulate_sdk
>
> Then extract SDK, the
> environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi
> doesn't work since:
> * The CC is arm-pokymllib32-linux-gnueabi-gcc
>    which doesn't exist, the patch for cross-canadian.bbclass
>    fixes problem.
> * Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi
>    which doesn't exist, the patch for libgcc-common.inc fixes the
>    problem.
>
> [YOCTO #8616]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/cross-canadian.bbclass         |    3 +++
>   meta/recipes-devtools/gcc/libgcc-common.inc |   24 +++++++++++++++++-------
>   meta/recipes-devtools/gcc/libgcc.inc        |    2 +-
>   3 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> index ea17f09..bf016de 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -18,6 +18,7 @@ PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
>   CANADIANEXTRAOS = "linux-uclibc linux-musl"
>   CANADIANEXTRAVENDOR = ""
>   MODIFYTOS ??= "1"
> +GNUEABI_SUFFIX = ""
>   python () {
>       archs = d.getVar('PACKAGE_ARCHS', True).split()
>       sdkarchs = []
> @@ -69,6 +70,7 @@ python () {
>           d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
>       if tarch == "arm" or tarch == "armeb":
>           d.setVar("TARGET_OS", "linux-gnueabi")
> +        d.setVar("GNUEABI_SUFFIX", "-gnueabi")
>       else:
>           d.setVar("TARGET_OS", "linux")
>
> @@ -167,6 +169,7 @@ SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs2"
>   cross_canadian_bindirlinks () {
>   	for i in linux ${CANADIANEXTRAOS}
>   	do
> +		i="$i${GNUEABI_SUFFIX}"
>   		for v in ${CANADIANEXTRAVENDOR}
>   		do
>   			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
> index b09ea65..71e09d8 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -134,11 +134,21 @@ BASETARGET_SYS = "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
>
>   addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
>   fakeroot python do_extra_symlinks() {
> -    targetsys = d.getVar('BASETARGET_SYS', True)
> -
> -    if targetsys != d.getVar('TARGET_SYS', True):
> -        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsys
> -        src = d.getVar('TARGET_SYS', True)
> -        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
> -            os.symlink(src, dest)
> +    base_targetsys = d.getVar('BASETARGET_SYS', True)
> +    targetsys = d.getVar('TARGET_SYS', True)
> +
> +    if base_targetsys != targetsys:
> +        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + base_targetsys
> +        dest_list = [dest]
> +        # For multilib like aarch64 + arm, need 2 symlinks:
> +        # 1) BASETARGET_SYS as usual
> +        # 2) BASETARGET_SYS + "-gnueabi" for multilib
> +        libce = d.getVar('LIBCEXTENSION', True)
> +        abie = d.getVar('ABIEXTENSION', True)
> +        if abie and libce and targetsys.endswith(libce + abie):
> +            dest_list.append(dest + libce + abie)
> +        src = targetsys
> +        for dir in dest_list:
> +            if not os.path.lexists(dir) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
> +                os.symlink(src, dir)
>   }
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> index 95fa3f4..94cde2e 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -17,7 +17,7 @@ LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
>
>   FILES_${PN}-dev = "\
>       ${base_libdir}/libgcc*.so \
> -    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
> +    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)}* \

The "*" should be after ${libdir}/${BASETARGET_SYS} rather than in the end,
I updated it in the repo.

// Robert

>       ${libdir}/${TARGET_SYS}/${BINV}* \
>   "
>
>

