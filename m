Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPIIg-0003f9-64
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:59:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2012 11:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95152456"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 01 May 2012 11:50:05 -0700
Message-ID: <4FA0305D.6010408@linux.intel.com>
Date: Tue, 01 May 2012 11:50:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335508325.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1335508325.git.lianhao.lu@intel.com>
Subject: Re: [PATCH V2 0/7] Misc fixings for multilib
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
X-List-Received-Date: Tue, 01 May 2012 18:59:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2012 11:34 PM, Lianhao Lu wrote:
> 1. Added a package QA check function in multilib case. It checkes whether
> there is a package runtime dependency on packages with names not prefixed
> by $MLPREFIX.
>
> 2. Fixed a bunch of recipes to use $libdir and $base_libdir instead of the
> hard coded /usr/lib and /lib.
>
> The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:
>    Martin Jansa (1):
>          bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/multilib
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib
>
> Lianhao Lu (7):
>    multilib.bbclass: Added multilib specific package QA.
I think that we need to address some of these WARNING before merging 
this change directly.  Is this supposed to address [YOCTO #2038]?

>    popt: Fixing pkgconfig file installation issue.
>    avahi: not using hard coded libdir.
Merged into OE-Core

>    pulseaudio: use base_libdir for udev rules.
>    alsa-utils: use base_libdir for udev rules.
I am still reviewing the udev changes.

>    xorg-app: Use ${libdir} and ${datadir} for packaging.
Merged into OE-Core
>    xf86-input-vmmouse: use base_libdir for udev rules.
Under review

Thanks
	Sau!

>
>   meta/classes/multilib.bbclass                      |   31 ++++++++++++++++++++
>   meta/recipes-connectivity/avahi/avahi.inc          |    4 +-
>   meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb  |    2 +-
>   .../recipes-graphics/xorg-app/mkfontscale_1.1.0.bb |    2 +
>   meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb    |    2 +-
>   meta/recipes-graphics/xorg-app/xauth_1.0.6.bb      |    2 +-
>   meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb   |    2 +-
>   meta/recipes-graphics/xorg-app/xhost_1.0.4.bb      |    2 +-
>   meta/recipes-graphics/xorg-app/xinit_1.3.2.bb      |    2 +-
>   meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |    2 +-
>   meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb    |    2 +
>   meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb    |    2 +-
>   meta/recipes-graphics/xorg-app/xorg-app-common.inc |    4 +-
>   meta/recipes-graphics/xorg-app/xprop_1.2.1.bb      |    2 +-
>   meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb     |    2 +-
>   meta/recipes-graphics/xorg-app/xset_1.2.2.bb       |    2 +-
>   meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb     |    1 +
>   meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb   |    2 +-
>   .../xorg-driver/xf86-input-vmmouse_12.8.0.bb       |    6 +++-
>   meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |    6 ++-
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
>   .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
>   meta/recipes-support/popt/popt/pkgconfig_fix.patch |   15 +++++++++
>   meta/recipes-support/popt/popt_1.16.bb             |    6 ++-
>   24 files changed, 82 insertions(+), 22 deletions(-)
>   create mode 100644 meta/recipes-support/popt/popt/pkgconfig_fix.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


