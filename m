Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1E26CEF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 20:05:31 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id DEC9DA024DE; Thu, 10 Oct 2013 15:06:13 -0500 (CDT)
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Oct 2013 15:06:11 -0500
Message-Id: <cover.1381435139.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Use alternatives for all of binutils instead of -symlinks
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
X-List-Received-Date: Thu, 10 Oct 2013 20:05:31 -0000

The original complaint that got me started on this was that someone
was using binutils on a target, and didn't have an ld command, so they
asked for it. We added binutils-symlinks, and that seemed to work, but
eventually we ran into a problem because "ar" and "strings" weren't
showing up.

After some asking about as to why ar and strings might be omitted from
binutils, we concluded that it was probably because they were using
the alternatives mechanism. In a local branch, we experimented for a while
with just using that instead of the -symlinks package, and found that
it was overall better-behaved; in particular, it produces the desireable
result that you don't have to know about or add a "-symlinks" package
to use the utilities in the common case where you just install a package
and expect its binaries to show up. It also eliminates the odd special
case difference between ar/strings (which can be provided by busybox)
and the other utilities.

This is implemented as two patches. The first switches to using the
alternatives mechanism, but leaves the alternatives in the -symlinks
package rather than in the base package. The second moves them into
the base package, and adds an RPROVIDES for the -symlinks name in
case anyone is using it.

One caveat: This can produce warnings because the "embedspu" and "ld.gold"
binaries don't always exist, but they sometimes exist. I'm not sure whether
there's a good way to fix that...

The following changes since commit 1149b1fef8912f77d971242dfec151fff5a3aa51:

  build-appliance: Update SRCREV for release (2013-10-08 16:33:25 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/binutils-alternatives
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/binutils-alternatives

Peter Seebach (2):
  Use alternatives for the binutils-symlinks package.
  Drop binutils-symlinks

 meta/recipes-devtools/binutils/binutils.inc |   68 ++++++++++++++++-----------
 1 files changed, 40 insertions(+), 28 deletions(-)


