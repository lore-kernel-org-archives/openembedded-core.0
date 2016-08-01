Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3BD731F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 11:32:04 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bUBS1-0003Lp-D6 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2016 04:32:05 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Mon, 1 Aug 2016 12:32:03 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2016 16:31:43 +0500
Message-ID: <1470051103-4924-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [[PATCH v3] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Mon, 01 Aug 2016 11:32:08 -0000
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
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 4 ++--
 meta/recipes-core/initrdscripts/files/init-install.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f564f4e..c5db2f0 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -122,8 +122,8 @@ umount ${device}* 2> /dev/null || /bin/true
 mkdir -p /tmp
 
 # Create /etc/mtab if not present
-if [ ! -e /etc/mtab ]; then
-    cat /proc/mounts > /etc/mtab
+if [ ! -e /etc/mtab ] && [ -e /proc/mounts ]; then
+    ln -sf /proc/mounts /etc/mtab
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 72ce92b..bf92acb 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -118,8 +118,8 @@ if [ ! -b /dev/loop0 ] ; then
 fi
 
 mkdir -p /tmp
-if [ ! -L /etc/mtab ]; then
-    cat /proc/mounts > /etc/mtab
+if [ ! -L /etc/mtab ] && [ -e /proc/mounts ]; then
+    ln -sf /proc/mounts /etc/mtab
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
-- 
1.9.1


