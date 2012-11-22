Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbaxM-0000CV-LA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 18:52:57 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so868970pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 09:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=O0RNxKMrJ9MO/Kck7LqRhLACmN1JZTyDCKGht3PFlVg=;
	b=qMfFdM/uVOZY0nGpbQVcP+bRPzQ34GmmEs/7xF21mw5d1etUHAhy0GXmy3PazmA5jn
	rDANYi5PdSXrd7YSI+MvUCg2BdC7vsln49KPzSVcS54d6GOAun+vgtzU+sDW2U3QmuqK
	nRimaCtIRAB5qlSll4bQhDlXgcPwXlLAho1eeDogrd5lGwJ6eu13R3v13ztNOnp4qfGV
	mNxeYaY5om0jsX9gVgNROqJND0pgkm1bGA40dtc598Gbc3KRYiGYp0+rjIRNdzV309R9
	FWIdj54YVRj+GoF4c+alPtfihYzRb5xPslNr6aewSJT+bmrCBVQeJF+VOAQuGaNwFnhV
	6v1w==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr6892339pbc.33.1353605929334; Thu,
	22 Nov 2012 09:38:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 09:38:49 -0800 (PST)
In-Reply-To: <1353603291-8788-1-git-send-email-otavio@ossystems.com.br>
References: <1353603291-8788-1-git-send-email-otavio@ossystems.com.br>
Date: Thu, 22 Nov 2012 15:38:49 -0200
X-Google-Sender-Auth: zhR6Y142snQAo5H1JatCCPACw14
Message-ID: <CAP9ODKpDysH8wF0Md_mssXLx6oEStn53dbgUvrWHHct4vN5zOA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] initramfs-framework: udev: Handle alternative binary paths
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
X-List-Received-Date: Thu, 22 Nov 2012 17:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 22, 2012 at 2:54 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This allows use of udev daemon for different installation destinations
> so allowing use of udev's from systemd code for initramfs.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../initrdscripts/initramfs-framework/udev         |   25 ++++++++++++++++----
>  .../initrdscripts/initramfs-framework_1.0.bb       |    2 +
>  2 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> index 9ea8aa3..8be0595 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -1,10 +1,25 @@
>  #!/bin/sh
> -# Copyright (C) 2011 O.S. Systems Software LTDA.
> +# Copyright (C) 2011, 2012 O.S. Systems Software LTDA.
>  # Licensed on MIT
>
> +udev_daemon() {
> +       OPTIONS="/sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
> +
> +       for o in $OPTIONS; do
> +               if [ -x "$o" ]; then
> +                       echo $o
> +                       return 0
> +               fi
> +       done
> +
> +       return 1
> +}
> +
> +_UDEV_DAEMON=`udev_daemon`
> +
>  udev_enabled() {
> -       if [ ! -e /sbin/udevd ]; then
> -               debug "/sbin/udev doesn't exist"
> +       if [ ! -z "$_UDEV_DAEMON" ]; then

This is wrong and I send the wrong version of the patch by mistake. I
will send a v2 fixing it.

> +               msg "WARNING: Cannot find the udev daemon; daemon will not be started in initramfs."
>                 return 1
>         fi
>
> @@ -14,9 +29,9 @@ udev_enabled() {
>  udev_run() {
>         mkdir -p /run
>
> -       udevd --daemon > /dev/null
> +       $_UDEV_DAEMON --daemon
>         udevadm trigger --action=add
>         udevadm settle
>
> -       killall udevd 2>/dev/null
> +       killall `basename $_UDEV_DAEMON` 2>/dev/null
>  }
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 58e41d4..45d6592 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -3,6 +3,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  RDEPENDS = "busybox"
>
> +PR = "r1"
> +
>  inherit allarch
>
>  SRC_URI = "file://init \
> --
> 1.7.2.5
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


