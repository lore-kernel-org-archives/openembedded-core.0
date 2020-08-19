Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.86366.1597836325333948164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 04:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=C/+KmJoz;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 17FE75C0842;
	Wed, 19 Aug 2020 13:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1597836322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuLmiEwPTdzHuFtI9tn32WI1Ft+flXilDvth4RHwu58=;
	b=C/+KmJoz3SCBU5pe7IVD4r0gKo5cyMN1R7PPbyqfeK6apF+d+AkEci2glznuUB0WImLkEK
	VFqqPChXHl13beD8rZMg5QXB9QYwr8nkY464yEb8oW41RCm9R0OG1Y7tqbIi65hbg8fsdu
	a9nburTL0crAn8clF2q1xjhXNBOep44=
MIME-Version: 1.0
Date: Wed, 19 Aug 2020 13:25:21 +0200
From: "Stefan Agner" <stefan@agner.ch>
To: Alex Kiernan <alex.kiernan@gmail.com>, liu.ming50@gmail.com
Cc: openembedded-core@lists.openembedded.org,
 otavio.salvador@ossystems.com.br
Subject: Re: [OE-Core][RFC PATCH v3 02/13] systemd: Package udev rules explicitly
In-Reply-To: <20200327172520.62888-3-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>
 <20200327172520.62888-3-alex.kiernan@gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <7fe598ea84e9abd0602e027f60fd6ded@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2020-03-27 18:25, Alex Kiernan wrote:
> udev is packaged before systemd so any wildcard inclusions in FILES will
> override later specifics. List all udev rules explicitly so that the
> systemd specific rules, packaged alongside systemd, appear in the
> correct package.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Just found that this fix broke our Plymouth based splash screen. It
seems that Plymouth relies systemd/logind style "seat" TAGS to identify
the DRM devices to show the splash screen on. So far our
initramfs-framework based initramfs just installed udev, which in turn
installed system's 71-seat.rules which set up those tags accordingly.
However, now that 71-seat.rules is no longer part of the udev package,
the "seat" TAGS isn't present anymore, and the splash screen does not
show any longer.

Not sure what the proper fix is for this, maybe creating a
systemd-udev-rules package which contains the udev rules separately, so
that they can be installed in case needed...

FWIW, I think this patch is correct. This message is more meant as a FYI
for others stumble upon such an issue and information gathering.

--
Stefan

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  meta/recipes-core/systemd/systemd_244.3.bb | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_244.3.bb
> b/meta/recipes-core/systemd/systemd_244.3.bb
> index f0cf102dc250..809dbcb9a69b 100644
> --- a/meta/recipes-core/systemd/systemd_244.3.bb
> +++ b/meta/recipes-core/systemd/systemd_244.3.bb
> @@ -599,7 +599,33 @@ FILES_udev += "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/scsi_id \
>                 ${rootlibexecdir}/udev/v4l_id \
>                 ${rootlibexecdir}/udev/keymaps \
> -               ${rootlibexecdir}/udev/rules.d/*.rules \
> +               ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-block.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-drm.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-input-id.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> +              
> ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-serial.rules \
> +               ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
> +               ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
> +               ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
> +               ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
> +               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
> +               ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
> +               ${rootlibexecdir}/udev/rules.d/75-net-description.rules \
> +               ${rootlibexecdir}/udev/rules.d/75-probe_mtd.rules \
> +               ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
> +               ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
> +               ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
> +               ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
>                 ${sysconfdir}/udev \
>                 ${sysconfdir}/init.d/systemd-udevd \
>                 ${systemd_unitdir}/system/*udev* \
> 
