Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD20C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:20:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.40444.1655799642782700720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jm4kuy8R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 839424000E;
	Tue, 21 Jun 2022 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655799641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+qqlpy5K/YTw1VY4vYdkQlXDdRRCjEJZIxcYx2JqAA=;
	b=jm4kuy8Riygp6C2bxe7cbZEE4ejxixhl9A2KDPvn0jnD0w7L9+DvV2HMamElOC0/PUFZLk
	771AbyswmLuHajjciOLWHs/JpZ1VuPjQ6zSPvGbcl3oujcaBHjs5+sVhCcNgOkxjjMND0r
	uq2ypLFF3O/Gj45m4ijVXxe9ocQKtZ3E7nLqco8Zy3aBxJl5AvI6qatVORHmWobHVwAM2E
	Zw5dlHb4MFbcoXV+qiOSBsgI5FShXOWJdviv/pzA/0sX4CUsf+/A1XlLs67CeWwICJU+qK
	61echiiK2IYe6FoPi+24WAI01R5g068bXtXGqNtG/nj/RSZlS/t80rn6NOLRGw==
Date: Tue, 21 Jun 2022 10:20:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Muhammad Hamza" <Muhammad_Hamza@mentor.com>
Cc: <openembedded-core@lists.openembedded.org>, "Arsalan H . Awan"
 <Arsalan_Awan@mentor.com>
Subject: Re: [OE-core] [PATCH] udev-extraconf/mount.sh: add LABELs to
 mountpoints
Message-ID: <20220621102038.00b08ff3@booty>
In-Reply-To: <20220620122640.239381-1-muhammad_hamza@mentor.com>
References: <20220620122640.239381-1-muhammad_hamza@mentor.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:20:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167135

Hi Muhammad,

On Mon, 20 Jun 2022 17:26:40 +0500
"Muhammad Hamza" <Muhammad_Hamza@mentor.com> wrote:

> This alters the mountpoints such that if a device has a LABEL or
> a PARTLABEL, it will be mounted at e.g.:
> 
>   /run/media/$LABEL-<device-node>
>   /run/media/$PARTLABEL-<device-node>
>   /run/media/rootfs-sda2
> 
> otherwise the device will be mounted at e.g.:
> 
>   /run/media/<device-node>
>   /run/media/sda1
> 
> The <device-node> appended with LABEL or PARTLABEL makes sure that
> the mountpoint is unique, therefore, avoids overlapping mounts.
> 
> Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  .../recipes-core/udev/udev-extraconf/mount.sh | 20 +++++++++++++++++++
>  meta/recipes-core/udev/udev-extraconf_1.1.bb  |  2 +-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index c8b773bc07..12c6a5af22 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -54,6 +54,16 @@ automount_systemd() {
>          grep "^[[:space:]]*$tmp" /etc/fstab && return
>      done
>  
> +    # Get the LABEL or PARTLABEL
> +    LABEL=`/sbin/blkid | grep "${DEVNAME}:" | grep -o 'LABEL=".*"' | cut -d '"' -f2`
> +    # If the $DEVNAME has a LABEL or a PARTLABEL
> +    if [ -n "$LABEL" ]; then
> +            # Set the mount location dir name to LABEL appended
> +            # with $name e.g. label-sda. That would avoid overlapping
> +            # mounts in case two devices have same LABEL
> +            name="${LABEL}-${name}"
> +    fi
> +
>      [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
>  
>      MOUNT="$MOUNT -o silent"
> @@ -94,6 +104,16 @@ automount() {
>  	# configured in fstab
>  	grep -q "^$DEVNAME " /proc/mounts && return
>  
> +        # Get the LABEL or PARTLABEL
> +        LABEL=`/sbin/blkid | grep "${DEVNAME}:" | grep -o 'LABEL=".*"' | cut -d '"' -f2`
> +        # If the $DEVNAME has a LABEL or a PARTLABEL
> +        if [ -n "$LABEL" ]; then
> +                # Set the mount location dir name to LABEL appended
> +                # with $name e.g. label-sda. That would avoid overlapping
> +                # mounts in case two devices have same LABEL
> +                name="${LABEL}-${name}"
> +        fi

This is exactly as above. Can you move the common code to a function?


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

