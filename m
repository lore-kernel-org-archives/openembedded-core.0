Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjTr2-0006m1-Hc
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 12:18:12 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjTn6-00037w-KD
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 12:14:08 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 11:14:07 +0100
In-Reply-To: <4fb98dee67ddcdbc35f6e5c203ddb7217cd55a97.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
	<4fb98dee67ddcdbc35f6e5c203ddb7217cd55a97.1311150183.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311156848.30326.58.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 20 Jul 2011 10:18:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 01:28 -0700, Saul Wold wrote:
> +We disable locale on uclibc in OE therefore we do not use it if building for uclibc
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Inappropriate <OE config related>
> +
> + {
> +-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
> ++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)

I'm not totally thrilled about having the equivalence between "uclibc"
and "no locale" patched into random sources in a piecemeal way like
this.  uClibc doesn't inherently lack locale support, it's just that the
default oe-core configuration happens to turn it off, and there's no
reason that another layer mightn't decide to enable it again.  It would
suck if that layer then had to re-patch all these recipes to take the
__UCLIBC__ conditional back out.

I think it would be better to replace this sort of thing with an
autoconf linker test that checks to see whether newlocale() is actually
available in the installed libc.

p.




