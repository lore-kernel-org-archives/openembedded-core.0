Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Suhnj-00016c-Kx for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 12:29:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RAIDwa005273
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 11:18:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03016-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 11:18:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RAI2p4005267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 11:18:04 +0100
Message-ID: <1343384281.9574.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 11:18:01 +0100
In-Reply-To: <1343290285-7095-1-git-send-email-mertsas@cisco.com>
References: <1343290285-7095-1-git-send-email-mertsas@cisco.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc: Make it possbile for armcc and gcc to coexist.
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
X-List-Received-Date: Fri, 27 Jul 2012 10:29:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 10:11 +0200, Martin Ertsaas wrote:
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
>  .../gcc/gcc-4.7/armcc-coexistence.patch.txt        |   12 ++++++++++++
>  .../recipes-devtools/gcc/gcc-configure-runtime.inc |    6 ++++++
>  3 files changed, 19 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt

I'm afraid this patch caused some build failures on the automated
regression testing. Most of the red columns on the autobuilder:

http://autobuilder.yoctoproject.org:8010/waterfall

are due to this, e.g.:

http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/177/steps/shell_23/logs/stdio

The problem is we share a work directory between all the gcc component
builds (gcc-cross-initial, gcc-cross-intermediate, gcc-cross, libgcc and
gcc-runtime). For this to work, they all need to have matching SRC_URIs
which is an assumption this patch breaks. We'll therefore need to find a
different way to do this. Patches should really be applied by do_patch
anyway, it confuses things not to do that as if every recipe did this,
we'd end up in a huge mess.

The patch is also missing an Upstream-Status field, author information
and a description  of what it does.

Cheers,

Richard



> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 43d77ec..709d7d8 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>  
> -PR = "r7"
> +PR = "r8"
>  
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt b/meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt
> new file mode 100644
> index 0000000..61c04ac
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt
> @@ -0,0 +1,12 @@
> +--- /usr/local/oecore-x86_64/sysroots/armv7ahf-vfp-neon-nimbus-linux-gnueabi/usr/include/c++/OE_TARGET_SYS/bits/c++config.h~	2012-06-15 11:47:57.000000000 +0200
> ++++ /usr/local/oecore-x86_64/sysroots/armv7ahf-vfp-neon-nimbus-linux-gnueabi/usr/include/c++/OE_TARGET_SYS/bits/c++config.h	2012-06-29 11:57:10.000000000 +0200
> +@@ -1147,7 +1147,9 @@ namespace std
> + /* #undef _GLIBCXX_VERSION */
> + 
> + /* Define if the compiler supports C++11 atomics. */
> ++#ifndef __ARMCC_VERSION
> + #define _GLIBCXX_ATOMIC_BUILTINS 1
> ++#endif
> + 
> + /* Define to use concept checking code from the boost libraries. */
> + /* #undef _GLIBCXX_CONCEPT_CHECKS */
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> index d40383c..cdb69bf 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> @@ -2,6 +2,8 @@ require gcc-configure-common.inc
>  
>  CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
>  
> +SRC_URI += "file://armcc-coexistence.patch.txt"
> +
>  EXTRA_OECONF_PATHS = " \
>      --with-gxx-include-dir=${includedir}/c++/ \
>      --with-sysroot=${STAGING_DIR_TARGET} \
> @@ -49,6 +51,10 @@ do_install () {
>  			rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
>  		fi
>  	done
> +	cd ${D}${prefix}
> +	cat ${S}/../armcc-coexistence.patch.txt \
> +		| sed -e "s|OE_TARGET_SYS|${TARGET_SYS}|g" \
> +		| patch -p7
>  	chown -R root:root ${D}
>  }
>  




