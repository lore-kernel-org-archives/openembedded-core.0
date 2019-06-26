Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC3D96B067
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 02:15:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5Q2EiS5021187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 19:14:59 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 25 Jun 2019 19:14:48 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190625221319.102643-1-okaya@kernel.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
Date: Wed, 26 Jun 2019 10:27:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190625221319.102643-1-okaya@kernel.org>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 02:15:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Under which circumstances will the tools be absent?
And why do you check the existence of files for some the the existence 
of directories for others?

Best Regards,
Chen Qi

On 06/26/2019 06:13 AM, Sinan Kaya wrote:
> do_rootfs: The postinstall intercept hook 'update_udev_hwdb'
> do_rootfs: The postinstall intercept hook 'update_gio_module_cache' failed
> do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
> do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   scripts/postinst-intercepts/update_font_cache    |  6 ++++--
>   .../postinst-intercepts/update_gio_module_cache  | 10 +++++++---
>   scripts/postinst-intercepts/update_icon_cache    | 16 +++++++++-------
>   scripts/postinst-intercepts/update_pixbuf_cache  |  5 ++++-
>   scripts/postinst-intercepts/update_udev_hwdb     |  6 ++++--
>   5 files changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
> index 3053c7065f4..954acbb41b2 100644
> --- a/scripts/postinst-intercepts/update_font_cache
> +++ b/scripts/postinst-intercepts/update_font_cache
> @@ -5,5 +5,7 @@
>   
>   set -e
>   
> -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
> -chown -R root:root $D${fontconfigcachedir}
> +if [ -f $D${libexecdir}/${binprefix}fc-cache ]; then
> +	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
> +	chown -R root:root $D${fontconfigcachedir}
> +fi
> diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
> index c87fa85db9e..e8483cb0bf5 100644
> --- a/scripts/postinst-intercepts/update_gio_module_cache
> +++ b/scripts/postinst-intercepts/update_gio_module_cache
> @@ -5,7 +5,11 @@
>   
>   set -e
>   
> -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
> +if [ -f $D${libexecdir}/${binprefix}gio-querymodules ]; then
> +
> +	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
> +
> +	[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
> +		chown root:root $D${libdir}/gio/modules/giomodule.cache
> +fi
>   
> -[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
> -	chown root:root $D${libdir}/gio/modules/giomodule.cache
> diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
> index 212209a9daf..a67ff7ef970 100644
> --- a/scripts/postinst-intercepts/update_icon_cache
> +++ b/scripts/postinst-intercepts/update_icon_cache
> @@ -5,12 +5,14 @@
>   
>   set -e
>   
> -# update native pixbuf loaders
> -$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
> +if [ -d $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0 ]; then
> +	# update native pixbuf loaders
> +	$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
>   
> -for icondir in $D/usr/share/icons/*/ ; do
> -    if [ -d $icondir ] ; then
> -        gtk-update-icon-cache -fqt  $icondir
> -    fi
> -done
> +	for icondir in $D/usr/share/icons/*/ ; do
> +	    if [ -d $icondir ] ; then
> +	        gtk-update-icon-cache -fqt  $icondir
> +	    fi
> +	done
> +fi
>   
> diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
> index ea12814474e..166422e5c37 100644
> --- a/scripts/postinst-intercepts/update_pixbuf_cache
> +++ b/scripts/postinst-intercepts/update_pixbuf_cache
> @@ -8,6 +8,9 @@ set -e
>   export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
>   export GDK_PIXBUF_FATAL_LOADER=1
>   
> -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
> +if [ -d $D${libdir}/gdk-pixbuf-2.0 ]; then
> +	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
>       >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
>       sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
> +fi
> +
> diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
> index c4fb2bffcbf..7b6e38338f3 100644
> --- a/scripts/postinst-intercepts/update_udev_hwdb
> +++ b/scripts/postinst-intercepts/update_udev_hwdb
> @@ -5,5 +5,7 @@
>   
>   set -e
>   
> -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
> -chown root:root $D${sysconfdir}/udev/hwdb.bin
> +if [ -d $D/lib/udev/hwdb.d ]; then
> +	PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
> +	chown root:root $D${sysconfdir}/udev/hwdb.bin
> +fi



