Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1899A6E47E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 13:24:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2013 05:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,495,1384329600"; d="scan'208";a="425352076"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.3])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2013 05:23:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Dec 2013 13:23:56 +0000
Message-ID: <3470792.PBUdbl2oFv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
References: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Mon, 16 Dec 2013 13:24:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Monday 16 December 2013 14:15:25 Martin Jansa wrote:
> * building without x11 doesn't work, because it sets default
>   gdkbackend to x11 and then requires cairo-xlib to be available
> * checking for CAIRO_BACKEND... no
>   configure: error: Package requirements (cairo-xlib >= 1.6) were not met:
> 
>   No package 'cairo-xlib' found
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc
> b/meta/recipes-gnome/gtk+/gtk+.inc index 73d624c..5bf0bfe 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -14,9 +14,13 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr
> libxdamage libxrender DEPENDS = "glib-2.0 pango atk jpeg libpng
> gdk-pixbuf-native docbook-utils-native \ cairo gdk-pixbuf"
> 
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '',
> d)}" +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11',
> '', d)} \ +           ${@base_contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)} \ +"
> 
>  PACKAGECONFIG[x11] = "--with-x=yes
> --with-gdktarget=x11,--with-x=no,${X11DEPENDS}" +# without
> --with-gdktarget=directfb it will check for cairo-xlib which isn't
> available without X11 DISTRO_FEATURE +PACKAGECONFIG[directfb] =
> "--with-gdktarget=directfb,,directfb"
> 
>  inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache

I was under the impression that directfb support was removed from GTK+ some 
time ago - is that not the case?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

