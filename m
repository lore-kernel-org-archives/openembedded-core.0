Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F08A8615F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 06:11:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r896Bjj4019468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Sep 2013 23:11:45 -0700 (PDT)
Received: from [128.224.159.157] (128.224.159.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 8 Sep 2013 23:11:44 -0700
Message-ID: <522D669E.5080001@windriver.com>
Date: Mon, 9 Sep 2013 14:11:42 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
In-Reply-To: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Originating-IP: [128.224.159.157]
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
X-List-Received-Date: Mon, 09 Sep 2013 06:11:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

This patch can not work on routerstationpro.

After apply this patch, the system can not boot up.

Here is the boot log (I print some variables):

...
Configuring network interfaces... ifup skipped for nfsroot interface eth0
run-parts: /etc/network/if-pre-up.d/nfsroot exited with code 1
Starting rpcbind daemon...done.
hwclock: can't open '/dev/misc/rtc': No such file or directory
Thu Sep 5 22:45:00 UTC 2013
hwclock: can't open '/dev/misc/rtc': No such file or directory
INIT: Entering runlevel: 5
Starting system message bus: dbus.
Starting Connection Manager
NET_DEVS = lo
eth1
sit0
eth0
NET_ADDR = 128.224.165.207:128.224.165.20:128.224.165.1:255.255.255.0::eth0
ADDR = 127.0.0.1
ADDR =
ADDR =
ADDR = 128.224.165.207
eth0: link down
nfs: server 128.224.165.20 not responding, still trying


The system can not boot up since eth0 down.

# cat /proc/cmdline
console=ttyS0,115200 root=/dev/nfs rw 
nfsroot=128.224.165.20:/export/pxeboot/vlm-boards/19256/rootfs 
ip=128.224.165.207:128.224.165.20:128.224.165.1:255.255.255.0::eth0:off 
board=UBNT-RSPRO ethaddr=00.00.00.33.46.63


于 2013年09月06日 15:23, Jukka Rissanen 写道:
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


