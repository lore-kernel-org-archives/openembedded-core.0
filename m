Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C99E96F8DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:30:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Mar 2014 05:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,742,1389772800"; d="scan'208";a="508162191"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2014 05:30:50 -0700
Message-ID: <533419E9.3080509@intel.com>
Date: Thu, 27 Mar 2014 14:30:33 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Subject: Re: [PATCH] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Thu, 27 Mar 2014 12:30:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/26/2014 11:07 PM, Otavio Salvador wrote:
> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-graphics/wayland/weston_1.4.0.bb | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> index e0c354d..a41b5cd 100644
> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> @@ -23,7 +23,6 @@ EXTRA_OECONF = "--enable-setuid-install \
>                   --enable-simple-clients \
>                   --enable-clients \
>                   --enable-demo-clients-install \
> -                --disable-simple-egl-clients \
>                   --disable-libunwind \
>                   --disable-rpi-compositor \
>                   --disable-rdp-compositor"
> @@ -39,7 +38,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev way
>   # Weston on KMS
>   PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
>   # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl --disable-wayland-compositor,virtual/mesa"

We need --disable-egl if wayland is not in DISTRO_FEATURES. See bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5867
> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
>   # Weston on X11
>   PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
>   # Headless Weston
> @@ -50,6 +49,10 @@ PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,ude
>   PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
>   # VA-API desktop recorder
>   PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
> +# Weston with EGL support
> +PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
> +# Weston with cairo glesv2 support
> +PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
>   
>   do_install_append() {
>   	# Weston doesn't need the .la files to load modules, so wipe them


