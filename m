Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DFDE36B90F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 17:34:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Aug 2013 10:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,929,1367996400"; d="scan'208";a="349724742"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2013 10:34:24 -0700
Message-ID: <5214FA20.6090803@linux.intel.com>
Date: Wed, 21 Aug 2013 10:34:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1377064624.git.jackie.huang@windriver.com>
	<0b8b0b9d30aa7677a5c23e4d03d4ce6e21678ad7.1377064624.git.jackie.huang@windriver.com>
In-Reply-To: <0b8b0b9d30aa7677a5c23e4d03d4ce6e21678ad7.1377064624.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Wed, 21 Aug 2013 17:34:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 11:15 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../openssh/openssh-6.2p2/init                     |   14 +++++++++++++-
>   1 files changed, 13 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
> index 12fb79b..72c5822 100644
> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
> @@ -1,6 +1,9 @@
>   #! /bin/sh
>   set -e
>
> +# source function library
> +. /etc/init.d/functions
> +
>   # /etc/init.d/ssh: start and stop the OpenBSD "secure shell" daemon
>
>   test -x /usr/sbin/sshd || exit 0
> @@ -54,6 +57,11 @@ check_keys() {
>   	fi
>   }
>
> +rh_status() {
> +	status /usr/sbin/sshd
> +	return $?
> +}
> +
>   export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
>
>   case "$1" in
> @@ -92,8 +100,12 @@ case "$1" in
>   	echo "."
>   	;;
>
> +  status)
> +	rh_status

Why rh_status here and in the "at" script?  Can't you just do the status 
/usr/bin/sshd directly here?

> +  ;;
> +
>     *)
> -	echo "Usage: /etc/init.d/ssh {start|stop|reload|force-reload|restart}"
> +	echo "Usage: /etc/init.d/ssh {start|stop|status|reload|force-reload|restart}"
>   	exit 1
>   esac
>
>

