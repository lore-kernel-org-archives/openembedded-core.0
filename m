Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 241B073FC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 02:06:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4F26lNK004886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 19:06:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 19:06:47 -0700
Message-ID: <555554B6.2070300@windriver.com>
Date: Fri, 15 May 2015 10:06:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
	<bc821025ab812f67e5055ffda1f309ddc511d898.1431324180.git.liezhi.yang@windriver.com>
In-Reply-To: <bc821025ab812f67e5055ffda1f309ddc511d898.1431324180.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 02/12] gtk+/cairo: enable x11 or directfb
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
X-List-Received-Date: Fri, 15 May 2015 02:06:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

Other patches have been merged except this one, any comments on it, please ?

// Robert

On 05/11/2015 02:08 PM, Robert Yang wrote:
> The gtk+2 requires whether x11 or directfb to build, so we need enable
> either of them. The cairo can be built without x11 or directfb, but gtk+
> requires cairo, so enable x11 or directfb for cairo, too.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-gnome/gtk+/gtk+.inc      |    5 ++---
>   meta/recipes-graphics/cairo/cairo.inc |    7 +++++--
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
> index 1c0558c..fcfb86f 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -14,9 +14,8 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
>   DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
>    cairo gdk-pixbuf"
>
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> -"
> +# Requires x11 or directfb
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'directfb', d)}"
>
>   PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
>   # without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 98add5a..f1aca9b 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -17,8 +17,11 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
>   X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>   DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> +# Build cairo-xlib or cairo-directfb for gtk+
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'directfb', d)}"
> +# No directfb-native, so set PACKAGECONFIG to null when no x11
> +PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +
>   PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
>   PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
>   PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
>

