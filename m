Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4956066A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 01:34:13 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 May 2013 18:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,767,1363158000"; d="scan'208";a="248447401"
Received: from unknown (HELO [10.255.13.98]) ([10.255.13.98])
	by AZSMGA002.ch.intel.com with ESMTP; 29 May 2013 18:34:12 -0700
Message-ID: <51A6AC93.7030103@linux.intel.com>
Date: Thu, 30 May 2013 10:34:11 +0900
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1369078242-4032-1-git-send-email-jslater@windriver.com>
	<1369078242-4032-2-git-send-email-jslater@windriver.com>
In-Reply-To: <1369078242-4032-2-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] util-linux: adjust hwclock ALTERNATIVE_PRIORITY
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
X-List-Received-Date: Thu, 30 May 2013 01:34:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2013 04:30 AM, Joe Slater wrote:
> Make ALTERNATIVE_PRIORITY[hwclock] dependent on an
> OVERRIDE so that the hwclock from busybox, if available,
> will be used for the nslu2 bsp.
>
> Independently, add util-linux-agetty to RRECOMMENDS.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc |    9 ++++++---
>   1 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index c783385..10493aa 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -88,7 +88,9 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
>   RDEPENDS_util-linux-reset += "ncurses"
>
>   RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
> -RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
> +RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
> +                     util-linux-mount util-linux-readprofile util-linux-mkfs \
> +                     util-linux-agetty "
>
I think this patch should be sperated out since it has nothing to do 
with hwclock.

>   RRECOMMENDS_${PN}_class-native = ""
>   RDEPENDS_${PN}_class-native = ""
> @@ -175,9 +177,10 @@ ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
>   ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
>   ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
>
> -# There seems to be problem, atleast on nslu2, with these, untill they are
> +# There seems to be problems, at least on nslu2, with these, until they are
>   # fixed the busybox ones have higher priority
> -ALTERNATIVE_PRIORITY[hwclock] = "10"
> +#
> +ALTERNATIVE_PRIORITY[hwclock] = "${@['100', '10']['${OVERRIDES}'.find('nslu2') != -1]}"
>   ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
>
I am not sure this is the right way to go with this, as I think it will 
make util-linux be MACHINE specific, which it should not be.

Can the nslu2 layer which seems to be maintained by Khem Raj take a 
patch that will set the ALTERNATIVE_PRIORITY of hwclock to 10, we might 
need to have a patch here:

ALTERNATIVE_PRIORITY[hwclock] ?= "100" so that it can be overridden by 
the layer?

Thoughts

Sau!


>   ALTERNATIVE_util-linux-fdisk = "fdisk"
>

