Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.571.1627505633263092254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=mSfpMUl/;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 3028E2E891F
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 15:53:52 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627505632; bh=kIdNKceNmYQM+fE0UI+kI5jrZcd1V2tc4HfKcCdk4wM=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=mSfpMUl/sYdSQPsVAzVIWLmCtG6l+635uRSQnwvD3PsMUNxi4LtzgFqWwnuLlHLkQ
	 g2EDSpMk//yS0C3mSUXRId9Al3nT6G668TF7p1b1Wmlm/cU6ngZkuXTl4tvmd9sOmM
	 jfztsybihrXZceCwqLY3JC6DfySiG4JJzXs6pjtBh9ujvwG0dlj2eonDe6unwYcosa
	 kWpwkiFAnNUXR99eG/cZH+2mPkshrGQhAE2/uAJjLv5N5GvKIAg9xarF4WB5RXeu4p
	 k3/Cj2Gqe8D1Kad5EQEIAA7wULEr5AsIrp/ZJZ+KgEGCMaA3cjz4jpOthm72EkYbnw
	 xDOn1SKPDEL0Q==
Date: Wed, 28 Jul 2021 15:53:48 -0500
From: "Seebs" <seebs@seebs.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
Message-ID: <20210728155348.7c13a0ee@seebsdell>
In-Reply-To: <CAJ86T=WvqW64bxW+qWon5ahuyJMqy4H=nhJBhUfwy9jKM4X8SQ@mail.gmail.com>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
	<20210727104712.385ad146@seebsdell>
	<17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
	<20210727115246.04b8ffa4@seebsdell>
	<17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl>
	<20210728151641.667338a5@seebsdell>
	<CAJ86T=WvqW64bxW+qWon5ahuyJMqy4H=nhJBhUfwy9jKM4X8SQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Jul 2021 13:49:17 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> If the caller only cares about yes/no then how about returning 1/0
> instead of a pointer?

Other callers are actually using the response, because the pseudo_msg_t*
returned from this is how, say, OP_STAT responds with the stat
information it got from the server. It's just chroot, specifically, that
wants to know that the client accepted-and-processed the chroot, but
there's no meaningful additional information past that.

I suppose in theory pseudo_client_op could be split into one function
for ops with message returns and another for ops with only
success/failure, or "just ignored", but it doesn't seem rewarding.

In Go, I'd probably have done it as
	func (c *PseudoClient) Op(whatever goes here) (*Message, error)
and this would just be returning (nil, nil) or (nil,
some-meaningful-error) in the chroot case, but here we are in C with
single return values. :)

-s
