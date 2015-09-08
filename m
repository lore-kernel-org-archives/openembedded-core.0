Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 33A7060053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 12:18:56 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZHrS-0005rp-TQ; Tue, 08 Sep 2015 14:18:55 +0200
Message-ID: <1441714733.22688.71.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
Date: Tue, 08 Sep 2015 13:18:53 +0100
In-Reply-To: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
References: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: 32 bit time_t in openembedded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Sep 2015 12:18:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-08 at 13:44 +0200, Umut Tezduyar Lindskog wrote:
> Can 32 bits ISA handle year 2038 problem in openembedded?

Not generically.  But this is not an OE-level problem; the issue is more
that the underlying libraries and kernel ABIs are not currently
Y2038-safe.  Fixing this is not really within the scope of OE and is
more a matter for the respective upstream maintainers to deal with.

See for example some previous discussion of the linux kernel
implications at http://lwn.net/Articles/643407/

>Our ISA is 32 bits and we are using relatively new kernel with
>relatively old glibc (2.15). We are using RTC chips which come with a
>random date/time initialized. We started seeing boot problems in
>systemd if the random value of RTC is newer than 2038.

If this is all you're concerned about and you don't seriously expect
your product to be still in use in 2038 then you could add a sanity
check at bootup to reset the clock to some reasonable default if the
value in the RTC is either known to be in the past or is implausibly far
in the future.  

If you do need full Y2038 support (which wouldn't be totally
unreasonable, given that the end of the epoch is now less than 25 years
away and at least some of us will probably live long enough to see it!)
then you would need to do some more substantial development work and you
should probably contact linux-kernel and/or libc-alpha in the first
instance.  Or update to a natively 64-bit system.

p.



