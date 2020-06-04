Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web11.24160.1591304680660228713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 14:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jgx2T-0007VR-TP; Thu, 04 Jun 2020 23:04:37 +0200
Date: Thu, 4 Jun 2020 23:04:37 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
Message-ID: <20200604210437.GA28641@pbcl.net>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net>
 <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
 <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
 <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
 <5da0a98a98d9b1194ca13315f9986c20b9e5d565.camel@linuxfoundation.org>
 <CAJ86T=Xu+mjNER1D=R4110uN-8oK-s3xk6ij1hChESNVY2U2Dw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xu+mjNER1D=R4110uN-8oK-s3xk6ij1hChESNVY2U2Dw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2020 at 01:05:30PM -0700, Andre McCurdy wrote:
> The fix being proposed is simply to always leave the config file in
> the rootfs, so it's always there when ldconfig is run at build time.
> Doing so seems safe enough. Since the config file is only parsed by
> ldconfig, there's no run time performance penalty of leaving it around
> - it will just be ignored if there's no ldconfig in the rootfs to use
> it.

Yes, agreed.  For some reason I had previously got it into my head
that ld.so itself would read ld.so.conf if there is no ld.so.cache,
but I just checked the glibc sources again and clearly it doesn't.
I'm not sure if my previous understanding was outdated, mixed up
with some other libc, or just plain wrong, but either way you're
right that there's no performance penalty.

I also checked with strace which reveals that, on the other hand,
ld.so _is_ trying to open /etc/ld.so.preload which is clearly a
waste of time as well.  But that's a separate issue...

p.
