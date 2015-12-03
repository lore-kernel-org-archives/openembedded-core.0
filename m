Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 89B6560589
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 09:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 21E7F263C17
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 09:23:45 +0000
Message-Id: <cover.1449134546.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH v2 0/3] Clean up connman-conf
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
X-List-Received-Date: Thu, 03 Dec 2015 09:23:53 -0000

As reported in YP#8399[1] we currently hack the connman service to try and
execute a script which is only installed on qemu targets. This pair of
patches changes the connman-conf recipe to install a oneshot systemd unit
that is called before ConnMan, removes the ExecStartPre and adds an override
to the RRECOMMENDS so that the connman-conf is only installed by default for
qemu machines and images for other machines are left with an error in the
journal about failing to start a service.

Changes since v1:
  * don't explicitly set INHIBIT_DEFAULT_DEPS, allarch.bbclass does that for us

Since the initial RFC submission I've:
  * rebased on master
  * changed connman-conf to be an allarch recipe
  * updated to use the new systemd_system_unitdir variable

The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/connman

Joshua Lock (3):
  connman-conf: convert to systemd oneshot
  connman-conf: mark as allarch
  connman: tidy up connman-conf usage

 meta/recipes-connectivity/connman/connman-conf.bb              |  9 ++++++++-
 .../connman/connman-conf/qemuall/wired-connection.service      | 10 ++++++++++
 meta/recipes-connectivity/connman/connman.inc                  |  5 -----
 meta/recipes-connectivity/connman/connman_1.30.bb              |  3 +--
 4 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service

--
2.4.3

