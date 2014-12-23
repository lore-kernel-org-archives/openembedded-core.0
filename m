Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F15B9726EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 00:54:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN0stHL003912
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 22 Dec 2014 16:54:55 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 22 Dec 2014 16:54:54 -0800
Message-ID: <5498BD5B.4030800@windriver.com>
Date: Tue, 23 Dec 2014 08:54:51 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1419243206.13316.70.camel@linuxfoundation.org>
In-Reply-To: <1419243206.13316.70.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH] runqemu-internal: Fix qemu networking for qemuarm64
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
X-List-Received-Date: Tue, 23 Dec 2014 00:55:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月22日 18:13, Richard Purdie wrote:
> This brings qemuarm64 into feature parity with the other qemu machines
> and enables the automated testing on the autobuilder.

Great!  It will be enormously helpful.
Thanks.

--Kai

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index c219419..f6274e2 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -264,7 +264,7 @@ else
>               ROOTFS_OPTIONS="-hda $ROOTFS"
>           fi
>           if [ "$MACHINE" = "qemuarm64" ]; then
> -            QEMU_NETWORK_CMD="-netdev user,id=net0 -device virtio-net-device,netdev=net0"
> +            QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
>               DROOT="/dev/vda"
>               ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS -device virtio-blk-device,drive=disk0"
>           fi
> @@ -381,7 +381,7 @@ if [ "$MACHINE" = "qemuarm64" ]; then
>       export QEMU_AUDIO_DRV="none"
>       QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
>       if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
> -        KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off"
> +        KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
>           # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
>           QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>       fi
>
>
>
>


-- 
Regards,
Neil | Kai Kang


