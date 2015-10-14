Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id CDCC974242
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 10:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 10597608E37
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 11:14:47 +0100
Message-Id: <cover.1444817583.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [RFC PATCH 0/2] Clean up connman-conf
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
X-List-Received-Date: Wed, 14 Oct 2015 10:15:12 -0000

As reported in YP#8399[1] we currently hack the connman service to try and
execute a script which is only installed on qemu targets. This pair of
patches changes the connman-conf recipe to install a oneshot systemd unit
that is called before ConnMan, removes the ExecStartPre and adds an override
to the RRECOMMENDS so that the connman-conf is only installed by default for
qemu machines and images for other machines are left with an error in the
journal about failing to start a service.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

Regards,

Joshua

1. https://bugzilla.yoctoproject.org/show_bug.cgi?id=8399

The following changes since commit e42d8eff9eed7d1454b4f331d96dcee6dea232df:

  bash: Disable custom memory allocator (2015-10-12 14:35:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/connman
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/connman

Joshua Lock (2):
  connman-conf: convert to systemd oneshot
  connman: tidy up connman-conf usage

 meta/recipes-connectivity/connman/connman-conf.bb           | 13 +++++++++++--
 .../connman/connman-conf/qemuall/wired-connection.service   | 10 ++++++++++
 meta/recipes-connectivity/connman/connman.inc               |  5 -----
 meta/recipes-connectivity/connman/connman_1.30.bb           |  2 +-
 4 files changed, 22 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service

-- 
2.1.4


