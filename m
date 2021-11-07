Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d56cc2db74fe40828567c9c7df8507479cdecea3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] wayland: Fix wayland-tools packaging problems
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 07 Nov 2021 16:15:18 +0000
In-Reply-To: <20211107160006.25440-1-tom.hochstein@nxp.com>
References: <20211107160006.25440-1-tom.hochstein@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org

On Sun, 2021-11-07 at 10:00 -0600, Tom Hochstein wrote:
> There are several packaging problems due to the wayland-tools packaging
> implementation. The wayland-tools package currently looks like this:
> 
> wayland-tools
> └── usr
>     ├── bin
>     │   └── wayland-scanner
>     └── share
>         └── wayland
>             ├── wayland.dtd
>             ├── wayland-scanner.mk
>             └── wayland.xml
> 
> The files wayland-scanner.pc and wayland-scanner.m4 are incorrectly
> located in the main package. The files wayland.dtd and wayland.xml
> are incorrectly located here but belong in the main package.
> 
> Fix the problems by moving wayland-tools before the other packages,
> adding wayland-tools-dev, and dropping the main package FILES
> variable override as no longer needed.
> 
> After the fix wayland-tools and wayland-tools-dev look like this:
> 
> wayland-tools
> └── usr
>     └── bin
>         └── wayland-scanner
> wayland-tools-dev
> └── usr
>     ├── lib
>     │   └── pkgconfig
>     │       └── wayland-scanner.pc
>     └── share
>         ├── aclocal
>         │   └── wayland-scanner.m4
>         └── wayland
>             └── wayland-scanner.mk
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/recipes-graphics/wayland/wayland_1.19.0.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
> index d6e468497d..74d6d65e9e 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
> @@ -52,10 +52,14 @@ sysroot_stage_all:append:class-target () {
>  	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
>  }
>  
> -PACKAGES += "${PN}-tools"
> +PACKAGES =+ "${PN}-tools ${PN}-tools-dev"
>  
> -FILES:${PN} = "${libdir}/*${SOLIBS}"
> -FILES:${PN}-tools += "${bindir} ${datadir}/wayland"
> +FILES:${PN}-tools = "${bindir}/wayland-scanner"
> +FILES:${PN}-tools-dev = " \
> +    ${libdir}/pkgconfig/wayland-scanner.pc \
> +    ${datadir}/aclocal/wayland-scanner.m4 \
> +    ${datadir}/wayland/wayland-scanner.mk \
> +"
>  
>  BBCLASSEXTEND = "native nativesdk"
> 

Shouldn't these just go into wayland-dev?

Cheers,

Richard


