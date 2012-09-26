Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGo7H-0001EK-Ty
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:41:15 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGnus-0006KD-Ew; Wed, 26 Sep 2012 11:28:26 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 26 Sep 2012 10:28:25 +0100
In-Reply-To: <1348649372.8662.90.camel@ted>
References: <1348577690.31293.70.camel@phil-desktop>
	<1348610357.2853.5.camel@lenny>
	<1348610431.1335.11.camel@x121e.pbcl.net>
	<1348611089.2853.7.camel@lenny> <1348649372.8662.90.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348651706.31293.89.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Wed, 26 Sep 2012 09:41:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 09:49 +0100, Richard Purdie wrote:
> On Tue, 2012-09-25 at 18:11 -0400, Colin Walters wrote:
> > On Tue, 2012-09-25 at 23:00 +0100, Phil Blundell wrote:
> > 
> > > That'd be inconsistent with other packages, since we do generally build
> > > and ship the static libraries.  Having a big switch to turn off static
> > > libraries globally seems like a fine plan, but I can't see any obvious
> > > reason why the util-linux ones are any more useless than the rest.
> > 
> > Makes sense.  I wonder if there are actually any users of the static
> > libraries.
> > 
> > For what it's worth in gnome-ostree I do just globally pass
> > --disable-static by default.
> 
> I tested this a while back to see what performance difference it made.
> The answer was "nothing too significant", I don't have the exact timings
> handy. I do remember having to exclude sqlite-native from the list since
> pseudo static links against it.

It's slightly surprising that it doesn't make that much of a difference,
given that building static libraries does essentially double the number
of compilations for library code.  Though, of course, glibc doesn't
support --disable-static nowadays and there might be a few other big
packages that have the same issue.

I guess that if you have enough cores, compilation count becomes
something of a non-issue since it's one of the few things that does
parallelize very well.  It might be interesting to repeat the
measurements of --disable-static on a machine with only a few CPUs and
see whether it makes more of a difference there.

Out of interest, why does pseudo static-link against sqlite anyway?

p.




