Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD40C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 16:51:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mx.groups.io with SMTP id smtpd.web09.29758.1658163060710129594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 09:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: online.de, ip: 212.227.126.130, mailfrom: martin.beeger@online.de)
Received: from perlenbacher.bvd.indurad.x ([194.8.217.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQdtO-1nr0r700YQ-00Neqo; Mon, 18 Jul 2022 18:50:59 +0200
From: Martin Beeger <martin.beeger@online.de>
To: openembedded-core@lists.openembedded.org
Cc: Martin Beeger <martin.beeger@online.de>
Subject: [PATCH v2] cmake: remove CMAKE_ASM_FLAGS variable in toolchain file
Date: Mon, 18 Jul 2022 18:50:23 +0200
Message-Id: <20220718165023.422662-1-martin.beeger@online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2lrwbktVJ31yt/3HJn/elwv4+bhpTbNV/lO01HWzpzV9oyOUKoh
 Uc7YrzVIqJwHFTP3gHbXtPAkekvm+CZJkh2494OQYN+jumoD8PHdxQmGgiQAZY7lH0MoNv7
 G8qfHNRcPdshZq6BIvgWLMVuWrm/oUN3DEaky2cWqey2CGiYKyVh/CoMYVAWbrArCt+kCDB
 gq+uc14jLlaWHxdgdar3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sMZPDlzHB8c=:wKJnqVxRV/GeFj/SPS3vZg
 j5Dd6G7SwBaCObf1Lc9FgAnf+Mys8LEi7wMh82ZyMAMpJAMS0/q8a+9bEBWXVpQavQS0wF2ZA
 7owfvDSeNDd7DRP/Xlg2maB1saPeJ04qdPBOLOoqUBCGMZKem2/WptE2p526DBPBL64bKBEqC
 ARtuQvHCHIUMVA0mUQlk6dLldbCZ8+x4Sb3F5tQgcog2gZOb0hjtlX6h2beBMLHOWC0zU3wjQ
 /9/aZMJzKJv2kCdRfZAmreD6JD6vfdHxyTvNoOCbdwcXM2u5bYM9K100q6niuPn6PZIXUmgQz
 R+BZm55PNn6D3a6J77pemrZirYEseelh+xqKw1Vb++iKRq9AFpZCgii8meeKMbSsUXyIY0WnJ
 ZtzV3qGxUU2Dgv1lN2VMoUXY0jpbAXLbjLD54zldSFJYE+ekwbcqe+b7XS6jndMihNcoOK5cc
 3ShHiBIFhtTuauWpj9PK3ugf5UYtMO6reYDQuLVhb+IBaP+63v+jqaXdbkkv6nkMpUgwg8Pig
 kKw3KxO0Z3Aoke47xR6DGVj7Ao2z25XQM8setLvrmQ7WQsebb2y1nixDXr8PcsN/Q9IeIkWl7
 LdwnW2RzQ9CKZrgQd1053aIIWXqR880IjSKPelxek1LR0yLyXDQKMxqKL7enVw8R9j4EgZy5S
 +aATDNM935oGm03Sr1oyK1qBBvpbwrdBsm0bY7NSbPGuv0iElgh/0TL6UE5GPLACnkN4X/KzF
 9Pp/0UGDVNMWgRLzaaivL7OsMDJiVL8pftXslRqyxMKEyHqACDzsXACMsH0=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 16:51:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168243

As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
file to configure the toolchain correctly in cross-compile build for recipes
using cmake. The CMAKE_ASM_FLAGS are the configuration are meant for  assembly,
but the spelling is incorrect and the Flag is ASFLAGS for gcc and other compilers.
So this variable might neever have worked and it is better for
recipes to specify their own.

Signed-off-by: Martin Beeger <martin.beeger@online.de>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 86446c3ace..3ddef12c83 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -1,7 +1,6 @@
 set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-- 
2.30.2


