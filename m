Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3AC65CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:25:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2016 16:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,536,1464678000"; d="scan'208";a="1037454885"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2016 16:25:27 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 16:25:32 -0700
Message-Id: <20160817232533.92478-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH V5] rootfs.py: allow removal of unneeded packages
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
X-List-Received-Date: Wed, 17 Aug 2016 23:25:27 -0000

Paul and I had a discussion about this a couple weeks ago. We want to
allow for the removal of certain packages, regardless of the image
features containing "read-only-rootfs".

For example, if something has a runtime dependency on update-rc.d or
shadow, we need a way to remove these packages regardless of this
dependency.

Here is my idea for documenting the new variable:

FORCE_RO_REMOVE
Setting this variable to "1" will force the removal of the packages
listed in ROOTFS_RO_UNNEEDED during the generation of the rootfs.

I have purposely kept ROOTFS_RO_UNNEEDED from being easily
overridden, as this would have allowed users to remove packages on a
whim, which may be giving them just enough rope to hang themselves.

That being said, IMHO this patch adds some flexibility without adding
serious complexity or avenues for confusion.

Stephano Cetola (1):
  rootfs.py: allow removal of unneeded packages

 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.9.3


