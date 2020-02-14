Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4F56113A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:34:17 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01EIYEK5032293;
	Fri, 14 Feb 2020 12:34:15 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Date: Fri, 14 Feb 2020 12:34:13 -0600
Message-Id: <20200214183414.141058-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [RFC PATCH 0/1] Change newlib configuration to require libgloss
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
X-List-Received-Date: Fri, 14 Feb 2020 18:34:17 -0000

This is an RFC, because I only know of my particular use-case.  So I'm not
sure how generic of a change this really is.

In my own use-case, we want to build a generic newlib and then customize
our equivalent to libgloss when linking baremetal applications.

I found that if we don't pass --disable-newlib-supplied-syscalls, even if
libgloss was linked in, the syscalls -always- came from newlib (on 32-bit
arm) and would not permit my implementations to override the built-in
newlib versions.

By setting the disable in BOTH newlib an libgloss, newlib syscalls are
disabled, while libgloss syscalls are enabled.  This results in a newlib
that will now require to be linked against a 'BSP' implementation, such
as libgloss, in order to build baremetal applications.

Alternatively to this I'd suggest we add pkgconfigs (or even distro
flags) to be able to change this behavior as well as flip some other
newlib switches if desired.

Mark Hatle (1):
  newlib: Move syscalls from newlib to libgloss

 meta/recipes-core/newlib/newlib.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1


