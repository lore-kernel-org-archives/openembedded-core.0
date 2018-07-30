Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF4A78D2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:20:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6U9KWkw029232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 02:20:33 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 30 Jul 2018 02:20:32 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2018 17:16:32 +0800
Message-ID: <20180730091632.275318-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] kdump: start kdump.service after basic.target
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
X-List-Received-Date: Mon, 30 Jul 2018 09:20:32 -0000
Content-Type: text/plain

If kdump.service is set to run on boot and dump-capture kernel isn't
placed in /dev/root, kdump.service will fail to load the kernel,
since other partitions are not mounted yet. Starting kdump.service
after basic.target guarantees dump-capture kernel can be loaded in
this situation.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools/kdump.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump.service b/meta/recipes-kernel/kexec/kexec-tools/kdump.service
index 4e65a46ac4..013c5a62b3 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kdump.service
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump.service
@@ -1,6 +1,7 @@
 [Unit]
 Description=Reboot and dump vmcore via kexec
 DefaultDependencies=no
+After=basic.target
 
 [Service]
 Type=oneshot
-- 
2.14.4


