Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfeQ2-0006LO-1X for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 23:51:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FLeOmK017454
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 22:40:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16330-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 22:40:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FLeGdC017448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 22:40:18 +0100
Message-ID: <1339796416.2547.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 22:40:16 +0100
In-Reply-To: <20120615203949.GY3140@jama.jama.net>
References: <20120615063647.GU3140@jama.jama.net>
	<CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
	<1339771010.4471.14.camel@ted> <20120615203949.GY3140@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: openssl does not build on recent distributions with perl-5.16.0
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
X-List-Received-Date: Fri, 15 Jun 2012 21:51:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-15 at 22:39 +0200, Martin Jansa wrote:
> On Fri, Jun 15, 2012 at 03:36:50PM +0100, Richard Purdie wrote:
> > On Fri, 2012-06-15 at 07:15 -0700, Khem Raj wrote:
> > > On Thursday, June 14, 2012, Martin Jansa wrote:
> > >         Hi,
> > >
> > >         openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
> > >
> > >         is using perlpath.pl:
> > >
> > >          do_configure () {
> > >                  cd util
> > >                  perl perlpath.pl ${STAGING_BINDIR_NATIVE}
> > >
> > > I wonder why it's using host perl and not staged perl-native
> > > May be missing inherit perlnative 
> > 
> > perlnative is not meant to be used as a replacement for the host
> > system's perl, its meant for building target modules and target perl
> > itself. 
> > 
> > We require perl to be on the host system. We're not meant to be using
> > anything outside the standard perl install though. The alternative means
> > effectively totally cratering build time as we'd have to build
> > perl-native before pretty much anything else.
> > 
> > So the best solution is likely to have something that adds find.pl to
> > the native sysroot and have these recipes depend on it, at least short
> > term. I'm extremely reluctant to start adding perl-native dependencies
> > throughout the system due to performance considerations.
> 
> is there any other recipe depending on find.pl? (I've tried only minimal
> image with perl-5.16), maybe sgml-common-native as Jack reported, 
> here it's used only in do_configure, that's why I added find.pl only to 
> openssl and better fix would be to send patch to use File::Find in 
> perlpath.pl to openssl upstream IMHO then adding find.pl to sysroot.

Agreed, I've not looked into the details of this but that sounds
reasonable...

Cheers,

Richard



