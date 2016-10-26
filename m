Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id AFD4971A98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 09:49:28 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161026094929199_0484;
	Wed, 26 Oct 2016 09:49:29 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=12337 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bzKpm-0004aa-JZ; Wed, 26 Oct 2016 05:49:22 -0400
Date: Wed, 26 Oct 2016 05:48:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610260520300.17717@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
	<alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
	<alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
	<CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Wed, 26 Oct 2016 09:49:31 -0000
Content-Type: text/plain; charset=US-ASCII


  ok, one more question about all this "mapping RH/CentOS rpms to Perl
modules" nonsense i'm buried in, with the hope i can resolve this once
and for all and finish this off, and then i can shut up about this.

  in brief, a current build system creates an X86-target bootable
linux system by installing (among other things) a couple hundred
CentOS Perl module RPMs. rather than list them all here, i took a few
minutes and put them all up on a wiki page yesterday:

  http://www.crashcourse.ca/wiki/index.php/RPM_OE

to keep track of progress. as you can see, all those RPMs (being
mostly perl modules) are either x86_64 or noarch rpms, no surprise
there. obviously, to convert this build system to OE/YP, i need to
determine the OE recipe/package equivalent of all those rpms. i
originally thought that wouldn't be so hard ... silly me.

  as i started poking around, i noted (as you can read in the Overview
i wrote on that wiki page) that some of those modules could be found
in a number of places:

  * part of the "perl-modules" definition when building perl itself
  * from the OE layer
  * from the meta-openembedded/meta-perl layer
  * from the meta-cpan layer

(side note: the new target system is not x86, it's powerpc, which
explains the necessity of replacing the current build system, which is
x86 only and therefore unusable.)

  to start things off and to see how much of all that i could get into
the target image during a first pass, i did the obvious:

  * selected "qemuppc" as the target MACHINE
  * added "perl-modules" to IMAGE_INSTALL to add *all* generated
    perl modules to the image
  * IMAGE_FEATURES += "package-management", to get "rpm" on the
    target to examine the installed rpms
  * built a "core-image-minimal"

all that worked fine, i fired up the resulting qemuppc image and
verified that it did indeed have all 639 "perl-module-*ppc7400.rpm"
generated packages. overkill, yes, but i don't care at the moment.

  and this is where the fun starts as i now need to figure out where
to get the rest. i spent a few minutes just searching the layers i
mentioned above but, surely, there's an easier way. one of the
absolutely crucial modules that needs to be on the target is
Text::Template, but i see no existing recipe for that.

  more to the point, i would have thought that OE would have a
mechanism to build such modules dynamically -- i thought that was the
whole purpose of the "meta-cpan" layer. i was reading this linkedin
page:

https://www.linkedin.com/pulse/how-we-brought-cpan-embedded-devices-jens-rehsack?articleId=8774955546707699773

which refers to "automating basic package maintenance", so i assumed
there was some automatic way of doing this. am i misreading that?

  in any event, what is the *proper* way to do this? surely it doesn't
involve manually hunting down each recipe file one by one. in
addition, even when i find a recipe file, it sometimes doesn't have
related recipe files in the same place.

  case in point -- we need these two modules:

 * perl-Authen-PAM-0.16-16.el7.x86_64
 * perl-Authen-SASL-2.15-10.el7.noarch

however, the meta-perl layer contains the second, but not the first,
so it's not clear to me what criteria is used to include perl module
recipes in any given layer.

  thoughts? as a single example, how would one include the
Text::Template module in a target image? any assistance gratefully
received.

rday

p.s. i typically don't work with perl modules, so if i sound clueless
about perl packaging, that's because i am.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


