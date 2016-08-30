Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7DFB6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:49:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7UGnE9s014235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 09:49:14 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 09:49:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Aug 2016 12:49:01 -0400
Message-ID: <7a16ab60139050fc112ae798e763f1270e7abbfd.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] qemuarm: add device tree support
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
X-List-Received-Date: Tue, 30 Aug 2016 16:49:17 -0000
Content-Type: text/plain

As of the 4.7 kernel qemuarm must be booted with a dtb. To allow
older and recent kernels to both boot qemuarm, we add the device
tree definitions only to recipes that need it (linux-yocto-dev)
and make runqemu detect and use the dtb if present.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 scripts/runqemu-internal | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d10466d35cce..e74a9150cbd7 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -298,6 +298,9 @@ config_qemuarm() {
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
     fi
+    if [ -e "$DEPLOY_DIR_IMAGE/zImage-versatile-pb.dtb" ]; then
+        QEMUOPTIONS="$QEMUOPTIONS -dtb $DEPLOY_DIR_IMAGE/zImage-versatile-pb.dtb"
+    fi
     if [ "$MACHINE" = "qemuarmv6" ]; then
         QEMUOPTIONS="$QEMUOPTIONS -cpu arm1136"
     fi
-- 
2.5.0


