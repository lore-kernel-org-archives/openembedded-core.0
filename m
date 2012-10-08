Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TL8U3-0008Pr-M0 for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 10:14:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9881WxV016986;
	Mon, 8 Oct 2012 09:01:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16463-02; Mon,  8 Oct 2012 09:01:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9881L0E016979
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 8 Oct 2012 09:01:23 +0100
Message-ID: <1349683286.15658.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 08 Oct 2012 09:01:26 +0100
In-Reply-To: <CAPj87rM0BH_eU+6j66Gq7+mrPs2JbrwDZdu58gqwJ_34vNeKmg@mail.gmail.com>
References: <1349437649.15658.20.camel@ted>
	<CAPj87rO=rnyWBjnoMnx=2QCZ3BoMqfiq1w+Vf8qZAmMLyJg-sg@mail.gmail.com>
	<CAPj87rM0BH_eU+6j66Gq7+mrPs2JbrwDZdu58gqwJ_34vNeKmg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 08:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-08 at 16:44 +1100, Daniel Stone wrote:
> On 7 October 2012 12:10, Daniel Stone <daniel@fooishbar.org> wrote:
> > On 5 October 2012 21:47, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> We don't want the cairo dependency. Unfortunately simply checking whether its present
> >> isn't good enough. If its not in DEPENDS, it can disappear half way through building.
> >> We therefore need to explicitly disable it.
> >
> > I've done roughly the same thing in this commit:
> > http://cgit.collabora.com/git/user/daniels/poky.git/commit/?id=96a6e8e9eb7c086be3fcbde6a38ac3b699fca008
> >
> > which has already been submitted upstream:
> > http://lists.freedesktop.org/archives/dri-devel/2012-October/028514.html

Thanks for that, sending something upstream was on my todo list but I
needed to fix the breaking builds more urgently.

> My patch also has the advantage of not trying to link against Cairo if
> it's present but disabled.  Without this, if you build libdrm, build
> Cairo, clean libdrm and attempt to rebuild it again, the rebuild will
> fail, because the test still attempts to link with -lcairo, which
> fails as Cairo's .la file references libdrm.

I'm assuming you mean libdrm's .la file references cario?

Since I pass in --disable-cairo, it never runs the pkgconfig test for
cairo and never puts the include/library options into play. I did test
that and just retested and it doesn't reference it.

Cheers,

Richard





