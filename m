Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RFnvI-0002Ea-0j
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 16:12:12 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RFnph-0007wo-M6
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 16:06:25 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 15:06:24 +0100
In-Reply-To: <20111017135938.GH12684@jama.jama.net>
References: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
	<1318859310.22985.114.camel@phil-desktop>
	<20111017135938.GH12684@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1318860385.22985.118.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC] bitbake.conf: include only ${libdir}/${BPN}/*${SOLIBS} not whole ${libdir}/${BPN}/* in FILES_${PN}-dev
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
X-List-Received-Date: Mon, 17 Oct 2011 14:12:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-17 at 15:59 +0200, Martin Jansa wrote:
> On Mon, Oct 17, 2011 at 02:48:29PM +0100, Phil Blundell wrote:
> > If there are .la or .so files in ${libdir}/${PN} that are causing a
> > problem then it does seem reasonable to add them to FILES_${PN}-dev.
> > But I don't think that restricting the scope of FILES_${PN} is
> > desirable, or ought to be necessary.
> 
> How to do this with this order of PACKAGES, without redefining PACKAGES
> itself?
> 
> PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-locale"

Ah, hm.  I had thought for some reason that ${PN}-dev was before ${PN}
but evidently that's not correct.  So you're right, there is probably no
good way to do it without fiddling FILES_${PN}.  

That being the case, I am inclined to say that this ought just to be
fixed locally in the recipes that have the problem: it isn't very
obvious to me that setting a restrictive glob on FILES_${PN} (and then
having to edit all the recipes that install non-library things in there)
is going to be a net win compared to just fixing the recipes that are
currently shipping .la files in there by mistake.

Or, maybe another solution would be to invent some sort of mechanism
like...

EXCLUDEFILES_${PN} = "*.la"

and get package.bbclass to skip anything matching that glob.

p.




