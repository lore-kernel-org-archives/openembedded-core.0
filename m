Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 265C46D3BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:24:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V1OjX2019726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 18:24:45 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 18:24:44 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 09:24:40 +0800
Message-ID: <1383182680-20871-1-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.8.3.3
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
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
X-List-Received-Date: Thu, 31 Oct 2013 01:24:43 -0000
Content-Type: text/plain

From: "Signed-off-by: Xufeng Zhang" <xufeng.zhang@windriver.com>

Since kernel will build twice when we are trying to bundle kernel
and initramfs together after commit 609d5a9ab("kernel.bbclass,
image.bbclass: Implement kernel INITRAMFS dependency and bundling"),
thus, the second building for kernel would fail if rm_work is done
previously.

To fix this problem, we need to delay the rm_work task for kernel
to run after do_bundle_initramfs task.

[YOCTO #5416]

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dedfab7..6154df0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -29,6 +29,9 @@ python __anonymous () {
     image_task = d.getVar('INITRAMFS_TASK', True)
     if image_task:
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
+
+    if image or image_task:
+        d.appendVarFlag('do_rm_work', 'depends', " %s:do_bundle_initramfs" % d.getVar('PN', True))
 }
 
 inherit kernel-arch deploy
-- 
1.8.3.3


