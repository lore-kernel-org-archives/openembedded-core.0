Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRTHb-0006rE-0c
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 21:39:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Oct 2012 12:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,648,1344236400"; d="scan'208";a="210863278"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by orsmga001.jf.intel.com with ESMTP; 25 Oct 2012 12:26:28 -0700
Message-ID: <50899263.6030402@linux.intel.com>
Date: Thu, 25 Oct 2012 12:26:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.co.uk>
References: <1351169702-2652-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1351169702-2652-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH] latencytop: disable GTK and remove gtk+ dependacy
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
X-List-Received-Date: Thu, 25 Oct 2012 19:39:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2012 05:55 AM, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> When DISTRO_FEATURES does not contain x11, disable GTK GUI and
> also don't add gtk+ to the DEPENDS
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
>   meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  6 ++++--
>   2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
> index 59a0b1f..596450c 100644
> --- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
> +++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
> @@ -1,8 +1,9 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- a/Makefile	2010-07-20 18:51:32.000000000 +0800
> -+++ b/Makefile	2010-07-20 18:54:54.000000000 +0800
> -@@ -4,7 +4,8 @@
> +--- a/Makefile 2010-07-20 18:51:32.000000000 +0800
> ++++ b/Makefile 2010-07-20 18:54:54.000000000 +0800
> +@@ -1,10 +1,8 @@
> +-# FIXME: Use autoconf ?
> +-HAS_GTK_GUI = 1
> +-
>    DESTDIR =
>    SBINDIR = /usr/sbin
>    XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
> @@ -12,7 +13,7 @@ Upstream-Status: Inappropriate [configuration]
>
>    OBJS= latencytop.o text_display.o translate.o fsync.o
>
> -@@ -26,16 +27,17 @@
> +@@ -26,16 +24,17 @@
>
>    # We write explicity this "implicit rule"
>    %.o : %.c
> diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> index 15f3667..2429b3d 100644
> --- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> +++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> @@ -5,7 +5,7 @@ BUGTRACKER = "n/a"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
>
> -DEPENDS = "virtual/libintl ncurses glib-2.0 gtk+"
> +DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
>
>   PR = "r2"
>
> @@ -15,8 +15,10 @@ SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
>   SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
>   SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
>
> +EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '-DHAS_GTK_GUI=1', '', d)}"
> +
This does not seem to make sense here, you are saying OECONF, but 
passing it below to "make", so maybe this should be EXTRA_OEMAKE_X.

Also this seems to generate the following error:
> | NOTE: make -j 16 -e MAKEFLAGS= install DESTDIR=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/latencytop-0.5-r2/image -DHAS_GTK_GUI=1
> | make: invalid option -- 'D'
> | make: invalid option -- 'H'
> | make: invalid option -- 'A'
> | make: invalid option -- '_'
> | make: invalid option -- 'G'
> | make: invalid option -- 'T'
> | make: invalid option -- 'K'
> | make: invalid option -- '_'
> | make: invalid option -- 'G'
> | make: invalid option -- 'U'
> | Usage: make [options] [target] ...
> | Options:
> |   -b, -m                      Ig
...

Please revisit this patch.

Thanks
	Sau!


>   CFLAGS += "${LDFLAGS}"
>
>   do_install() {
> -    oe_runmake install DESTDIR=${D}
> +    oe_runmake install DESTDIR=${D} ${EXTRA_OECONF_X}
>   }
>


