Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TE6QR-0000HE-JO
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:37:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Sep 2012 15:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,445,1344236400"; d="scan'208";a="194277876"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by azsmga001.ch.intel.com with ESMTP; 18 Sep 2012 15:25:09 -0700
Message-ID: <5058F4C5.9030903@linux.intel.com>
Date: Tue, 18 Sep 2012 15:25:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andy Ross <andy.ross@windriver.com>
References: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-2-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-3-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1348004325-30668-3-git-send-email-andy.ross@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev-extraconf: Don't mount root filesystem under /media
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 22:37:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 02:38 PM, Andy Ross wrote:
> The mount.sh handler attempts to prevent already-mounted filesystems
> from being mounted as dynamic/removable "/media".  But it misses the
> case where the kernel has mounted the root filesystem (e.g. with
> "root=/dev/sda1").  In that situation, /proc/mounts has a device name
> of "/dev/root" instead of the proper $DEVNAME string exposed by udev.
> So we must also test the root filesystem device number vs. the
> $MAJOR/$MINOR udev tells us.
>
How much bigger does this make the busybox image?

Sau!

> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>   meta/recipes-core/udev/udev-extraconf/mount.sh | 8 ++++++--
>   meta/recipes-core/udev/udev-extraconf_1.0.bb   | 2 +-
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index 2eb9aff..99c76b2 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -49,8 +49,12 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
>       		$MOUNT $DEVNAME 2> /dev/null
>   	fi
>   	
> -	# If the device isn't mounted at this point, it isn't configured in fstab
> -	grep -q "^$DEVNAME " /proc/mounts || automount
> +	# If the device isn't mounted at this point, it isn't
> +	# configured in fstab (note the root filesystem can show up as
> +	# /dev/root in /proc/mounts, so check the device number too)
> +	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
> +		grep -q "^$DEVNAME " /proc/mounts || automount
> +	fi
>   fi
>
>
> diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
> index 9995899..2c4a4f1 100644
> --- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
> +++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>
>   inherit allarch
>
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = " \
>          file://automount.rules \
>


