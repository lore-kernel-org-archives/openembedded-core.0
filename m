Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 626677F275
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 09:29:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8G9TKrO018067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 02:29:20 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 16 Sep 2019 02:29:19 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2019 17:29:17 +0800
Message-ID: <1568626157-16035-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [PATCH] grub: remove diffutils and freetype runtime dependencies
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
X-List-Received-Date: Mon, 16 Sep 2019 09:29:19 -0000
Content-Type: text/plain

The diffutils runtime dependency was introduced from legacy grub since
the script grub-install invokes cmp command which is from diffutils
package. But in Grub2 the grub-install has been rewritten with C
language. So this package isn't needed anymore.

The freetype runtime dependency is for grub-mkfont but we have
explicitly disabled grub-mkfont build. It is safe to remove it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 2 +-
 meta/recipes-bsp/grub/grub_2.04.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index aaa198e..c85879b 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -3,7 +3,7 @@ require grub2.inc
 GRUBPLATFORM = "efi"
 
 DEPENDS_append_class-target = " grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype grub-common virtual/grub-bootconf"
+RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/grub_2.04.bb
index 1d1a456..9232ea8 100644
--- a/meta/recipes-bsp/grub/grub_2.04.bb
+++ b/meta/recipes-bsp/grub/grub_2.04.bb
@@ -1,7 +1,7 @@
 require grub2.inc
 
 RDEPENDS_${PN}-common += "${PN}-editenv"
-RDEPENDS_${PN} += "diffutils freetype ${PN}-common"
+RDEPENDS_${PN} += "${PN}-common"
 
 RPROVIDES_${PN}-editenv += "${PN}-efi-editenv"
 
-- 
2.7.4


