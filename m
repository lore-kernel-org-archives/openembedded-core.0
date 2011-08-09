Received: from outbound.icp-osb-irony-out9.iinet.net.au ([203.59.1.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1Qqbve-0005Rn-9i
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 04:20:26 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ar4HAJuWQE7LO4Se/2dsb2JhbABDmByPDHeCQCiBKcZthkYEh1qQToMQiD8
X-IronPort-AV: E=Sophos;i="4.67,340,1309708800"; d="scan'208";a="27009479"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-osb-irony-out9.iinet.net.au with ESMTP;
	09 Aug 2011 10:12:49 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 10:04:13 +0800
Message-Id: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR assignment to unconditional.
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
X-List-Received-Date: Tue, 09 Aug 2011 02:20:26 -0000

The pseudo executable sets the PSEUDO_LOCALSTATEDIR environment variable
to point to a sysroot location. During an initial cache build, in which
pseudo is not used as it is being built, the PSEUDO_LOCALSTATEDIR is set
to a per-package location by bitbake.conf, and baked into the cache.
If the cache is subsequently invalidated, bitbake may run under pseudo,
and rebuild it with the sysroot location baked into the cache. This
results in all packages using the same, persistent db, even on package
rebuild, which leads to permissions errors. Making the assignment
unconditional corrects this problem.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f0b42c..9a9ab53 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -557,7 +557,7 @@ SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 SRC_URI = "file://${FILE}"
 
 # Use pseudo as the fakeroot implementation
-PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
+PSEUDO_LOCALSTATEDIR = "${WORKDIR}/pseudo/"
 FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
-- 
1.7.3.4



