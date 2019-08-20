Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E7C667EB0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 16:38:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Cc1c3vtNz3P;
	Tue, 20 Aug 2019 18:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566319126;
	bh=K82zcPt0CjDHkO782gQgsClQCAe31Jdz3kS/55fB6Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7kNKSuII0NhcjByJWAmM6cI+QZ4+89/4NkyTJZ+xXEXaoclBSZGGe4M/ot6cvv9Z
	Fh2odyTOUcN/5ZZ9S88R3pCh/z+pIUF4iKx0Y/TpWiDC8Lxc+yPAR/4FL0hem6X2M4
	j9fSP2JxM05GvU39NdgWPTPnbD0Nr+gr20gSFLKT8zP4/jivXSVtEEPsfs9hYMaUYv
	Lxtjsn7peTAuLrdiaLRajWfoTe4kP4na6E0DTxXRWlq9FouThVtWjxp2WQZp6LIV2E
	RVFneLPy8R+OyWQOU3R/WfPzdIhjVctJro/GVWcTzZufPaScRkEkujMLx5ZdbUwmub
	0cAt7lk11KuJonpL+sgr2hHFgYZ6nH1o/PEz++lpeTDl1JmQkxkjUWe3uVnNZTUQUP
	i9U7Kp59zW190y9uhlkbZPNp9UUAmbwaiIZtSWwRJU+mZ92WKDwruaunoI6QktUsFO
	m7NiMRx4drpl6Jsj7sGpsxnyWkN/dyTawAIA4c1UuG7GSXJ+ySYMqZFOxWI0RCF6mE
	e7uC8tEct+oDfQ57nPIFVwqqER7w9hOjzecGVpd58CZERR0V25Eg2CSkdr5+BBaMPB
	uqCxanwH0bckjMwtlaA18/gqH+zBx5eeajiUVwWpnXFjXf8pyWt+3TyYWAaXycyswP
	lXVS7mBENwlLoSMM4a1uC6SE=
Date: Tue, 20 Aug 2019 19:38:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190820163841.GA24268@localhost>
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
	<28dbc362015c3cbae5b8550e8636e74802afbfc3.camel@linuxfoundation.org>
	<4cbf8a7b-f0b2-9a16-6a91-bead26ecef50@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4cbf8a7b-f0b2-9a16-6a91-bead26ecef50@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Tue, 20 Aug 2019 16:38:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 20, 2019 at 08:46:53AM -0500, Mark Hatle wrote:
> On 8/19/19 9:55 AM, richard.purdie@linuxfoundation.org wrote:
> > On Mon, 2019-08-19 at 16:01 +0200, Alexander Kanavin wrote:
> >> Should the limit be simply raised? The 256M setup is crumbling on
> >> several fronts (runtime tests, modernisation of X, various non-x86
> >> qemu targets). Adding per-image/target exceptions, custom non-
> >> upstreamable patches, or sticking to deprecated configurations isn't
> >> the right thing to do, I think.
> > 
> > What kind of devices/uses are we meant to be targeting?
> > 
> > I believe OE is suited to optimised used cases where constraints on
> > size and performance are quite likely and supported.
> > 
> > This is *exactly* the kind of thing we should be exploring and
> > supporting. systemd is not designed for some of the systems we target.
> > Changing some of its configuration shouldn't be a surprise.
> > 
> > Having NFS taking up half the available memory doesn't make sense,
> > particularly when the sysvinit limits have worked for us for years. I
> > therefore appreciate Hongxu figuring out what the difference was and I
> > believe we should change this to something more suited for our target
> > audience, unless someone can explain why this is a bad idea.
> > 
> > Similarly, forcing everyone to full GL stacks under qemu simply is not
> > acceptable. For example I might have a single container type image
> > which I want to load/test under qemu. Forcing such usage to require
> > 512MB memory for what could be a headless system also isn't right and
> > will just frustrate users. Users need to be able to access headless or
> > 2D configurations of it.
> 
> Looking at what my customers are doing, I completely agree.  I look at the
> design criteria for my customer's devices and I'm seeing 256MB as -very- common.
>  More happens, but it's rare still.  (But I have some customers with GB of ram,
> but that is usually to support their application, but the base system!)
> 
> (Note, I do have customers -with- graphics requirements [X11] that are in the
> 128/256 MB ram ranges.  In most cases OpenGL is something they would like, but I
> don't believe it's a hard requirement for them.)
> 
> I do still have many customers with 128 MB of ram requirements.  So it's
> important for us to set a reasonable baseline (256MB).  So going under this
> requires 'work', but I think that is acceptable.

There is also a certain disconnect between these numbers and the 
constant pain for everyone of keeping everything building with
musl for small size gain.

128 MB RAM and 16 MB flash would be a configuration where I would not 
worry about size enough to consider glibc a problem.

Is there real-world demand for running X11 with musl?

Is there a CI setup ensuring that disk and RAM usage of relevant
musl setups don't regress - which might be more than the gains
of musl compared to glibc?

> --Mark

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


