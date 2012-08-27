Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T61jw-0000mq-Q0
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 18:00:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2012 08:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,321,1344236400"; d="scan'208";a="191856926"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2012 08:48:24 -0700
Message-ID: <503B96C7.8070304@linux.intel.com>
Date: Mon, 27 Aug 2012 08:48:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Matthew McClintock <msm@freescale.com>
References: <1345832197-3648-1-git-send-email-msm@freescale.com>
In-Reply-To: <1345832197-3648-1-git-send-email-msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
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
X-List-Received-Date: Mon, 27 Aug 2012 16:00:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 11:16 AM, Matthew McClintock wrote:
> kmod will fail to build with the following error because O_CLOEXEC is
> not defined:
>
> | libkmod/libkmod-module.c: In function 'kmod_module_get_initstate':
> | libkmod/libkmod-module.c:1640: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-module.c:1640: error: (Each undeclared identifier is reported only once
> | libkmod/libkmod-module.c:1640: error: for each function it appears in.)
> | libkmod/libkmod-module.c: In function 'kmod_module_get_refcnt':
> | libkmod/libkmod-module.c:1754: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-module.c: In function 'kmod_module_get_sections':
> | libkmod/libkmod-module.c:1913: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-file.c: In function 'kmod_file_open':
> | libkmod/libkmod-file.c:282: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-file.c:282: error: (Each undeclared identifier is reported only once
> | libkmod/libkmod-file.c:282: error: for each function it appears in.)
>
> Since we are only using kmod-native for depmod, and it's a non-threaded
> user of this libary being built this should be safe to override O_CLOEXEC.
>
> Keep in mind this is ONLY effecting the native builds and not what is
> being shipped in the root file system.
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: use patch instead of munging CFLAGS
>
>   meta/recipes-kernel/kmod/kmod-native_git.bb        |    3 ++-
>   .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        |   17 +++++++++++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
>
> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
> index 96de8b8..8cbcdf8 100644
> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -4,7 +4,8 @@
>   require kmod.inc
>   inherit native
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
> +SRC_URI += "file://fix-undefined-O_CLOEXEC.patch"
>
>   do_install_append (){
>   	for tool in depmod insmod lsmod modinfo modprobe rmmod
> diff --git a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> new file mode 100644
> index 0000000..3177e9a
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> @@ -0,0 +1,17 @@
> +Upstream-Status: Not applicable
> +
> +Index: git/libkmod/libkmod-private.h
> +===================================================================
> +--- git.orig/libkmod/libkmod-private.h
> ++++ git/libkmod/libkmod-private.h
> +@@ -1,6 +1,10 @@
> + #ifndef _LIBKMOD_PRIVATE_H_
> + #define _LIBKMOD_PRIVATE_H_
> +
> ++#ifndef O_CLOEXEC
> ++# define O_CLOEXEC 0
> ++#endif
> ++
> + #include <stdbool.h>
> + #include <stdio.h>
> + #include <syslog.h>
>

Merged into OE-Core

Thanks
	Sau!



