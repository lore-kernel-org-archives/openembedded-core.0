Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web12.14218.1628106140704615789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 12:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=pUsteVnd;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id BMmPmzHbHOQhvBMmQmScog; Wed, 04 Aug 2021 20:42:19 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IvmFjI3g c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=Q4-j1AaZAAAA:8 a=ugkhXdxtAAAA:8
 a=l-G8VKC-1Z8xwSyvXccA:9 a=CjuIK1q_8ugA:10 a=63wSdAoKnfsA:10
 a=KqUEti3kXUUA:10 a=eDHOid60NOgA:10 a=FZ_q8whQ1RAA:10 a=SIBqzdgODD4A:10
 a=VinBSYM5t5AA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ZG-MjRxWnTTVGrJRUvVH:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=hqKEFFo8paqTuWMORLA/bfaCAZRZVNPTz2YT1TTkXIY=; b=pUste
	VndR6XDZ6/FVs5ceR2LF63KSmAUn8xjePNYlmh7DSgo/dgEGyFc/RbAs3AsPdF7lWAfLLEizFDU/q
	iWjw9dJ+2jw3T9fViQi0FgRGZFySx9lpSq5Vpe8WF8/n0zTRFhQQ0oMLhLL2+P0i2KssUKpsq/mFy
	nJ0W8Y1I5heX/gczc+Jye0887500qfUi0qttl5kjSKcfjwNZLkAwnqfn4jGsRKb5fMHmJRJljLTv8
	HhktwVdSYTPCZbYpo1+dxWVQsuutxFI6QnCTVm2L94hGhNOGvK7MBu0rh8Hc8BS/5RQgQ4K+JyDvn
	Gjmj6nfrIvJQOxbkcjFHCcPkPYpSw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mBMmP-0005DX-Ac; Wed, 04 Aug 2021 20:42:17 +0100
Date: Wed, 4 Aug 2021 20:42:17 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH v2] curl: Fix CVE-2021-22924 and CVE-2021-22925
Message-ID: <20210804194217.GA18303@mcrowe.com>
References: <20210804170552.1163928-1-mac@mcrowe.com>
 <16982A916A07A38B.6121@lists.openembedded.org>
 <CAOSpxdbthf5JtAGYri==t=izjpTXFbWU733YtxRXjTgQ+pjcTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOSpxdbthf5JtAGYri==t=izjpTXFbWU733YtxRXjTgQ+pjcTg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfChAcT+l/B3DQFBZ/sPVypbxt+rnREE6tfmJP0Yif5s9LImEZvLIVTCm6L5PYpuvUzRgnAdeaeiF8VYjWb0IA+tUsNSi2z9UD/ukWSLOv+0xblhdXxfq
 RFBgzNEbPWKOyCrW6o4HZg13awHjSe0X5LglRhrWEI7MTWFmJGmUUwXKz0x9ufH870t2BB5p8RyTxA==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 04 August 2021 at 08:05:27 -1000, Steve Sakoman wrote:
> On Wed, Aug 4, 2021 at 7:27 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Wed, Aug 4, 2021 at 7:06 AM Mike Crowe via lists.openembedded.org
> > <yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> > >
> > > curl v7.78 contained fixes for five CVEs:
> > >
> > > CVE-2021-22922[1] and CVE-2021-22923[2] are only present when support
> > > for metalink is enabled. EXTRA_OECONF contains "--without-libmetalink"
> > > so these fixes are unnecessary.
> > >
> > > CVE-2021-22926[3] only affects builds for MacOS.
> > >
> > > CVE-2021-22924[4] and CVE-2021-22925[5] are both applicable. Take the
> > > patches from Ubuntu 20.04 curl_7.68.0-1ubuntu2.6 package which is close
> > > enough that the patch for CVE-2021-22924 applies without conflicts. The
> > > CVE-2021-22925 patch required only a small tweak to apply.
> > >
> > > [1] https://curl.se/docs/CVE-2021-22922.html
> > > [2] https://curl.se/docs/CVE-2021-22923.html
> > > [3] https://curl.se/docs/CVE-2021-22926.html
> > > [4] https://curl.se/docs/CVE-2021-22924.html
> > > [5] https://curl.se/docs/CVE-2021-22925.html
> >
> > This patch wouldn't apply because there's another curl CVE fix in my
> > testing queue (curl: Fix for CVE-2021-22898):
> >
> > https://lists.openembedded.org/g/openembedded-core/message/154145
> >
> > I went ahead and did the required fixup so no need for you to do anything.
> 
> Sigh. I spoke too soon.  Your CVE-2021-22925 patch and the previous
> CVE-2021-22898 patch both touch lib/telnet.c so your patch won't apply
> now.
> 
> You mentioned that you had to tweak the CVE-2021-22925 patch, might
> this be related to the CVE-2021-22898 fix (which is a one-liner)?

Ah, yes. That's the change I had to accommodate. You can either tweak my
patch (just adding the "== 2" to the patch should work - that's the
opposite of what I did) or just drop your CVE-2021-22898 patch since the
CVE-2021-22925 patch supersedes it.)

Alternatively, I can do whichever of those you prefer tomorrow if you wish.

Thanks.

Mike.
