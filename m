Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7RjR-0003Ju-MJ for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 14:25:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DDGwYS026810
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 13:16:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26104-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 13:16:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DDGk0b026804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 13:16:48 GMT
Message-ID: <1331644607.16878.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 13:16:47 +0000
In-Reply-To: <2e3c4ca4c3c2dfc8b8e1333e61b239251b4f4efb.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
	<2e3c4ca4c3c2dfc8b8e1333e61b239251b4f4efb.1331604310.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] gettext: do not set libncurses prefix explicitly
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
X-List-Received-Date: Tue, 13 Mar 2012 13:25:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-12 at 19:08 -0700, Scott Garman wrote:
> The --with-libncurses-prefix configure option was added before
> this recipe had ncurses in DEPENDS, so it should be safe to
> remove it.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 3c65dca..daee5c0 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>  LICENSE = "GPL-3+ & LGPL-2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
> -PR = "r7"
> +PR = "r8"
>  DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
>  DEPENDS_virtclass-native = "libxml2-native"
>  PROVIDES = "virtual/libintl virtual/gettext"
> @@ -21,8 +21,6 @@ SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
>  SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
>  SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
>  
> -#PARALLEL_MAKE = ""
> -
>  inherit autotools
>  
>  EXTRA_OECONF += "--without-lispdir \
> @@ -32,7 +30,6 @@ EXTRA_OECONF += "--without-lispdir \
>                   --disable-native-java \
>                   --disable-openmp \
>                   --with-included-glib \
> -                 --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
>                   --without-emacs \
>                   --without-cvs \
>                   --without-git \

Sadly this breaks gettext for me as I'm now seeing things like:

i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/media/build1/poky/build/tmp/sysroots/qemux86 -std=gnu99 -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/recode-sr-latin recode_sr_latin-recode-sr-latin.o recode_sr_latin-filter-sr-latin.o  ../gnulib-lib/.libs/libgettextlib.so -L/usr/lib -lc -lncurses
/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: skipping incompatible /usr/lib/libtinfo.so when searching for -ltinfo
/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: skipping incompatible /usr/lib/libtinfo.a when searching for -ltinfo

in the logs which triggers a QA warning.

Cheers,

Richard



