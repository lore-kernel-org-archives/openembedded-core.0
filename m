Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 588CE731A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 13:58:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 09 Feb 2016 05:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="743037492"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.26.146])
	by orsmga003.jf.intel.com with ESMTP; 09 Feb 2016 05:58:27 -0800
Message-ID: <1455026305.6918.5.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2016 13:58:25 +0000
In-Reply-To: <1455020449-320-1-git-send-email-modonovan@biotector.com>
References: <1455020449-320-1-git-send-email-modonovan@biotector.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] udhcpc: specify full path for ip command calls
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
X-List-Received-Date: Tue, 09 Feb 2016 13:58:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-09 at 12:20 +0000, Mark O'Donovan wrote:
> Running with a restricted environment (e.g. cron) was causing
> issues as we check for the ip command with full path and call
> without full path

This change should probably change the /sbin/ path in the script to a
symbol and use sed to replace it with the expansion of ${sbindir}
rather than hard-coding a path which isn't always correct.

Regards,

Joshua

> ---
>  meta/recipes-core/busybox/files/simple.script | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/files/simple.script
> b/meta/recipes-core/busybox/files/simple.script
> index 22168b0..e233c3c 100644
> --- a/meta/recipes-core/busybox/files/simple.script
> +++ b/meta/recipes-core/busybox/files/simple.script
> @@ -28,8 +28,8 @@ case "$1" in
>  		fi
>  		if ! root_is_nfs ; then
>                          if [ $have_bin_ip -eq 1 ]; then
> -                                ip addr flush dev $interface
> -                                ip link set dev $interface up
> +                                /sbin/ip addr flush dev $interface
> +                                /sbin/ip link set dev $interface up
>                          else
>                                  /sbin/ifconfig $interface 0.0.0.0
>                          fi
> @@ -38,7 +38,7 @@ case "$1" in
>  
>  	renew|bound)
>                  if [ $have_bin_ip -eq 1 ]; then
> -                        ip addr add dev $interface local $ip/$mask
> $BROADCAST
> +                        /sbin/ip addr add dev $interface local
> $ip/$mask $BROADCAST
>                  else
>                          /sbin/ifconfig $interface $ip $BROADCAST
> $NETMASK
>                  fi
> @@ -59,7 +59,7 @@ case "$1" in
>  			metric=10
>  			for i in $router ; do
>                                  if [ $have_bin_ip -eq 1 ]; then
> -                                        ip route add default via $i
> metric $metric
> +                                        /sbin/ip route add default
> via $i metric $metric
>                                  else
>                                          route add default gw $i dev
> $interface metric $metric 2>/dev/null
>                                  fi
> -- 
> 1.9.1
> 

