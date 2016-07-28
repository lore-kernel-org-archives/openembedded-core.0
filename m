Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D636E607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 08:49:59 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bSh0y-0007Z3-6Y from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2016 01:50:00 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 28 Jul 2016 09:49:58 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2016 13:49:48 +0500
Message-ID: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Thu, 28 Jul 2016 08:50:01 -0000
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
index f564f4e..53f6508 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -123,7 +123,7 @@ mkdir -p /tmp
 
 # Create /etc/mtab if not present
 if [ ! -e /etc/mtab ]; then
-    cat /proc/mounts > /etc/mtab
+    ln -sf /etc/mtab /proc/mounts
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 72ce92b..21ae0a6 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -119,7 +119,7 @@ fi
 
 mkdir -p /tmp
 if [ ! -L /etc/mtab ]; then
-    cat /proc/mounts > /etc/mtab
+    ln -sf /etc/mtab /proc/mounts
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
-- 
1.9.1


