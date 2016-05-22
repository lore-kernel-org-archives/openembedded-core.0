Return-Path: <contact@jgueytat.fr>
X-Greylist: delayed 1291 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 22 May 2016 18:16:08 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F59165CC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 18:16:08 +0000 (UTC)
Received: from mfilter28-d.gandi.net (mfilter28-d.gandi.net [217.70.178.159])
	by relay2-d.mail.gandi.net (Postfix) with ESMTP id B7D36C5A4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 20:16:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter28-d.gandi.net
Received: from relay2-d.mail.gandi.net ([IPv6:::ffff:217.70.183.194])
	by mfilter28-d.gandi.net (mfilter28-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id O0U0Ql1e7gOi
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 20:16:06 +0200 (CEST)
X-Originating-IP: 77.154.202.160
Received: from localhost.localdomain (160.202.154.77.rev.sfr.net
	[77.154.202.160]) (Authenticated sender: contact@jgueytat.fr)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2D5F7C5A56
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 20:16:05 +0200 (CEST)
From: Julien Gueytat <contact@jgueytat.fr>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2016 20:16:05 +0200
Message-Id: <1463940965-14727-1-git-send-email-contact@jgueytat.fr>
X-Mailer: git-send-email 1.9.1
Subject: [psplash][PATCH] Add --fbdev option to psplash like --rotation.
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
X-List-Received-Date: Sun, 22 May 2016 18:16:10 -0000

A new fbdev file is needed and should be overrided if needed.
The number contained in fbdev will be used as X in /dev/fbX.

By overriding fbdev you can have a splash screen on another
framebuffer than /dev/fbO.

You might have to adapt INITSCRIPT_PARAMS in psplash_git.bbappend
in case the framebuffer you want to use is not ready yet.

Signed-off-by: Julien Gueytat <contact@jgueytat.fr>
---
 meta/recipes-core/base-files/base-files/fbdev     | 1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb | 8 +++++++-
 meta/recipes-core/psplash/files/psplash-init      | 7 ++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/base-files/base-files/fbdev

diff --git a/meta/recipes-core/base-files/base-files/fbdev b/meta/recipes-core/base-files/base-files/fbdev
new file mode 100644
index 0000000..c227083
--- /dev/null
+++ b/meta/recipes-core/base-files/base-files/fbdev
@@ -0,0 +1 @@
+0
\ No newline at end of file
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index d391707..17225a9 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # For the manifest and the license text for each package:
 # Set COPY_LIC_MANIFEST and COPY_LIC_DIRS
 
-SRC_URI = "file://rotation \
+SRC_URI = "file://fbdev \
+           file://rotation \
            file://nsswitch.conf \
            file://motd \
            file://host.conf \
@@ -110,6 +111,11 @@ do_install () {
 
 	${BASEFILESISSUEINSTALL}
 
+	fbdev=`cat ${WORKDIR}/fbdev`
+	if [ "$fbdev" != "0" ]; then
+ 		install -m 0644 ${WORKDIR}/fbdev ${D}${sysconfdir}/fbdev
+	fi
+
 	rotation=`cat ${WORKDIR}/rotation`
 	if [ "$rotation" != "0" ]; then
  		install -m 0644 ${WORKDIR}/rotation ${D}${sysconfdir}/rotation
diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index 66c85e9..3d12f78 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -20,10 +20,15 @@ done
 export TMPDIR=/mnt/.psplash
 mount tmpfs -t tmpfs $TMPDIR -o,size=40k
 
+fbdev=0
+if [ -e /etc/fbdev ]; then
+	read fbdev < /etc/fbdev
+fi
+
 rotation=0
 if [ -e /etc/rotation ]; then
 	read rotation < /etc/rotation
 fi
 
-/usr/bin/psplash --angle $rotation &
+/usr/bin/psplash --fbdev $fbdev --angle $rotation &
 
-- 
1.9.1


