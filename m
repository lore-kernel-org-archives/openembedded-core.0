Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1StLG7-0007Wx-SW
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 18:13:24 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0E3B9F8121C; Mon, 23 Jul 2012 09:52:16 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 79C66F81208;
	Mon, 23 Jul 2012 09:52:14 -0600 (MDT)
Message-ID: <500D733F.6080708@mlbassoc.com>
Date: Mon, 23 Jul 2012 09:52:31 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343052163-4060-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1343052163-4060-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Mon, 23 Jul 2012 16:13:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-07-23 08:02, Radu Moisan wrote:
> Close-on-exec seems to be unsuported on some architectures like CentOS 5.8
> and thus causing some packages to fail to build successfully. Future kernel
> version will probably fix this, but for now this patch works around this
> problem.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   meta/recipes-kernel/kmod/kmod.inc                  |    3 +-
>   .../Handle-unsupported-close-on-exec-flag.patch    |   60 ++++++++++++++++++++
>   2 files changed, 62 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch
>
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
> index adba4d4..c992ad8 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -8,7 +8,7 @@ LICENSE = "GPL-2.0+ & LGPL-2.1+"
>   LICENSE_libkmod = "LGPL-2.1+"
>   SECTION = "base"
>   PV = "8"
> -INC_PR = "r1"
> +INC_PR = "r2"
>
>   DEPENDS += "pkgconfig-native"
>
> @@ -20,6 +20,7 @@ inherit autotools gtk-doc
>   SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
>              file://depmod-search.conf \
>              file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
> +           file://Handle-unsupported-close-on-exec-flag.patch \
>             "
>
>   SRCREV = "819f79a24d58e3c8429f1631df2f8f85a2f95d4a"
> diff --git a/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch b/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch
> new file mode 100644
> index 0000000..f0820d9
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch
> @@ -0,0 +1,60 @@
> +Index: git/libkmod/libkmod-config.c
> +===================================================================
> +--- git.orig/libkmod/libkmod-config.c	2012-07-23 16:13:44.000000000 +0300
> ++++ git/libkmod/libkmod-config.c	2012-07-23 16:15:53.000000000 +0300
> +@@ -33,6 +33,10 @@
> + #include "libkmod.h"
> + #include "libkmod-private.h"
> +
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + struct kmod_alias {
> + 	char *name;
> + 	char modname[];
> +Index: git/libkmod/libkmod-file.c
> +===================================================================
> +--- git.orig/libkmod/libkmod-file.c	2012-07-23 16:13:44.000000000 +0300
> ++++ git/libkmod/libkmod-file.c	2012-07-23 16:15:57.000000000 +0300
> +@@ -31,6 +31,10 @@
> + #include "libkmod.h"
> + #include "libkmod-private.h"
> +
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + #ifdef ENABLE_XZ
> + #include <lzma.h>
> + #endif
> +Index: git/libkmod/libkmod-index.c
> +===================================================================
> +--- git.orig/libkmod/libkmod-index.c	2012-07-23 16:13:44.000000000 +0300
> ++++ git/libkmod/libkmod-index.c	2012-07-23 16:16:00.000000000 +0300
> +@@ -31,6 +31,10 @@
> + #include "libkmod-index.h"
> + #include "macro.h"
> +
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + /* index.c: module index file shared functions for modprobe and depmod */
> +
> + #define INDEX_CHILDMAX 128
> +Index: git/libkmod/libkmod-module.c
> +===================================================================
> +--- git.orig/libkmod/libkmod-module.c	2012-07-23 16:13:44.000000000 +0300
> ++++ git/libkmod/libkmod-module.c	2012-07-23 16:16:04.000000000 +0300
> +@@ -40,6 +40,10 @@
> + #include "libkmod.h"
> + #include "libkmod-private.h"
> +
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + /**
> +  * SECTION:libkmod-module
> +  * @short_description: operate on kernel modules
>

Why didn't you put this change in 'libkmod.h' - then you'd only have
to change a single file.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


