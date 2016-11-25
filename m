Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 31C7B71A71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 09:29:39 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161125092939958_0484
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 09:29:39 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=43143 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cACp2-0003Jl-CU for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2016 04:29:32 -0500
Date: Fri, 25 Nov 2016 04:28:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611250416280.8610@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: meta-perl vs meta-cpan: [lib]module-build-perl-native
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
X-List-Received-Date: Fri, 25 Nov 2016 09:29:41 -0000
Content-Type: text/plain; charset=US-ASCII


  about to go back and try to follow that thread about OE and perl
modules, but one question about quick and dirty workarounds ... i just
ran into the (inevitable) situation where the "standard" OE layers and
meta-cpan have different naming conventions for modules, as in:

  meta-perl:	DEPENDS += "libmodule-build-perl-native
  meta-cpan:	DEPENDS += "module-build-perl-native"

which finally bit me when i wanted to add to an image the one (the
*only* one) meta-perl recipe that contains:

$ grep -r "module-build-perl-native" *
meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb:DEPENDS += "libmodule-build-perl-native \
$

which clashed trying to install files into a shared area when those
files already exist, given that numerous recipes from meta-cpan
already contain:

  $ grep -hr "module-build-perl-native" *
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  DEPENDS += "module-build-perl-native"
  $

i'm actually surprised there is just the one recipe that eventually
got me into trouble, and while i understand there's a long-term plan
to standardize this, what is the best short-term hack to get around
this? reproduce the recipe? .bbappend and override DEPENDS? blacklist
the one from meta-cpan and replace it?

  and in the long term, unless there's a common naming convention, how
can meta-cpan be listed as an OE layer at
https://layers.openembedded.org/layerindex/branch/master/layers/?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


