Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 020F571A88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAN7nS53006434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:49:28 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 23:49:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 23:49:25 -0800
Message-ID: <3fdfb4554ae5e8c1ea2650de099dd2c60a482ca7.1479871728.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479871728.git.liezhi.yang@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] rootfs-postcommands.bbclass: fix zap_empty_root_password
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
X-List-Received-Date: Wed, 23 Nov 2016 07:49:29 -0000
Content-Type: text/plain

[YOCTO #10710]

The previous logic works when root passwd is blank, but it doesn't work
when there is a root passws, for example:
1) Set a root passwd in base-passwd
2) IMAGE_FEATURES += "debug-tweaks"
Start the target, it still requires passwd to login.

Empty passwd if debug-tweaks is in IMAGE_FEATURES, else do nothing can
fix problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 0c7ceea..353dc4f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -1,6 +1,6 @@
 
 # Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "empty_root_password ; ", "",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
@@ -105,12 +105,12 @@ read_only_rootfs_hook () {
 #
 # This function is intended to disallow empty root password if 'debug-tweaks' is not in IMAGE_FEATURES.
 #
-zap_empty_root_password () {
+empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
+		sed -i 's%^root:[^:]*:%root::%' ${IMAGE_ROOTFS}/etc/shadow
         fi
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
+		sed -i 's%^root:[^:]*:%root::%' ${IMAGE_ROOTFS}/etc/passwd
 	fi
 } 
 
-- 
2.10.2


