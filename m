Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLylO-00057A-0g for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 16:27:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEOJeT020235;
	Mon, 16 May 2011 15:24:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20015-04; Mon, 16 May 2011 15:24:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEOEag020229
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 May 2011 15:24:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <51c904d03751c96d848617bb425f85635c33be87.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
	<51c904d03751c96d848617bb425f85635c33be87.1305422996.git.sgw@linux.intel.com>
Date: Mon, 16 May 2011 15:24:13 +0100
Message-ID: <1305555853.3424.78.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 09/15] bitbake.conf: move VENDOR variables from bitbake.conf to defaultsetup.conf
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
X-List-Received-Date: Mon, 16 May 2011 14:27:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
> 
> * empty TARGET_VENDOR was set before weak assignment in defaultsetup.conf
> * -oecore was changed to -oe to be more consistent with SDK_VENDOR as we had -oesdk as SDK_VENDOR and not -oecoresdk
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I know I probably indicated otherwise but looking at this patch, I think
moving all these entries into distrosetup.conf is not desirable. The
real issue here is the default:

TARGET_VENDOR = "${BUILD_VENDOR}"

which when you think about it doesn't actually make much sense. I'm
happy for the default just to become:

TARGET_VENDOR = "-oe"

in bitbake.conf.

Cheers,

Richard


> ---
>  meta/conf/bitbake.conf             |    4 ----
>  meta/conf/distro/defaultsetup.conf |    5 ++++-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7c72de1..418a15d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -62,7 +62,6 @@ target_datadir := "${datadir}"
>  
>  BUILD_ARCH = "${@os.uname()[4]}"
>  BUILD_OS = "${@os.uname()[0].lower()}"
> -BUILD_VENDOR = ""
>  BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
>  BUILD_PREFIX = ""
>  BUILD_CC_ARCH = ""
> @@ -70,7 +69,6 @@ BUILD_EXEEXT = ""
>  
>  HOST_ARCH = "${TARGET_ARCH}"
>  HOST_OS = "${TARGET_OS}"
> -HOST_VENDOR = "${TARGET_VENDOR}"
>  HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
>  HOST_PREFIX = "${TARGET_PREFIX}"
>  HOST_CC_ARCH = "${TARGET_CC_ARCH}"
> @@ -78,14 +76,12 @@ HOST_EXEEXT = ""
>  
>  TARGET_ARCH = "INVALID"
>  TARGET_OS = "INVALID"
> -TARGET_VENDOR = "${BUILD_VENDOR}"
>  TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
>  TARGET_PREFIX = "${TARGET_SYS}-"
>  TARGET_CC_ARCH = ""
>  
>  SDK_ARCH = "${BUILD_ARCH}"
>  SDK_OS = "${BUILD_OS}"
> -SDK_VENDOR = "-oesdk"
>  SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
>  SDK_PREFIX = "${SDK_SYS}-"
>  SDK_CC_ARCH = "${BUILD_CC_ARCH}"
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> index 8da6c0a..dd9ffc3 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -3,7 +3,10 @@ include conf/distro/include/default-versions.inc
>  include conf/distro/include/default-distrovars.inc
>  include conf/distro/include/world-broken.inc
>  
> -TARGET_VENDOR ?= "-oecore"
> +BUILD_VENDOR ?= ""
> +TARGET_VENDOR ?= "-oe"
> +HOST_VENDOR ?= "${TARGET_VENDOR}"
> +SDK_VENDOR ?= "-oesdk"
>  
>  TARGET_FPU_arm ?= "soft"
>  TARGET_FPU_armeb ?= "soft"




