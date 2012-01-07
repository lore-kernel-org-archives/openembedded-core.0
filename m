Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RjONV-0004sJ-Gb
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 05:59:37 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so3666004iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 20:52:14 -0800 (PST)
Received: by 10.50.156.130 with SMTP id we2mr9911341igb.10.1325911934852;
	Fri, 06 Jan 2012 20:52:14 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id gh7sm109453857igb.1.2012.01.06.20.52.12
	(version=SSLv3 cipher=OTHER); Fri, 06 Jan 2012 20:52:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 20:51:55 -0800
Message-Id: <1325911915-16001-5-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] update-modules: don't run modutils.sh if systemd is installed
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
X-List-Received-Date: Sat, 07 Jan 2012 04:59:37 -0000

systemd has its own mechanism for loading kernel modules at startup

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../update-modules-1.0/update-modules              |    3 ++-
 .../update-modules/update-modules_1.0.bb           |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules b/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
index 636fe1c..7ee7df8 100755
--- a/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
+++ b/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
@@ -181,7 +181,8 @@ fi
 mv "$MODCONFTMPFILE" "$MODCONFFILE"
 mv "$MODULESTMPFILE" "$MODULESFILE"
 
-if [ $first_time -eq 1 ]; then
+# Don't run modutils.sh if systemd is installed
+if [ $first_time -eq 1 ] && [ ! -e /bin/systemctl ]; then
   /etc/init.d/modutils.sh || true
 fi
 
diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
index dc44965..d9697de 100644
--- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
+++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
@@ -4,7 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} = "module-init-tools-depmod"
-PR = "r11"
+
+PR = "r12"
 
 SRC_URI = "file://update-modules \
            file://COPYING.GPL"
-- 
1.7.1



