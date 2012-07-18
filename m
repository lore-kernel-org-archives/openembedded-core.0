Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrIcQ-0006QD-LV
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 03:00:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 17:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123671771"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jul 2012 17:48:17 -0700
Message-ID: <500607D1.1010009@linux.intel.com>
Date: Tue, 17 Jul 2012 17:48:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CACFtY++ekHacLd5VLvfEabKxkdTFxSzfa6oU+aRbS5br_PzDxA@mail.gmail.com>
In-Reply-To: <CACFtY++ekHacLd5VLvfEabKxkdTFxSzfa6oU+aRbS5br_PzDxA@mail.gmail.com>
Cc: Nathan West <nathan.west@okstate.edu>
Subject: Re: [PATCH] point prelink.conf to ${IMAGE_ROOTFS}
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
X-List-Received-Date: Wed, 18 Jul 2012 01:00:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 03:16 PM, Nathan West wrote:
> Hopefully I do this right. First time patching (ever! this is exciting :-) )
>
Welcome to the wonderful world of patching!

> The --root option doesn't work and isn't documented anywhere I could
> find, and without the ${IMAGE_ROOTFS} before the config file it was
> point to my native /etc/prelink.conf (which doesn't exist and probably
> would be useful if it did)
>
Which prelink are you using, it's possible you did not look at the 
correct one.

There should be a tmp/sysroot/x86_64-linux/usr/sbin/prelink (if you are 
building on a 64bit machine, otherwise i586-linux), that's the prelink 
binary and a --help to that will show the --root option.

It should not be using your host's /etc/prelink.conf, but the sysroot 
version.

The --root option should take care of it as it's described as follows:

      --root=ROOT_PATH       Prefix all paths with ROOT_PATH

So, the next question is what's going on to cause it to use your host's 
prelinker instead of the native version that should be build as part of 
the native tools?


> Be gentle if I screwed up!
No worries.
> -Nathan
>

Hope that was not too painful, let see how we can help you accomplish 
what you are trying to do.

Sau!


>
>
> ---
>   meta/classes/image-prelink.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image-prelink.bbclass
> b/meta/classes/image-prelink.bbclass
> index 53ef47e..2d62f03 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -21,7 +21,7 @@ prelink_image () {
> fi
> # prelink!
> -${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS}
> -amR -N -c ${sysconfdir}/prelink.conf
> +${STAGING_DIR_NATIVE}${sbindir_native}/prelink ${IMAGE_ROOTFS} -amR -N
> -c ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
> # Remove the prelink.conf if we had to add it.
> if [ "$dummy_prelink_conf" = "true" ]; then
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



