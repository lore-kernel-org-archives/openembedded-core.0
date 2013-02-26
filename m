Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAA5k-0001B7-Vc
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 03:17:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2013 18:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="295838685"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2013 18:00:05 -0800
Message-ID: <512C1725.80906@linux.intel.com>
Date: Mon, 25 Feb 2013 18:00:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1361783630.git.Qi.Chen@windriver.com>
	<cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
In-Reply-To: <cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: start .sh scripts correctly
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
X-List-Received-Date: Tue, 26 Feb 2013 02:17:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2013 05:39 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, scripts which end with '.sh' were sourced, so the arguments
> like 'start' and 'stop' were just ignored.
>
> This resulted in some init scripts not being able to start correctly.
> For example, sourcing hwclock.sh in busybox actually does nothing.
> It should be invoked as 'hwclock.sh start' or 'hwclock.sh stop'.
>
> This patch fixes this issue.
>
> [YOCTO #3612]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/sysvinit/sysvinit/rc |   16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
> index 44bc9bf..50951da 100755
> --- a/meta/recipes-core/sysvinit/sysvinit/rc
> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
> @@ -41,21 +41,7 @@ startup_progress() {
>   startup() {
>     # Handle verbosity
>     [ "$VERBOSE" = very ] && echo "INIT: Running $@..."
> -
> -  case "$1" in
> -	*.sh)
> -		# Source shell script for speed.
> -		(
> -			trap - INT QUIT TSTP

Are you sure you don't want the trap still?  I realize this reset it to 
default..

Sau!

> -			scriptname=$1
> -			shift
> -			. $scriptname
> -		)
> -		;;
> -	*)
> -		"$@"
> -		;;
> -  esac
> +  "$@"
>     startup_progress
>   }
>
>


