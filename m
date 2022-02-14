Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D0DC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:38:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mx.groups.io with SMTP id smtpd.web09.35705.1644853111543842975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: online.de, ip: 212.227.126.130, mailfrom: martin.beeger@online.de)
Received: from perlenbacher.bvd.indurad.x ([194.8.217.178]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MRCFw-1ngdvN2ZFs-00NANV; Mon, 14 Feb 2022 16:38:29 +0100
From: Martin Beeger <martin.beeger@online.de>
To: openembedded-core@lists.openembedded.org
Cc: Martin Beeger <martin.beeger@online.de>
Subject: [PATCH] cmake: read asm flags correctly from environment in toolchain
 file
Date: Mon, 14 Feb 2022 16:38:07 +0100
Message-Id: <20220214153807.21216-1-martin.beeger@online.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q2APk+lTJZClmA39wQFf6fP7Fyf07Eoe9YXtCaFNpkB9OBuavSV
 gEkg3ewi0PpdbCyEphAXPwKfBZqzs7og57Vj36Ww0yCU71e7zTVJKw68n/YCwlA2Ipt8VWI
 YVkPDA/52PfBDwaI9oJpIlnSITlEL3PM13tHdNeroqiM0+3fV+oGfYth4pqWvNTfL1M4kjc
 W+HOpq+642TMKrBdz5rnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WTlUM0fH62k=:grlIqHVO2w4alx+tAM7w+Z
 3bKxlWkApJ2rd68FLNksb2LTRTE2WO1LPe67yFNYAsXTh+7pmN+djwHeWVPz5qg1u1M78tlZV
 fBSMy3aTTclBpS1bjwST7/4ktYXlsp9bN0mynueNvhP10twQ6s0lh+vtq7C6P0alXnLHRr6y+
 7nAjbDh0/nT9MIGahxEjmYIz3ru9fCZANh9dKHDB3E2Mm2rIB5+OjVtYoSMAeP3RSDAkNa1Dq
 H4zDz8Ns8snxIO73NYnzZorxFxCA/PN+va07n3UiSP+dg9P8ij5dt67mH94HNpAjVT5z2xl5y
 2RQfugdUqC8pK3Mr97n7zoZxJhjqouFptchHmUzWcxDd5lzTdyblOWY2Uk0IXbo3Ik7BB/bTe
 f7IN+qzRXGIWMS8qe2KHDQu3lkG1duA9Kz7/gSf97Dbz384XY1vMcRiCz/WGzZAAO/VosS8aG
 KzTcBtqXWRA5AG4yaD1acGmmCUHmRkdrueMtSsuLH01SQ/+p/FATRzTOI0TEljuMPB32n6Az3
 RUTcqRXDgPdmjPYtmorbJMvrAjTfo6olK4fq0eDlYFvFeaZfDSlwEaLt8YBGAKDV5gpckTFDr
 VbHsF6TTUBbAh/mFJOXkgaPUDE4K4uOBq0mRGrEHFxu2StWkcTjDJf60bIUlYwMA9TUYtBntZ
 9xb8S1k+W3pL2MYoDWQhY3BKocv7t1JnDqMGfr2oxY+p9ZHRG/5+8Tc81KX4JfadoD6Q6g+Mm
 xddrzB119WhjYKfm
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:38:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161713

As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
file to configure the toolchain correctly in cross-compile build for recipes
using cmake. The CMAKE_ASM_FLAGS are the configuration for inline assembly,
and these are set in toolchain environment via the ASMFLAGS variable.
This changes the toolchain so cmake correctly picks up the given ASMFLAGS
instead of errorneously forcing the C flags instead.

Signed-off-by: Martin Beeger <martin.beeger@online.de>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 86446c3ace..3513d05b2f 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -1,7 +1,7 @@
 set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_ASM_FLAGS $ENV{ASMFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-- 
2.20.1


