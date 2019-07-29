Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-12.clustermail.de (good-out-12.clustermail.de
	[212.223.35.74])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF617F223
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 12:14:24 +0000 (UTC)
Received: from [10.0.0.17] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1hs4Xj-0003U9-2i
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Jul 2019 14:14:24 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1hs4Xj-0002Mi-0w
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Jul 2019 14:14:19 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 29 Jul 2019 14:14:18 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2019 14:13:44 +0200
Message-ID: <20190729121344.31643-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [PATCH] image.bbclass: Fix debug output for rootfs size
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
X-List-Received-Date: Mon, 29 Jul 2019 12:14:24 -0000
Content-Type: text/plain

The debug output didn't match the calculation - it showed a wrong value.
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 682858dc95..25b0ead9bf 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -529,7 +529,7 @@ def get_rootfs_size(d):
     base_size = size_kb * overhead_factor
     bb.debug(1, '%f = %d * %f' % (base_size, size_kb, overhead_factor))
     base_size2 = max(base_size, rootfs_req_size) + rootfs_extra_space
-    bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size, rootfs_req_size, max(base_size, rootfs_req_size), overhead_factor))
+    bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size, rootfs_req_size, max(base_size, rootfs_req_size), rootfs_extra_space))
 
     base_size = base_size2
     if base_size != int(base_size):
-- 
2.17.1


