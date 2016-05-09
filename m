Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 578626FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 23:27:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2016 16:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,602,1455004800"; d="scan'208";a="972131110"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2016 16:27:39 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:28:34 -0700
Message-Id: <1462836516-26997-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH 0/2] Create systemd users at build time
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
X-List-Received-Date: Mon, 09 May 2016 23:27:39 -0000

Systemd has a config option sysusers which creates any users or groups that
systemd needs on first boot. There is a rootfs-postcommand that creates these
users in case the filesystem is readonly, however it does not take into
account any staicids that the user may have set.

By adding these users at build time, we allow a check for staticids, which would
otherwise have been skipped.

This issue was initially raised by a fix that was added to Ostro OS. See
Patrick's comments for more info on that.

[ YOCTO #9497 ]

Stephano Cetola (2):
  systemd: add sysusers config option to defaults
  systemd: add users/groups at build rather than runtime

 meta/classes/rootfs-postcommands.bbclass | 66 +++++++++++++++++++++-----------
 meta/classes/useradd-staticids.bbclass   | 56 +--------------------------
 meta/recipes-core/systemd/systemd_229.bb |  4 +-
 useradd-staticids-list.bbclass           | 56 +++++++++++++++++++++++++++
 4 files changed, 103 insertions(+), 79 deletions(-)
 create mode 100644 useradd-staticids-list.bbclass

-- 
2.8.0


