Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qbsd6-0000di-9D for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:08:24 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbsZY-000144-8y
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:04:44 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309344835.20015.355.camel@rex>
References: <044DC375-E0BA-44D9-A063-9BB8E11F7742@dominion.thruhere.net>
	<1309341325.15156.232.camel@phil-desktop>
	<1309344835.20015.355.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 12:04:42 +0100
Message-ID: <1309345482.2551.10.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Gstreamer packaging
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
X-List-Received-Date: Wed, 29 Jun 2011 11:08:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 11:53 +0100, Richard Purdie wrote:
> Obviously you can make the recipe depend on good+bad+ugly but its less
> than ideal for build time reasons (esp. when considering dependencies)
> but also the reason that good/bad/ugly exist in the first place which is
> licensing. 

It's only -ugly which has licensing issues, and those same licensing
issues also mean that plugins don't tend to migrate to or from -ugly in
the same way as they do between the other packages.  So, if -good, -bad
and -base were combined in a single recipe, leaving -ugly separate, that
would solve about 90% of the current nuisance.

Dependency-wise, gst-plugins-good is the only one with a large stack of
DEPENDS.  If you assume that most people are probably going to need at
least one plugin from that package anyway, which I think is probably the
case in reality, then the dependency impact of combining -good, -bad and
-base in a single recipe would be fairly negligible.  (The only extra
dependencies you'd get from -bad would be libmusicbrainz, tremor and
librsvg.)

Of course, another way to attack the dependency stack problem would be
to combine the recipes and then be more aggressive about allowing
DISTROs to select only the plugins (and hence the dependencies) that
they want.  For example, I have long found it slightly annoying that
gst-plugins-good requires gtk+ and x11 at build time since I don't
actually use either of those libraries in my deployed system.

p.




