Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 61C0477BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573660"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:36 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:29 +0200
Message-Id: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH 0/6] Stop using update-alternatives for init scripts
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
X-List-Received-Date: Wed, 01 Nov 2017 14:00:36 -0000

This patchset does away with the usage of update-alternatives for managing init
scripts. Using u-a for initscripts cause race/ordering issues with package
scriptlets doing daemon stop/start/enable at package installation time. The
patchset also reverts a kludge that was introduced in
update-alternatives.bbclass and update-rc.d.bbclass to work around the
aforementioned problems. Finally, it introduces sanity check to
update-alternatives.bbclass to prevent usage of u-a for init scripts in the
future.

[YOCTO #10944]


The following changes since commit 3b413a80578caacd9a7f405f3c51a3921d78a60d:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-10944
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-10944

Markus Lehtonen (6):
  sysklogd: don't use update-alternatives
  initscripts: don't use update-alternatives
  lsbinitscripts: don't use update-alternatives
  initscripts: rrecommend initscripts-functions
  Revert "classes: Fix alternatives and rc.d ordering"
  update-alternatives.bbclass: refuse to manage SysV init scripts

 meta/classes/update-alternatives.bbclass         | 33 ++++++++----------------
 meta/classes/update-rc.d.bbclass                 | 23 +++--------------
 meta/conf/distro/include/default-providers.inc   |  1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb | 11 ++++----
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb   |  2 +-
 meta/recipes-extended/lsb/lsbinitscripts_9.72.bb |  8 ++----
 meta/recipes-extended/sysklogd/sysklogd.inc      | 12 +--------
 7 files changed, 24 insertions(+), 66 deletions(-)

-- 
2.13.6


