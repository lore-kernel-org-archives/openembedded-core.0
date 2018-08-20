Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 720EB7908F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:40:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7K9ecYD001333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 20 Aug 2018 10:40:39 +0100
Message-ID: <9b1b218cfaba5dbc2d582f1b570674a4577db7ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 10:40:38 +0100
In-Reply-To: <0d484e3706a46b34f4edfc3fec906e576a29a9bd.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
	<0d484e3706a46b34f4edfc3fec906e576a29a9bd.1534699224.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/9] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Mon, 20 Aug 2018 09:40:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-08-19 at 10:23 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-
> graphics/cairo/cairo.inc
> index 20e0d2c92a..7347f223ff 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender
> libxext"
>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>  
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11 xcb', '', d)} \
> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'opengl', '', d)}"
>  
>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --
> disable-xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index 6aedeee9dc..2671d4de4d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -47,6 +47,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATU
> RES', 'wayland vulkan', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> vulkan', 'dri3', '', d)} \
>  		   "
>  
> +PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
> +PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
> +
>  # "gbm" requires "dri", "opengl"
>  PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"

Adding this patch causes:

"oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash"

to fail. I've not looked into it in more detail other than to narrow it
down to this patch.

Cheers,

Richard


