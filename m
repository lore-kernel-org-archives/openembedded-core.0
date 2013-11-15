Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EF7806D5A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:15:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2013 07:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435866681"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2013 07:15:06 -0800
Message-ID: <52863A79.3010006@linux.intel.com>
Date: Fri, 15 Nov 2013 07:15:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Yue Tao <Yue.Tao@windriver.com>, openembedded-core@lists.openembedded.org
References: <1384497286-19011-1-git-send-email-Yue.Tao@windriver.com>
In-Reply-To: <1384497286-19011-1-git-send-email-Yue.Tao@windriver.com>
Subject: Re: [PATCH 1/2] Avoid starting rpcbind daemon twice during boot
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
X-List-Received-Date: Fri, 15 Nov 2013 15:15:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 10:34 PM, Yue Tao wrote:
> Check whether rpcbind daemon already run before starting it.
>
Please review the commit guidelines for both of your patches and correct 
the short summary (subject) to be in the form of:

initscripts: Avoid ...

Thanks
	SaU!

> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   .../initscripts/initscripts-1.0/mountnfs.sh        |    9 ++++++---
>   1 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> index 4fffe4e..a03070d 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> @@ -69,9 +69,12 @@ if test "$rpcbind" = yes
>   then
>   	if test -x /usr/sbin/rpcbind
>   	then
> -		echo -n "Starting rpcbind... "
> -		start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
> -		sleep 2
> +		service rpcbind status > /dev/null
> +		if [ $? != 0 ]; then
> +			echo -n "Starting rpcbind..."
> +			start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
> +			sleep 2
> +		fi
>   	fi
>   fi
>
>

