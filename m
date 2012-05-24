Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXLg6-0001Af-IG
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 02:13:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2012 17:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103547416"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 17:03:06 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 17:02:56 -0700
Message-Id: <cover.1337816265.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/7] Sanity class clean ups
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
X-List-Received-Date: Thu, 24 May 2012 00:13:18 -0000

My recent change to the sanity class to warn users when they don't have R/W
permission to their SSTATE_CACHE directory has caused at least a couple of users
trouble, including the Yocto project autobuilder.

I have been unable to reproduce the issue but after discussionwith Elizabeth and
Chris on #yocto I came up with the following series.

The series includes a revert my original change as it seems the simple logic has
severla edge cases. I replace it later in the series with a simple piggy-back
on the existing check_create_long_filename() call, where I make the suggestion
of using SSTATE_MIRRORS if that call fails with "Permission denied" when called
against SSTATE_DIR. This check has been in use for some time and, to the best of
my knowledge, doesn't trigger invalid failures.

Thanks to Chris and Elizabeth for pointers as to why this was failing.

Cheers,

Joshua

The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/sanity
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/sanity

Joshua Lock (7):
  Revert "sanity.bbclass: check user can read and write to SSTATE_DIR"
  sanity.bbclass: copy the data store and finalise before running
    checks
  sanity.bbclass: data.getVar(VAR, obj, exp) -> obj.getVar(VAR, exp)
  sanity.bbclass: add newline to check_create_long_filename failure
    message
  sanity.bbclass: add extra information when SSTATE_CACHE unusable
  sanity.bbclass: catch an extra exception in
    check_create_long_filename
  sanity.bbclass: check sanity at BuildStarted rather than ConfigParsed

 meta/classes/sanity.bbclass |  153 ++++++++++++++++++++++---------------------
 1 files changed, 78 insertions(+), 75 deletions(-)

-- 
1.7.7.6



