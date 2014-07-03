Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ACA9C6AC92
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 03:00:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6330i8W025812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 20:00:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 2 Jul 2014 20:00:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 11:02:21 +0800
Message-ID: <cc5e2177af01c043b74197e39b61bb569686a5de.1404354210.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404354210.git.Qi.Chen@windriver.com>
References: <cover.1404354210.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu-extract-sdk: normalize paths to improve output
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
X-List-Received-Date: Thu, 03 Jul 2014 03:00:49 -0000
Content-Type: text/plain

Previously, we would have output like below from runqemu-extract-sdk.

    Creating directory /home/chenqi/poky/build-systemd/./nfs-root

Normalize paths for runqemu-extract-sdk so that we have output like below.

    Creating directory /home/chenqi/poky/build-systemd/nfs-root

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-extract-sdk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 4ce906a..32ddd48 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -49,7 +49,7 @@ fi
 
 # Convert SDK_ROOTFS_DIR to a full pathname
 if [[ ${SDK_ROOTFS_DIR:0:1} != "/" ]]; then
-	SDK_ROOTFS_DIR=$(pwd)/$SDK_ROOTFS_DIR
+	SDK_ROOTFS_DIR=$(readlink -f $(pwd)/$SDK_ROOTFS_DIR)
 fi
 
 TAR_OPTS=""
@@ -74,6 +74,7 @@ if [ ! -d "$SDK_ROOTFS_DIR" ]; then
 fi
 
 pseudo_state_dir="$SDK_ROOTFS_DIR/../$(basename "$SDK_ROOTFS_DIR").pseudo_state"
+pseudo_state_dir="$(readlink -f $pseudo_state_dir)"
 
 if [ -e "$pseudo_state_dir" ]; then
 	echo "Error: $pseudo_state_dir already exists!"
-- 
1.7.9.5


