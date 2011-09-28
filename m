Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8w8y-0008QR-AA
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 17:33:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2011 08:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56793343"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.159])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2011 08:28:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 16:28:24 +0100
Message-Id: <cover.1317223487.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Fix TMPDIR usage in scripts v3
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
X-List-Received-Date: Wed, 28 Sep 2011 15:33:56 -0000

Fix TMPDIR external environment variable usage within our scripts which
is a problem on OpenSUSE within an X session (see Yocto bug #1530) by
using OE_TMPDIR from the external environment instead.

Note that this will require changes to autobuilder scripts that use a
TMPDIR environment variable when calling these scripts - they should now
set OE_TMPDIR instead (if versions with and without this change need to
be run on the same system, then setting both variables will cause no
harm).

Since v1, fix pass-through references to TMPDIR in the
qemuimage-testlib script.

Since v2, fix setting of OE_TMPDIR in classes/imagetest-qemu.bbclass.

The following changes since commit e0908b7b080c0d861a1b3ccb2185b9281b10fa1a:

  tables: remove it as obsolete recipe (2011-09-28 11:47:24 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/scripts-tmpdir
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/scripts-tmpdir

Paul Eggleton (2):
  scripts: use OE_TMPDIR instead of TMPDIR external variable
  scripts/oe-setup-rpmrepo: use setup_tmpdir from runqemu

 meta/classes/imagetest-qemu.bbclass |    2 +-
 scripts/oe-setup-rpmrepo            |   35 +++++++++++++++++++++--------------
 scripts/qemuimage-testlib           |    4 ++--
 scripts/runqemu                     |    7 ++++++-
 4 files changed, 30 insertions(+), 18 deletions(-)

-- 
1.7.4.1



