Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TQakX-0001OI-T2
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 11:26:13 +0200
Received: from [192.168.0.2] (host81-153-114-169.range81-153.btcentralplus.com
	[81.153.114.169]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 3445499A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 10:12:49 +0100 (BST)
Message-ID: <50865F91.5060002@r-finger.com>
Date: Tue, 23 Oct 2012 10:12:49 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1350898066.git.ross.burton@intel.com>
	<dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
In-Reply-To: <dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
Subject: Re: [PATCH 1/3] libxkbcommon: New window system-independent xkb library
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
X-List-Received-Date: Tue, 23 Oct 2012 09:26:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I think this needs a -native tools as well, like,
https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/recipes-graphics/xorg-lib/libxkbcommon_git.bb

Tomas


On 22/10/12 10:30, Ross Burton wrote:
> From: Damien Lespiau <damien.lespiau@intel.com>
> 
> Needed for weston and wayland clients to compile key maps.
> 
> Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   19 +++++++++++++++++++
>  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> new file mode 100644
> index 0000000..b426115
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Generic XKB keymap library"
> +
> +DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
> +processes a reduced subset of keymaps as defined by the XKB specification."
> +
> +LICENSE = "MIT & MIT-style"
> +
> +require xorg-lib-common.inc
> +
> +DEPENDS = "flex-native bison-native"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
> +
> +SRCREV = "1c880887666f84e08ea1752bb8a5ab2a7bf1d8a0"
> +PV = "0.1.0+git${SRCPV}"
> +PR = "r0"
> +
> +SRC_URI = "git://anongit.freedesktop.org/xorg/lib/libxkbcommon;protocol=git"
> +S = "${WORKDIR}/git"
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> index c911925..f3c08ab 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -17,7 +17,7 @@ EXTRA_OECONF = "--enable-malloc0returnsnull \
>                  --disable-specs --with-groff=no --with-ps2pdf=no --with-fop=no --without-xmlto"
>  
>  python () {
> -        whitelist = [ "pixman", "libpciaccess" ]
> +        whitelist = [ "pixman", "libpciaccess", "libxkbcommon" ]
>          if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
>                  raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
>  }



