Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id CD8116B590
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 06:15:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r786Fq3g009637
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2013 02:15:55 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 23:15:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2013 14:16:03 +0800
Message-ID: <7c79c8a116d82b16cc8828be02e572a6c28dcfab.1375941355.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375941355.git.Qi.Chen@windriver.com>
References: <cover.1375941355.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 06/10] runqemu-internal: fix to start X correctly in live images
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
X-List-Received-Date: Thu, 08 Aug 2013 06:15:55 -0000
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


