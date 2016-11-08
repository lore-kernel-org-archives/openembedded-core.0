Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 3B35860234
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 08:20:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161108082058397_0485
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 08:20:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=33614 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c41eG-00017X-Vs for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2016 03:20:53 -0500
Date: Tue, 8 Nov 2016 03:19:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611080239410.18324@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: methodology for writing OE perl recipes equivalent to RH RPMs
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
X-List-Received-Date: Tue, 08 Nov 2016 08:21:00 -0000
Content-Type: text/plain; charset=US-ASCII


  (NOTE: i'm fighting with a compile error in a perl recipe i've
written, but rather than ask about that right this instant, i want to
explain my general methodology for writing these sorts of recipes so
that, in the future, i'll have a much better idea of how to solve
issues like this, so i apologize for the verbosity, and if people want
to chime in with advice, i'll be delighted to write all this up later
for everyone else's benefit. *then* i'll ask about my compile error.)

  at the moment, for a "qemuppc" core-image-minimal target, i'm trying
to write OE-equivalent perl and/or python recipes for 200+ x86_64
centos RPMs -- effectively trying to reproduce (for powerpc) a running
centos 7 system. in short, trying to port a centos 7 system to an
OE-based powerpc box, which involves reproducing with OE equivalents
quite a number of stock RPMs for which there are no obvious available
recipes. from that initial list of 200+ RPMs, i'm down to less than 60
to go, so that's progress.

  most of what's left is perl, so here's my methodology for creating a
perl recipe, and i'll use a specific example, "perl-Net-IP", and even
though i'm doing this on my fedora system, there's not much difference
between this system and a centos box, other than RPM version
differences.

  first, i typically pop over to the OE layers page, and do a search
to see if there's already a recipe for what i'm looking for -- in this
case, i didn't see an equivalent for "perl-Net-IP":

https://layers.openembedded.org/layerindex/branch/master/recipes/?q=perl+net+ip

(Q: is that a reasonably comprehensive search approach? oh, and i've
already been advised to avoid using the meta-debian layer.)

  next, since it looks like i'll need to write a recipe, i install the
equivalent recipe on my fedora box, just to see what i'm aiming for as
a final result (or something reasonably equivalent):

  $ sudo dnf install perl-Net-IP
  $ rpm -ql perl-Net-IP
  /usr/bin/ipcount
  /usr/bin/iptab
  /usr/share/doc/perl-Net-IP
  /usr/share/doc/perl-Net-IP/COPYING
  /usr/share/doc/perl-Net-IP/Changes
  /usr/share/doc/perl-Net-IP/README
  /usr/share/man/man3/Net::IP.3pm.gz
  /usr/share/perl5/vendor_perl/Net
  /usr/share/perl5/vendor_perl/Net/IP.pm
  $

ok, now i have an idea of what my final OE build should produce.

  next, pop over to metacpan.org and search for corresponding source
to find:

  https://metacpan.org/pod/Net::IP

at which point, write a fairly boilerplate recipe (the "noarch" RPMs
are the easy ones), filling in among other things:

  * "SRC_URI"
  * checksums
  * "S"
  * "inherit cpan allarch"

///// start /////

DESCRIPTION = "Net::IP"

SECTION = "libs"
LICENSE = "Artisticv1 | GPLv1+"
PR = "r0"

MAINTAINER=     "rday"
HOMEPAGE=       "https://metacpan.org/pod/Net::IP"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"

SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MANU/Net-IP-1.26.tar.gz"

SRC_URI[md5sum] = "3a98e3ac45d69ea38a63a7e678bd716d"
SRC_URI[sha256sum] = "040f16f3066647d761b724a3b70754d28cbd1e6fe5ea01c63ed1cd857117d639"

S = "${WORKDIR}/Net-IP-${PV}"

inherit cpan allarch

BBCLASSEXTEND = "native"

///// end /////

  at this point, i run:

  $ bitbake -c fetchall perl-net-ip

to make sure the fetch works (and adjust checksums to taste), then:

  $ bitbake perl-net-ip

to build, and check the contents of the resulting rpm file to see that
it matches:

  $ rpm -qpl perl-net-ip-1.26-r0.all.rpm
  /usr
  /usr/bin
  /usr/bin/ipcount
  /usr/bin/iptab
  /usr/lib
  /usr/lib/perl
  /usr/lib/perl/vendor_perl
  /usr/lib/perl/vendor_perl/5.22.1
  /usr/lib/perl/vendor_perl/5.22.1/Net
  /usr/lib/perl/vendor_perl/5.22.1/Net/IP.pm
  $

looks good, so that gets added to my build, and on to the next recipe.

  couple final notes:

* i'm currently ignoring all the dependencies i should be adding to
those recipes; i'll put them in later

* it's easy to see when i should use "inherit cpan_build" for the
older-style Build.PL-based recipes

* about to get into the arch-specific recipes, so that will get more
interesting ... back shortly with my recipe that's causing the build
error

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


