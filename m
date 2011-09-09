Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R28ZH-0005jn-K0
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 23:24:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Sep 2011 14:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,357,1312182000"; d="scan'208";a="15675640"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Sep 2011 14:19:53 -0700
Message-ID: <4E6A82F8.5020508@linux.intel.com>
Date: Fri, 09 Sep 2011 14:19:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1314804932.19905.169.camel@phil-desktop>
In-Reply-To: <1314804932.19905.169.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Fri, 09 Sep 2011 21:24:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2011 08:35 AM, Phil Blundell wrote:
> This allows pango to be installed in an image with read-only-rootfs.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-graphics/pango/pango.inc       |   11 +++++++----
>   meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
>   2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
> index a8e99e2..ff3f5dd 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -10,13 +10,13 @@ SECTION = "libs"
>   LICENSE = "LGPL"
>
>   X11DEPENDS = "virtual/libx11 libxft"
> -DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> +DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cairo qemu-native ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>
>   PACKAGES_DYNAMIC = "pango-module-*"
>
>   RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc"
>
> -inherit gnome
> +inherit gnome qemu
>
>   EXTRA_AUTORECONF = ""
>
> @@ -33,9 +33,12 @@ LIBV = "1.6.0"
>
>   postinst_prologue() {
>   if [ "x$D" != "x" ]; then
> -  exit 1
> +	if [ ! -f "$D${sysconfdir}/pango/pango.modules" ]; then
> +		mkdir -p $D${sysconfdir}/pango
> +		PSEUDO_RELOADED=YES ${@qemu_target_binary(d)} -L $D $D${bindir}/pango-querymodules>  "$D${sysconfdir}/pango/pango.modules"
> +	fi
> +	exit 0
>   fi
> -
>   }
>
The usage here of qemu, and some further testing has shown that this may 
not be the best time to put this patch in, There are failures in both 
x86-64 and arm builds and the newer version of qemu does not appear to 
resolve this.

Phil, given we are trying to generate a release at this point, I feel 
that we need to revert this patch. You are welcome to resubmit an 
updated version with sufficient test results, but it will be to master 
and not 1.1.

Thanks for the efforts to create a read-only rootfs, this one just can't 
make it this time.

Sau!

>   python populate_packages_prepend () {
> diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
> index 68ab700..33eac21 100644
> --- a/meta/recipes-graphics/pango/pango_1.28.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
> @@ -2,7 +2,7 @@ require pango.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>
> -PR = "r1"
> +PR = "r4"
>
>   SRC_URI += "file://no-tests.patch"
>


