Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SMj3U-00032g-6d
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 18:57:32 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SMiuF-0001Jy-Ko
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 18:47:59 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 17:47:58 +0100
In-Reply-To: <1335285237.21409.19.camel@ted>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
	<1335260575.27021.64.camel@phil-desktop>
	<1335264349.12692.120.camel@ted>
	<1335264491.27021.66.camel@phil-desktop>
	<1335285237.21409.19.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1335286079.27021.102.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: is the virtual package <locale>-tanslation correct?
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
X-List-Received-Date: Tue, 24 Apr 2012 16:57:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 17:33 +0100, Richard Purdie wrote:
> On Tue, 2012-04-24 at 11:48 +0100, Phil Blundell wrote:
> > On Tue, 2012-04-24 at 11:45 +0100, Richard Purdie wrote:
> > > On Tue, 2012-04-24 at 10:42 +0100, Phil Blundell wrote:
> > > > Yes, that is the intended behaviour.  This is necessary to support
> > > > dynamically installed language packs.
> > > 
> > > What uses this out of interest?
> > 
> > I'm not entirely sure to be honest.  We used to use it quite heavily in
> > Familiar but I have no idea whether Angstrom does the same.  The systems
> > I'm working on nowadays don't tend to require language packs so I
> > haven't personally used that mechanism for a while.
> 
> How did the system use this? I can imagine querying the list of
> installed packages and then attempting installing xx-locale as a resuilt
> but I'm not sure how this other provider helps?
> 
> As far as I know, opkg doesn't directly support anything like this?

Ipkg did have (and I assume opkg still has, though I haven't checked) a
"greedy depends" mechanism which works exactly like this.  If it sees a
line like:

Recommends: xx-locale*

then it will install all the packages which Provide: xx-locale and whose
dependencies are already satisfied.  The way we used this in Familiar
was that the .ipk containing message catalogs for language CC and
package PN would Provide: PN-locale, CC-translation, and would Depend:
on PN and locale-base-CC.  PN itself would Recommend: PN-locale*, and
there was a language-pack-CC metapackage which would Depend: on
locale-base-cc and Recommend: CC-translation*.  So...

- if you did "ipkg install language-pack-de", it would install
locale-base-de (via the hard Depends) and then install PN-locale-de for
each PN that was already installed (via the Recommends).

- if you did "ipkg install frozen-bubble", it would install the program
itself (obviously) and then install the message catalogs for all the
locale-bases that were already installed.

Likewise, if you subsequently removed locale-base-de or frozen-bubble
then the dependency chain would cause all the corresponding message
catalogs to get ripped out as well.

Obviously this was about a decade ago so my recollection might not be
100% reliable.  But I'm fairly sure that the basic gist of the above is
correct.

p.




