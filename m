Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAdK-0003Uo-FZ
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:20:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Oct 2012 09:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="230424139"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2012 09:07:03 -0700
Message-ID: <506F05A7.1080209@linux.intel.com>
Date: Fri, 05 Oct 2012 09:07:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349349543-23599-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349349543-23599-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sato-icon-theme: use gtk-icon-cache helper class
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
X-List-Received-Date: Fri, 05 Oct 2012 16:20:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2012 04:19 AM, Ross Burton wrote:
> Instead of explicitly updating the icon cache use the helper class that also
> forces a loader update at the same time.  This eliminates the possibility of
> updating the icon cache without any gdk-pixbuf loaders.
>
> Also check that the Sato icon theme isn't already set to avoid appending to the
> file every time the postinst runs.
>
> [YOCTO #2399]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc   |   15 +++++++--------
>   .../sato-icon-theme/sato-icon-theme_0.4.1.bb            |    2 +-
>   2 files changed, 8 insertions(+), 9 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> index 9fd1012..0bd4814 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> @@ -8,18 +8,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
>   SECTION = "x11"
>   DEPENDS = ""
>
> -inherit autotools pkgconfig allarch
> +inherit autotools pkgconfig allarch gtk-icon-cache
>
>   FILES_${PN} += "${datadir}"
>
>   EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
>
> -#explictly setting "Sato" as default icon theme to avoid icon missing due to
> -#tricky race condition
> +# Explictly setting "Sato" as the default icon theme to avoid flickering from
> +# the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
>   pkg_postinst_${PN} () {
> -        if [ "x$D" != "x" ]; then
> -                exit 1
> -        fi
> -        gtk-update-icon-cache -q /usr/share/icons/Sato
> -        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
> +    mkdir -p $D/etc/gtk-2.0
> +
> +    grep -s -q -e ^gtk-icon-theme-name.*\"Sato\" $D/etc/gtk-2.0/gtkrc || \
> +        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
>   }
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> index 108f8e8..6405359 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> @@ -2,7 +2,7 @@ require sato-icon-theme.inc
>
>   DEPENDS += "icon-naming-utils-native"
>
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
>              file://iconpath-option.patch \
>


