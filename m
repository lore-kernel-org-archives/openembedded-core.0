Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXe5U-0007kr-Tv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 22:57:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2013 13:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,591,1363158000"; d="scan'208";a="306397519"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2013 13:39:23 -0700
Message-ID: <51817D7A.20708@linux.intel.com>
Date: Wed, 01 May 2013 13:39:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1366297820-5000-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1366297820-5000-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grub-efi-native: fix build on modern distributions without gets()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 20:57:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Koen,

Please Cc recipe authors.

On 04/18/2013 08:10 AM, Koen Kooi wrote:
> O irony: the grub2/gnulib nag macro that says "don't use gets, use fgets" breaks the build if you're using a recent (e)glibc release that has gets removed.

Please ensure your git log wraps at around 72 chars to ensure it isn't
truncated in the git log output in a typical terminal.

> 
> Fedora already #if 0's the check in grub, so I stole their patch.

Perfect :-)

> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>


More below...

> ---
>  .../grub-2.00-ignore-gnulib-gets-stupidity.patch   | 28 ++++++++++++++++++++++
>  meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |  3 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
> 
> diff --git a/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch b/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
> new file mode 100644
> index 0000000..70f6001
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
> @@ -0,0 +1,28 @@
> +From f66d54b934710f54999debb72e8b7c620edece1d Mon Sep 17 00:00:00 2001
> +From: Peter Jones <pjones@redhat.com>
> +Date: Fri, 25 May 2012 15:28:19 -0400
> +Subject: [PATCH] gnulib accused in build breaking shocker.
> +
> +Upstream-Status: pending [Fedora will push this]
> +
> +---
> + grub-core/gnulib/stdio.in.h |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/grub-core/gnulib/stdio.in.h b/grub-core/gnulib/stdio.in.h
> +index 80b9dbf..69932d9 100644
> +--- a/grub-core/gnulib/stdio.in.h
> ++++ b/grub-core/gnulib/stdio.in.h
> +@@ -141,7 +141,9 @@ _GL_WARN_ON_USE (fflush, "fflush is not always POSIX compliant - "
> +    so any use of gets warrants an unconditional warning.  Assume it is
> +    always declared, since it is required by C89.  */
> + #undef gets
> ++#if 0
> + _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> ++#endif
> + 
> + #if @GNULIB_FOPEN@
> + # if @REPLACE_FOPEN@
> +-- 
> +1.7.10.1
> +
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> index 6f8ba8e..2a5dad7 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  # FIXME: We should be able to optionally drop freetype as a dependency
>  DEPENDS = "autogen-native"
>  RDEPENDS_${PN} = "diffutils freetype"
> -PR = "r1"
> +PR = "r2"
>  
>  # Native packages do not normally rebuild when the target changes.
>  # Ensure this is built once per HOST-TARGET pair.
> @@ -28,6 +28,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://grub-2.00-disable-help2man.patch \
>             file://check-if-liblzma-is-disabled.patch \
>  	   file://grub-no-unused-result.patch \
> +	   file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
            "

Please be consistent with whitespace above. I prefer TABs be used
exclusively for indentation with spaces used for alignment. The above is
purely alignment. However, others prefer TABs for as much of either as
possible. Either is fine, but it must be consistent throughout the file.
In this case, please use spaces.


>  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>  SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
> 

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


