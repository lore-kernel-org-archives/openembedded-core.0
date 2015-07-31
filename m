Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC107647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:21:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6V5LkHu028599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 22:21:50 -0700 (PDT)
Received: from pek-khao-d1.corp.ad.wrs.com (128.224.162.156) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Thu, 30 Jul 2015 22:21:26 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 13:21:25 +0800
Message-ID: <1438320085-5543-1-git-send-email-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] u-boot: fix extern inline build errors for gcc 5
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
X-List-Received-Date: Fri, 31 Jul 2015 05:21:52 -0000
Content-Type: text/plain

The gcc 5 change its default standard from gnu89 to gnu11. These two
standards do have different semantics for inline functions. And the
gcc 5 will emit the following errors on the "extern inline" functions:
    arch/powerpc/cpu/mpc8xxx/fsl_lbc.o: In function `ld_le16':
    ./arch/powerpc/include/asm/byteorder.h:12: multiple definition of `ld_le16'
    arch/powerpc/cpu/mpc8xxx/fdt.o:./arch/powerpc/include/asm/byteorder.h:12: first defined here

Fix these build errors by using "-fgnu89-inline" to enforce the gnu89
inline semantics as suggested in [1].

[1] https://gcc.gnu.org/gcc-5/porting_to.html

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot_2015.07.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb b/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
index 3ba2f44eaa20..4746c33ec25e 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
@@ -10,3 +10,5 @@ SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
 SRC_URI += "file://0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch"
 
 PV = "v2015.07+git${SRCPV}"
+
+EXTRA_OEMAKE_append = " KCFLAGS=-fgnu89-inline"
-- 
2.1.0


