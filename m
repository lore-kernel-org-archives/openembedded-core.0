Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.369.1602086372967251922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 08:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kQBql-0004ub-CF; Wed, 07 Oct 2020 17:59:31 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1kQBqk-00080v-2K; Wed, 07 Oct 2020 17:59:30 +0200
Date: Wed, 7 Oct 2020 17:59:30 +0200
From: "Marco Felsch" <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
Message-ID: <20201007155930.iayne47puz6ax2qv@pengutronix.de>
References: <20201005141838.8559-1-m.felsch@pengutronix.de>
 <d9657b20703921b770f72ffc337420ff34ad8171.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d9657b20703921b770f72ffc337420ff34ad8171.camel@linuxfoundation.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:42:32 up 327 days,  7:01, 360 users,  load average: 0.02, 0.04,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20-10-07 12:28, Richard Purdie wrote:
> On Mon, 2020-10-05 at 16:18 +0200, Marco Felsch wrote:
> > This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.
> > 
> > This commit breaks compiling if no initramfs is used because the kernel
> > image can be compressed too using lzo.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  meta/classes/kernel.bbclass | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 78def5bbc1..06150e8072 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -4,8 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
> >  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> >  
> >  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> > -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
> > -DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
> > +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
> >  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
> >  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> 
> I've been giving this more thought, we can't simply add every possible
> DEPENDS in kernel.bbclass.
> 
> In this case if a recipe is enabling lzo compression on the kernel,
> perhaps it should just add DEPENDS += "lzop-native" itself?

You're absolutely right and I would have no doubts going this way if we
won't have this dependency since 2016. I think this will break a lot of
builds. We can go this if that doesn't matter, but I would drop the
dynamically added DEPENDS which would be added in case of
INITRAMFS_FSTYPES. So the BSP needs to specify the correct DEPS all the
time.

Regards,
  Marco
