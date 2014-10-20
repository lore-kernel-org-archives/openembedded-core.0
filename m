Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3A2260097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 15:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9KFNOl5019511; Mon, 20 Oct 2014 16:23:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qXLBCqUQrD6V; Mon, 20 Oct 2014 16:23:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9KFNKOW019508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 20 Oct 2014 16:23:21 +0100
Message-ID: <1413818635.17752.159.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 20 Oct 2014 16:23:55 +0100
In-Reply-To: <544502B6.5040808@topic.nl>
References: <5444F848.3040307@topic.nl> <1413806657.17752.154.camel@ted>
	<544502B6.5040808@topic.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Going beyond MACHINE?
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
X-List-Received-Date: Mon, 20 Oct 2014 15:24:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-10-20 at 14:40 +0200, Mike Looijmans wrote:
> ﻿On 10/20/2014 02:04 PM, Richard Purdie wrote:
> > On Mon, 2014-10-20 at 13:55 +0200, Mike Looijmans wrote:
> >> ﻿The short version of my question: Can I define a "level" that goes beyond MACHINE?
> >>
> >> My problem in detail (and I suspect there are more systems with similar problems):
> >>
> >> I have an SOC called "topic-miami". There are currently two variants: The 7015
> >> and 7030. They are identical but for one component: They have a different FPGA
> >> part (the 7030 is bigger and faster).
> >> Both run exactly the same kernel and bootloader, and all other software and
> >> libraries are exactly the same.
> >>
> >> Currently I have MACHINE="topic-miami-7015" and then SOC_FAMILY="topic-miami"
> >> so I can use "topic-miami" as override word for all packages.
> >>
> >> However, this means I get two kernels, two bootloaders, etc. even though they
> >> are exactly the same.
> >>
> >> The only package that currently differs is the one that delivers the
> >> bitstream(s) for the FPGA. These are big, too big to fit bitstreams for both
> >> models into flash and leave room for applications, so just installing both
> >> into the rootfs and pick the correct one at boot time is not really an option.
> >>
> >> Maybe I could define some extra PACKAGE_ARCH for the bitstreams (which make
> >> sense, as this is sort of firmware for a different platform). But how would a
> >> user then pick the right value for this variable, since MACHINE seems to be
> >> the only thing he can really choose?
> >>
> >> Any thoughts and ideas are welcome...
> >
> > One possible solution would be to inject another PACKAGE_ARCH (as the
> > intel gmgd graphics does for example), then mark the MACHINE specific
> > packages as being that package architecture. They'd then only get built
> > once per package architecture yet your bitstreams would still be machine
> > specific. You could probably do the "remarking" using anonymous python
> > injected at the machine level.
> 
> Sounds doable, but I can't find anything about "intel gmgd" in any layer. 
> Which machine are you referring to here?

Sorry, emgd:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/classes/emgd-gl.bbclass?h=daisy
http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/conf/machine/include/meta-intel-emgd.inc?h=daisy

I have actually sent Scott some text for the manual about this but its
not been edited yet.

Cheers,

Richard


