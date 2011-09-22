Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6cAp-0001Ak-O3 for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 07:50:15 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M5p7d4022700; Thu, 22 Sep 2011 06:51:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dns8aoPUk5mT; Thu, 22 Sep 2011 06:51:07 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M5ox45022696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 22 Sep 2011 06:51:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 06:44:39 +0100
In-Reply-To: <1316630404-10336-16-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316630404-10336-16-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316670292.13622.26.camel@ted>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 16s, Richard17] gcc: fix possible problems with nscd compilation during eglibc-nativesdk build
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
X-List-Received-Date: Thu, 22 Sep 2011 05:50:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 22:40 +0400, Dmitry Eremin-Solenikov wrote:
> Long time ago a066e7ca90a28d5681c5fa895a29e999ed7c88b was committed to
> address possible problems with compilation of nscd during
> eglibc-nativesdk build. Problems were related to the way gcc searches
> for headers to check if it should enable it's own stack smash protection
> bits or it can relay on eglibc for it.
> 
> However after 934d38530c9a67562e53d4034aee5531f0f26750 things got
> broken, as for gcc-crosssdk{,-intermediate} packages:
> 1) EXTRA_OECONF is ignored
> 2) headers are installed in a different location than expected by that
> patch.
> 
> This results in eglibc-nativesdk build broken on some systems (e.g. mine
> Debian x86_64 squeeze). Fix that by providing with-headers options to
> crosssdk gcc configurations.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    2 +-
>  meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
>  .../gcc/gcc-crosssdk-intermediate.inc              |    2 ++
>  meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    2 ++
>  4 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
> index 90824bd..6a9a7a6 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>  
> -PR = "r10"
> +PR = "r11"
>  
>  DEPENDS =+ "mpfr gmp libmpc elfutils"
>  NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index ee42fa7..5d83e90 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>  
> -PR = "r11"
> +PR = "r12"
>  
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.6.0
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
> index ed5d5e8..8f20d20 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
> @@ -7,3 +7,5 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
>  DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native"
>  DEPENDS += "virtual/${TARGET_PREFIX}libc-initial-nativesdk"
>  PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate-crosssdk"
> +
> +EXTRA_OECONF += " --with-headers=${STAGING_DIR_TCBOOTSTRAP}${SYSTEMHEADERS} "
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> index 0fd82a6..5063f6f 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> @@ -8,3 +8,5 @@ GCCMULTILIB = "--disable-multilib"
>  
>  DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc-nativesdk gettext-native"
>  PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
> +
> +EXTRA_OECONF += " --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} "


You are patching both gcc-crosssdk and gcc-crosssdk-intermediate here. I
ran a check:

bitbake gcc-crosssdk -e | grep EXTRA_OECONF

and this suggested the second part of this change isn't needed and the
real issue is in the intermediate step?

How about we add this line explicitly to gcc-cross-intermediate.inc?

Cheers,

Richard



