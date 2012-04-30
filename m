Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SOwst-0005Tg-BP
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 22:07:47 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 21:58:00 +0200
Message-Id: <1335815880-7346-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nfs-utils: don't try to unload nfsd module
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
X-List-Received-Date: Mon, 30 Apr 2012 20:07:47 -0000

* When nfsserver get's stopped, "modprobe -r nfsd" may
  hang indefinitely. As there's no need to unload the
  module, just remove the call to modprobe.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../nfs-utils/nfs-utils/nfsserver                  |    8 --------
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 69c8718..e460e26 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -105,14 +105,6 @@ stop_nfsd(){
 	}
 	then
 		echo done
-		# This will remove, recursively, dependencies
-		echo -n 'removing nfsd kernel module: '
-		if modprobe -r nfsd
-		then
-			echo done
-		else
-			echo failed
-		fi
 	else
 		echo failed
 	fi
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index d047940..eb18aaa 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
 RDEPENDS_${PN} = "portmap"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
-- 
1.7.9.5



