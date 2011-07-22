Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QkIem-0007jC-Bw
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:32:56 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6MGSkMf010603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:28:46 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 09:28:35 -0700
Message-Id: <cover.1311352057.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/8] Start consolidating siteinfo information
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
X-List-Received-Date: Fri, 22 Jul 2011 16:32:56 -0000

Hey all,

As I've been talking about for a while, here is the first part of re-syncing
oe.dev siteinfo files with oe-core AND doing more consolidation.  There's
more to do, but I don't want this to grow too large before I start submitting.
This contains what I would call the obviously correct stuff where:
- all of the common platforms set things to the same value
- A little poking around shows it's a libc test or a standard linux
  feature.
- All of the arches that didn't set it just hadn't tried to build that yet.

The only part that's not 100% in that would be the db mutex drops.  But
after trying the version of db we have and looking at the recipe:
- These values weren't being used at all and were incorrect in some
  cases anyhow (eg x86_64 uclibc went with the x86_64 asm bits it has for
  mutex, not none)
- It's not how you set mutex bits either.  ie arm was doing one thing in
  siteinfo and the recipe another and the way the recipe did it, works.

The following changes since commit b4c23fce3eadaff8fc621d38759d493cd03cc131:
  Koen Kooi (1):
        consolekit 0.4.5: fix PAM installation dir

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/update-site-files-22jul
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-site-files-22jul

Tom Rini (8):
  siteinfo: Move certain samba entries to common-linux
  siteinfo: Move certain bash entries to common-linux
  x86_64-linux siteinfo: Add bash info
  siteinfo: Move certain mysql entries to common-linux
  siteinfo: Move the rp-pppoe entry to common-linux
  siteinfo: Move certain db entries to common-linux
  siteinfo: Move general realloc/malloc values to common-$libc
  siteinfo: Move (getpgrp|setpgrp|setgrent|*get{pwuid,grgid}) to
    common-libc

 meta/site/arm-common          |   35 -----
 meta/site/arm-linux           |   14 --
 meta/site/arm-linux-uclibc    |   11 --
 meta/site/armeb-linux         |   10 --
 meta/site/armeb-linux-uclibc  |   10 --
 meta/site/common-glibc        |   10 ++
 meta/site/common-linux        |   39 ++++++
 meta/site/common-uclibc       |   11 ++
 meta/site/ix86-common         |   43 ------
 meta/site/mips-common         |    3 -
 meta/site/mips-linux          |   29 +----
 meta/site/mips-linux-uclibc   |   29 +----
 meta/site/mipsel-linux        |   40 +------
 meta/site/mipsel-linux-uclibc |   26 ----
 meta/site/powerpc-common      |  285 +++++++++++++++++++++++++++++++++++++++++
 meta/site/powerpc-linux       |   13 --
 meta/site/powerpc32-linux     |   36 +-----
 meta/site/sh-common           |   45 +-------
 meta/site/sparc-linux         |   10 --
 meta/site/x86_64-linux        |   28 +---
 meta/site/x86_64-linux-uclibc |   23 ----
 21 files changed, 357 insertions(+), 393 deletions(-)



