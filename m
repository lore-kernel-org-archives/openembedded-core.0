Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDDD-0001vg-I9 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:43:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FdWPB021377;
	Fri, 8 Jul 2011 16:39:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20388-10; Fri,  8 Jul 2011 16:39:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FdQLV021371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jul 2011 16:39:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <73f52ab56a2f932082e954f5650896cdee010fee.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<73f52ab56a2f932082e954f5650896cdee010fee.1310132765.git.otavio@ossystems.com.br>
Date: Fri, 08 Jul 2011 16:38:48 +0100
Message-ID: <1310139528.20015.894.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 8/8] fix SDK building due TARGET_ARCH use in installation path
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
X-List-Received-Date: Fri, 08 Jul 2011 15:43:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
> TARGET_ARCH makes the building too fragile since it changes during
> building of target and nativesdk binaries thus making it difficult to
> handle a proper path for installation of binaries. The fix for it is
> to move it to toolchain tarball name.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/populate_sdk.bbclass |    2 +-
>  meta/conf/bitbake.conf            |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
> index 089ed9a..03b6d0f 100644
> --- a/meta/classes/populate_sdk.bbclass
> +++ b/meta/classes/populate_sdk.bbclass
> @@ -9,7 +9,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
>  
>  TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
> -TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
> +TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${SDK_ARCH}-${TARGET_ARCH}-toolchain-${DISTRO_VERSION}"
>  
>  RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>  DEPENDS = "virtual/fakeroot-native sed-native"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdaa35d..cc2b8e2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -341,7 +341,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>  
>  PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
>  
> -SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> +SDK_NAME = "oecore-sdk-${DISTRO}"
>  SDKPATH = "/usr/local/${SDK_NAME}"
>  SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"

I'd really like Koen to take a look at this with his Angstrom hat on. I
still suspect the better fix for this is likely to end up with:

 SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
-SDKPATH = "/usr/local/${SDK_NAME}"
+SDKPATH = "/usr/local/oecore-sdk-${DISTRO}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"

Certainly having TARGET_ARCH in SDKPATH is a bad idea but I think the
SDK_NAME variable could make sense as it is originally...

Cheers,

Richard



