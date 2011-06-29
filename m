Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbwPu-0008C7-0g for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 17:11:02 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbwML-0001Ee-It
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 17:07:21 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
References: <1309358918.2551.48.camel@phil-desktop>
	<1309359293.2551.49.camel@phil-desktop>
	<A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 16:07:20 +0100
Message-ID: <1309360040.2551.56.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: bitbake -b busted again?
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
X-List-Received-Date: Wed, 29 Jun 2011 15:11:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 16:55 +0200, Koen Kooi wrote:
> Op 29 jun 2011, om 16:54 heeft Phil Blundell het volgende geschreven:
> 
> > On Wed, 2011-06-29 at 15:48 +0100, Phil Blundell wrote:
> >> Using bitbake master from today, I'm now getting this error whenever I
> >> try to do "bitbake -b anything.bb":
> > 
> > Actually, it looks like I was just unlucky/unskilled in my choice of
> > recipes when I tested.  It does in fact work for at least some files;
> > there must be something about the ones I was trying to begin with that
> > is upsetting it.  I'll investigate further.
> 
> Try bitbake -b /full/path/to/recipe, that seems to make things work for me.

It seems that the main problem I was having was that (coincidentally in
light of the earlier gst discussion) the recipe I was trying to build
was unluckily named and being skipped because base.bbclass thought I
wasn't licensed to use it.

The code which detects commerciality is somewhat simple-minded and just
does a straight regex search for ${PN} within ${COMMERCIAL_LICENSE}, so
if your recipe happens to be called "fmp" (for example) it will match
against ffmpeg and you will lose.

I think this has probably just started to bite me because I recently
started using default-distrovars.inc.  Possibly that was a dim plan on
my part.

p.




