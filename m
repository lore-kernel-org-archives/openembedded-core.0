Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 43A997169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:58:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 29 Apr 2015 01:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,670,1422950400"; d="scan'208";a="702585420"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2015 01:58:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 29 Apr 2015 09:58:42 +0100
Message-ID: <3660887.yGCeB9zHDt@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <203a7291ad8678391e4cf6d7785cb22e23ea43de.1430294879.git.Qi.Chen@windriver.com>
References: <cover.1430294879.git.Qi.Chen@windriver.com>
	<203a7291ad8678391e4cf6d7785cb22e23ea43de.1430294879.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 29 Apr 2015 08:58:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 April 2015 16:08:37 Chen Qi wrote:
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
>  meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index 7925ece..0e4ee31 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -188,7 +188,17 @@ install_tools() {
>  	ln -sr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool
> ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool touch
> ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
> 
> -	install
> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKG
> ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh
> ${SDK_OUTPUT}/${SDKPATH} +	# find latest buildtools-tarball and install it
> +	maxseconds=0
> +	buildtools_path=""
> +	for f in `ls
> ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKG
> ARCH}-buildtools-nativesdk-standalone-*.sh`; do +		seconds=`stat -c 
"%Y" $f`
> +		if [ $seconds -gt $maxseconds ]; then
> +			maxseconds=$seconds
> +			buildtools_path="$f"
> +		fi
> +	done
> +	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}

Surely it would be simpler to just `ls -t ... | head -n1` ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

