Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 90AEB6BF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:08:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Sep 2013 09:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,916,1371106800"; d="scan'208";a="295460698"
Received: from unknown (HELO [10.255.14.132]) ([10.255.14.132])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Sep 2013 09:08:00 -0700
Message-ID: <52372CE0.3060101@linux.intel.com>
Date: Mon, 16 Sep 2013 09:08:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
In-Reply-To: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Ignore the NFS root network interface in init script
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
X-List-Received-Date: Mon, 16 Sep 2013 16:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2013 12:23 AM, Jukka Rissanen wrote:
> The connman init.d script tried to ignore all the network interfaces
> if NFS root is configured. We should only ignore the interface
> that is used by NFS root.
>
> [YOCTO #4587]
>
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>   meta/recipes-connectivity/connman/connman/connman | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
> index 67ba7c8..2625ade 100644
> --- a/meta/recipes-connectivity/connman/connman/connman
> +++ b/meta/recipes-connectivity/connman/connman/connman
> @@ -29,8 +29,18 @@ done
>   do_start() {
>   	EXTRA_PARAM=""
>   	if test $nfsroot -eq 1 ; then
> -		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
> -		EXTRA_PARAM="-I $ethn"
> +	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
> +	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ ]*\):.*$/\1/p'`
> +
> +	    if [ x$NET_ADDR != x ]; then
> +		for i in $NET_DEVS; do
> +		    ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> +		    if [ "$NET_ADDR" = "$ADDR" ]; then
> +			EXTRA_PARAM="-I $i"
> +			break
> +		    fi
> +		done
> +	    fi
>   	fi
>   	if [ -f @LIBDIR@/connman/wired-setup ] ; then
>   		. @LIBDIR@/connman/wired-setup
>

This seems to have introduced a different issue, please see 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5176

Can you please look into this.

Thanks
	Sau!


