Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4991461013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 14:09:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2013 07:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,936,1371106800"; d="scan'208";a="380578001"
Received: from unknown (HELO [10.255.15.100]) ([10.255.15.100])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2013 07:09:43 -0700
Message-ID: <523B05A7.9090201@linux.intel.com>
Date: Thu, 19 Sep 2013 07:09:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1379585199-27059-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1379585199-27059-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] x11vnc: respect zeroconf DISTRO_FEATURE to enable Avahi support
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
X-List-Received-Date: Thu, 19 Sep 2013 14:09:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2013 03:06 AM, Ross Burton wrote:
> There's a standard way of announcing VNC services over mDNS that x11vnc
> supports, so respect the feature and enable/disable it.
>
> Also re-order the statements and drop the redundant PR.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> index 0abc84a..098d8e8 100644
> --- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> +++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> @@ -7,10 +7,6 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
>                       file://x11vnc/x11vnc.h;endline=33;md5=6f95dc6535467d7ee1563fd434fb372e"
>
> -DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib libxfixes libxrandr libxdamage libxtst"
> -
> -PR = "r0"
> -
>   SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
>              file://starting-fix.patch \
>              file://endian-fix.patch "
> @@ -18,5 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
>   SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
>   SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
>
> +DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib libxfixes libxrandr libxdamage libxtst"
> +
Did you intend to move the DEPENDS line here and keep avahi as you have 
avahi in the PACKAGECONFIG below.

Sau!

>   inherit autotools
>
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
> +PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
>

