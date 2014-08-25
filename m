Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD63617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:31:36 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so20958497pdj.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rwRKY1g9DavRu1saqXVzdh3L56l+nB4wViWw6+oEz54=;
	b=f23almGiR2aD8tSEXFSZJ+v2cZfnDdkdrBMBCdYr15I33lwuCrsITdS8zBFemSelri
	3lBMMcDwetW1MzRhWxJgL4DOEga4xMheL1H/9lfyJCpzPjgq2Fi7HmGaJbPcw0uF1X9q
	rqexkfeddTTjFHxUJ0gDe8oUdi0QgoYrMjxCNXLSSwKfeyCJSaRERp1HC1SbrLFZVY40
	BLroopOcVSvxU4Q/OKLf+KnaEipUXIDrlDs2FQ7dqcHV138fd5UFw5jWsBApaYhSORx6
	WrtTwsStj1ddoBdsZXcWRQaEQrlrCf7XVvCYJ0VPaNSWjj3Hg0NplQTib8ddxzMKMmjO
	VFJw==
X-Received: by 10.66.243.208 with SMTP id xa16mr30347944pac.41.1408995097816; 
	Mon, 25 Aug 2014 12:31:37 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id yw4sm579905pbc.69.2014.08.25.12.31.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 12:31:37 -0700 (PDT)
Date: Mon, 25 Aug 2014 12:35:23 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140825193523.GB23339@haswell>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama> <20140822154954.04d4fc02@e6410-2>
	<20140822214626.GF20524@jama> <20140822170626.13280b11@e6410-2>
	<20140822222642.GG20524@jama> <53FB8A87.1010202@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53FB8A87.1010202@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Mon, 25 Aug 2014 19:31:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-25 14:12:07, Mark Hatle wrote:
> On 8/22/14, 5:26 PM, Martin Jansa wrote:
> >On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
> >>On Fri, 22 Aug 2014 23:46:26 +0200
> >>Martin Jansa <martin.jansa@gmail.com> wrote:
> >>
> >>>changing
> >>>default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
> >>>still building with -marm doesn't make much sense to me and is only
> >>>confusing.
> >>
> >>I think the distinction is that if you use armv7at-neon, you *can* build
> >>specific packages with thumb. Mostly, I guess, I don't think it makes sense
> >>to use a tuning that specifically states that it can't run thumb code for
> >>processors which can. Although... May not be an important distinction, really,
> >>as you note.
> >
> >>I don't think it makes sense to use a tuning that specifically states
> >>that it can't run thumb code

yes. We should not have such case in armv7+ 

> 
> The defaulttune is supposed to supply what the processor and ABI are capable of.
> 
> So in the case of armv7a, it's saying no thumb support at all, this included
> thumb interwork.

if thats what we do then we are wrong. Since thumb interwork is
mandatory when we claim EABI compatibility and I think we have stopped
supporting Old ABI hence EABI is default which means interworking is
inherent.

> 
> armv7at says that the processor supports thumb, and interwork -should- be
> enabled.  (It can of course be manually disabled, but that's another issue
> to be dealt with...)

FWIW adding 't' in there should just be done when the resulting binary
is compiled using thumb ISA, using 't' to qualify interworking
capablility is not required.

> 
> armv7at doesn't say it actually includes thumb combines binaries.  (I argued
> originally it should, but was overruled for a variety of reasons... not the
> least of which is the interwork enabled, and multilib issues with 'same abi'
> configurations.)
> 
> So I agree the default should be armv7at or armv7at-neon, unless there is a
> compelling reason to leave it as a default with interwork disabled.

I dont believe thats the case we simply should not be able to disable
interworking.

> 
> As for the hard float question.  I'm torn on this.. for compatibility a lot
> of the industry is still soft-float based, and frankly I've not exactly
> encouraged it with my customers.. (I'm not seeing general performance
> improvements, only improvements in select artificial benchmarks, or specific
> pieces of code.)
> 
> But if changing the default to hard float were generally agreed upon (for
> architectures where VFP are available) then I wouldn't object.
> 

I would leave that choice to distributions for now

