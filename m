Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYfEZ-0002OQ-6J
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 15:46:03 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYf7z-0001ML-OU
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 15:39:15 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 14:39:14 +0000
In-Reply-To: <67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323355155.26081.355.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 14:46:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 11:14 +0100, Koen Kooi wrote:
> Op 8 dec. 2011, om 10:34 heeft Xiaofeng Yan het volgende geschreven:
> 
> > From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> > 
> > gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
> > the configuration related to x11 should be disabled and directfb should be enabled.
> 
> Since I still can't get an answer to "what happens when you enable both x11 and directfb as distro features", 

The answer to that question seems to be that you will get undefined
behaviour.  Both PACKAGECONFIG flags will match so you'll get the
configure options for both of them, but the packageconfig mechanism
doesn't appear to guarantee what the ordering will be.  (You might
expect that it would be the order of the entries in PACKAGECONFIG itself
but, from a quick look at the code, that doesn't appear to be the case.)

So, you'll end up with both sets of things in DEPENDS and either:

--with-x=yes --with-gdktarget=x11 --with-gdktarget=directfb

or

--with-gdktarget=directfb --with-x=yes --with-gdktarget=x11

in EXTRA_OECONF but there doesn't seem to be any obvious way to predict
which it'll be.

It would be nice if there was a way to declare PACKAGECONFIG options as
conflicting with each other so that you'd get a diagnostic if you tried
to turn both on.  But there's no mechanism to support that at present
and it doesn't seem like it would merit ad-hoc python hacks in the gtk+
recipe.

p.




