Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRoWV-0002nd-Rk for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:43:59 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRoTT-0001it-4r
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:40:51 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CE41A629-FFAA-4A2D-9173-3BCF44CA932C@dominion.thruhere.net>
References: <1306944074.2529.107.camel@phil-desktop>
	<CE41A629-FFAA-4A2D-9173-3BCF44CA932C@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 17:40:50 +0100
Message-ID: <1306946450.2529.136.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 16:43:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 18:10 +0200, Koen Kooi wrote:
> Op 1 jun 2011, om 18:01 heeft Phil Blundell het volgende geschreven:
> 
> > Is there any compelling reason why dbus-native needs to be built
> > --with-x?  This seems to be causing quite a large stack of native X11
> > packages to get built with, as far as I can tell, no useful result.
> 
> I agree, for -native --with-x is overkill

Actually, it turns out that dbus.inc already has:

EXTRA_OECONF_X = "--with-x"
EXTRA_OECONF_X_virtclass-native = "--without-x"

... it's just that it doesn't have any similar code to squash the
dependency on virtual/libx11 in the native case, so you end up building
the x libs anyway.  Doh.

Knocking that dependency out has reduced the task count for
micro-base-image from 938 to 748, which seems like a worthwhile saving.
I'll send a patch later once I've verified that the image build does
actually succeed with that change.

p.




