Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2692A7391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 05:39:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8M5dwOj003177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 22:39:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 21 Sep 2015 22:39:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Sep 2015 22:39:57 -0700
Message-ID: <c1171ed2ab54a6e39fcaf5ad7806ca6cf74a4e56.1442900379.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442900379.git.liezhi.yang@windriver.com>
References: <cover.1442900379.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu-extract-sdk: allow install debugfs on rootfs
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
X-List-Received-Date: Tue, 22 Sep 2015 05:40:00 -0000
Content-Type: text/plain

Usually, the debugfs' (-dbg.tar.*) work follow is:
1) Install regular rootfs to dir_foo
2) Install debugfs (-dbg.tar.*) to the same dir_foo

So we need allow install debugfs on rootfs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-extract-sdk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 32ddd48..90a7cbf 100755
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
1.7.9.5


