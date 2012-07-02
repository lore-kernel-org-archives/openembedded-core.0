Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SlnRk-0004GW-Kl for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:42:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q62KV9Y7006427;
	Mon, 2 Jul 2012 21:31:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06299-02; Mon,  2 Jul 2012 21:31:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q62KV1S9006420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Jul 2012 21:31:02 +0100
Message-ID: <1341261067.23146.269.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 21:31:07 +0100
In-Reply-To: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
References: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [RFC PATCH] grub-efi: Do not use help2man
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
X-List-Received-Date: Mon, 02 Jul 2012 20:42:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-02 at 13:09 -0700, Darren Hart wrote:
> Fixes [YOCTO #2527]
> 
> Modify configure.ac and the generated configure script to avoid using
> help2man during the compilation process. For grub-efi we are only
> deploying the EFI payload and are not installing grub on the target
> root filesystem. Therefor, we do not need the man pages.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Paul Eggleton <paul.eggleton@linux.intel.com>
> CC: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../grub/files/grub-1.99-disable-help2man.patch    |  231 ++++++++++++++++++++
>  meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    3 +-
>  2 files changed, 233 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
> 
> diff --git a/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch b/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
> new file mode 100644
> index 0000000..b007cae
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
> @@ -0,0 +1,231 @@
> +Upstream-Status: Inappropriate (Bitbake build environment)
> +
> +We do not need the man pages when building just the EFI payload for the target,
> +all the tools are built for the host. This does not trigger GRUB's built-in
> +cross-compilation check, so force it. After the change to configure.ac,
> +autogen.sh was run in devshell and the resulting configure was used to generate
> +the configure diff. The configure diff was included to avoid having to add
> +autogen.sh to a do_configure_prepend() routine which would slow down the build
> +unnecessarily.
> +   
> +Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> +
> +Index: grub-1.99/configure.ac
> +===================================================================
> +--- grub-1.99.orig/configure.ac
> ++++ grub-1.99/configure.ac
> +@@ -275,11 +275,12 @@ if test x$grub_cv_apple_cc = xyes ; then
> +   HOST_CFLAGS="$HOST_CFLAGS -fnested-functions"
> + fi
> + 
> +-if test "x$cross_compiling" = xyes; then
> +-  AC_MSG_WARN([cannot generate manual pages while cross compiling])
> +-else
> +-  AC_PATH_PROG(HELP2MAN, help2man)
> +-fi
> ++# Force behaving as though we are cross-compiling with respect to HELP2MAN
> ++#if test "x$cross_compiling" = xyes; then
> ++AC_MSG_WARN([cannot generate manual pages while cross compiling])
> ++#else
> ++#  AC_PATH_PROG(HELP2MAN, help2man)
> ++#fi
> + 
> + # Check for functions and headers.
> + AC_CHECK_FUNCS(posix_memalign memalign asprintf vasprintf getextmntent)
> +Index: grub-1.99/configure
> +===================================================================
> +--- grub-1.99.orig/configure
> ++++ grub-1.99/configure

Isn't configure regenerated so we don't need this second bit patching
configure, just configure.ac?

Cheers,

Richard



