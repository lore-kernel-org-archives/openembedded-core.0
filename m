Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Stgq8-00062G-Ny
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:16:01 +0200
Received: by ggnp4 with SMTP id p4so6250812ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9/v2U7IioyUeVGHZ2S53Kn4ZVD52wVmqhRxHzouLOsc=;
	b=ORYNSXqcSmDOYjUwrrO1an1AJdbjCbAYTC++czUNFtlLr2VhGpftag7BPcCtoPR/4p
	z/0U4JUc0mio7VOWz7OejbTLTcAgSqhcfjGLdFMDpDgdTo0l1+l4jXnNIfZ0w08ZVazC
	YUm6qMhFBCPHBWgHvNBYiHqLZGkOOUIvMW1Z637GG7FCfIldvbF6274qLWzpMezyw/hv
	0++C9FtUuZg7Ks4tE4DgK1PJntzNnq59VnK3Ho8IfPLyY73UxXrVTMJFY8oZruJb+ivi
	/YGI0OmnxPVyZtGzuY1OdLWkgN+Dw/ZAg+ehc3xDwMlGrDEkVTmlXuZ/63SldDgr1XDk
	96sg==
Received: by 10.68.236.129 with SMTP id uu1mr45303922pbc.77.1343142271308;
	Tue, 24 Jul 2012 08:04:31 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id wk10sm7718771pbc.71.2012.07.24.08.04.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 08:04:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:03:39 -0700
Message-Id: <cover.1343142062.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/5] toolchain bootstrap fixes and kernel.bbclass integration
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
X-List-Received-Date: Tue, 24 Jul 2012 15:16:01 -0000

This patchset fixes isssue with compiling toolchain's bootstrap elements
added changes from kernel.bbclass from meta-oe
Fixes eglibc when certain options are disabled (seen on poky-tiny)

The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:

  libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=master

Denis Carikli (1):
  kernel.bbclass: fix external module building

Khem Raj (3):
  eglibc-initial: Fix build failure due to missing limits.h
  gcc-cross-initial: Stage self sufficient fixed limits.h
  eglibc: Fix build when OPTION_POSIX_WIDE_CHAR_DEVICE_IO is not set

Koen Kooi (1):
  kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"

 meta/classes/kernel.bbclass                        |    5 +-
 meta/conf/distro/include/default-distrovars.inc    |    1 +
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |   48 ++++++++++++++------
 .../eglibc-2.16/fileops-without-wchar-io.patch     |   22 +++++++++
 meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    9 ++--
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   10 ++++
 9 files changed, 82 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch

-- 
1.7.9.5



