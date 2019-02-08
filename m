Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B64187C5B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:07:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g67so3492153wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bRHpKBDWGR62tiTCblDTgVOkAVqFdqEoSaakbqVx4rM=;
	b=SQww4c8srSElHcj7zdwSs/sFpHLxuN3OvI7V38ZC/YJdc8UoG4SG7SiTJGzvba14oh
	5vOGAYoy6Aq4JdDAb0mGw/Lvu5RLe2LXF3QwQBjmwcjJaToaGqw53I+WFNVaZwJQ3alk
	Wi0M6sVjDvBfGZWSrKRkbXXxM2y1ri0MZmgIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bRHpKBDWGR62tiTCblDTgVOkAVqFdqEoSaakbqVx4rM=;
	b=OG0/Qvla2Ctn3Hr+fjcD8w883vvvUYcZSYCjSIphJ1IdHXG8pmruvkhm8jdZas/23H
	Oy+xFL5sCDCpwUkP6Wl/Xv7OlFdGHiDbzbHjYoKcy1KBcxZ+kMOoQUii1J7OhjaKsst6
	SWV5hxt8ysImkZvSBpPExfXr+VzcSPvB9W8BvdjhZFP9ewKD8L+BPEYK5s7bSVL2JAYE
	kmHt8pBUZp1arGcLwX2o3r8/i69k4CFjBOZNUH5c4Bj9Ke2tGwdVHBV81Kw2+JVdr/LD
	qfWH3p7XX9UdyR5PbVNBfnY21KfFl96x7AS6DpfdaG459joLHfhyXkwoyGibUpNKqIVh
	V5cA==
X-Gm-Message-State: AHQUAubHzAR8hfGQB3yHmRMS5EzHaYbifW4ZKWDnUrpSGgayyZysWN5M
	+7AVjUy6b/PwHFdwi7dM4eksAw==
X-Google-Smtp-Source: AHgI3IYxoGeg4NHIYAfCORIXVgEJRQnF6Fs15G5gL1eNj+4axD9SXN6phy1r2OmbOuHqXPvcUVigYQ==
X-Received: by 2002:a1c:342:: with SMTP id 63mr11337982wmd.34.1549634864378;
	Fri, 08 Feb 2019 06:07:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h5sm1718806wrt.38.2019.02.08.06.07.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Feb 2019 06:07:43 -0800 (PST)
Message-ID: <c637a3a45fb3d5f40e22a54f59649908f5500794.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2019 14:07:42 +0000
In-Reply-To: <20190208120210.31861-1-git@andred.net>
References: <20190208120210.31861-1-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Fri, 08 Feb 2019 14:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-02-08 at 12:02 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Busybox' getty has code to try to make itself a session leader,
> whereas util-linux' agetty doesn't. It expects this to happen
> from outside.
> When getty is not a session leader, many things don't work on
> the serial console, e.g. setting the terminal process group,
> job control doesn't work, etc.
> 
> Executing image tests also fails with AssertionErrors, because
>     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get
> controlling tty: Operation not permitted
>     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set
> process group: Inappropriate ioctl for device
> 
> Update the start_getty script to invoke getty via the setsid
> utility if needed, i.e. if /sbin/getty is not busybox getty.
> 
> [YOCTO #13058]
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 9
> ++++++++-
>  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> index e15ae35f90..ae613f1e54 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> @@ -13,6 +13,13 @@ active_serial=$(grep "serial" /proc/tty/drivers |
> cut -d/ -f1 | sed "s/ *$//")
>  # Rephrase input parameter from ttyS target index (ttyS1, ttyS2,
> ttyAMA0, etc).
>  runtime_tty=$(echo $2 | grep -oh '[0-9]')
>  
> +# busybox' getty does this itself, util-linux' getty needs extra
> help
> +getty="/sbin/getty"
> +if ! basename $(readlink -f "${getty}") | grep -q busybox \
> +    && [ -x "/usr/bin/setsid" ] ; then
> +    getty="/usr/bin/setsid ${getty}"
> +fi

The reason I'm reluctant to take changes like this is you just added 3
fork calls above. This does have a significant effect on boot time on
slower devices.

Is there a way we can do a shell string comparison rather than using
grep? case statement maybe?

Cheers,

Richard



