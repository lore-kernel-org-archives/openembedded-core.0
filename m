Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6D360107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 11:19:18 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160421111917310_0484
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 11:19:17 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=37977 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atCf6-0003ub-Nc for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2016 07:20:44 -0400
Date: Thu, 21 Apr 2016 07:19:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1604210639150.4110@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: question about order of processing SRC_URI items
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
X-List-Received-Date: Thu, 21 Apr 2016 11:19:23 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm currently building up a BSP layer which is going to involve
quite a bit of FILESEXTRAPATHS and OVERRIDES and conditionals in my
kernel bbappend files so i want to make sure i understand the
processing order (or what there is of it).

  first, if one simply appends items to SRC_URI, as in:

  SRC_URI += " \
	derp.scc \
	gorp.scc \
	...
  "

then regardless of how FILESOVERRIDES adjusts the search order in the
eventual FILESPATH, those items *must* be found somewhere, correct?
(this seems pretty obvious to me, but i've been burned by obvious
things before.)

  next, i realize there are two forms of appending to SRC_URI:

 * SRC_URI +=
 * SRC_URI_append =

first, is there an aesthetic preference for one over the other if the
end result is the same? (just curious about what people here prefer to
use.)

  more significantly, i realize the final order of SRC_URI items
depending on which one you use might be different, as "_append" leaves
the appending until the final stage of processing. so what this tells
me is that all of the items you list in SRC_URI should *not* be
order-dependent, is that a fair statement? or, IOW, if your layer
depends on the items in SRC_URI being processed in a specific order,
you probably need to rework your recipe file.

  (side note: i do realize that, in a single .scc file, the patches
listed will be applied in precisely that order, but that's a different
issue and not relevant here.)

  next, if there are truly conditional SRC_URI items, the only way to
identify those is:

  SRC_URI_append_<override> = " ... blah blah ..."

you can't do this, can you?

  SRC_URI_<override> += " more stuff "

i don't think i've ever seen an example of the latter, but maybe i
just didn't look closely enough.

  and, finally, given that you can have a combination of SRC_URI
assignments and appends in the same .bbappend file:

  SRC_URI += "..."
  SRC_URI_append = "..."
  SRC_URI_append_<override> = "..."

that tells me that you *really* don't want any of that to be
order-dependent, as i mentioned before.

  is that about it? am i missing anything about SRC_URI definition and
processing? thanks muchly.

rday

p.s.  oh, wait, two more curiosities. first, i still see the
occasional example of this in numerous layers, including oe-core:

    meta/recipes-support/attr/attr_2.4.47.bb:
        SRC_URI_append += "file://attr-Missing-configure.ac.patch \
        ^^^^^^^^^^^^^^^^^

pretty sure combining "SRC_URI_append" with "+=" is just as redundant
as ever, no? :-)

  also, if the list of items in SRC_URI should be order-independent,
then it would seem to make little sense to specifically use:

  SRC_URI_prepend = "..."

anywhere, right? IOW, there should be no situation in which
specifically *prepending* to SRC_URI is necessary. but i found one
example in oe-core:

  meta/recipes-devtools/qemu/qemu_2.5.0.bb:

SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
            file://qemu-enlarge-env-entry-size.patch \
            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
            file://no-valgrind.patch \
            file://CVE-2016-1568.patch \
            file://CVE-2016-2197.patch \
            file://CVE-2016-2198.patch \
            file://pathlimit.patch \
           "
SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
SRC_URI[sha256sum] = "3443887401619fe33bfa5d900a4f2d6a79425ae2b7e43d5b8c36eb7a683772d4"

  uh ... yeah, i get that the above does the right thing but, come on,
that just looks weird. is there a reason the qemu recipe deliberately
goes out of its way to do this?

  ok, back to work ...


