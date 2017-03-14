Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EA78C6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 07:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2E7Vv8m029010; Tue, 14 Mar 2017 07:31:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kCfVuvhsUnEt; Tue, 14 Mar 2017 07:31:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2E7Vsp2029006
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2017 07:31:55 GMT
Message-ID: <1489476714.13980.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 07:31:54 +0000
In-Reply-To: <1489507238-3384-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1489507238-3384-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [jethro][PATCH] sdk: arm toolchain patch for multilib
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
X-List-Received-Date: Tue, 14 Mar 2017 07:32:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-15 at 00:00 +0800, zhengrq wrote:
>   The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,this
> makes multilib sdk doesn't work, for example:
> 
>   MACHINE = qemuarm64
>   require conf/multilib.conf
>   MULTILIBS = "multilib:lib32"
>   DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
> 
>   $ bitbake core-image-minimal -cpopulate_sdk
> 
>   Then extract SDK, the environment-setup-armv7a-vfp-neon-
> pokymllib32-linux-gnueabi doesn't work since:
>   * The CC is arm-pokymllib32-linux-gnueabi-gcc which doesn't exist,
> the patch for cross-canadian.bbclass fixes problem.
>   * Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi
> which doesn't exist, the patch for libgcc-common.inc fixes the
> problem.
> 
>   [YOCTO #8616]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

I'm not seeing any patch in master which sets GNUEABI_SUFFIX unless I'm
missing something?

Which patch are you backporting to jethro here?

Don't you really want http://git.yoctoproject.org/cgit.cgi/poky/commit/
?id=b6253350fb86d8e54792905342a5892af570d526 ?

and perhaps you mean #8642 or #10054?

Cheers,

Richard

>  meta/classes/cross-canadian.bbclass         |  3 +++
>  meta/recipes-devtools/gcc/libgcc-common.inc | 25 ++++++++++++++++++-
> ------
>  meta/recipes-devtools/gcc/libgcc.inc        |  2 +-
>  3 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/cross-canadian.bbclass
> b/meta/classes/cross-canadian.bbclass
> index ea17f09..458185d 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -18,6 +18,7 @@ PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
>  CANADIANEXTRAOS = "linux-uclibc linux-musl"
>  CANADIANEXTRAVENDOR = ""
>  MODIFYTOS ??= "1"
> +GNUEABI_SUFFIX = ""
>  python () {
>      archs = d.getVar('PACKAGE_ARCHS', True).split()
>      sdkarchs = []
> @@ -69,6 +70,7 @@ python () {
>          d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-
> uclibcn32 linux-musln32")
>      if tarch == "arm" or tarch == "armeb":
>          d.setVar("TARGET_OS", "linux-gnueabi")
> +        d.setVar("GNUEABI_SUFFIX", "-gnueabi")
>      else:
>          d.setVar("TARGET_OS", "linux")
>  
> @@ -167,6 +169,7 @@ SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-
> shlibs2"
>  cross_canadian_bindirlinks () {
>  	for i in linux ${CANADIANEXTRAOS}
>  	do
> +                i="$i${GNUEABI_SUFFIX}"
>  		for v in ${CANADIANEXTRAVENDOR}
>  		do
>  			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
> b/meta/recipes-devtools/gcc/libgcc-common.inc
> index b09ea65..46f8cfd 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -134,11 +134,22 @@ BASETARGET_SYS =
> "${TARGET_ARCH}${ORIG_TARGET_VENDOROS}"
>  
>  addtask extra_symlinks after do_multilib_install before do_package
> do_populate_sysroot
>  fakeroot python do_extra_symlinks() {
> -    targetsys = d.getVar('BASETARGET_SYS', True)
> -
> -    if targetsys != d.getVar('TARGET_SYS', True):
> -        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/'
> + targetsys
> -        src = d.getVar('TARGET_SYS', True)
> -        if not os.path.lexists(dest) and
> os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
> -            os.symlink(src, dest)
> +    base_targetsys = d.getVar('BASETARGET_SYS', True)
> +    targetsys = d.getVar('TARGET_SYS', True)
> +
> +    if base_targetsys != targetsys:
> +        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/'
> + base_targetsys
> +        dest_list = [dest]
> +        # For multilib like aarch64 + arm, need 2 symlinks:
> +        # 1) BASETARGET_SYS as usual
> +        # 2) BASETARGET_SYS + "-gnueabi" for multilib
> +        libce = d.getVar('LIBCEXTENSION', True)
> +        abie = d.getVar('ABIEXTENSION', True)
> +        if abie and libce and targetsys.endswith(libce + abie):
> +            dest_list.append(dest + libce + abie)
> +        src = targetsys
> +        for dir in dest_list:
> +            if not os.path.lexists(dir) and
> os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
> +                os.symlink(src, dir)
>  }
> +
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-
> devtools/gcc/libgcc.inc
> index 95fa3f4..f6a0a8c 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -17,7 +17,7 @@ LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
>  
>  FILES_${PN}-dev = "\
>      ${base_libdir}/libgcc*.so \
> -    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '',
> '${libdir}/${BASETARGET_SYS}', d)} \
> +    ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '',
> '${libdir}/${BASETARGET_SYS}*', d)} \
>      ${libdir}/${TARGET_SYS}/${BINV}* \
>  "
>  
> -- 
> 2.7.4
> 
> 
> 

