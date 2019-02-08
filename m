Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4915F7C5D7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 16:55:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id t6so3308608edw.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 08:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nRY+al90wlCJKmCaK5NYhBQnJ0cPzoQj82QuDKKv45c=;
	b=nhRLmJqMbpNuMZNWIP3sr1/nMT2lyAWMSRjb9GDKGLBoKlmZ2JK4rYAko5I/HLnU45
	n+wMz2z1wCc+I4E3QiOzbPP8AX8/P8q4Co44hbp6Um+ef6eO5LPy1SgFKVLH04gx8xxx
	WquXRVNwy4WfyDV7NsUV9pfee6F1Sp7qB5D2deoU8k4/m60eg0llUJUxDG3GnSoO3MiU
	y3vshahsyQpPy7XyyokzXUePAm5GmBovvWcMk+iAEnymlob4yZNE5xc9dRm7CJvcUWy5
	HRy3ARf+Cd7rwKVuC0xBsHvXuiGmOoIC7O/hXuI1oekKxHcXMJrmEJAv9a86VMAijf+3
	cg7Q==
X-Gm-Message-State: AHQUAuaG0bON7VxxbyyEg8nYxEFRZOqFvpyd4Uwb4wElHHNcUunIY2C5
	0dIzaJjCDxs8+Kj+PfaZYPQ=
X-Google-Smtp-Source: AHgI3IaecyJUgBwFCUGnogevRCbc8P99w/bjkTKNBz/zrFkSPXABBwjzQJfDz0LicyM1k28yvKfIiw==
X-Received: by 2002:a50:9226:: with SMTP id i35mr18024017eda.8.1549644918885; 
	Fri, 08 Feb 2019 08:55:18 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36])
	by smtp.gmail.com with ESMTPSA id g18sm737465edh.39.2019.02.08.08.55.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 08 Feb 2019 08:55:18 -0800 (PST)
Message-ID: <f37a095f78efe6e4c9033a430121de128a8871c6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2019 16:55:17 +0000
In-Reply-To: <c637a3a45fb3d5f40e22a54f59649908f5500794.camel@linuxfoundation.org>
References: <20190208120210.31861-1-git@andred.net>
	<c637a3a45fb3d5f40e22a54f59649908f5500794.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 08 Feb 2019 16:55:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-02-08 at 14:07 +0000, Richard Purdie wrote:
> On Fri, 2019-02-08 at 12:02 +0000, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Busybox' getty has code to try to make itself a session leader,
> > whereas util-linux' agetty doesn't. It expects this to happen
> > from outside.
> > When getty is not a session leader, many things don't work on
> > the serial console, e.g. setting the terminal process group,
> > job control doesn't work, etc.
> > 
> > Executing image tests also fails with AssertionErrors, because
> >     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get
> > controlling tty: Operation not permitted
> >     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set
> > process group: Inappropriate ioctl for device
> > 
> > Update the start_getty script to invoke getty via the setsid
> > utility if needed, i.e. if /sbin/getty is not busybox getty.
> > 
> > [YOCTO #13058]
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 9
> > ++++++++-
> >  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  | 1 +
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > index e15ae35f90..ae613f1e54 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > @@ -13,6 +13,13 @@ active_serial=$(grep "serial" /proc/tty/drivers |
> > cut -d/ -f1 | sed "s/ *$//")
> >  # Rephrase input parameter from ttyS target index (ttyS1, ttyS2,
> > ttyAMA0, etc).
> >  runtime_tty=$(echo $2 | grep -oh '[0-9]')
> >  
> > +# busybox' getty does this itself, util-linux' getty needs extra
> > help
> > +getty="/sbin/getty"
> > +if ! basename $(readlink -f "${getty}") | grep -q busybox \
> > +    && [ -x "/usr/bin/setsid" ] ; then
> > +    getty="/usr/bin/setsid ${getty}"
> > +fi
> 
> The reason I'm reluctant to take changes like this is you just added 3
> fork calls above. This does have a significant effect on boot time on
> slower devices.
> 
> Is there a way we can do a shell string comparison rather than using
> grep? case statement maybe?

I've sent a v2.

Are you aware that there are at least 9 forks in this file for something as
simple as forking a getty?


Cheers,
Andre'

> 
> Cheers,
> 
> Richard
> 
> 


