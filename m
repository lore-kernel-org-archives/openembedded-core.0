Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 148537FC5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:57:33 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 47xGsT1Vh8z5tlC;
	Mon, 13 Jan 2020 15:57:33 +0100 (CET)
Date: Mon, 13 Jan 2020 15:57:31 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20200113145729.amwegnpvnp2kb3ut@qschulz>
References: <20180514144415.40730-1-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <20180514144415.40730-1-stefan@agner.ch>
User-Agent: NeoMutt/20180716
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Mon, 13 Jan 2020 14:57:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Mon, May 14, 2018 at 04:44:15PM +0200, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> The udhcpc script calls ip addr flush .. which flushes addresses
> of any address family, including IPv6. However, busybox udhcpc is
> IPv4 only and should not influence IPv6 addressing. Hence use ip
> addr flush with family constrait.
> 
> The script particularly broke IPv6 SLAAC: Typically when udhcpc
> calls the script the kernel already assigned the IPv6 link-local
> address. The flush removes the link-local IPv6 address again and
> prohibits proper IPv6 operation such as SLAAC since neighbor
> discovery protocol relies on IPv6 link-local addressing.
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/recipes-core/busybox/files/simple.script | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
> index 6ed0293525..8b5eb53633 100644
> --- a/meta/recipes-core/busybox/files/simple.script
> +++ b/meta/recipes-core/busybox/files/simple.script
> @@ -28,7 +28,7 @@ case "$1" in
>  		fi
>  		if ! root_is_nfs ; then
>                          if [ $have_bin_ip -eq 1 ]; then
> -                                /SBIN_DIR/ip addr flush dev $interface
> +                                /SBIN_DIR/ip -4 addr flush dev $interface
>                                  /SBIN_DIR/ip link set dev $interface up
>                          else
>                                  /SBIN_DIR/ifconfig $interface 0.0.0.0

Kindly pinging, happened to us as well many times.

OT: Didn't have the original mail, so hopefully getting the mbox file
and answering to it didn't trigger anything weird somewhere :)

Thanks,
Quentin

