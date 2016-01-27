Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 60DD86FFCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:24:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jan 2016 03:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,354,1449561600"; d="scan'208";a="869740547"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.8.138])
	by orsmga001.jf.intel.com with ESMTP; 27 Jan 2016 03:24:16 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 11:23:58 +0000
Message-Id: <cover.1453893763.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v5 0/2] Clean up connman-conf on systemd systems
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
X-List-Received-Date: Wed, 27 Jan 2016 11:24:20 -0000

As reported in YP#8399 we currently hack the connman service to try and
execute a script which is only installed on qemu targets, its absence on
non-qemu machines results in an error in the journal:
  connman.service: Failed at step EXEC spawning /usr/lib/connman/wired-setup: No such file or directory

This pair of patches changes the connman-conf recipe to install a oneshot
systemd unit that is called before ConnMan and removes the ExecStartPre.

SysV init based images are unaffected by this change, the existing
mechanisms to check for the presence of the wired-setup script from the
init script remain in place.

Since v4 I've rebased on master and updated the unit file to have the path
to the script sed'ed in, as the script location has changed since the
original submission.

Tested by 1) booting a qemux86 and validating the network was brought up
per the wired.config settings 2) booting a genericx86 image and checking
that the wired-connection.service isn't installed.

Regards,

Joshua

The following changes since commit 2a6e061712cfe9cb4738806a0c351a64e0d30144:

  cmake: update to 3.4.2 (2016-01-26 22:48:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/connman-conf
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/connman-conf

Joshua Lock (2):
  connman-conf: convert to systemd oneshot
  connman: tidy up connman-conf usage

 meta/recipes-connectivity/connman/connman-conf.bb            | 12 +++++++++++-
 .../connman/connman-conf/qemuall/wired-connection.service    | 10 ++++++++++
 meta/recipes-connectivity/connman/connman.inc                |  5 -----
 3 files changed, 21 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service

--
2.5.0

