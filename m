Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 244F1731C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 08:55:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6L8tj5n023151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 01:55:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 21 Jul 2016 01:55:43 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2016 16:52:58 +0800
Message-ID: <321550cbcc119cec8a9e3675888e85420fe8090b.1469091122.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
In-Reply-To: <cover.1469091122.git.kai.kang@windriver.com>
References: <cover.1469091122.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kernel-uimage.bbclass: indeed update var KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Thu, 21 Jul 2016 08:55:50 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The replace() method of the python string class doesn't replace
in-place, then the var KERNEL_IMAGETYPE_FOR_MAKE doesn't be updated as
design.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/kernel-uimage.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 2a187f5..340503a 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -14,8 +14,7 @@ python __anonymous () {
         if d.getVar("KEEPUIMAGE", True) != 'yes':
             typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
             if "uImage" in typeformake.split():
-                typeformake.replace('uImage', 'vmlinux')
-            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
+                d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
 }
 
 do_uboot_mkimage() {
-- 
2.9.2.368.g08bb350


