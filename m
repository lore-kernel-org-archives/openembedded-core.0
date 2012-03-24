Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBPN3-0002qZ-Oa for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 12:42:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OBY1Qe005646
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 11:34:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01784-09 for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 11:33:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OBXs2x005639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 11:33:55 GMT
Message-ID: <1332588836.9740.522.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 24 Mar 2012 11:33:56 +0000
In-Reply-To: <20120324103634.GH4604@jama.jama.net>
References: <alpine.DEB.2.02.1203240420500.19324@oneiric>
	<20120324103634.GH4604@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: confusion between += and =+ and _append and _prepend ...
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
X-List-Received-Date: Sat, 24 Mar 2012 11:42:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-24 at 11:36 +0100, Martin Jansa wrote:
> On Sat, Mar 24, 2012 at 04:34:40AM -0400, Robert P. J. Day wrote:
> > 
> >   when perusing the source for oe-core, it's going to be easy for a
> > beginner to get confused about the right time(s) to use += versus =+
> > versus _append versus _prepend because the source simply bounces
> > around between them all arbitrarily.
> > 
> >   here's a single example.  the file bitbake.conf defines the default
> > for PACKAGES:
> > 
> > PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
> > 
> > now it would seem that, if a recipe wanted to extend that list (as
> > many do), the obvious approach is to augment the list with more
> > entries.  and in the occasional situation where that default needs to
> > be overridden, then a straight assignment can be used.
> > 
> >   but searching the source shows every possible combination of adding
> > to the PACKAGES variable:
> > 
> > ...
> > meta/recipes-devtools/perl/perl_5.14.2.bb:PACKAGES_append = " perl-modules "
> > meta/recipes-qt/qt4/qt-4.8.0.inc:PACKAGES_append = " ${QT_BASE_NAME}-tests-dbg ${QT_BASE_NAME}-tests"
> > ...
> > meta/recipes-connectivity/bind/bind_9.8.1.bb:PACKAGES_prepend = "${PN}-utils "
> > meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc:PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
> > meta/recipes-extended/newt/libnewt_0.52.14.bb:PACKAGES_prepend = "whiptail "
> > ...
> > 
> >   and there are, of course, many, many uses of "PACKAGES +=" and
> > "PACKAGES =+".  and, sure, they'll all work but the variety is
> > definitely going to confuse someone trying to figure out best
> > practices.
> > 
> >   and occasionally, there is a direct assignment when a simple
> > appending would work fine, like with rpm:
> > 
> > meta/recipes-devtools/rpm/rpm_5.4.0.bb:PACKAGES = "${PN}-dbg ${PN}
> > ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common
> > ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm
> > perl-module-rpm perl-module-rpm-dev ${PN}-locale"
> > 
> >   i realize this is all annoyingly picky pedantry but there should be
> > some sort of standard for things like this, just for consistency.
> 
> order of items in PACKAGES variable is important (FILES_foo) are picked
> in PACKAGES order so it's different if foo is before bar or after (if
> their FILES_ mask has some overlap).
> 
> So sometimes you have to prepend, sometimes append.

I'd also add that it is preferred to append/prepend to PACKAGES rather
that directly set it. A lot of recipes used to directly set it, we've
removed a lot of them. I know a few still remain.

Part of the problem was being able to demonstrate a given patch didn't
change the packaging adversely. We now have buildhistory so it should be
easier to make those kind of changes and be able to prove it didn't
break anything. This makes it easier for people to write and for me to
take such changes.

I keep mentioning buildhistory since it has a lot of potential to make
things easier for us and allow us to do more. Its one reason I've
refused to let it slip from the Yocto 1.2 schedule.

Cheers,

Richard



