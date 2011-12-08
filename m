Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYiWn-0003bj-G0
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 19:17:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Dec 2011 10:10:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83704878"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by azsmga001.ch.intel.com with ESMTP; 08 Dec 2011 10:10:14 -0800
Message-ID: <4EE0FD86.2030908@linux.intel.com>
Date: Thu, 08 Dec 2011 10:10:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323202770-19265-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1323202770-19265-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH] rootfs_ipk: implement FEED_DEPLOYDIR_BASE_URI support
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
X-List-Received-Date: Thu, 08 Dec 2011 18:17:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/06/2011 12:19 PM, Eric Bénard wrote:
> this feature was present in OE-classic, is documented in OE-core
> but its implementation is actually missing.
> The present implementation is directly copied from OE-classic
> and tested on an arm926 machine.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   meta/classes/rootfs_ipk.bbclass |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index b4b95c5..ec01951 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -205,7 +205,18 @@ ipk_insert_feed_uris () {
>
>   		# insert new feed-sources
>   		echo "src/gz $feed_name $feed_uri">>  ${IPKGCONF_TARGET}
> -        done
> +	done
> +
> +	# Allow to use package deploy directory contents as quick devel-testing
> +	# feed. This creates individual feed configs for each arch subdir of those
> +	# specified as compatible for the current machine.
> +	# NOTE: Development-helper feature, NOT a full-fledged feed.
> +	if [ -n "${FEED_DEPLOYDIR_BASE_URI}" ]; then
> +		for arch in ${PACKAGE_ARCHS}
> +		do
> +			echo "src/gz local-$arch ${FEED_DEPLOYDIR_BASE_URI}/$arch">>  ${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
> +	    done
> +	fi
>   }
>
>   python () {

Merged into OE-Core

Thanks
	Sau!



