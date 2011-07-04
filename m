Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmM8-0005UH-TW
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:45 +0200
Received: by rex (Postfix, from userid 1000)
	id 725992031C; Mon,  4 Jul 2011 17:46:28 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:25 +0100
Message-Id: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/8] Various QA fixes
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
X-List-Received-Date: Mon, 04 Jul 2011 16:50:45 -0000

The following changes since commit 2b3bf5350861f62435e2fdf1c56c8a02f4b1b4ac fix
a number of QA warnings/errors. There are a couple of RFC style commits in this mix:

A key change is that functionality is added to insane.bbclass to allow 
skipping of individual QA tests by name. It needs two existing users (elfutils and u-boot)
to specify which QA tests they want to skip (I'm working on a patch). Any external 
layer using that variable would need to update and I can't decide if that is a 
drawback or a feature.

Also a gettext change I'm testing to see which approach performs best is included. A final decision on that will depend on the performance test results (thanks go to paul for hightlighting the impact of that git-native depenedency).

Also included is a gcc libiberty fix (yocto #1199).

They are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master

Richard  Purdie (5):
  gcc: Fix removal of libiberty.a
  gettext: Disable both git and cvs for autopoint's archive format.
  gcc: Remove unneeded module .la file and .so link
  insane.bbclass: Allow INSANE_SKIP to work on a per test basis
  lttng-viewer: Fixup various QA warnings and a false positive

Richard Purdie (3):
  oprofile: Fix QA warnings
  libgsmd: Fix QA warnings
  gcc-package-cross: Switch to using pattern matching to detect when to
    stash libgcc into the sysroot

 meta/classes/insane.bbclass                        |   37 +++++++++++---------
 meta/recipes-connectivity/gsm/gsmd.inc             |   26 ++++++++++----
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    7 ++--
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 .../gcc/gcc-cross-intermediate.inc                 |    4 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |   30 ++++++++-------
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    6 ++-
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |    6 ++-
 meta/recipes-kernel/oprofile/oprofile_0.9.6.bb     |    4 ++
 10 files changed, 75 insertions(+), 49 deletions(-)

-- 
1.7.4.1



