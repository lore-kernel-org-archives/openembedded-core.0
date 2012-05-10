Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSHKH-00045n-4A
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:33:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2012 17:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164204778"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.30])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2012 17:22:50 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 17:22:45 -0700
Message-Id: <cover.1336608479.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC PATCH 0/3] Shared state for all !
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
X-List-Received-Date: Thu, 10 May 2012 00:33:49 -0000

This is an RFC series, and for ease of review sent as against the Poky tree so
that it can be reviewed as a whole.

In Yocto #2041[2]  Mark reported an issue with reusing shared state as a
different user on the same machine.

Since the whole purpose of shared state is that it be shared I decided to dig
into this issue. I wanted to at least be able to use the shared-state cache of
a different user without error, even if all of the objects aren't actually used
(i.e. native, at least on the Edison branch I did most of the testing with).

This is an RFC mainly because it changes the permissions of created directories,
sstate files and siginfo files from what they have traditionally been.

There is more of the rhyme an reason in the patch commit headers and comments
but tl;dr bb.mkdirhier directories will be 0777 (rwxrwxrwx) with this patch, as
will all of the contents of sstate-cache (siginfo and tgz) files.

This is actually what one would expect from reading the Python API docs for
os.makedirs "The default mode is 0777 (octal)."[1] but not what actually happens
on most modern Linux systems thanks to umask.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

Regards,

Joshua

1. http://docs.python.org/library/os.html#os.makedirs
2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=2041

The following changes since commit 6841abd17268a1c1ca5e3634f0ae9e21426ca9c9:

  Hob: change the workflow about click 'Run Image' to run directly after builded a qemu image (2012-05-09 21:56:47 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib josh/perms
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=josh/perms

just the BitBake changes are at:
  git://github.com/incandescant/bitbake.git josh/perms
  https://github.com/incandescant/bitbake/commits/josh/perms

just the openembedded-core changes are at:
  git://git.openembedded.org/openembedded-core-contrib josh/perms
  http://git.openembedded.org/openembedded-core-contrib/log/?h=josh/perms

Joshua Lock (3):
  lib/bb/utils.py: add optional mode parameter to bb.utils.mkdirhier()
  lib/bb/siggen.py: create permissive files and directories
  sstate.bbclass: ensure sstate files are easily shared

 bitbake/lib/bb/siggen.py    |    7 ++++++-
 bitbake/lib/bb/utils.py     |    7 +++++--
 meta/classes/sstate.bbclass |    1 +
 3 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.7.7.6



