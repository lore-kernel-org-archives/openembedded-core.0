Return-Path: <prvs=066539cd8=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 318627E7BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 23:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560988259; x=1592524259;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xD7CqCq82mpqw5jy7nOE+NVrMvld36dyPjgcfD6lZIQ=;
	b=a15W7U8ojRLboY8fNx42jZ8tvDJZRYMRlhtNThg3y5D8UVCFPfasXKKA
	cPk/j5n4yBtL9mgipy+z3X4v1Z3jCIHPRQCwWghvKSDAAKd3ZXdeTwB5w
	JLtBd1wuDxaHjGbpiV6XP3c8ICr9IhsU/CzzWMunWpkkibb3nw/DW6UzB
	2OHxywuNKuMmeKdOCRPR/79n9+g0my39+UxqXKwKkJgezZme6q7jVF0Ce
	9AS+Q0a293Ny9zcwgWBnfyR7Kbe/z3EV42ZGhrQgUodXG46+VvQnk5x9T
	N/g0uGqgdvmffl9W3EjUCfqdb2jjlEWE1y73LSeoZowBjtcCV41dmE67S A==;
X-IronPort-AV: E=Sophos;i="5.63,394,1557158400"; d="scan'208";a="112241475"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2019 07:50:59 +0800
IronPort-SDR: 0UATfpt5s2Lh+/5VuLv2ar1zFW6FbtDuTAMc3MaEtp2XE+KDCl+7+L5aG2jnoFkMk6I77LA36A
	2KqBwInkIQ5OObilrcO4atAyeDXgyyF1b+9D0RdwEQlgysHoIlb2sXykcc6iHDAdGMZN+07kIM
	+9HWuP3epNtp+1P1uz9sibmubZTM5U1gbhmCticyumU3hlhV5GNxxc1AEN0hoggzM/rSBRruKy
	51eraEwn97Hj7L/04EEpZ7dcv2y0AjMSNSRyqar9hdkGrnaFEU1Eihho0wK6KBksparEZfgkSG
	6hEJ0WKMTQ9pOZYEdaFrwabG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 19 Jun 2019 16:50:25 -0700
IronPort-SDR: WDU83Sj+srFoTRT+sXH2Roe8/m6EufHmlvRd3JDDQWmZtygGHh3oy89Tn924v1aFamzkZbZkOK
	+Bq0zBL59VvcDs/yAvhTy+dSsjw6M3zFQRteD+OOyGF+UO04/fkeM0vx43WNWLkHj4B9Do/Ips
	pFf0EfTXppMDK3u4yZaPnn01U2JSuxwl9f5RLIHN+1j4jA+0xI94y00HBwTeddbuiLbQltEaCn
	kPk8BznarWuFEVnzUq6+QQnqNgWZWUbwtnm4Y0hU3lIjOHKzoTDX5X/kcU/vyn6oacMx0RpY4Y
	KIg=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 19 Jun 2019 16:51:00 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 16:48:33 -0700
Message-Id: <20190619234833.18178-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619234833.18178-1-alistair.francis@wdc.com>
References: <20190619234833.18178-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemuriscv64: Fix QB_OPT_APPEND overwrite
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
X-List-Received-Date: Wed, 19 Jun 2019 23:50:58 -0000
Content-Transfer-Encoding: 8bit

Avoid overwriting the QB_OPT_APPEND variable.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/qemuriscv64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
index f1be7b8a71..dba8f09e93 100644
--- a/meta/conf/machine/qemuriscv64.conf
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/riscv/qemuriscv.inc
 
-QB_OPT_APPEND = "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
+QB_OPT_APPEND += "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
 UBOOT_MACHINE = "qemu-riscv64_defconfig"
-- 
2.22.0


