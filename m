Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 851807ED3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 06:44:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45nDXS75JJz3P;
	Mon, 15 Jul 2019 08:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563173065;
	bh=zzZmLp2Lo5CDJYXjUh/U25rjwUU3SYdPCe8V2LkqpTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fD7NDCI6XbNhX+h/E6Z305iXciQ4HdbF/mEbPoYTkYvMyiIR2qphtVGotHqqzEMzK
	9GG/LF7zqYEFZVBQlvSFs9xn/cBwlLnipaEIaD1uC3qhl7M48aJovg1KYG7p2G7M5F
	tKIk/gVH2xepdX14xYfk8X2a5dX1kbQMOj2e+pBBilOM44mnhfO66X7Lm4Q7DTZB92
	ZYab6r0nfDXZAL4sybZXmKtzftPDVYonKDzhmwkbmIw0oCIeCEQ6BlpGhWFO/IVJwU
	XC6zEKAlXInL93EONKzqRnTmK+hpnexXTPaZ2tjbq3MX2Ef8ao6tCavLwbMZ/bHPYx
	503KCaP+Pv5Jp3zqyNUSTQrA/wCWel4SbBS1enAEAaowmoy+4HDNfwuzzaZgSZC9UF
	d93LzNhoPJJL635AGTobUZWpmr1dTvOBExRSObE1yJeFaoUGhZsuw+AqejYF1tXWS7
	DMhg1gZlxkQ7rX1h/s2qIlauboWIuXdaAftkOrfVUsH+rX9mCnllOhTtdV/ISKRp9r
	WP9/+8HzF7YDCny0zzquxRRGzruTwjW9clWqv9Iu40Hz52sniHMxutB7U+NeZkbK5W
	K7LXGeaffWKxg80UdUVMQN4CCZ93tBsxja6bdMusm7jlzrZzldzviIeHj0WlN7bu6q
	CxDvFWQpoAz9Uqrlq9ZPGs1U=
Date: Mon, 15 Jul 2019 09:44:22 +0300
From: Adrian Bunk <bunk@stusta.de>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20190715064422.GC21719@localhost>
References: <cover.1563168887.git.Qi.Chen@windriver.com>
	<c383309fe15b52683ac90b50d4305922c338b470.1563168887.git.Qi.Chen@windriver.com>
	<20190715061729.GA21719@localhost>
	<936a85fa-4248-6d37-455e-0a3bbf82b363@windriver.com>
MIME-Version: 1.0
In-Reply-To: <936a85fa-4248-6d37-455e-0a3bbf82b363@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] msmtp: fix postinstall to avoid do_rootfs failure
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
X-List-Received-Date: Mon, 15 Jul 2019 06:44:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 15, 2019 at 02:40:28PM +0800, ChenQi wrote:
> On 07/15/2019 02:17 PM, Adrian Bunk wrote:
> > On Mon, Jul 15, 2019 at 01:35:15PM +0800, Chen Qi wrote:
> > > When lsb is enabled, that is, 'linuxstdbase' is in OVERRIDES,
> > > do_rootfs would fail if both 'msmtp' and 'postfix' are installed.
> > > This is because they both try to create /usr/lib/sendmail link if
> > > it does not exist. So we need to fix the check to avoid non-zero
> > > exit status.
> > > ...
> > This would make it random (depending on installation order) which is
> > linked to, and it could also make ${sbindir}/sendmail and
> > $D/usr/lib/sendmail point to different programs.
> > 
> > It would be better to make $D/usr/lib/sendmail also an alternative in
> > all packages that provide sendmail.
> > 
> > cu
> > Adrian
> > 
> I don't think we should mix linuxstdbase and ALTERNATIVES setting. It makes
> things complicated.
> As ALTERNATIVES_PRIORITY is higher in postfix, I'll just remove the check in
> postfix and use 'ln -sf' directly.
> Can you accept this solution?

I do not see how this solves your problem if msmtp gets installed
after postfix.

Is it actually required to have these packages installed at the same 
time in LSB?

If not, something like
  RCONFLICTS_linuxstdbase = "postfix"
might work. (untested)

> Regards,
> Chen Qi

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


