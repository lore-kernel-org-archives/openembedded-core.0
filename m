Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAWts-0007sm-TT
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 02:33:13 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900KGTIJZBOF0@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:23:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0748B2016D; Wed,
	21 Mar 2012 21:23:58 -0400 (EDT)
Date: Wed, 21 Mar 2012 21:23:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120322012358.GF6857@denix.org>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
	<CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
	<4F5531C5.30007@linux.intel.com>
MIME-version: 1.0
In-reply-to: <4F5531C5.30007@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 01:33:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 05, 2012 at 01:36:05PM -0800, Saul Wold wrote:
> On 02/24/2012 09:05 AM, Khem Raj wrote:
> >On Fri, Feb 24, 2012 at 8:21 AM, Richard Purdie
> ><richard.purdie@linuxfoundation.org>  wrote:
> >>On Thu, 2012-02-23 at 19:33 -0800, Khem Raj wrote:
> >>>Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >>>---
> >>>  meta/conf/distro/include/default-distrovars.inc |    7 +++++++
> >>>  1 files changed, 7 insertions(+), 0 deletions(-)
> >>>
> >>>diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> >>>index 16b3108..dba204e 100644
> >>>--- a/meta/conf/distro/include/default-distrovars.inc
> >>>+++ b/meta/conf/distro/include/default-distrovars.inc
> >>>@@ -41,6 +41,13 @@ NO32LIBS ??= "1"
> >>>
> >>>  # Default to emitting logfiles if a build fails.
> >>>  BBINCLUDELOGS ??= "yes"
> >>>+
> >>>+# dummy distro related variables
> >>>+# they should be overridden by real distros
> >>>+# these fallbacks only serve the purpose of
> >>>+# oe-core standalone testability
> >>>+
> >>>+DISTRO ??= ""
> >>>  SDK_VERSION ??= "oe-core.0"
> >>>  DISTRO_VERSION ??= "oe-core.0"
> >>
> >>Why do we need this? The commit message tells me what you're doing but
> >>not why. I'm really getting frustrated with one line commit messages
> >>with no details.
> >>
> >>I don't think we should need this either, I'm not sure I like the
> >>change. The whole idea was OE-Core could run "distroless".
> >>
> >
> >There is an error case I dont remeber how I obtained that where it
> >prints bogus value if DISTRO is not
> >defined at all but and empty DISTRO var is distroless in essence anyway IMO
> >
> Khem,
> 
> Please let us know what the reproducer for this is.  Once we have a
> reproducer we can look into the issue.

Richard, Saul, Khem,

I was able to track this issue down (at least the one I was having). DISTRO is 
used in OVERRIDES unconditionally:

OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
DISTROOVERRIDES ?= "${DISTRO}"

If DISTRO is not set, FILESPATH becomes littered with directories like 
files/${DISTRO} etc. It won't bomb until you try to eval it - i.e. 
manipulating FILESPATH directly with .= works fine, but calling e.g. 
base_set_filespath() throws this:

ERROR: Failure expanding variable FILESPATH, expression was ${@blah} which 
triggered exception SyntaxError: EOL while scanning string literal (FILESPATH, 
line 1)

I have a patch that basically does this in conf/bitbake.conf to fix it:

-DISTROOVERRIDES ?= "${DISTRO}"
+DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"

A proper formatted patch to follow...

-- 
Denys


