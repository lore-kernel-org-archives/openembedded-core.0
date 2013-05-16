Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ud2o0-0000qN-Bx
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 20:21:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2013 11:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,685,1363158000"; d="scan'208";a="242589253"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.48])
	by AZSMGA002.ch.intel.com with ESMTP; 16 May 2013 11:03:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 21:03:04 +0300
Message-Id: <cover.1368727195.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 0/3] Fix mtab issue for initramfs install
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
X-List-Received-Date: Thu, 16 May 2013 18:21:50 -0000

This patch set reversn and older patch and correctly fixes the
issue that /etc/mtab was getting installed in the initramfs 
because of a RDEPENDS on base files from rpm-postinsts. This RDEPENDS
was wrong and now removed by this patch.

The revert need to undo the remove of the cat /proc/mounts > /etc/mtab
and then ensure that the PR bumps are retained.

Sau!

The following changes since commit e3561c1cae467a4fb79723f83dea54d9d62adf7d:

  qemuimage-testlib: change default directory for target tests (2013-05-16 00:23:34 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/update

Saul Wold (3):
  rpm-postinst: remove un-needed RDEPENDS on base-files
  Revert "initramfs-live-install*: fix the "install" boot option"
  initrdscripts: Not let PR go backwards after revert

 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 1 +
 meta/recipes-core/initrdscripts/files/init-install.sh     | 1 +
 meta/recipes-devtools/rpm/rpm-postinsts.bb                | 2 --
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.0.2



