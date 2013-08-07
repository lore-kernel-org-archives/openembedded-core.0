Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A867F6B5B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 08:08:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7788o0V027679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 01:08:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 01:08:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2013 16:08:54 +0800
Message-ID: <c0da8cdbf82fa10f6ea1ab575aa8fff11e9bc9ef.1375862591.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375862591.git.Qi.Chen@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com, chen_q07@163.com
Subject: [PATCH V4 06/10] runqemu-internal: fix to start X correctly in live images
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
X-List-Received-Date: Wed, 07 Aug 2013 08:08:54 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The QEMUOPTIONS for ISOFS was not complete, leading to failures when
trying to start X in live images.

This patch fixes this problem.

[YOCTO #4103]
[YOCTO #4884]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 9619bec..8a6e551 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -526,7 +526,7 @@ if [ "x$RAMFS" = "xtrue" ]; then
 fi
 
 if [ "x$ISOFS" = "xtrue" ]; then
-    QEMUOPTIONS="-cdrom $ROOTFS"
+    QEMUOPTIONS="$QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
 fi
 
 if [ "x$QEMUOPTIONS" = "x" ]; then
-- 
1.7.9.5


