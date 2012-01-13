Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rlmdz-0002rx-64
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 20:18:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 11:10:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="56230648"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jan 2012 11:10:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 11:10:51 -0800
Message-Id: <cover.1326481387.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
Subject: [PATCH 0/4] Add alsa-state from OE Classic v3
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
X-List-Received-Date: Fri, 13 Jan 2012 19:18:31 -0000

The small series which follows introduces the alsa-state recipe from oe-classic.
The reason for doing so is to remove the requirement for recipes like the
beagleboard-audio recipe in meta-yocto, which ensures the beagleboards sound
device has the volume turned up.

Long term I'd like to implement something more generic for handling device
quirks, but alsa-state is a simple fix for an immediate need that should
standardise how alsa configuration is handled in layers.

Since v1 I added an extra commit which:
a) defaults to /var/lib/alsa/ for state files, as this is the directory
alsactl writes to by default.
b) sed's the path to the state files into the init script, rather than hard
coding them.

Since v2 I've modified the task-base commit to add VIRTUAL-RUNTIME_alsa-state
rather than hard code the alsa-state recipe per suggestion from Martin Jansa
and added an extra commit to move the defintion of VIRTUAL-RUNTIME_apm from
task-base to default-providers.inc

Cheers,

Joshua

The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:

  patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function (2012-01-13 16:56:20 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/devices
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/devices

Joshua Lock (4):
  task-base: move default definition of VIRTUAL-RUNTIME_apm
  alsa-state: add alsa-state from oe classic
  alsa-state: move state files to localstatedir
  task-base: add VIRTUAL-RUNTIME_alsa-state to task-base-alsa

 meta/conf/distro/include/default-providers.inc     |    2 +
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   59 ++++++++++++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 ++++
 .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
 meta/recipes-core/tasks/task-base.bb               |    8 +--
 6 files changed, 106 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
 create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state

-- 
1.7.7.5



