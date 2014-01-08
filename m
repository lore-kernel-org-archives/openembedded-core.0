Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 855CC6C008;
	Wed,  8 Jan 2014 17:02:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08H1u1O019187; Wed, 8 Jan 2014 17:01:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dCJGfTLY1UNp; Wed,  8 Jan 2014 17:01:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08H1laT019169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 17:01:49 GMT
Message-ID: <1389200502.6899.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 08 Jan 2014 17:01:42 +0000
In-Reply-To: <CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
	<CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Wed, 08 Jan 2014 17:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-08 at 16:09 +0000, Burton, Ross wrote:
> Hi,
> 
> Despite a good start this thread got rapidly hijacked, so let's try again!
> 
> On 24 December 2013 01:09, Philip Balister <philip@balister.org> wrote:
> >> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> >> and pushes the boundaries of "core platform".  In a sense this is a
> >> repeat of the discussion we had with Midori...  does oe-core contain
> >> everything needed to sufficiently exercise the core components it
> >> ships or not?
> >
> > I expect Richard will push back on this, and I would support him here.
> 
> Probably best to let Richard speak for himself here. :)

:)

I have to admit I'm leaning towards pulling in the 4 recipes we need
since the win is we get to test the GL stacks.

We do support graphics in the core, we also do particularly badly at
testing it. That is something I think we need to change. piglit lets us
do that and its not like it has a significant number of dependencies.
Having a couple more python modules to test the python stack probably
isn't a bad idea ether. We pruned quite a number of recipes out, this is
a case where we can add a small number for a significant win.

> >> 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> >> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> >> forbid mixing distribution policy and recipes.  We'd need to sync
> >> meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> >> that's our problem.
> >
> > So meta-yocto is right out. I'm a user of numpy, and I certainly do not
> > want to include something called meta-yocto-qa just to pick up numpy.
> 
> Right, so my point with the syncing was that this meta-yocto-qa layer
> would be a copy of recipes from other places through combo-layer, and
> would be clearly marked as such.
> 
> Reviewing the options:
> 
> 1) Add python-mako, python-numpy, waffle and piglit to oe-core, for
> all BSPs to use.
> 2) Add python-mako, python-numpy, waffle and piglit to meta-yocto
> (effectively read-only clones with combo-layer, maintained in meta-oe
> still) for Poky to use.
> 3) Add meta-python layer to Poky, and waffle/piglit to meta-yocto
> (read-only clones) for Poky to use.
> 
> Paul raises a good point about other BSPs potentially using Piglit to
> test their GL stacks.  Do any other BSPs test their GL integration,
> and if so what tooling to they use?  I'm only pushing for Piglit
> because it's what the Intel driver team use to test Mesa, but if
> nobody else wants to use it then that's an argument for keeping it in
> Poky (or even cloning it into meta-intel?).

I'm in favour of 1). If there is significant community push back against
that, I will go for 4) a kind of hybrid of 2/3 which is:

4) use combo-layer filtering technology to import just the files we want
from the meta-oe repo into the poky repo.

The plus of 4) is that it would showcase a usage of combo-layer which is
currently underused and IMO should be used more. Equally, I think 4)
might not be liked by some. If would however fulfil the needs the Yocto
Project has in this area.

I would still prefer 1) though.

Cheers,

Richard



