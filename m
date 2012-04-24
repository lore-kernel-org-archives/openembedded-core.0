Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMm2t-0000aL-D0 for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 22:09:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OJxXXQ016471
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 20:59:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14820-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 20:59:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OJxQg1016460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 20:59:27 +0100
Message-ID: <1335297565.21409.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 20:59:25 +0100
In-Reply-To: <1335286079.27021.102.camel@phil-desktop>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
	<1335260575.27021.64.camel@phil-desktop>
	<1335264349.12692.120.camel@ted>
	<1335264491.27021.66.camel@phil-desktop>
	<1335285237.21409.19.camel@ted>
	<1335286079.27021.102.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 24 Apr 2012 20:09:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 17:47 +0100, Phil Blundell wrote:
> On Tue, 2012-04-24 at 17:33 +0100, Richard Purdie wrote:
> > On Tue, 2012-04-24 at 11:48 +0100, Phil Blundell wrote:
> > > On Tue, 2012-04-24 at 11:45 +0100, Richard Purdie wrote:
> > > > On Tue, 2012-04-24 at 10:42 +0100, Phil Blundell wrote:
> > > > > Yes, that is the intended behaviour.  This is necessary to support
> > > > > dynamically installed language packs.
> > > > 
> > > > What uses this out of interest?
> > > 
> > > I'm not entirely sure to be honest.  We used to use it quite heavily in
> > > Familiar but I have no idea whether Angstrom does the same.  The systems
> > > I'm working on nowadays don't tend to require language packs so I
> > > haven't personally used that mechanism for a while.
> > 
> > How did the system use this? I can imagine querying the list of
> > installed packages and then attempting installing xx-locale as a resuilt
> > but I'm not sure how this other provider helps?
> > 
> > As far as I know, opkg doesn't directly support anything like this?
> 
> Ipkg did have (and I assume opkg still has, though I haven't checked) a
> "greedy depends" mechanism which works exactly like this.  If it sees a
> line like:
> 
> Recommends: xx-locale*
> 
> then it will install all the packages which Provide: xx-locale and whose
> dependencies are already satisfied.  The way we used this in Familiar
> was that the .ipk containing message catalogs for language CC and
> package PN would Provide: PN-locale, CC-translation, and would Depend:
> on PN and locale-base-CC.  PN itself would Recommend: PN-locale*, and
> there was a language-pack-CC metapackage which would Depend: on
> locale-base-cc and Recommend: CC-translation*.  So...
> 
> - if you did "ipkg install language-pack-de", it would install
> locale-base-de (via the hard Depends) and then install PN-locale-de for
> each PN that was already installed (via the Recommends).
> 
> - if you did "ipkg install frozen-bubble", it would install the program
> itself (obviously) and then install the message catalogs for all the
> locale-bases that were already installed.
> 
> Likewise, if you subsequently removed locale-base-de or frozen-bubble
> then the dependency chain would cause all the corresponding message
> catalogs to get ripped out as well.
> 
> Obviously this was about a decade ago so my recollection might not be
> 100% reliable.  But I'm fairly sure that the basic gist of the above is
> correct.

This is interesting information, thanks! Back in <checks logs> 2007 I
disabled some of the functionality you mention above since I couldn't
find anyone who could explain to me what it was meant to be doing but it
was causing problems:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/package.bbclass?id=cee4b2a05a506817c65267ff9786c2e9c980306a

and we still have that comment block in the code to this day. I'm sure
at the time I tried to get opkg/ipkg to do something sensible with this
and couldn't.

It would certainly be interesting to revisit some of this and see if we
could bring it back to life, maybe as part of the ipk backend this time
instead of in the core. It is going to be package manager specific
though and that may be the right place to add in some of these
dependencies if they aren't going to be useful (or functional)
elsewhere.

Cheers,

Richard





