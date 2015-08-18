Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D3D0960043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:51:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Aug 2015 06:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,701,1432623600"; d="scan'208";a="786042432"
Received: from jburrows-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.34])
	by fmsmga002.fm.intel.com with ESMTP; 18 Aug 2015 06:51:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>,
	Randy Witt <randy.e.witt@intel.com>
Date: Tue, 18 Aug 2015 14:51:19 +0100
Message-ID: <1839307.RBueBEjXet@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <61284f2a7056896fb87e51be2ade7dd72528f442.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<61284f2a7056896fb87e51be2ade7dd72528f442.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Tue, 18 Aug 2015 13:51:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 August 2015 11:17:59 Chen Qi wrote:
> If we do `bitbake buildtools-tarball' and then after one day do `bitbake
> core-image-minimal -c populate_sdk_ext', we would meet errors like below.
> 
> | install: cannot stat
> | '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
> 
> poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalon
> e -1.8+snapshot-20150429.sh': No such file or directory
> 
> The problem is that the output name for buildtools-tarball has ${DATE} in
> it. So if populate_sdk_ext task is executed but buildtools-tarball is not
> rebuilt, the above error appears.
> 
> Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the
> install_tools() function, we should find the latest buildtools-tarball based
> on the modification time and install it.
> 
> [YOCTO #7674]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index a36bf16..b6725e0 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -169,7 +169,9 @@ install_tools() {
>  	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool
> ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool touch
> ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
> 
> -	install
> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKG
> ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh
> ${SDK_OUTPUT}/${SDKPATH} +	# find latest buildtools-tarball and install it
> +	buildtools_path=`ls -t1
> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKG
> ARCH}-buildtools-nativesdk-standalone-*.sh | head -n1` +	install
> $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
> 
>  	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2
> ${SDK_OUTPUT}/${SDKPATH} }

Hmm, it turns out there's another problem here - this assumes SDK_NAME is set 
as it is in poky. Perhaps we correct that in a follow-up patch though, but 
it'll be a little bit tricky as it'll need to be done by getting the actual 
value of SDK_NAME as it would have been when IMAGE_BASENAME is "buildtools-
tarball".

The more I think about this though the more I wonder why we're bothering with 
buildtools instead of just bundling its contents inside the native part of the 
extensible SDK itself. Randy can you remind me why we did it that way?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

