Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RTXCO-0005uX-E2
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 12:10:36 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RTX65-0001MD-2u
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 12:04:05 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 11:04:02 +0000
In-Reply-To: <2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>
	<20d46c74e1c1de68ca86b5b7eded5ae66a142e85.1322102636.git.xiaofeng.yan@windriver.com>
	<2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322132645.26081.49.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/9] gtk.inc: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 11:10:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 07:38 +0100, Koen Kooi wrote:
> Op 24 nov. 2011, om 04:06 heeft Xiaofeng Yan het volgende geschreven:
> 
> > From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> > 
> > gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
> > the configuration related to x11 should be disabled and directfb should be enabled.
> 
> Apart from this patch is messing with PACKAGES as well, I still don't believe it's true that x11 must be disabled for directfb to work

[...]

> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> +
> +PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
> +PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"

If you're using a version of GTK+ which expects the "--with-gdktarget"
option then I think it is true that X11 and directfb are exclusive since
you can only have one backend enabled at a time.  There's nothing you
can do in the recipe that will help with this, though it would be nice
if you got a sensible diagnostic rather than one of the options just
being silently ignored.

With newer versions (3.0 and later, I think) there are separate
--enable-FOO-backend options for the different backends and you can turn
on as many as you want at the same time.  In those versions I don't
think --with-gdktarget will do anything useful at all so this patch
won't work.

p.




