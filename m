Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4F90360853
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 10:23:17 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bT4wn-0003ja-Rl from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2016 03:23:18 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 29 Jul 2016 11:23:16 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2016 15:22:40 +0500
Message-ID: <1469787760-19159-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [][PATCH v2] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Fri, 29 Jul 2016 10:23:17 -0000
Content-Type: text/plain

Using a copy would only make management of devices erroneous
and makes the system unstable in some scenarios as tools will
have to manipulate both files separately. A link ensures that
both files /proc/mounts and /etc/mtab will have the same
information at all times and this is how it is handled
on newer systems where there is such a need. Same is
suggested by busybox.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f564f4e..8b996ca 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -123,7 +123,7 @@ mkdir -p /tmp
 
 # Create /etc/mtab if not present
 if [ ! -e /etc/mtab ]; then
-    cat /proc/mounts > /etc/mtab
+    ln -sf /proc/mounts /etc/mtab
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 72ce92b..2362c53 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -119,7 +119,7 @@ fi
 
 mkdir -p /tmp
 if [ ! -L /etc/mtab ]; then
-    cat /proc/mounts > /etc/mtab
+    ln -sf /proc/mounts /etc/mtab
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
-- 
1.9.1


