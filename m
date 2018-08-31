Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C19F87953B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 02:17:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7V2HGh7011453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 19:17:16 -0700
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 19:17:15 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2018 10:15:08 +0800
Message-ID: <1535681710-29461-6-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] wic:direct:remove same entry when updating fstab
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
X-List-Received-Date: Fri, 31 Aug 2018 02:17:15 -0000
Content-Type: text/plain

Remove same mountpoint entry when updating fstab.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 meta/recipes-support/wic/files/wic/plugins/imager/direct.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
index f648db4..d3ebc9c 100644
--- a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
+++ b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
@@ -163,6 +163,9 @@ class DirectPlugin(ImagerPlugin):
             opts = part.fsopts if part.fsopts else "defaults"
             line = "\t".join([device_name, part.mountpoint, part.fstype,
                               opts, "0", "0"]) + "\n"
+            for tmpline in fstab_lines:
+                if part.mountpoint in tmpline:
+                    fstab_lines.remove(tmpline)
 
             fstab_lines.append(line)
             updated = True
-- 
2.7.4


