Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED63B6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 21:00:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so12907058wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n/bxxlEPIQYcI1PpVxNXF90Qh3X2+xAKFuAwYMrKYzQ=;
	b=oItaRQyJZFn4koaN1KV/LZRxqXFObeOVGIZZCvu7HL/y0EJ0QP5W5vRgrY4KEn2VXv
	tziKQ0wvbxHjJnQUwD8uVmCs6T97QhydGZEfdCodNGKwTnxcS7DoUBkV8Su3psQOwI1p
	ujzwtniSVXWCiUi0vSlZ6Q3zL4XZtamMUuq6MsOzVaOnzCUq2PSs+0iMXBrrNxypSp3+
	g1gVE6JxtJrRZqKSIOh5bS6jPstFObrk+WAKmZ/vw2hu1YwjXk6PCwr676xKbOd0tguC
	syxTmEOEUBBwawjg9MBQxn8vhCZRZb3gN+YGuYNgpz7vvBPmPkHIQu7q9cpzIRiPYkxS
	aizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n/bxxlEPIQYcI1PpVxNXF90Qh3X2+xAKFuAwYMrKYzQ=;
	b=F9vRhutZqvO7/StABzFie0kHE+XzKa/1ukfDfRuNp7NkmCOV5rSSHHfeqev3fjoJNG
	dDQXDL6183HwZFA4QRZFNpav7OoTAX9i++uSvUOwmJtOA2MqtpE+f2NmTqeR4+DxVpTm
	iGJ1/DR+xBpG2WTommViC+8gpg4UudssuyF+Y+TnOxqCaxvAPPNXuvgJpsD6CC43V0c7
	pxOo1tyR2Q1/e2ZQA2vjTTY5eBABLfgvP29Yr2UwDAfSrEk0Ucd7g8a1Gx/C67M+B6q2
	+UgvMZrcaxoeboR3hL8PRo7FJrXe/Oiiqt3QGudSExla9SDoaKOAffBTcupB20y6E0j/
	35wQ==
X-Gm-Message-State: ALyK8tI+hT/fK7XV/RQ/Fx9guVIu7BCQKlTIgx81yRkbSD8zaSNKyoxiz6K7GfP7EGLx91JyxhrdznLWLZBU7w==
X-Received: by 10.28.50.199 with SMTP id y190mr58984773wmy.61.1469739623891;
	Thu, 28 Jul 2016 14:00:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.233.99 with HTTP; Thu, 28 Jul 2016 14:00:23 -0700 (PDT)
In-Reply-To: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>
References: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 28 Jul 2016 14:00:23 -0700
Message-ID: <CAJ86T=UuFqo=AfB_TSzPXQMZ5pRErv-otyxbcjQui2Qc3y+_1g@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Thu, 28 Jul 2016 21:00:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 28, 2016 at 1:49 AM, Awais Belal <awais_belal@mentor.com> wrote:
> Using a copy would only make management of devices erroneous
> and makes the system unstable in some scenarios as tools will
> have to manipulate both files separately. A link ensures that
> both files /proc/mounts and /etc/mtab will have the same
> information at all times and this is how it is handled
> on newer systems where there is such a need. Same is
> suggested by busybox.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
>  meta/recipes-core/initrdscripts/files/init-install.sh     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f564f4e..53f6508 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -123,7 +123,7 @@ mkdir -p /tmp
>
>  # Create /etc/mtab if not present
>  if [ ! -e /etc/mtab ]; then
> -    cat /proc/mounts > /etc/mtab
> +    ln -sf /etc/mtab /proc/mounts

Did you mean:

  ln -sf /proc/mounts /etc/mtab

?

>  fi
>
>  disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 72ce92b..21ae0a6 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -119,7 +119,7 @@ fi
>
>  mkdir -p /tmp
>  if [ ! -L /etc/mtab ]; then
> -    cat /proc/mounts > /etc/mtab
> +    ln -sf /etc/mtab /proc/mounts
>  fi
>
>  disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

