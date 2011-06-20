Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QYiuC-0007vP-Gf
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 20:09:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2011 11:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,395,1304319600"; d="scan'208";a="17390632"
Received: from vorpal.jf.intel.com ([10.7.199.159])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2011 11:05:27 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 11:09:12 -0700
Message-Id: <cover.1308592651.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] sanity: implement network connectivity test v2
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
X-List-Received-Date: Mon, 20 Jun 2011 18:09:00 -0000

v2 of this change set based on feedback from Jeremy Puhlman.
Changes since v1:
* Allow checked URI's to be configurable. Note: I opted to leave the fallback
hard coded. I can certainly remove this and add them toa  configuration file
somewhere if desired. If this is requested I'll probably remove the
DISABLE_NETWORK_SANITY variable and just disable the check if
CONNECTIVITY_CHECK_URIS is unset.
* Don't copy the data structure if it's not needed.

"In response to a Yocto Bugzilla request[1] I've written a sanity test to
check whether BitBake is able to fecth from http, https and git sources. The
idea being that if the user is behing a proxy and this test fails we can more
easily help them diagnose and fix their problem.

I've built on the existing infrastructure for less frequent sanity tests so
whilst this test is reasonably heavy it will only run when TMPDIR changes
(usually first run?). Further I added a variable to disable just this sanity
check. People shipping offline installs to customers should just be able to
set the variable in their shipped configuration and not worry about this
sanity check irritating people.

The error message points to a wiki page[2] which is pretty vanilla right now
but the intention would be to flesh it out with guidance on common
proxy/nat/etc issues."

The following changes since commit 835d817f1ba7b99167743fdb86ba80f3a07bd82d:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:12:40 +0100)

are available in the git repository at:
  git://git.openembedded.net/openembedded-core-contrib josh/connection-test

Joshua Lock (2):
  sanity.bbclass: pass the data object to the less frequent test
    harnesses
  sanity: implement network connectivity test

 meta/classes/sanity.bbclass |   50 ++++++++++++++++++++++++++++++++++++-------
 1 files changed, 42 insertions(+), 8 deletions(-)

-- 
1.7.5.2



