Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsLi-000875-F3
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:05:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2012 13:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134550287"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2012 13:55:26 -0700
Message-ID: <4F9B07BE.3080703@linux.intel.com>
Date: Fri, 27 Apr 2012 13:55:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335312509.git.scott.a.garman@intel.com>
	<49762500156a52102418293f3fe167b21e252d8a.1335312509.git.scott.a.garman@intel.com>
In-Reply-To: <49762500156a52102418293f3fe167b21e252d8a.1335312509.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] runqemu-ifup: enable ip masquerading for QEMU NAT addresses
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
X-List-Received-Date: Fri, 27 Apr 2012 21:05:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2012 05:11 PM, Scott Garman wrote:
> Fix the IP masquerading settings so that networked QEMU sessions can
> reach external networks.
>
> This is a partial fix for [YOCTO #2329].
>
> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> ---
>   scripts/runqemu-ifup |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index 3bd9980..f80538f 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -100,7 +100,8 @@ dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
>   $ROUTE add -host 192.168.7.$dest $TAP
>
>   # setup NAT for tap0 interface to have internet access in QEMU
> -$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.0/24
> +$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
> +$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
>   echo 1>  /proc/sys/net/ipv4/ip_forward
>   $IPTABLES -P FORWARD ACCEPT
>

Merged into OE-Core

Thanks
	Sau!


