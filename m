Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9A33A6DBF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:46:41 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id f12so315365vbg.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PlIriOp0qHbpg3u9tAQOC2eJH8V3DZyyqreZEGxTp7c=;
	b=bn4J9G/29QlI/FIJkjjVC3hLeF1w4aMHezqfA/UO2Q1Xi4Fd74USH5M8+C6VwoJdJq
	fI7zxzQv0QbhojzZcDLXVVjEFDwmMKfveOa9pkrEYnr2yKObn35Z3HIO6cUz6mGCRXQc
	a0odrMXyQAOJr2miUDA8+zQ5GFwa8awTlM0MDBbXHC+lHLMOmpJQYYW0peDzbwcpjEdp
	FlGBpiGbdwheUnLVmW/tzgivheN/3rf14+5maD461AMv+7HY4sLVwI8TgDriVL6QN3Ks
	FRWq923UxWRr9OqnlPRYdWfp/TrXj7bwWqxUNhCkbTRALrBLZNyTVYEBfJBrUVmEU2Ru
	u8Cw==
X-Gm-Message-State: ALoCoQmATpp70/UIB/8xdJYQFlUIkrHNiKU5bMjz1autxqafxnB4od2Pv6ChNPOrI1LsYk6N/Z6B
X-Received: by 10.58.116.239 with SMTP id jz15mr1368581veb.26.1390405602434;
	Wed, 22 Jan 2014 07:46:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Wed, 22 Jan 2014 07:46:22 -0800 (PST)
In-Reply-To: <1387461777-25101-1-git-send-email-valentin.popa@intel.com>
References: <1387461777-25101-1-git-send-email-valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jan 2014 15:46:22 +0000
Message-ID: <CAJTo0LYyvpbqXDLXH6vGjG+K+w-ZNi4Lu0UAvXFxnb6Emx=D5A@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Allow user to set -vga option with qemuparams
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
X-List-Received-Date: Wed, 22 Jan 2014 15:46:42 -0000
Content-Type: text/plain; charset=UTF-8

Just noticed that this was merged but doesn't add anything to the
usage() function in runqemu - can you quickly add something?

Ross

On 19 December 2013 14:02, Valentin Popa <valentin.popa@intel.com> wrote:
> At the moment, the user cannot to set -vga other then vmware
> (because "vmware" is set by default); and the first argument
> in qemuparams has higher precedence.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>  scripts/runqemu          |  1 +
>  scripts/runqemu-internal | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 9c0a03b..dcb2931 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -156,6 +156,7 @@ while true; do
>              # to use simplified options instead
>              serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
>              kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
> +            vga_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-vga\)'`
>              [ ! -z "$serial_option" -o ! -z "$kvm_option" ] && \
>                  echo "Please use simplified serial or kvm options instead"
>              ;;
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 74b0c35..284b88c 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -357,7 +357,11 @@ fi
>
>  if [ "$MACHINE" = "qemux86" ]; then
>      QEMU=qemu-system-i386
> -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
> +    if [ ! -z "$vga_option" ]; then
> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
> +    else
> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
> +    fi
>      if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>          KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>          QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
> @@ -381,7 +385,11 @@ fi
>
>  if [ "$MACHINE" = "qemux86-64" ]; then
>      QEMU=qemu-system-x86_64
> -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
> +    if [ ! -z "$vga_option" ]; then
> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
> +    else
> +        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
> +    fi
>      if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>          KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>          QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
> --
> 1.8.3.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

