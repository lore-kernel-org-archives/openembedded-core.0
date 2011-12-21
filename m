Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdLrP-0000h4-7X for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 14:05:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLCwQCN008801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 12:58:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08159-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 12:58:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLCwJox008795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 12:58:21 GMT
Message-ID: <1324472301.16323.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 12:58:21 +0000
In-Reply-To: <1324468506.24417.278.camel@phil-desktop>
References: <1324465882.16323.13.camel@ted>
	<1324468506.24417.278.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: nativesdk and native recipe names
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
X-List-Received-Date: Wed, 21 Dec 2011 13:05:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 11:55 +0000, Phil Blundell wrote:
> On Wed, 2011-12-21 at 11:11 +0000, Richard Purdie wrote:
> > If we change nativesdk to become a prefix, the problem can share the
> > same code as multilib and become much more widely usable rather than the
> > current special cases. Its obviously a fairly major change in recipe
> > naming though. Would changing this be acceptable?
> 
> I wonder whether we should just stop this business of bashing PN around
> altogether and encode the native- or sdk-ness into PACKAGE_ARCH or some
> such instead.  (I guess this would need bitbake enhanced to be able to
> build a parallel dependency tree for each architecture, and a way of
> specifying the desired arch in DEPENDS, neither of which it can
> presumably do at the moment.) 

This is certainly an alternative and we already encode the data into
PACKAGE_ARCH FWIW. My gut instinct says the bitbake changes that would
be required are rather complex though.

At a high level the issue is making each variant appear unique to
bitbake so I guess you could do this if you prefixed PROVIDES and R*
variables internally to bitbake, a bit like BBCLASSEXTEND already does
with filenames.

This opens up questions like whether we'd have machine behave more like
a BBCLASSEXTEND so you could do something like:

bitbake qemuarm:core-image-sato qemumips:core-image-sato

which is certainly something people have asked before. Of course we'd
have to support stacking these:

bitbake qemux86:multilib-lib32:core-image-sato

and I'm shuddering to think of some of the corner cases.

In summary, I think its worth thinking about but its a long term change
which isn't going to be viable any time soon.

> All these transforms on PN seem rather fragile and, although changing
> the infix to be a prefix will help, it still doesn't completely
> eliminate the chance of ambiguity.

It doesn't eliminate the issue but it woiuld certainly be an
improvement...

Cheers,

Richard



