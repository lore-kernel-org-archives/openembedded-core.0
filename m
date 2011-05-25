Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPHVP-0007hJ-3c for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:04:23 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPHSU-0004kz-Kw
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:01:22 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 25 May 2011 18:01:21 +0100
Message-ID: <1306342881.2525.258.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: RDEPENDS_${PN} and virtclass-native
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
X-List-Received-Date: Wed, 25 May 2011 17:04:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

By way of displacement activity to avoid actually fixing my perl
compilation problem, it occurred to me to investigate why perl was
getting dragged into a micro-base-image build in the first place.  The
culprit turns out to be imake, which does:

RDEPENDS_${PN} = "perl xproto"

and is then BBCLASSEXTENDed to imake-native (which in turn is pulled in
by way of prelink-native and transfig-native).

Now, leaving aside the question of whether it is reasonable for prelink
to be depending on transfig, it is clearly wrong for the -native version
of imake to be depending on perl.  It seems that native.bbclass makes
some effort to rewrite plain RDEPENDS to the -native version, but it
doesn't apply the same tactics to RDEPENDS_${PN} or any such.  (And, in
fact, rewriting plain RDEPENDS is probably futile since few if any
recipes are going to be setting it.)

Obviously I can fix this by just setting RDEPENDS_virtclass-native in
the recipe, and that's what I've done in my local tree.  But I wonder if
a better solution would be for native.bbclass to be slightly more
adventurous about rewriting these things for itself.

p.




