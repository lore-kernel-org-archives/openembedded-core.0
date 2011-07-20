Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjXcQ-0002hd-L8 for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:19:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEFGCF023299
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:15:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22788-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:15:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEF993023293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:15:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311156848.30326.58.camel@phil-desktop>
References: <cover.1311150183.git.sgw@linux.intel.com>
	<4fb98dee67ddcdbc35f6e5c203ddb7217cd55a97.1311150183.git.sgw@linux.intel.com>
	<1311156848.30326.58.camel@phil-desktop>
Date: Wed, 20 Jul 2011 15:15:06 +0100
Message-ID: <1311171306.2344.39.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 46/50] mesa-xlib: Dont use locales with uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 14:19:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 11:14 +0100, Phil Blundell wrote:
> On Wed, 2011-07-20 at 01:28 -0700, Saul Wold wrote:
> > +We disable locale on uclibc in OE therefore we do not use it if building for uclibc
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Upstream-Status: Inappropriate <OE config related>
> > +
> > + {
> > +-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
> > ++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
> 
> I'm not totally thrilled about having the equivalence between "uclibc"
> and "no locale" patched into random sources in a piecemeal way like
> this.  uClibc doesn't inherently lack locale support, it's just that the
> default oe-core configuration happens to turn it off, and there's no
> reason that another layer mightn't decide to enable it again.  It would
> suck if that layer then had to re-patch all these recipes to take the
> __UCLIBC__ conditional back out.
> 
> I think it would be better to replace this sort of thing with an
> autoconf linker test that checks to see whether newlocale() is actually
> available in the installed libc.

Agreed, when I first saw this I wasn't happy either, I don't think it
makes sense. An autoconf test here would be much more scalable (and more
likely to get accepted upstream too).

Cheers,

Richard



