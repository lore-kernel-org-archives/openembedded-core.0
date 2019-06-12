Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9317E745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 07:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5C73nTK002097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 00:04:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 12 Jun 2019 00:04:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jun 2019 15:04:05 +0800
Message-ID: <1560323045-74211-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] multilib: add override for image recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 07:04:25 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

MACHINE set to qemux86-64
for lib32-core-image-sato, during do_rootfs, it will run
install_complementary, which will get localedir by
d.getVar("libdir"), without override, libdir will still be
lib64. add override to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/multilib.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 2b761f3..7750221 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -33,6 +33,8 @@ python multilib_virtclass_handler () {
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
         e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROOT'))
+        override = ":virtclass-multilib-" + variant
+        e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
         target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
         if target_vendor:
             e.data.setVar("TARGET_VENDOR", target_vendor)
-- 
2.7.4


