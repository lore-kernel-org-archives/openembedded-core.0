Return-Path: <stefan@agner.ch>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Jun 2019 12:30:16 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5017E3F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 12:30:16 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id E0E8B5C1984;
	Mon, 24 Jun 2019 14:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1561379083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=3YgSG5aB/SRZd8+1nhkJIvaLJPbmUz2kCmgG70nTRoM=;
	b=w/zXH12gQhjDuPikT+e8MxGUUWHyX+b3j//NWffm13M33BA8td0MFiPtN3WMxmvrdzziF8
	HWM8GN/HGEpQGzj7iRWeZaB1htGUdILucx0EUEmUK6Shl/H4Kls7ej/HmZLBh1l6NewQT8
	bV3h8Uj64QU16QxJYgYravvwANbzg+k=
MIME-Version: 1.0
Date: Mon, 24 Jun 2019 14:24:43 +0200
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20180514144415.40730-1-stefan@agner.ch>
References: <20180514144415.40730-1-stefan@agner.ch>
Message-ID: <a05f627f3ca58557dca8db9cd2f42b8a@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: Stefan Agner <stefan.agner@toradex.com>, modonovan@biotector.com
Subject: Re: [PATCH] busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Mon, 24 Jun 2019 12:30:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Any comment on this patch? Just stumbled upon that problem today again
:-)

--
Stefan

On 14.05.2018 16:44, Stefan Agner wrote:
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
> diff --git a/meta/recipes-core/busybox/files/simple.script
> b/meta/recipes-core/busybox/files/simple.script
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
> -- 
> 2.13.6

