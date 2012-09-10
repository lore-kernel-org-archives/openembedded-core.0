Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6Fr-0002ny-Cm
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:50:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2012 08:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="143376419"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Sep 2012 08:37:59 -0700
Message-ID: <504E0957.104@linux.intel.com>
Date: Mon, 10 Sep 2012 08:37:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346791451-23638-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346791451-23638-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: make DRI/GLX options respect opengl distro feature
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
X-List-Received-Date: Mon, 10 Sep 2012 15:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 01:44 PM, Ross Burton wrote:
> If the distro doesn't have the opengl feature there's no point building the DRI
> or GLX support, making the mesa-dri build dependency optional.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    3 +--
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    5 ++++-
>   meta/recipes-graphics/xorg-xserver/xserver-xorg.inc        |    6 ------
>   3 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index b588c11..b4a348c 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,5 +8,4 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r5"
> -
> +PR = "r6"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 404c488..94e83ea 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -119,8 +119,11 @@ EXTRA_OECONF += "--with-fop=no \
>                    ac_cv_file__usr_share_sgml_X11_defs_ent=no \
>   "
>
> -PACKAGECONFIG ??= "udev"
> +PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
>   PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
> +PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
> +                      --disable-dri --disable-glx,\
> +                      xf86driproto dri2proto mesa-dri"
>
>   do_install_append () {
>   	# Its assumed base-files creates this for us
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index ca7d33a..1322cfc 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -1,12 +1,6 @@
>   require xserver-xorg-common.inc
>
> -PROTO_DEPS += "xf86driproto dri2proto"
> -LIB_DEPS += "mesa-dri"
> -
>   EXTRA_OECONF += "\
> -                 --enable-dri \
> -                 --enable-dri2 \
> -                 --enable-glx-tls \
>                    --with-pic \
>                    --with-int10=x86emu \
>                    --without-xmlto \
>

Merged into OE-Core

Thanks
	Sau!



