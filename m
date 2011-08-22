Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qvcao-0007ux-D0
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:03:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 14:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40743140"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 14:58:52 -0700
Message-ID: <4E52D11B.6020603@linux.intel.com>
Date: Mon, 22 Aug 2011 14:58:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<7fbda567f12cd48df2dc292b370109681ce39cfb.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <7fbda567f12cd48df2dc292b370109681ce39cfb.1313816148.git.otavio@ossystems.com.br>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 5/8] fix SDK building due TARGET_ARCH use in installation path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2011 22:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 09:58 PM, Otavio Salvador wrote:
> TARGET_ARCH makes the building too fragile since it changes during
> building of target and nativesdk binaries thus making it difficult to
> handle a proper path for installation of binaries. The fix for it is
> to move it to toolchain tarball name.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/classes/populate_sdk.bbclass |    2 +-
>   meta/conf/bitbake.conf            |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
> index 0f3591b..929f730 100644
> --- a/meta/classes/populate_sdk.bbclass
> +++ b/meta/classes/populate_sdk.bbclass
> @@ -9,7 +9,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
>
>   TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>   TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
> -TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
> +TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${SDK_ARCH}-${TARGET_ARCH}-toolchain-${DISTRO_VERSION}"
>
>   RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>   DEPENDS = "virtual/fakeroot-native sed-native"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b309516..b5c6696 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -361,7 +361,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>
>   PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
>
> -SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> +SDK_NAME = "oecore-sdk-${DISTRO}"
>   SDKPATH = "/usr/local/${SDK_NAME}"
>   SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>
This is the same set that has been rejected before.

I think this has been discussed before between Richard and Koen, Koen 
was going to look into a variation that Richard suggested, I am not sure 
if Koen has replied to that email (from back in early July).

Sau!


