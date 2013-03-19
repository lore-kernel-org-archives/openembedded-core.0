Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UI4kY-0002JI-U4
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:11:19 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 22:54:26 +0100
Message-Id: <1363730066-11361-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] Revert "base-files: add fstab for systemd based systems"
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
X-List-Received-Date: Tue, 19 Mar 2013 22:11:20 -0000

For hybrid systemd/sysvinit builds, only one fstab can be used.
The default fstab used by sysvinit should work fine with systemd.

Since virtually every machine will ship its own fstab in its bsp
layer, the bsp layer may decide how to override the fstab based
on distro features.

This reverts commit 77bbb839ba25b974a538b90d346b454ccd5deefd.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/base-files/base-files/fstab.systemd |    9 ---------
 meta/recipes-core/base-files/base-files_3.0.14.bb     |    7 +------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd

diff --git a/meta/recipes-core/base-files/base-files/fstab.systemd b/meta/recipes-core/base-files/base-files/fstab.systemd
deleted file mode 100644
index cb48a0d..0000000
--- a/meta/recipes-core/base-files/base-files/fstab.systemd
+++ /dev/null
@@ -1,9 +0,0 @@
-# stock fstab - you probably want to override this with a machine specific one
-
-rootfs               /                    auto       defaults              1  1
-tmpfs                /var/volatile        tmpfs      defaults              0  0
-tmpfs                /media/ram           tmpfs      defaults              0  0
-
-# uncomment this if your device has a SD/MMC/Transflash slot
-#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
-
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index e7a9d82..a56450d 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -18,7 +18,6 @@ SRC_URI = "file://rotation \
            file://profile \
            file://shells \
            file://fstab \
-           file://fstab.systemd \
            file://filesystems \
            file://issue.net \
            file://issue \
@@ -92,11 +91,7 @@ do_install () {
  		install -m 0644 ${WORKDIR}/rotation ${D}${sysconfdir}/rotation
 	fi
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -m 0644 ${WORKDIR}/fstab.systemd ${D}${sysconfdir}/fstab
-	else
-		install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-	fi
+	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
 	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
-- 
1.7.10.4



