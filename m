Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZSe5-0003Es-Qs for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:59:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MItqHS007778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:55:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07554-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:55:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MItk8d007772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:55:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <42574f1bebc1fdf79c9662a22ca0a86d12a8f221.1308391365.git.liezhi.yang@windriver.com>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
	<42574f1bebc1fdf79c9662a22ca0a86d12a8f221.1308391365.git.liezhi.yang@windriver.com>
Date: Wed, 22 Jun 2011 19:55:27 +0100
Message-ID: <1308768927.20015.96.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/6 V3] gcc-crosssdk: share work directories
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
X-List-Received-Date: Wed, 22 Jun 2011 18:59:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-06-18 at 20:41 +0800, Robert Yang wrote:
> The gcc-crosssdk.inc edited the files of config/*/linux*.h in ${S},
> which made the source incompatible. Copy config to config-sdk, and edit
> the files in config-sdk, configure will read the files in it when build
> gcc-crosssdk.
> 
> The sed command for configure is more complicated than for configure.ac,
> this is because there is such a line /boot/home/config/ in it, we should
> not substitute it.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-crosssdk.inc |   13 +++++++++++--
>  1 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> index 6e7d5a7..fdba6df 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> @@ -9,8 +9,17 @@ GCCMULTILIB = "--disable-multilib"
>  DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc-nativesdk gettext-native"
>  PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
>  
> +export BUILD_GCC_SDK = "-sdk"
>  do_configure_prepend () {
>  	# Change the default dynamic linker path to the one in the SDK
> -	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
> -	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
> +	[ ! -d ${S}/gcc/config-sdk ] && cp -r ${S}/gcc/config ${S}/gcc/config-sdk/
> +	sed -i ${S}/gcc/configure.ac -e 's#config/#config\$BUILD_GCC_SDK/#'
> +	sed -i ${S}/gcc/configure -e 's# config/# config\$BUILD_GCC_SDK/#' \
> +		-e 's#\${srcdir}/config/#\${srcdir}/config\$BUILD_GCC_SDK/#' \
> +		-e 's#\$srcdir/config/#\$srcdir/config\$BUILD_GCC_SDK/#' \
> +		-e 's#\$(srcdir)/config/#\$(srcdir)/config\$BUILD_GCC_SDK/#' \
> +		-e "s#\$(srcdir)'/config/#\$(srcdir)'/config\$BUILD_GCC_SDK/#"
> +
> +	sed -i ${S}/gcc/config-sdk/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
> +	sed -i ${S}/gcc/config-sdk/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
>  }

The other patches look good but this one is still giving me cause for
concern I'm afraid. The reason why is that you could change SDKMACHINE
and get unexpected results. We really need the changes to be
configurable from ${B}.

How about this approach:

We always sed these files in config/ changing:

"GLIBC_DYNAMIC_LINKER.*/lib32/.*" -> "GLIBC_DYNAMIC_LINKER[...] (GLIBC_LIBDIR32 "/[...])"
"GLIBC_DYNAMIC_LINKER.*/lib64/.*" -> "GLIBC_DYNAMIC_LINKER[...] (GLIBC_LIBDIR64 "/[...])"
"GLIBC_DYNAMIC_LINKER.*/lib/.*" -> "GLIBC_DYNAMIC_LINKER[...] (GLIBC_LIBDIR "/[...])"

so entries in the files that look like:

#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"

would become

#define GLIBC_DYNAMIC_LINKER64 (GLIBC_LIBDIR64 "/ld-linux-x86-64.so.2")

and then we'd add:

#define GLIBC_LIBDIR "/lib"
#define GLIBC_LIBDIR32 "/lib32"
#define GLIBC_LIBDIR64 "/lib64"

to our config.h or t-oe (I haven't checked which which makes sense).
We'd then be able to customise these entries in the specific gcc
configurations as needed. It shouldn't change the "normal" cases and
when we get into multilib configurations, we should have some useful
code already present to assist with making filesystem layout changes too
as an added bonus.

Could you see if you can get something like that to work?

Cheers,

Richard



