Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RNTTD-0004AW-LN
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 18:58:55 +0100
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 09:52:41 -0800
Received: by wwi36 with SMTP id 36so5057209wwi.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 09:52:39 -0800 (PST)
Received: by 10.180.94.71 with SMTP id da7mr8709849wib.29.1320688283518;
	Mon, 07 Nov 2011 09:51:23 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id db1sm1595803wib.19.2011.11.07.09.51.21
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 09:51:22 -0800 (PST)
Message-ID: <4EB81A97.6070703@intel.com>
Date: Mon, 07 Nov 2011 09:51:19 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320218594-13009-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1320218594-13009-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] udev-164: Update init script to do an explicit add action
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
X-List-Received-Date: Mon, 07 Nov 2011 17:58:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 12:23 AM, Kumar Gala wrote:
> With udev 152 or greater the default action for 'udevadm trigger' was
> modified to be 'change' instead of 'add.
>
> To ensure initial coldplug events at boot are seen be scripts the are
> expecting them as 'add' events we invoke udevadm with an explicit
> '--action=add'.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/recipes-core/udev/udev-164/init |    4 ++--
>   meta/recipes-core/udev/udev_164.bb   |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev-164/init
> index 9ce95ee..073942f 100644
> --- a/meta/recipes-core/udev/udev-164/init
> +++ b/meta/recipes-core/udev/udev-164/init
> @@ -48,10 +48,10 @@ kill_udevd>  "/dev/null" 2>&1
>
>           /sbin/udevadm control --env=STARTUP=1
>   		if [ "$not_first_boot" != "" ];then
> -			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
> +			/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
>   			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
>   		else
> -			/sbin/udevadm trigger
> +			/sbin/udevadm trigger --action=add
>   			/sbin/udevadm settle
>   		fi
>
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
> index 7cbe4d8..d487add 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
>   include udev-new.inc
>
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI += "file://udev-166-v4l1-1.patch"
>

Merged into OE-Core

Thanks
	Sau!


