Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0A17C583
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 15:32:24 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
	[10.13.135.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id 8127F24E218B;
	Fri,  8 Feb 2019 07:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1549639945; bh=/3dG6+JimYm65WmXyEvU6i400KI0dK9yCCVokspkSpk=;
	h=From:To:Cc:Subject:Date:From;
	b=DML45z+np1gmvtMAY68gKhK8QdYOBp4GeQn4qE9iwVdho9986QLx/Mj49s8wPtihB
	9VCEWm9RQrrcEUOzJ87eVXVitOOpmimr7J8KCRFASSwjpLpQZtp1ENgwFm9ENAHkah
	6DcoVdJiz9pI2x9R0WsBUl/k//Ppqoo7jqFgtHhGmGx0XiPHMQkAJCO03yTMiIIymF
	xlH+G2T2K81L+lo1St84RKRi6Yy0igC3nlnJBcV7QzTlcIfgrTg04lSYtcIIP03U3U
	SJCdELkeA4SEpW7lnlB+WdIIxEWR7SIjpbqErYMGj0p6b4dI3oHKRHHcn3OIDQEKWr
	VMCj2OUAFlg9g==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id ABCDAA005A;
	Fri,  8 Feb 2019 15:32:23 +0000 (UTC)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 18:32:21 +0300
Message-Id: <20190208153221.4335-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] linux-yocto: Add dependency on libgcc for ARC
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
X-List-Received-Date: Fri, 08 Feb 2019 15:32:24 -0000

As of now in case of ARC there's no in-kernel implementation of basic libgcc
functions used for millicode, multiplication, division etc instead we simply
link with libgcc.a which provides everything used by the compiler.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 1ebfb606da..f191946f2a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
 KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
+DEPENDS_append_arc = " libgcc"
+KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
+KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
+
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
 KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
-- 
2.16.2


