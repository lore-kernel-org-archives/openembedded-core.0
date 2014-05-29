Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04C206FC84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 11:16:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4TBGA5v020999; Thu, 29 May 2014 12:16:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I-0L_iCoj-Sx; Thu, 29 May 2014 12:16:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4TBG6IC020934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 29 May 2014 12:16:08 +0100
Message-ID: <1401362158.2607.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@neratec.com>
Date: Thu, 29 May 2014 12:15:58 +0100
In-Reply-To: <1634957.0tvEDlpPGg@chl500346>
References: <1634957.0tvEDlpPGg@chl500346>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu-internal: add NIC to kernel parameters
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
X-List-Received-Date: Thu, 29 May 2014 11:16:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-27 at 12:22 +0200, Adrian Freihofer wrote:
> Fixes [YOCTO #6356]
> 
> Problem: If QEMU parameters are extended to emulate additional
> network interfaces, NFS boot does not work. Example:
> runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..."
> This is solved by extending the kernel parameters by "::eth0:on"
> ---
>  scripts/runqemu-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index d317dfd..30d6514 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -249,7 +249,7 @@ else
>          n1=$(($n0 * 2 + 1))
>          n2=$(($n1 + 1))
>  
> -        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
> +        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:on"
>          QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
>          if [ "$KVM_ACTIVE" = "yes" ]; then
>              QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"

Unfortunately this results in failures in all our automated sanity
tests:

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/94/steps/Running%20Sanity%20Tests_1/logs/stdio

Cheers,

Richard


