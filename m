Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0hf-0007go-Ft
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:11:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2011 10:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="41638352"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 10:07:18 -0700
Message-ID: <4E495246.3050106@linux.intel.com>
Date: Mon, 15 Aug 2011 10:07:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313164713.6733.164.camel@phil-desktop>
In-Reply-To: <1313164713.6733.164.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] cairo: only use x11 if selected in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 17:11:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 08:58 AM, Phil Blundell wrote:
> This makes it possible to build cairo-using apps without X11.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-graphics/cairo/cairo.inc |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 72aaa03..c983a89 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -10,10 +10,11 @@ HOMEPAGE = "http://cairographics.org"
>   BUGTRACKER = "http://bugs.freedesktop.org"
>   SECTION = "libs"
>   LICENSE = "MPL-1&  LGPLv2.1"
> -DEPENDS = "virtual/libx11 libsm libpng fontconfig libxrender pixman glib-2.0"
> +X11DEPENDS = "virtual/libx11 libsm libxrender"
> +DEPENDS = "libpng fontconfig pixman glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>
>   #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>   require cairo-fpu.inc
> -EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)}"
> +EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} ${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
>
>   inherit autotools pkgconfig

Merged into OE Core

Thanks
	Sau!


