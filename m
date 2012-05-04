Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQMMf-00048K-1j
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 19:32:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 10:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="140178340"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2012 10:22:32 -0700
Message-ID: <4FA41058.7090204@linux.intel.com>
Date: Fri, 04 May 2012 10:22:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336136978-11081-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1336136978-11081-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] busybox: port improvements to simple.script from Debian (udhcpc)
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
X-List-Received-Date: Fri, 04 May 2012 17:32:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 06:09 AM, Andreas Oberritter wrote:
> * Support resolvconf
> * Avoid bashism $((metric++))
> * Use 'domain' instead of 'search' for domain parameter
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * This patch is based on the denzil branch.
> * This patch requires "busybox: remove unused patches for simple.script (udhcpc)",
>    because of the PR bump.
>
>   meta/recipes-core/busybox/busybox_1.19.4.bb   |    2 +-
>   meta/recipes-core/busybox/files/simple.script |   27 ++++++++++++++++++-------
>   2 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
> index 30dd333..0b1e787 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://B921600.patch \
> diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
> index 5cc21b9..27368f0 100644
> --- a/meta/recipes-core/busybox/files/simple.script
> +++ b/meta/recipes-core/busybox/files/simple.script
> @@ -20,6 +20,9 @@ fi
>
>   case "$1" in
>   	deconfig)
> +		if [ -x /sbin/resolvconf ]; then
> +			/sbin/resolvconf -d "${interface}.udhcpc"
> +		fi
>   		if ! root_is_nfs ; then
>                           if [ $have_bin_ip -eq 1 ]; then
>                                   ip addr flush dev $interface
> @@ -53,19 +56,29 @@ case "$1" in
>   			metric=0
>   			for i in $router ; do
>                                   if [ $have_bin_ip -eq 1 ]; then
> -                                        ip route add default via $i metric $((metric++))
> +                                        ip route add default via $i metric $metric
>                                   else
> -                                        route add default gw $i dev $interface metric $((metric++)) 2>/dev/null
> +                                        route add default gw $i dev $interface metric $metric 2>/dev/null
>                                   fi
> +                                metric=$(($metric + 1))
>   			done
>   		fi
>
> -		echo -n>  $RESOLV_CONF
> -		[ -n "$domain" ]&&  echo search $domain>>  $RESOLV_CONF
> -		for i in $dns ; do
> -			echo adding dns $i
> -			echo nameserver $i>>  $RESOLV_CONF
> +		# Update resolver configuration file
> +		R=""
> +		[ -n "$domain" ]&&  R="domain $domain
> +"
> +		for i in $dns; do
> +			echo "$0: Adding DNS $i"
> +			R="${R}nameserver $i
> +"
>   		done
> +
> +		if [ -x /sbin/resolvconf ]; then
> +			echo -n "$R" | /sbin/resolvconf -a "${interface}.udhcpc"
> +		else
> +			echo -n "$R">  "$RESOLV_CONF"
> +		fi
>   		;;
>   esac
>

Merged into OE-Core

Thanks
	Sau!



