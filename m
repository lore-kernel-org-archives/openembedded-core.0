Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZKdN-0004mg-SF for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 12:26:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZKZx-00036y-Ti
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 12:22:38 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinkNcN8RBcZapj5xF=q_p4O++trgg@mail.gmail.com>
References: <cover.1308680000.git.anders@chargestorm.se>
	<4e9efffb9118e29178d087577c0cebb360872ebe.1308680000.git.anders@chargestorm.se>
	<1308681938.3083.11.camel@lenovo.internal.reciva.com>
	<BANLkTinkNcN8RBcZapj5xF=q_p4O++trgg@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 22 Jun 2011 11:22:36 +0100
Message-ID: <1308738156.21613.80.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC PATCH 3/5] linux-kernel-base: add support for Linux 3.x
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
X-List-Received-Date: Wed, 22 Jun 2011 10:26:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 21:10 +0200, Anders Darander wrote:
> If we keep the kernel_majorversion, we'll need to have something
> similar to this,
> as the major version up to 2.6 was determined by X.Y. From 3.0, only the first
> digit represents the major number; while the second digit (0 in 3.0)
> is equal to
> x in 2.6.x. Thus, the function to determine the major version has to
> return either
> 2.6 or 3.

Well, the thing is that OE's "kernelmajorversion" was always something
of an artificial construct.  It was introduced purely as a way of coping
with some of the differences between 2.4 and 2.6: this was primarily the
different module format, but it also happened to coincide with major
rewrites of the iPAQ and Zaurus kernels which were the main ones we were
using in OE at the time.  Returning "3" here isn't going to be helpful
since none of the classes will know what to do with that value: all they
ever do is compare it against either 2.4 or 2.6.  The exact form of
those tests has never been standardised, so there is a risk that you
might encounter

if [ "$KERNEL_MAJORVERSION" != "2.6" ]; then
  # must be 2.4!
fi

which would evidently lose quite badly if the major version were
suddenly to become 3.

Since there are no material differences between Linux 2.6 and Linux 3.0
that OE needs to be aware of, I think it would make most sense for
kernelmajorversion() to continue returning "2.6" for Linux 3.0 and
future versions if we did want to keep that mechanism.

However, since the whole purpose of the mechanism was to ease the
transition from 2.4 to 2.6, I am fairly confident that it can just be
deleted altogether if support for 2.4 is being removed. 

p.




