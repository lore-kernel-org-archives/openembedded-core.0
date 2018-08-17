Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 927D679362
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 21:30:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7HLUJaK023342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 17 Aug 2018 22:30:21 +0100
Message-ID: <3baf10fc85c46ee6ada3f4a93b004195a0f4fd10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 22:30:19 +0100
In-Reply-To: <20180817085427.8557-1-zhixiong.chi@windriver.com>
References: <20180817085427.8557-1-zhixiong.chi@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] populate_sdk_base: only depend on nativesdk-glibc-locale when SDK_OS is not mingw32
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
X-List-Received-Date: Fri, 17 Aug 2018 21:30:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-17 at 01:54 -0700, Zhixiong Chi wrote:
> When we add the nativesdk-glibc-locale dependence for libc-glibc, if
> the SDK_OS
> is mingw32, it will broken the building with the following error:
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'nativesdk-glibc' (but
> > virtual:nativesdk:layers/oe-core/meta/recipes-core/glibc/glibc-
> > locale_2.24.bb
> > RDEPENDS on or otherwise requires it)
> > ERROR: nativesdk-glibc was skipped:
> > PREFERRED_PROVIDER_virtual/nativesdk-libc set to nativesdk-mingw-
> > w64-runtime, not nativesdk-glibc
> > NOTE: Runtime target 'nativesdk-glibc' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['nativesdk-glibc']
> > ERROR: Required build target 'meta-toolchain' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['meta-toolchain',
> > 'nativesdk-glibc-locale', 'nativesdk-glibc']
> 
> mingw32 SDK_OS doesn't need to depend on nativesdk-glibc-locale.
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index c456c52866..65c27b0077 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -48,7 +48,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>  SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>  SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
>  PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
> -SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
> +SDK_DEPENDS_append_libc-glibc = " ${@bb.utils.contains('SDK_OS', 'mingw32', '', 'nativesdk-glibc-locale', d)}"
>  
>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
>  # could be set to the MACHINE_ARCH

I appreciate this fixes a specific problem but this code is wrong
anyway, libc-glibc is a target override and we're talking about the sdk
 here. To illustrate, if a target image was musl based but the sdk
glibc based, this code wouldn't work.

Could we therefore correct this to correctly determine which libc is
being used in the SDK? If we're going to fix it, lets fix it
properly...

Cheers,

Richard





