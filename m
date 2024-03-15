Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0991C54E5D
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 03:08:17 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.12144.1710472088607620677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 20:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hbRM5I+Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710472089; x=1742008089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a/d7YYCFz/Q4kfJ+I6L5X4rwRU0dtBESAaM0zjhjmZk=;
  b=hbRM5I+YJdhucZiR04DxPaSxmjTAVcGdU0Yw7U6RC0lBiRxNUhPs+vEk
   0CVMBbmBDmUpMkM19bEXqvtFO+GDwIcF8/IKqS4lsOZ/En4fsiOLVp4Q6
   0QzxR/zJfcP5QjomcpZjafmn5wtpZ9kmb8BqBGe4QNyTH0zBlzausTYo+
   ecAZw1M3IOygjuKxPsNeM9bL1TvW0Tys+9G2XOUU1BDVoI/37qVPlX+H9
   viVqAj929hcUNh9O4WM5CnGBZs1E2+7R1XhLnsULVnOYPJPS8aEox0i5n
   sDfezHL60FBX+UJBbmGUb6eQcpNJVet78YrdQjdTlJMznQhE1D8h5syzT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="131697118"
X-IronPort-AV: E=Sophos;i="6.07,127,1708354800"; 
   d="scan'208";a="131697118"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 12:08:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EFAADF2648
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:08:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27754106129
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:08:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B76CB20098E17
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:08:02 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4EEDE1A006C;
	Fri, 15 Mar 2024 11:08:02 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 2/2] glibc: Fix conflict error when enbale multilib on aarch64.
Date: Fri, 15 Mar 2024 11:07:55 +0800
Message-Id: <20240315030755.1180092-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28252.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28252.004
X-TMASE-Result: 10--5.747700-10.000000
X-TMASE-MatchedRID: 9CLtS+2vXX/WzUAcn0Tx4LstbCLHbulSN5dqZcIK7Vgg9R3V8qg5xL8F
	Hrw7frluf146W0iUu2sOdJ5y5E1cRDHeDUGNtezIKiJEqUFWRgh9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrZHBF/Tp/f5VwataGaq/LN6wHJkw8XmTsm3URBhIzA+TcgKcSUZrur0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 03:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197124

From: Lei Maohui <leimaohui@fujitsu.com>

Error: Transaction test error:
  file /usr/include/finclude/math-vector-fortran.h from install of lib32-libc6-dev-2.39+git0+312e159626-r0.armv7ahf_neon conflicts with file from package libc6-dev-2.39+git0+312e159626-r0.aarch64

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1ef987be0a..19eb7afa81 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -167,6 +167,7 @@ do_install_armmultilib () {
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
+	oe_multilib_header finclude/math-vector-fortran.h
 }
 
 
-- 
2.25.1


