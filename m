Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TmVlg-00026R-B6
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 21:34:06 +0100
Received: from mail-da0-f70.google.com ([209.85.210.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Dec 2012 12:19:11 -0800
Received: by mail-da0-f70.google.com with SMTP id t11so5268807daj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 12:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:message-id:date:from:user-agent:mime-version
	:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=RKfAdknNi+IHbJ4Y99b333MVTOatkPkblhNIHZeAZhY=;
	b=MyEYJc/5Jhr+QhyQpPIIqP2dEFrKzbB6ckoHN+63WrP1/EjZSt1X/gn2MMu3WMWyTv
	XnyOHhntfNR/WVfmjfxWdUm4sBr9PsFyeHMhZ2AavqVCB05Q4xm4n7zbZgE9zl6F1d4E
	5kpwmZ80eimGENrMd2tyEHM3/bCgTksiqhw+PsOMX357DsJLUQp2GxqTHcXX1us6rsWx
	n/nU8VaqRzJHzs/5L4xVDdgenIhtawaGsLbVe+7CEJR7KM4x3+jb+XHhwdiR3d5qf+WJ
	IMrOaqm8aaflyUBfZSWomFT5l87xAmFjKEdXKTYnpUFU1ZZiw8DS5h07i9GUTMAwr8Av
	Vh7A==
X-Received: by 10.68.225.232 with SMTP id rn8mr51936452pbc.34.1356207551097;
	Sat, 22 Dec 2012 12:19:11 -0800 (PST)
X-Received: by 10.68.225.232 with SMTP id rn8mr51936441pbc.34.1356207550941;
	Sat, 22 Dec 2012 12:19:10 -0800 (PST)
Received: from [192.168.1.102] (c-71-237-213-89.hsd1.or.comcast.net.
	[71.237.213.89])
	by mx.google.com with ESMTPS id qb3sm9300128pbb.35.2012.12.22.12.19.09
	(version=SSLv3 cipher=OTHER); Sat, 22 Dec 2012 12:19:10 -0800 (PST)
Message-ID: <50D615BC.9010002@intel.com>
Date: Sat, 22 Dec 2012 12:19:08 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1356095093-21988-1-git-send-email-twoerner@gmail.com>
In-Reply-To: <1356095093-21988-1-git-send-email-twoerner@gmail.com>
X-Gm-Message-State: ALoCoQn11ApVsTG+YK3Qmuba0ban6bE0+w4RU/49AB6IAsUyuDQ2qkjMO1gGmsxx+3N3dhJedjbHku8ug2FORBz3TIM3rTGWC4pGrKSilnx0vUAMco52JofHZg6G7uEbzrPabfWUFRNWfR5IEFdf3OzsmETJpJgJ/eUoDTcOtEeO0esSZeXewL7AZSs1FM00mHYBVy2Bc0C7
Subject: Re: [PATCH] runqemu: change terminal's INTR key in 'serial' mode
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
X-List-Received-Date: Sat, 22 Dec 2012 20:34:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2012 05:04 AM, Trevor Woerner wrote:
> If you are using an image in '-serial stdio' mode, temporarily change the
> terminal's interrupt character to 'Ctrl-]' for the duration of the image
> run. In this way, hitting 'Ctrl-C' for something running in the image
> doesn't accidentally abort the entire qemu session.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Nice addition - thanks a bunch for this!

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   scripts/runqemu          | 2 ++
>   scripts/runqemu-internal | 7 +++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 190e3b4..9418ebd 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -64,6 +64,7 @@ LAZY_ROOTFS=""
>   SCRIPT_QEMU_OPT=""
>   SCRIPT_QEMU_EXTRA_OPT=""
>   SCRIPT_KERNEL_OPT=""
> +SERIALSTDIO=""
>
>   # Determine whether the file is a kernel or QEMU image, and set the
>   # appropriate variables
> @@ -138,6 +139,7 @@ while true; do
>           "serial")
>               SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
>               SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
> +            SERIALSTDIO="1"
>               ;;
>           "qemuparams="*)
>               SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 7fbe0a0..a11220d 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -444,6 +444,7 @@ if [ "$MACHINE" = "qemush4" ]; then
>           #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>           KERNCMDLINE="root=/dev/hda rw console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>           QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
> +        SERIALSTDIO="1"
>       fi
>       if [ "$FSTYPE" = "nfs" ]; then
>           if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
> @@ -453,6 +454,7 @@ if [ "$MACHINE" = "qemush4" ]; then
>           fi
>           KERNCMDLINE="root=/dev/nfs console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>           QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
> +        SERIALSTDIO="1"
>       fi
>   fi
>
> @@ -565,6 +567,11 @@ then
>   fi
>   fi
>
> +if [ "x$SERIALSTDIO" = "x1" ]; then
> +        echo "Interrupt character is '^]'"
> +        stty intr ^]
> +fi
> +
>   echo "Running $QEMU..."
>   # -no-reboot is a mandatory option - see bug #100
>   if [ "$FSTYPE" = "vmdk" ]; then
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


