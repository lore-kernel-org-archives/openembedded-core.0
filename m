Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAepQ-0006Ay-8X for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:01:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2M9qDIS012407
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:52:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10384-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:52:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2M9q0Jl012396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:52:02 GMT
Message-ID: <1332409922.9740.235.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 09:52:02 +0000
In-Reply-To: <20120322065113.GB4010@jama.jama.net>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
	<f21ffad75e377042ebb9d59a01d6b424c6bba711.1332365336.git.Martin.Jansa@gmail.com>
	<1332371476.9740.218.camel@ted> <20120321235049.GA4010@jama.jama.net>
	<1332374564.9740.228.camel@ted> <20120322065113.GB4010@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 06/13] gtk+: import native support from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 10:01:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 07:51 +0100, Martin Jansa wrote:
> On Thu, Mar 22, 2012 at 12:02:44AM +0000, Richard Purdie wrote:
> > On Thu, 2012-03-22 at 00:50 +0100, Martin Jansa wrote:
> > > On Wed, Mar 21, 2012 at 11:11:16PM +0000, Richard Purdie wrote:
> > > > On Wed, 2012-03-21 at 22:36 +0100, Martin Jansa wrote:
> > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > ---
> > > > >  meta/recipes-gnome/gtk+/gtk+.inc |    4 ++++
> > > > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > > > 
> > > > I really don't like the message having a gtk+-native around sends out.
> > > > Why do we need this?
> > > 
> > > See cover letter if you haven't already.
> > 
> > Sorry, I'd looked at it but I'd missed the key bit. I think I thought
> > the URL was a pull URL and my eyes skimmed it.
> 
> No problem,
> 
> > To be honest I don't think the update-icon-cache is good enough reason
> > to build a full gtk+-native. If we let these pieces in the dependencies
> > have a tendency to grow and people have no incentive to try and fix
> > these issues.
> 
> Well agreed, but most of those natives are needed for librsvg-native
> which in turn is used in navit build to generate icons (which I can
> hardly replace with something thiner then librsvg and using e.g.
> autodetected ksvgtopng from host is even worse for reproducible builds).

librsvg-native I don't mind as much, I'm ok with taking those patches.

> So for minimal gtk+-native I only need libx11-native and
> libxrander-native, but the problem is that PACKAGECONFIG without that
> fix ignores all -native depends and with fix it correctly adds -native
> to all non-native deps added by PACKAGECONFIG
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019348.html

Right, I'm aware of that issue and sorry for not responding yet.
Basically, I wanted to do some proper patch review and write a
reasonable response to it and I've been lacking the time to do so.

Firstly, I agree we need to fix it there is no question of that. The
patch moving everything to base.bbclass concerns me though, not least as
it undoes a lot of the work I've been trying to do with regard to
abstracting the bbclassextend code into lib/oe/*.py. I therefore think
an alternative approach is going to be needed but I've not managed to
come up with that yet :(.

> > I'd like to better understand why there is no other way to avoid this.
> 
> I can look into gtk+3 build what else we need to provide to be able to
> build without --enable-gtk2-dependency or how to disable
> update-icon-cache during build so that people with gtk+ installed on
> host and without get the same result package, but I'm not really
> interested in gtk+3 so I was just fixing another build failure :/ so it 
> can take some time...

This is one case I think we need to do the right thing and not take
short cuts. I don't mind the extends for librsvg-native but I don't want
to take gtk+-native or pango-native and any of the the dependencies only
they need.

I also agree we need to fix PACKAGECONFIG but I don't like the direction
the patch takes and haven't had time to come up with an alternative. I
wish I had more time and was able to give a better reply.

Cheers,

Richard




