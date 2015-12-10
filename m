Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1896FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 09:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 76239261460
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 09:01:40 +0000
Message-Id: <cover.1449737824.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH v3 0/3] Clean up connman-conf
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
X-List-Received-Date: Thu, 10 Dec 2015 09:01:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As reported in YP#8399[1] we currently hack the connman service to try and
execute a script which is only installed on qemu targets. This set of
patches changes the connman-conf recipe to install a oneshot systemd unit
that is called before ConnMan, removes the ExecStartPre and adds an override
to the RRECOMMENDS so that the connman-conf is only installed by default for
qemu machines.

SysV init based images are unaffected by this change, the existing mechanisms to check for the presence of the wired-setup script from the init script remain in place.

Since the earlier version of the series I've changed connman-conf to be an allarch package — as the series only adds connman-conf to RRECOMMENDS for qemu machines I don't think there's any reason to prevent people from choosing to install the generated packages if a pre-configured network would be useful.

Regards,

Joshua

The following changes since commit 7e8ff7b9d793b7be106415c3c80b687977217566:

  bitbake: toaster: toasterui Add ParseStarted/ParseProgress events to mask (2015-12-09 09:03:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/connman

Joshua Lock (3):
  connman-conf: convert to systemd oneshot
  connman: tidy up connman-conf usage
  connman-conf: convert to an allarch package

 meta/recipes-connectivity/connman/connman-conf.bb         | 15 ++++++++++-----
 .../connman/connman-conf/wired-connection.service         | 10 ++++++++++
 .../connman/connman-conf/{qemuall => }/wired-setup        |  0
 .../connman/connman-conf/{qemuall => }/wired.config       |  0
 meta/recipes-connectivity/connman/connman.inc             |  5 -----
 meta/recipes-connectivity/connman/connman_1.30.bb         |  3 +--
 6 files changed, 21 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/wired-connection.service
 rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired-setup (100%)
 rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired.config (100%)

--
2.5.0

