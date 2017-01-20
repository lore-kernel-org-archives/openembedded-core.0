Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB11719AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:35:13 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170120113501987_0486;
	Fri, 20 Jan 2017 11:35:01 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=52269 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cUXT4-0004kj-2h; Fri, 20 Jan 2017 06:34:54 -0500
Date: Fri, 20 Jan 2017 06:34:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Mike Looijmans <mike.looijmans@topic.nl>
In-Reply-To: <38f99bff-e9e4-ef57-caef-a47573fc5362@topic.nl>
Message-ID: <alpine.LFD.2.20.1701200632250.12889@uk63952.mitel.com>
References: <alpine.LFD.2.20.1701191542230.6131@localhost.localdomain>
	<38f99bff-e9e4-ef57-caef-a47573fc5362@topic.nl>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: still fighting to get an OE recipe for "libfilesys-smbclient-perl"
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
X-List-Received-Date: Fri, 20 Jan 2017 11:35:15 -0000
Content-Type: multipart/mixed;
	BOUNDARY="587868445-1134473589-1484912094=:12889"

--587868445-1134473589-1484912094=:12889
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jan 2017, Mike Looijmans wrote:

> ﻿On 19-01-17 21:58, Robert P. J. Day wrote:
> >
> >   following up on the whining i did a while back to finish off a few
> > perl recipes for OE, i have just a few left to resolve, and this is
> > one of them. i managed to get several dozen perl recipes to work
> > simply by throwing together recipes based on very little understanding
> > of perl cpan mechanics and just mindlessly cribbing boilerplate from
> > other recipes. if it worked, yee ha, move on.
> >
> >   here's my current recipe for this module (again, slapped together
> > without really understanding what's going on under the hood):
> >
> > ///// start /////
> >
> > DESCRIPTION = "Filesys::SmbClient"
> >
> > SECTION = "libs"
> > LICENSE = "Artisticv1 | GPLv1+"
> > PR = "r0"
> >
> > MAINTAINER=	"rday"
> > HOMEPAGE=	"https://metacpan.org/pod/Filesys::SmbClient"
> >
> > LIC_FILES_CHKSUM =
> > "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798
> > \
> > file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
> >
> > DEPENDS += "samba"
> >
> > SRC_URI =
> > "https://cpan.metacpan.org/authors/id/A/AL/ALIAN/Filesys-SmbClient-3.2.tar.gz"
> >
> > SRC_URI[md5sum] = "8a4205fe748aac7f43fb2a0e8ef502b2"
> > SRC_URI[sha256sum] =
> > "a9f2f3d4675de76f9dcae2be40bda93495cd5fafb1bb6326d71833cea451bc6e"
> >
> > S = "${WORKDIR}/Filesys-SmbClient-${PV}"
> >
> > inherit cpan
> >
> > EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}/samba-4.0'
> > LIBS='-L${STAGING_LIBDIR}'"
> >
> > BBCLASSEXTEND = "native"
> >
> > ///// end /////
> >
> > and the error i get when i try to build makes it *clear* that the
> > configuration is failing to set up properly for cross-compiling for my
> > powerpc target:
> >
> > $ bitbake libfilesys-smbclient-perl
> > ... snip ...
> > | Where can I find libsmbclient.h ? []
> > *************************************************************
> > | ** WHAT !!!!
> > | ** I Can't find /libsmbclient.h : No such file or directory.
> > | *************************************************************
> > ... snip ...
> > | Where can I find libsmbclient.so ? []
> > *************************************************************
> > | ** WHAT !!!!
> > | ** I Can't find libsmbclient.so : No such file or directory.
> > ... snip ...
> > | checking for C compiler default output... a.out
> > | checking whether the C compiler works... configure: error: cannot
> > run C compiled programs.
> > | If you meant to cross compile, use `--host'.
> > | See `config.log' for more details.
> >
> >
> >   and sure enough, the config.log for this build contains:
> >
> > Target: powerpc-poky-linux
> > Configured with:
> > ../../../../../../work-shared/gcc-6.3.0-r0/gcc-6.3.0/configure
> > --build=x86_64-linux --host=x86_64-linux --target=powerpc-poky-linux
> > ...
>
> Quick observation: I think host and target are wrong. The "host" is where the
> software will run. The line above builds something that runs on x86_64 and
> that compiles for a powerpc target (target only makes sense if you're
> compiling a compiler). You probably wanted --host=powerpc-poky-linux and no
> "--target" at all.

  right, that was why i reproduced that bit ... to show that the
"--host" value is clearly wrong, and even suggests that problem a few
lines earlier:

> > | checking whether the C compiler works... configure: error: cannot
> > run C compiled programs.
> > | If you meant to cross compile, use `--host'.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-1134473589-1484912094=:12889--
