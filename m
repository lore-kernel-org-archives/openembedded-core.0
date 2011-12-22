Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdoCc-0000QC-2J
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 20:21:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Dec 2011 11:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88675213"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by azsmga001.ch.intel.com with ESMTP; 22 Dec 2011 11:14:09 -0800
Message-ID: <4EF38180.2000408@linux.intel.com>
Date: Thu, 22 Dec 2011 11:14:08 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324025415.git.xiaofeng.yan@windriver.com>
	<c028203a732e19a12804c479dfcdbf7f61b75767.1324025415.git.xiaofeng.yan@windriver.com>
In-Reply-To: <c028203a732e19a12804c479dfcdbf7f61b75767.1324025415.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 2/3] x11-common: Change drive mode of Xfbdev when xserver using framebuffer
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
X-List-Received-Date: Thu, 22 Dec 2011 19:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2011 01:15 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> The previous mode of starting X is as follow:
> $Xfbdev :0 -keybd keyboard -mouse tslib
> This mode cause that some keys can't be mapped rightly. \
> for example "Down" have the same function with "Enter".
>
> another drive mode "evdev" can work rightly in new version.
> $Xfbdev :0 -keybd evdev,,device=/dev/input/event0 -mouse tslib
>
> So I select drive mode "evdev".
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../x11-common/x11-common/etc/X11/Xserver          |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
> index 57923e6..d1e17fb 100644
> --- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
> +++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
> @@ -28,11 +28,13 @@ module_id() {
>
>   ARGS=" -br -pn"
>
> +KD_DRIVE_KEYBOARD="-keybd keyboard"
> +KD_DRIVE_EVDEV="-keybd evdev,,device=/dev/input/keyboard0"
Not sure it's such a good idea to hard code the /dev here.

>   if [ "$XSERVER" != "/usr/bin/Xorg" ]; then
>
>           . /etc/formfactor/config
>
> -        ARGS="$ARGS -keybd keyboard"
> +        ARGS="$ARGS $KD_DRIVE_EVDEV"
>
>           # use usb mouse if present
>           if [ -z "$TSLIB_TSDEVICE" ]&&  [ -e /dev/input/mice ]; then


