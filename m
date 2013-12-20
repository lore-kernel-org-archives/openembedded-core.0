Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 166AC6B6F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 00:36:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2013 16:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,516,1384329600"; d="scan'208";a="455187419"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 16:36:38 -0800
Message-ID: <52B39115.2080008@linux.intel.com>
Date: Thu, 19 Dec 2013 16:36:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1387462812-23194-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1387462812-23194-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] weston: for fbdev enabled distro feature, change WESTON_NATIVE_BACKEND
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
X-List-Received-Date: Fri, 20 Dec 2013 00:36:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2013 06:20 AM, Valentin Popa wrote:
> For builds with fbdev (no drm/kms), set
> WESTON_NATIVE_BACKEND to "fbdev-backend.so"; doing this,
> weston-launch will be able to know what backend to use.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   meta/recipes-graphics/wayland/weston_1.3.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.3.1.bb
> index d97f6af..4ab2776 100644
> --- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
> @@ -45,7 +45,7 @@ PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/l
>   # Headless Weston
>   PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
>   # Weston on framebuffer
> -PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
> +PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"

Is this a more general way to do this as suggested by Koen back in May?

+# Needed for weston-launch
+WESTONBACKEND ??= "fbdev-backend.so"
+
+export WESTON_NATIVE_BACKEND = "${WESTONBACKEND}"

See http://patches.openembedded.org/patch/50871/

Sau!


>   # weston-launch
>   PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
>   # VA-API desktop recorder
>

