Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkhT8-0003vo-DA
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:07:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jun 2012 12:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117475534"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jun 2012 12:56:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 12:54:31 -0700
Message-Id: <4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1340998763.git.dvhart@linux.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/5] linux-libc-headers-yocto: Do not include linux-yocto
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
X-List-Received-Date: Fri, 29 Jun 2012 20:07:06 -0000

The only bit we seem to need from the linux-yocto include is the
SRCREV_FORMAT. If we define this explicitly, we can avoid including the
linux-yocto include.

This is desirable so that linux-yocto can require kernel and simplify
the PR update process of all the linux-yocto* recipes. Pulling in
kernel to the linux-libc-headers-yocto recipes causes build failures by
pulling in "update-modules-nativesdk".

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Bruce Ashfield <bruce.ashfield@windriver.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
---
 .../linux-libc-headers/linux-libc-headers-yocto_git.bb              |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
index b4222f1..8ab4fb1 100644
--- a/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ b/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
@@ -1,5 +1,4 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
-include recipes-kernel/linux/linux-yocto.inc
 
 B = "${S}"
 
@@ -13,6 +12,8 @@ SRCREV = "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
 PV = "3.4+git-${SRCPV}"
 PR = "r6"
 
+SRCREV_FORMAT ?= "meta_machine"
+
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
 # force this to empty to prevent installation failures, we aren't
-- 
1.7.10.2



