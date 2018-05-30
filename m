Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38E7B74DF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:55:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U8smiN005008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:55:20 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:55:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:03:49 +0800
Message-ID: <9424da4a80adce0d50291b781c0aaf156128b2be.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/16] runqemu-extract-sdk: allow install debugfs on rootfs
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
X-List-Received-Date: Wed, 30 May 2018 08:55:29 -0000
Content-Type: text/plain

Usually, the debugfs' (-dbg.tar.*) work follow is:
1) Install regular rootfs to dir_foo
2) Install debugfs (-dbg.tar.*) to the same dir_foo

So we need to allow installing the debugfs on top of the rootfs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-extract-sdk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 2a0dd50..f4286ef 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -76,7 +76,9 @@ fi
 pseudo_state_dir="$SDK_ROOTFS_DIR/../$(basename "$SDK_ROOTFS_DIR").pseudo_state"
 pseudo_state_dir="$(readlink -f $pseudo_state_dir)"
 
-if [ -e "$pseudo_state_dir" ]; then
+debug_image="`echo $ROOTFS_TARBALL | grep '\-dbg\.tar\.'`"
+
+if [ -e "$pseudo_state_dir" -a -z "$debug_image" ]; then
 	echo "Error: $pseudo_state_dir already exists!"
 	echo "Please delete the rootfs tree and pseudo directory manually"
         echo "if this is really what you want."
-- 
2.7.4


