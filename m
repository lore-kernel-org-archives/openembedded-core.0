Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJt1J-0005S7-Jt
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 23:31:49 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJsoj-0008Mh-Gs; Thu, 04 Oct 2012 23:18:49 +0200
Message-ID: <1349385377.8072.9.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 04 Oct 2012 22:16:17 +0100
In-Reply-To: <506DF8FB.1090606@windriver.com>
References: <506DCF4A.5020101@windriver.com>
	<CAMKF1srKsHp+Zb_eKa-BA53qbJALHvgqtXkHUdiF-fsvJp6vGQ@mail.gmail.com>
	<506DF8FB.1090606@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Secondary Toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 21:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-04 at 16:00 -0500, Mark Hatle wrote:
> This is only one runtime.  You have multiple compilers all capable of producing 
> software compatible with the same ABI.  The default (oe) compiler is used, 
> unless otherwise configured.  The alternative(s) are used for optimization of 
> various items.  I mentioned ICC, because it's one that I know today people are 
> using and it is capable of replacing gcc in many applications.

If that's the case then it doesn't seem like it ought to be necessary to
override most of the variables you mentioned.  Tools like ar, ranlib and
strip are generic to a binary format and should work fine with the
output from any compiler.  Also, if you're linking with GNU libc then
the chances are that you need to use one of the GNU linkers (be that
ld.bfd or gold) since I suspect most third party link editors will not
work very well.  And, if you have assembly source on hand, it's probably
going to be written in GAS dialect so selecting an alternative assembler
as ${AS} is unlikely to gain much.

So, it kind of seems like the only variables you're likely to need to
change are CC, CXX and the corresponding FLAGS.  I guess you might also
want to override F77 in theory though I'm not sure there are many people
using Fortran in an embedded environment.

Your proposed "toolchain-icc" override sounds like a reasonable enough
way to accomplish that, anyway.  The only problem it doesn't seem to
solve is the use-case of "everything that supports icc, I want to build
with icc; everything that doesn't support icc, I want to build with
gcc".  But I'm not sure this really matters much.

p.




