Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC5760068
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:48:46 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161125104842600_0485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:48:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=13925 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cAE3Z-0001qN-0r for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2016 05:48:37 -0500
Date: Fri, 25 Nov 2016 05:47:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611250534120.31820@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: YAPQ: OE recipe for Perl module Crypt::OpenSSL::X509?
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
X-List-Received-Date: Fri, 25 Nov 2016 10:48:46 -0000
Content-Type: text/plain; charset=US-ASCII


  (side note: if there's a better place to ask about
finding/tweaking/writing perl modules for an OE image, let me know.
i've almost cleared my list of essential perl recipes, just a couple
more i need pretty badly, so a couple more posts coming.)

  for my qemuppc image, i need a (obviously cross-compiled version of)
Crypt::OpenSSL::X509, which i can see at CPAN:

  https://metacpan.org/pod/Crypt::OpenSSL::X509

which has absolutely no hope of being cross-compiled based on the
boilerplate recipe i threw together:

  $ make libcrypt-openssl-x509-perl
  ... snip ...
  | cc1: error: include location "/usr/include/openssl" is unsafe for
  cross-compilation [-Werror=poison-system-directories]
  | cc1: all warnings being treated as errors
  | Makefile:346: recipe for target 'X509.o' failed
  | make: *** [X509.o] Error 1
  | ERROR: oe_runmake failed
  ... snip ...

not at all surprising given this in Makefile.PL:

  ... snip ...
  requires_external_cc();
    inc '-I/usr/include/openssl -I/usr/local/include/ssl -I/usr/local/ssl/include';
    libs '-L/usr/lib -L/usr/local/lib -L/usr/local/ssl/lib -lcrypto';
    ... snip ...

so, clearly, i need to hack that source to support cross-compilation;
i guess i can find another module to use as a template and take it
from there, so two questions:

  1) i'm willing to take a stab at rewriting that source to support
     cross-compiling (for the educational experience), any
     recommendation for a well-written reference module to use as a
     starting point?

  2) if someone already *has* such a recipe, hey, i'm more than happy
     to use it, but i'll still take the time to figure out how to
     write things like that properly.

  any assistance gratefully accepted. one more perl question coming
...

rday

p.s. i'm still poring over jens rehsack's guide to cross compiling
perl:

http://www.netbsd.org/~sno/talks/nrpm/Cross-Compiling-For-Perl-Hackers-Handout.pdf

because, you know, copious free time. :-P

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


