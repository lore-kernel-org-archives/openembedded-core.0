Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBB860579
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 01:17:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Sep 2013 18:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,887,1371106800"; d="scan'208";a="359246218"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by azsmga001.ch.intel.com with ESMTP; 11 Sep 2013 18:17:07 -0700
Message-ID: <1378948627.5240.66.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 18:17:07 -0700
In-Reply-To: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
References: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] ia32-base: only depend on GL if opengl DISTRO_FEATURE enabled
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
X-List-Received-Date: Thu, 12 Sep 2013 01:17:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 21:30 +0100, Ross Burton wrote:
> As Mesa refuses to compile if the "opengl" DISTRO_FEATURE isn't enabled,
> mesa-driver-i9xx and the GLX X module have to be conditional in the ia32 machine
> defintion too.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/machine/include/ia32-base.inc |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
> index cb542a5..e58a314 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/ia32-base.inc
> @@ -33,16 +33,16 @@ XSERVER_IA32_BASE = "xserver-xorg \
>             "
>  
>  XSERVER_IA32_EXT = " \
> -           xserver-xorg-extension-glx \
> +           ${@base_contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
>             xserver-xorg-module-libint10 \
>             "
>  
>  XSERVER_IA32_I915 = "xf86-video-intel \
> -           mesa-driver-i915 \
> +           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i915', '', d)} \
>             "
>  
>  XSERVER_IA32_I965 = "xf86-video-intel \
> -           mesa-driver-i965 \
> +           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i965', '', d)} \
>             "

I thought the idea was to try to build with --disable-gl or similar if
the DISTRO_FEATURES didn't include opengl, rather than disable the
driver entirely.

Am I remembering incorrectly, or was there more discussion on that which
showed that couldn't be made to work?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



