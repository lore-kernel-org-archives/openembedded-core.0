Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 07908609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 22:59:52 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s63M0aDo009783 for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jul 2014 17:00:36 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014070317003626-806945 ;
	Thu, 3 Jul 2014 17:00:36 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 3 Jul 2014 17:00:24 -0500
Message-Id: <1404424826-12023-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 07/03/2014 05:00:36 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 07/03/2014 05:00:36 PM,
	Serialize complete at 07/03/2014 05:00:36 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-03_07:2014-07-03, 2014-07-03,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH 0/2] Two gcc compatibility/usability fixes
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
X-List-Received-Date: Thu, 03 Jul 2014 22:59:59 -0000

I have a couple changes that help some sources build under meta-toolchain without
workarounds. These were originally developed on dylan; I just tested them by
building mingw SDKs under daisy with vanilla poky+meta-mingw, then applying the
patches to oe-core.

[01/02]: The build infrastructure for the Linux kernel tools (at least) doesn't
really expect you to supply a --sysroot for cross-compilation; they expect
setting CROSS_COMPILE to be all that you need. You can see the sorts of
contortions this leads to in perf.bb; but I need to build some other kernel
tools, outside of bitbake, so I'm exposed to this.

The root fix is *not* to supply --sysroot to these builds: thanks to some
ungodly-complex path mangling, gcc is actually smart enough to find the target
sysroot on its own. It just needs a little goading to work, which is provided in
this patch.

This might help simplify some recipes, including perf's.

[02/02]: Virtually every g++ configuration installs C++ headers to e.g.
/usr/include/c++/4.8.2 -- with the exception of OE, which doesn't include the
gcc version. This breaks ancient versions of STLport; it also precludes
side-by-side installation of multiple g++ versions. This patch fixes that.

Richard Tollerton (2):
  gcc-cross-canadian: Adjust $prefix to fix sysroot autodetect
  gcc: Ensure c++ includes are in /usr/include/c++/${BINV}

 meta/recipes-devtools/gcc/gcc-4.8.inc            | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 ++++-
 meta/recipes-devtools/gcc/gcc-cross.inc          | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc        | 2 +-
 meta/recipes-devtools/gcc/gcc-target.inc         | 2 +-
 5 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.0.1


