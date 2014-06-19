Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32BE96FD3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:10:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5J2AJt7019738
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 19:10:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 18 Jun 2014 19:10:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 10:11:33 +0800
Message-ID: <4d0c87a79fdde16dcad0783cac294feb8285e215.1403143738.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403143738.git.Qi.Chen@windriver.com>
References: <cover.1403143738.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [dora][PATCH 2/2] populate-extfs.sh: error out if debugfs encounters some error
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
X-List-Received-Date: Thu, 19 Jun 2014 02:10:18 -0000
Content-Type: text/plain

Previously, even if we encounter some error when populating the
ext filesystem, we don't error out and the rootfs process still
succeeds.

However, what's really expected is that the populate-extfs.sh script
should error out if something wrong happens when using `debugfs' to
generate the ext filesystem. For example, if there's not enough block
in the filesystem, and allocating a block for some file fails, the
failure should not be ignored. Otherwise, we will have a successful
build but a corrupted filesystem.

The debugfs returns 0 as long as the command is valid. That is, even
if the command fails, the debugfs still returns 0. That's really a
pain here. That's why this patch checks the error output to see whether
there's any error logged.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
index da3954e..23d97d3 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
@@ -94,4 +94,9 @@ DEBUGFS="debugfs"
 		echo "sif $SRC links_count $LN_CNT"
 	done
 	rm -fr $INODE_DIR
-} | $DEBUGFS -w -f - $DEVICE
+} | $DEBUGFS -w -f - $DEVICE 2>&1 1>/dev/null | grep '.*: .*'
+
+if [ $? = 0 ]; then
+    echo "Some error occured while executing [$DEBUGFS -w -f - $DEVICE]"
+    exit 1
+fi
-- 
1.7.9.5


