Return-Path: <nkela@cisco.com>
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id 2225B719A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=888; q=dns/txt; s=iport;
	t=1487204512; x=1488414112;
	h=from:to:cc:subject:date:message-id;
	bh=c65MlQ+M8Z/a4ObbJ+eUnuwtTkWl/OJAoiowB+WCJQQ=;
	b=dqMyv97T6MCp8cgajrLGy52MHmJ/t5upSpFwe9wTdU/fJPhQ1opapSwb
	7T09wBYgbzp3Yk8O2Z207LSyAkns3VFJf4JPId/58C8D6GsGRoN0eAAVT
	dhN/LcjcJ41JKpN32jhJKcmg7o8TCcYn+pOi6BD6PdWdip/X+InIEx2KX U=;
X-IronPort-AV: E=Sophos;i="5.35,167,1484006400"; d="scan'208";a="209111287"
Received: from alln-core-4.cisco.com ([173.36.13.137])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	16 Feb 2017 00:21:50 +0000
Received: from sjc-ads-4850.cisco.com (sjc-ads-4850.cisco.com [10.28.39.114])
	by alln-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id
	v1G0LoVD025580; Thu, 16 Feb 2017 00:21:50 GMT
Received: by sjc-ads-4850.cisco.com (Postfix, from userid 323395)
	id 7622BA0B; Wed, 15 Feb 2017 16:21:49 -0800 (PST)
From: Nikunj Kela <nkela@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 00:21:30 +0000
Message-Id: <1487204490-9078-1-git-send-email-nkela@cisco.com>
X-Mailer: git-send-email 2.5.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-kernel@external.cisco.com
Subject: [PATCH] kernel-fitimage.bbclass: Change KERNEL_IMAGETYPE_FOR_MAKE to Image for ARM64
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
X-List-Received-Date: Thu, 16 Feb 2017 00:21:51 -0000

zImage is the default KERNEL_IMAGETYPE_FOR_MAKE for non x86 fitImage.
On ARM64 architecture, zImage is not a valid kernel build target. This
change overrides KERNEL_IMAGETYPE_FOR_MAKE to Image on ARM64 platforms.

Cc: xe-kernel@external.cisco.com
Signed-off-by: Nikunj Kela <nkela@cisco.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 1c3b4b7..89cd5c4 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -9,6 +9,8 @@ python __anonymous () {
 
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
+        elif d.getVar("UBOOT_ARCH") == "arm64":
+            replacementtype = "Image"
         else:
             replacementtype = "zImage"
 
-- 
2.5.0


