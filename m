Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXE55-00037M-26
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 19:11:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2013 09:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="295525194"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.98])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2013 09:53:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 17:52:56 +0100
Message-Id: <cover.1367340369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/5] SERIAL_CONSOLES improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 17:11:21 -0000

Having two variables to enable essentially the same behaviour isn't
really desirable, so fix up the handling of SERIAL_CONSOLES, set it
from SERIAL_CONSOLE by default if not set and change everwhere we read
SERIAL_CONSOLE to read from SERIAL_CONSOLES instead. This should allow
us to deprecate SERIAL_CONSOLE whilst retaining compatibility with
machine configurations that still use it. 

Note: I'm a bit concerned about the default setting of SERIAL_CONSOLE in
systemd-serialgetty; I'm not sure why this is needed given that this is
almost always going to be machine-specific. I've left it alone for the
time being however.


The following changes since commit e86538db13605953465aacc3f2fb7d719dad919e:

  neard: add systemd unit file (2013-04-29 15:31:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/serial-consoles
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/serial-consoles

Paul Eggleton (5):
  sysvinit-inittab: ensure unique label for SERIAL_CONSOLES entries
  bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
  sysvinit-inittab: remove specific handling of SERIAL_CONSOLE
  shadow-securetty: change to handle SERIAL_CONSOLES
  systemd-serialgetty: change to handle SERIAL_CONSOLES

 meta/conf/bitbake.conf                             |  3 ++
 meta/recipes-core/systemd/systemd-serialgetty.bb   | 45 +++++++++++-----------
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           | 11 ++----
 .../shadow/shadow-securetty_4.1.4.3.bb             | 20 ++++++----
 4 files changed, 42 insertions(+), 37 deletions(-)

-- 
1.8.1.2



