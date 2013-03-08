Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UE6FO-00043g-Vt
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 23:58:49 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 23:42:03 +0100
Message-Id: <1362782523-17438-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362782523-17438-1-git-send-email-obi@opendreambox.org>
References: <1362782523-17438-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/3] wpa-supplicant: avoid host contamination by libnl3
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
X-List-Received-Date: Fri, 08 Mar 2013 22:59:18 -0000

Removes hardcoded include path -I/usr/include/libnl3. OE's include
path gets injected by do_configure.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |    3 +-
 .../fix-libnl3-host-contamination.patch            |   42 ++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.0.bb           |    2 +-
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 4e15369..dd85057 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -19,7 +19,8 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
-           file://99_wpa_supplicant"
+           file://99_wpa_supplicant \
+           file://fix-libnl3-host-contamination.patch"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
new file mode 100644
index 0000000..eb8036f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Pending
+
+From 37d6b3dd5a737cd67468e4a58b372bddd924a7be Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Fri, 8 Mar 2013 22:55:19 +0100
+Subject: [PATCH] Revert "build: Use updated libnl3 header paths"
+
+This reverts commit e7ecddf33a446072effbc85a27a078a8e582c89e.
+---
+ src/drivers/drivers.mak |    2 +-
+ src/drivers/drivers.mk  |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
+index 68ff910..1f38f57 100644
+--- a/src/drivers/drivers.mak
++++ b/src/drivers/drivers.mak
+@@ -30,7 +30,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20
+ else
+   ifdef CONFIG_LIBNL_TINY
+     DRV_LIBS += -lnl-tiny
+diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
+index db8561a..c93e88d 100644
+--- a/src/drivers/drivers.mk
++++ b/src/drivers/drivers.mk
+@@ -30,7 +30,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20
+ else
+   ifdef CONFIG_LIBNL_TINY
+     DRV_LIBS += -lnl-tiny
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
index 22e42dd..a8b0dad 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-2.0.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3be2ebfdcced52e00eda0afe2889839d"
 SRC_URI[sha256sum] = "2c115609fbb5223d51381084a5c944455a8afcda81d584173ff55ba233379e09"
-- 
1.7.10.4



