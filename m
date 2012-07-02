Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Slgcw-00050l-WA for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 15:25:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q62DEJPv031253
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 14:14:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29631-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 14:14:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q62DEBfo031246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 14:14:12 +0100
Message-ID: <1341234857.23146.228.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 14:14:17 +0100
In-Reply-To: <alpine.DEB.2.02.1207020726170.23135@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
	<CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
	<alpine.DEB.2.02.1206300618250.14118@oneiric>
	<1341219932.23146.187.camel@ted>
	<alpine.DEB.2.02.1207020726170.23135@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: is the PRIORITY variable actually used anywhere?
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
X-List-Received-Date: Mon, 02 Jul 2012 13:25:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-02 at 07:29 -0400, Robert P. J. Day wrote:
> On Mon, 2 Jul 2012, Richard Purdie wrote:
> 
> > On Sat, 2012-06-30 at 06:20 -0400, Robert P. J. Day wrote:
> > > On Sat, 30 Jun 2012, Martin Jansa wrote:
> > >
> > > > http://git.openembedded.org/meta-openembedded/commit/?id=040f75eca217c79fed7b881589d9bb36358cffe1
> > > > http://git.openembedded.org/openembedded-core/commit/?id=d122343362669c683acc4af295971a62cbc823fc
> > > >
> > > > so can be dropped from bitbake.conf too AFAIK
> > >
> > >   actually, there are still a number of lines that refer to that
> > > variable:
> > >
> > > $ grep -rw PRIORITY *
> > > meta/conf/bitbake.conf:PRIORITY = "optional"
> > > meta/conf/documentation.conf:PRIORITY[doc] = "Importance of package, default values are 'optional' or 'needed'."
> > > meta/classes/package_deb.bbclass:        fields.append(["Priority: %s\n", ['PRIORITY']])
> > > meta/classes/package_ipk.bbclass:		fields.append(["Priority: %s\n", ['PRIORITY']])
> > > meta/classes/oelint.bbclass:	# Test for valid PRIORITY
> > > meta/classes/oelint.bbclass:	s = testVar("PRIORITY")
> > > meta/classes/oelint.bbclass:				bb.note("PRIORITY '%s' is not recommended" % s)
> > > meta/classes/oelint.bbclass:				bb.note("PRIORITY '%s' is not recommended, better use '%s'" % (s, newprio))
> > > meta/classes/oelint.bbclass:			bb.note("PRIORITY '%s' is not recommended" % s)
> > > meta/classes/oelint.bbclass:			bb.error("PRIORITY should only use lower case")
> > > $
> > >
> > >   if i can assume that all of that can be removed, i can do that as a
> > > single patch, again unless someone else wants to handle it if there
> > > are subtleties involved.
> >
> > I think this one is best left alone as the code stands. We did remove
> > the variable from standard usage, it doesn't obsolete the above code
> > which someone could in theory still use from say a distro configuration
> > perspective.
> >
> > The line in documentation.conf look wrong though, I think "needed"
> > should be "required".
> 
>   oelint.bbclass currently suggests it can be any of "standard",
> "required", "optional" or "extra".  and perhaps a dumb question -- how
> are there *two* default values?  not sure what that means.

"optional" is the default, other possible values are "standard"
"required" and "extra".

>   anyway, i'll leave this in someone else's capable hands.  it's
> pretty obvious that no use is being made of this variable these days.

In the interests of resolving this, I've patched documentation.conf. If
anyone objects or wants to improve it further, please send the patch.

Cheers,

Richard




