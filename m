Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 01D6C7E3FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458fHS4b9qz2C;
	Thu, 23 May 2019 08:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558591812;
	bh=OzjKU/cUC2yY3udN/J+jFVr7h58sDWEOsQuMTxYWnCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahosLo9ngGZ4EClKD2VwY/HMHeQEiWFQjhiSjdfSG+NMphOyVA71DvR6rOaJyD8lG
	CsVAx+Tc4fHkaUdZgqcmD2sTDUY9xvTyYexdGlXv9QFCf5dGZ9xxC+NivLo2+88inF
	NtIpETCQxl0EFAarDE51c/rACX+1IUQ2NVY9m28XkrbUMGfEx5PR0mM9TdhxSr5BHo
	5DEcW0JOGKyvQS3lgTBk4IyctcZVslIu7yBHYYacKuaN75/jOJzWhO6odr1x4vuzIG
	BEl7SSKbJFOVBBOS4yUKBgd1qcm4vW/1cSUdFWXc5YLtnJDL4Hd0n/grXwcNFrdJIn
	Tl7PAMhI7YQ6Atp2XOTV/z0YvZAjGg3YXTg54DB+9YcTkh6G5XAqvuJKpLDdhNuJZD
	Xj5m4hIu33Tk8kDwjbNMSuxxSpzStqJXqb+a6MoMP4c4IclwnblLHb1NjnJdT6szr3
	iGC4lq+rdaKUGgkl1jC2U3VMZN9ph7H+EhteSS211Us8QMdxw0a5usWRht5MD7ZP7f
	ly21Xp/M9IRefVzjgrxb6VMljiUYutxbfdSWx6XSVPjxmpkHL/lzQaA8PUml5OKai2
	tL2+bcUJv6ainDBpwQRuLbV4fy8GLxNvpq4B/csQmcD+oGO3496h/T+B7SQPAqDV2I
	Ss5cuM+Wbp/XbjIbTJ8N+vhg=
Date: Thu, 23 May 2019 09:10:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190523061010.GA11736@localhost>
References: <20190522013228.7591-1-raj.khem@gmail.com>
	<20190522013228.7591-3-raj.khem@gmail.com>
	<20190522064909.GA9621@localhost>
	<CAMKF1sqj0+y_55xVf6SRjS1czodtioUYxVv1tbWU4_7AKYrzLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqj0+y_55xVf6SRjS1czodtioUYxVv1tbWU4_7AKYrzLw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Thu, 23 May 2019 06:10:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 22, 2019 at 04:29:33PM -0700, Khem Raj wrote:
> On Tue, May 21, 2019 at 11:49 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, May 21, 2019 at 06:32:28PM -0700, Khem Raj wrote:
> > >...
> > > PN and PN-binutils is not empty anymore on musl
> > >...
> > > ++#if !defined(FNM_EXTMATCH)
> > > ++# define FNM_EXTMATCH (1 << 5) /* Use ksh-like extended matching. */
> > > ++#endif
> > >...
> >
> > This might fix the compilation, but it is horribly wrong.
> >
> > It passes a flag to a function that this function does not understand.
> >
> > In the best case the function returns with an error on unknown flags.
> >
> > In the worst case the function does silently something different from
> > what the caller expects it to do.
> >
> 
> I forgot that the API is provided by libc here so mimic'ing the define
> infact could
> cause pain. I think its better to nullify it in this case where it is
> being used in these
> files.

Just looking at the usage in src/elfcompress.c, my first impression is 
that this tool is mostly useless without a properly working FNM_EXTMATCH.

Are the eu-* utils actually important in the cases where space is so 
limited that people are forced to use musl instead of glibc?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


