Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5126E7326D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:14:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u319Em3N029942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 02:14:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 1 Apr 2016 02:14:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Apr 2016 02:14:44 -0700
Message-ID: <4f2140fcfc9445972797d09269e87e0b928daf04.1459502011.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459502011.git.liezhi.yang@windriver.com>
References: <cover.1459502011.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] init-install.sh: fix disk_size
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
X-List-Received-Date: Fri, 01 Apr 2016 09:14:49 -0000
Content-Type: text/plain

It mis-matched "SanDisk" or "Disk Flags" before, which caused unexpected
error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh | 2 +-
 meta/recipes-core/initrdscripts/files/init-install-efi.sh        | 2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 7a0b4d4..b562109 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -69,7 +69,7 @@ umount /dev/${device}* 2> /dev/null || /bin/true
 mkdir -p /tmp
 cat /proc/mounts > /etc/mtab
 
-disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted /dev/${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
 testfs_size=$((disk_size*testfs_ratio/100))
 rootfs_size=$((disk_size-boot_size-testfs_size))
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 0443a9d..3531158 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -120,7 +120,7 @@ if [ ! -e /etc/mtab ]; then
     cat /proc/mounts > /etc/mtab
 fi
 
-disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
 swap_size=$((disk_size*swap_ratio/100))
 rootfs_size=$((disk_size-boot_size-swap_size))
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 1925d90..c5623ee 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -116,7 +116,7 @@ if [ ! -L /etc/mtab ]; then
     cat /proc/mounts > /etc/mtab
 fi
 
-disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
 grub_version=$(grub-install -v|sed 's/.* \([0-9]\).*/\1/')
 
-- 
2.8.0


