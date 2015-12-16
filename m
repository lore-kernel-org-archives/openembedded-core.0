Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A316B6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 20:43:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 75A982613AE
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 20:43:06 +0000
Message-Id: <cover.1450298303.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v4 0/2] Clean up connman-conf on systemd systems
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
X-List-Received-Date: Wed, 16 Dec 2015 20:43:17 -0000

As reported in YP#8399[1] we currently hack the connman service to try and
execute a script which is only installed on qemu targets, its absence on
non-qemu machines results in an error in the journal:
  connman.service: Failed at step EXEC spawning /usr/lib/connman/wired-setup: No such file or directory

This pair of patches changes the connman-conf recipe to install a oneshot
systemd unit that is called before ConnMan and removes the ExecStartPre.

SysV init based images are unaffected by this change, the existing mechanisms to check for the presence of the wired-setup script from the init script remain in place.

Regards,

Joshua

The following changes since commit f1f3716776078d68bd9e3734bca881a486dc2ea3:

  meta: more removals of redunant FILES_${PN}-dbg (2015-12-16 12:12:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/connman

Joshua Lock (2):
  connman-conf: convert to systemd oneshot
  connman: tidy up connman-conf usage

 meta/recipes-connectivity/connman/connman-conf.bb              |  9 ++++++++-
 .../connman/connman-conf/qemuall/wired-connection.service      | 10 ++++++++++
 meta/recipes-connectivity/connman/connman.inc                  |  5 -----
 3 files changed, 18 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service

--
2.5.0

