Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2g2e-0000a1-Ui
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 11:46:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2013 02:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="257891618"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2013 02:30:08 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue,  5 Feb 2013 02:31:36 -0800
Message-Id: <cover.1360059615.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/8] Git fetcher and proxy handling updates
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
X-List-Received-Date: Tue, 05 Feb 2013 10:46:22 -0000
X-List-Received-Date: Tue, 05 Feb 2013 10:46:22 -0000

The current git fetcher environment and proxy handling between bitbake,
base.bbclass, and oe-buildenv-internal has become stale and is largely
non-functional. The crux of the problem is that GIT_CONFIG is no longer honored
by anything other than the git-config command, rendering the GIT_CORE_CONFIG and
the assocaited proxy handling routines obsolete.

The GIT_PROXY_COMMAND, ALL_PROXY, and NO_PROXY environment variables are more
than adequate for storing the required information to manage proxies with a git
helper script.

These patches series aggressively removes the old stuff, fixes up some missing
environment settings, and adds a new git proxy handling script.

Note: These patches DO NOT address the bitbake gui builder.py references to git
      proxy settings!

I fully expect this series to be a bit controversial and that a few iterations
will be required to get it acceptable to everyone.

Finally, I felt this series was best viewed as a whole, so I'm sending it to
poky AND oe-core and CC'ing bitbake-devel as appropriate. Anything else seemed
too likely to result in confusion, missing context, and lots and lots of
redundant discussion.

The following changes since commit 7e9cb437b1b720e656f4a33f73c07c5dc7356a2c:

  dropbear: fix RPROVIDES (2013-02-04 23:31:02 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib dvhart/gitproxy
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/gitproxy

Darren Hart (8):
  bitbake: fetch2: Print the complete SRCREV variable name when INVALID
  bitbake: fetch2: Export upper and lower case environment variables
  bitbake: fetch2: Remove broken git variables from the environment
  oe-buildenv-internal: Remove GIT variables from BB_ENV_EXTRAWHITE
  oe-buildenv-internal: Add upper and lower case proxy vars to
    BB_ENV_EXTRAWHITE
  base.bbclass: Remove generate_git_config()
  oe-git-proxy.sh: Add a new comprehensive git proxy script
  git proxy: Document usage of oe-git-proxy.sh and remove alternatives

 bitbake/lib/bb/fetch2/__init__.py  |   22 +-
 meta-yocto/conf/site.conf.sample   |   35 +-
 meta/classes/base.bbclass          |   21 -
 scripts/oe-buildenv-internal       |    2 +-
 scripts/oe-git-proxy-command       |   10 -
 scripts/oe-git-proxy-socks-command |   23 -
 scripts/oe-git-proxy-socks.c       | 2982 ------------------------------------
 scripts/oe-git-proxy.sh            |  125 ++
 8 files changed, 150 insertions(+), 3070 deletions(-)
 delete mode 100755 scripts/oe-git-proxy-command
 delete mode 100755 scripts/oe-git-proxy-socks-command
 delete mode 100755 scripts/oe-git-proxy-socks.c
 create mode 100755 scripts/oe-git-proxy.sh

-- 
1.7.5.4



