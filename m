Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6C9608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 19:04:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43r8n32LSyzLN;
	Thu, 31 Jan 2019 20:04:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548961497;
	bh=cnTwod9plZad7806sABpjGGn0CYgFDhDapOPJ7xLJqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFVP7Go+yLmMlXlHNlqhvmRLf957d/GuPUi0wBiPrORrSRD7ieeQSk96slewRcz1g
	F/trbGoUfuTkei2+ktOjWVwkRhNiNnNaL84IX+Aj2uJ5MzNWfnto44BLgI6fiKjA6O
	Ws9lhkl82wFt0i0S8zhzPz0E2qNvjWC3Tlb2IsYz069V0rcUkkhFskDl7nJ2RJXT63
	gTeThs1LBjjnpLVGkZRrbiImamazazygmsAEvTIL6OPCn1yac5CPevK7Q2jEmZv2aQ
	HjI/4/94p+Io46zzsJga64GeJnSW4ctJ3NUr8kmrECPtnOVg+F0uqDZw+A6XghE7lg
	2uJUWvKTorwBMAn2xkTL/d89VyJ16BblgOi6lO5Js7Q0hAz2Wo627pT11pysrW96Tm
	UpOV8TujhleMWdJgjAphw2J2GIQimHl8J72WGloRafG53g+7jNUZsihnrP8+VE2YeJ
	LYoYXKOqAeUNKq1/T21lz6qCcPYRBAq6jthVYBdwW2d4zjkhYAFGBjKcI9aCabiwKe
	vO/HYfxojP/fgWQeHEemYOrS3NBei4pcbKn+dRGVSIjXrFRCQU/VZI4laSSmf269X+
	85JF9Nw8QP6V0HfQEcDn/h+RW7T1YTyzuMtpk9B46OmoD4/KXWWcmtGcNbryN9MZds
	iZtq/BQw0LJV9vNjfCYi56IQ=
Date: Thu, 31 Jan 2019 21:04:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20190131190453.GD28875@localhost>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
	<CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
	<71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
	<20190130224703.GO30838@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20190130224703.GO30838@bill-the-cat>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Thu, 31 Jan 2019 19:04:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 30, 2019 at 05:47:03PM -0500, Tom Rini wrote:
> 
> I would also ask if we should be enabling more stuff in busybox, period.

I don't think the current status quo would be a good starting point for that.

Before submitting I saw CONFIG_PATCH=y, which is a lot more of a
"Why would I ever need this on an embedded device?".

Not saying that you are wrong, but the starting point should be a review
of the current config.

> Customizing busybox for what you're trying to _do_ with a custom setup
> is one of those top 5 TODO items with making a cut down image and
> customizing the kernel config.  Outside of -tiny and initramfs/similar
> cases, there's not a great reason to use
> almost-but-not-quite-complete-busybox-applet compared with the regular
> app.

I frequently end up in projects where I do have great reason for that:

For root filesystems of the 32-64 MB size it is not necessary to use a 
different libc or use -Os, but using the busybox applets when they are 
sufficient saves > 10% filesystem size compared to the full versions.

E.g. 0.45 MB for a standalone tar is much when the little functionality 
you actually need is also provided by the busybox applet.

Plus there is also the convenience point that most of the tools you need 
are already installed just by adding busybox with the default config.

> Tom

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


