Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web09.7748.1611916280553717969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4DRtsx2c78z5tlG;
	Fri, 29 Jan 2021 11:31:17 +0100 (CET)
Date: Fri, 29 Jan 2021 11:31:16 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 01/13] gobject-introspection: Fix variable override order
Message-ID: <20210129103115.pxlpkl3hyesofb5l@qschulz>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Fri, Jan 29, 2021 at 10:24:07AM +0000, Richard Purdie wrote:
> The DEPENDS variable override ordering here was almostly certainly
> incorrect and led to weird behaviour when making changes elsewhere.
> Correct it.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../gobject-introspection/gobject-introspection_1.66.1.bb     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> index ee0ab2866b8..ebac8d3a432 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> @@ -28,14 +28,14 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  
>  MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
>  
> -DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
> +DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
>  

Not sure to understand the reason for this change other than "cleanup"?

Are you expecting to be able to override DEPENDS from other recipes and
couldn't do so because of the "_append"?

If that is the case, it seems this patch should be split in two so
there's proper explanation?

>  # target build needs qemu to run temporary introspection binaries created
>  # on the fly by g-ir-scanner and a native version of itself to run
>  # native versions of its own tools during build.
>  # Also prelink-rtld is used to find out library dependencies of introspection binaries
>  # (standard ldd doesn't work when cross-compiling).
> -DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
> +DEPENDS_append_class-target = " gobject-introspection-native qemu-native prelink-native"
>  

Ah, the classic :)

Cheers,
Quentin
