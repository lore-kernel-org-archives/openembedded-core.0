Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0I2m-0004XU-LI for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 20:40:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MJVifJ000448
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 19:31:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32559-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 19:31:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MJVc6s000442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 19:31:39 GMT
Message-ID: <1329939097.32110.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 19:31:37 +0000
In-Reply-To: <CA+b4E8znHQ3oXSH9y-iWi_Sy7WkJEjNunVkKKWAWTTJTWCzN7A@mail.gmail.com>
References: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
	<1329912732.20261.110.camel@ted>
	<CA+b4E8znKGcGq=3q+SXn6+N=A9o9Z=rkrVjT3Pf4v7CMBtipzg@mail.gmail.com>
	<1329932828.32110.6.camel@ted>
	<CA+b4E8znHQ3oXSH9y-iWi_Sy7WkJEjNunVkKKWAWTTJTWCzN7A@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Cannot satisfy the following dependencies for task-core-basic: libusb-compat (>= 0.1.3)
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
X-List-Received-Date: Wed, 22 Feb 2012 19:40:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 13:46 -0500, Brandon Stafford wrote:
> On Wed, Feb 22, 2012 at 12:47 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> 
> > If you look at the tmp/deploy/ipk/*/Packages index file, you should see
> > the dependencies of each package listed. It would be interesting to see
> > if something is depending on "libusb-compat". If there is something I'd
> > be tempted to try running "bitbake xxx -c cleansstate" and rebuilding
> > that specific recipe.
> 
> Victory!
> 
> Looking at the Packages file, it appears that gnupg depends on libusb-compat.
> 
> I then ran this series of commands:
> 
> bitbake gnupg -c cleansstate
> bitbake -c clean core-image-basic
> bitbake core-image-basic
> 
> These tasks all completed successfully. Thank you, Richard, for taking
> the time to point me in the right direction.
> 
> One last question-- somehow, the first build of gnupg was expecting to
> find libusb-compat by the wrong name. This was cached in sstate, and a
> subsequent build fixed it. Why would it work the second time if the
> recipe was unchanged?

That is a question I'd love to have the answer to. Something went wrong
but I don't know what. If you had the old sstate package, it would have
been interesting to compare the old and new ones but you've probably
deleted that now :(. If you do still have them I'd be very interested in
a copy of the two files.

Was this with master or the 2011-1 release branch (or are you using poky
and one of its release branches)?

Cheers,

Richard




