Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF38260603
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 06:04:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA1646Tj016976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:04:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 23:04:06 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:04:02 -0700
Message-ID: <45f029252467ce799baaaa783df2dace63fe8e0c.1509516068.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1509516068.git.wenzong.fan@windriver.com>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] initscripts: Check for the existence of /etc/default/rcS
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
X-List-Received-Date: Wed, 01 Nov 2017 06:04:06 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

/etc/default/rcS might be missing if the init manager is not sysvinit,
we have to check for the existence of this file before sourcing it.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh              | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh               | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh             | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/mountall.sh              | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/urandom                  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index df553bc079..8f1853a667 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -8,7 +8,7 @@
 # Short-Description: Misc and other.
 ### END INIT INFO
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 #
 # Put a nologin file in /etc to prevent people from logging in before
 # system startup is complete.
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
index 62869451b7..d1c4d6c017 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh
@@ -8,7 +8,7 @@
 # Short-Description: Check all other file systems
 ### END INIT INFO
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
 #
 # Check the rest of the filesystems.
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index 02f0351fcb..c879f9e519 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -8,7 +8,7 @@
 # Short-Description: Check to root file system.
 ### END INIT INFO
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
 #
 # Set SULOGIN in /etc/default/rcS to yes if you want a sulogin to be spawned
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index c719be5d9a..94c1f1a141 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -9,7 +9,7 @@
 # Description:
 ### END INIT INFO
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
 #
 # Mount local filesystems in /etc/fstab. For some reason, people
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 1a0328d63e..c001778e18 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index af1625b5fd..e9b84a9d11 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -15,7 +15,7 @@ test -c /dev/urandom || exit 0
 
 RANDOM_SEED_FILE=/var/lib/urandom/random-seed
 
-. /etc/default/rcS
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 [ -f /etc/default/urandom ] && . /etc/default/urandom
 
 case "$1" in
-- 
2.11.0


