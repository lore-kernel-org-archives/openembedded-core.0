Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3886C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 12:57:34 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by mx.groups.io with SMTP id smtpd.web08.6757.1644584253801643061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: online.de, ip: 212.227.17.24, mailfrom: martin.beeger@online.de)
Received: from perlenbacher.bvd.indurad.x ([194.8.217.178]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MN5W7-1nZCta2Wij-00J3RV; Fri, 11 Feb 2022 13:57:31 +0100
From: Martin Beeger <martin.beeger@online.de>
To: openembedded-core@lists.openembedded.org
Cc: Martin Beeger <martin.beeger@online.de>
Subject: [PATCH] cmake: remove bogus CMAKE_LDFLAGS_FLAGS definition from
 toolchain file
Date: Fri, 11 Feb 2022 13:57:14 +0100
Message-Id: <20220211125714.3831-1-martin.beeger@online.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XtT2zxL2J028IRzbUQNKRP3YMjSEwSETtIVq7rvjTX2xweTeXfZ
 EA4QxmziVUKVIcj0mfhkoCgY4Pk2YmG4+wupzPPApw/t6EJ+IKGkqAJy7sllfqn1OoeM+5W
 2hD/lCP52Vp+y0iqjj+R42AXi+cy1syJBXsm2FUYWgdmOEr3J85DOvx+JVN4/0YZzLNGYCf
 Lqnx4WgSSj6PEdQnzCXNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UbavQBkqSbs=:DnvOYJzMlbkhT4WwrBT/Ff
 XZTDkVkfY/BLCMav9V3+Yx7RvqMCAjBf/HboJPDt7iObkey2nKeE9qppKhkvEb0qtRYT82Tra
 ZnsyNlue7ZE3ci35uk7JdXEmfSW1pa3R7UmAGRyumdYOYbxVY5EMeDPD3LCNEc38PhQFDuQ4U
 E71Qk6rn4DCELFk4kWLCDMj0WVCRzhdrstOuljopXl3SLDXcfvYgeOCjnxNpGCTXmboTVGtrG
 uJ8sM7RwARGjiC/8RQR4LgOeRtAWznHptoyhj+jnSpOR7wKeAjXjKgL/0RymYyOyGVYr6SeGN
 cZAjO6t7N2BSVqEDtYuYPuuPER/gV+Zu6pfeS91Tjad2KjHi5/YFovdoyTVhWIRPB2EGQcUS0
 hp+ms6HMFL50cMr1zoePq30o+zPFqpJDo1n0s7oJ8eXRtmRNqOdH11HqlCUKv19BNYCJ7qJjn
 Ov09vjfm1wtpvC9FNCLStU9FgA9UUSE4WW4Gp+gLvBkjLnHh3WgBejq6Z15xozm/t5I5QN/+1
 BvX9gSFYHDb0++ZczmA2VzfeYpOPGxJ0U+yWYcl6bJcrYgSB/6CgddGvDgfyiqp9irhCQL+ft
 JOA6XLgQakPvaCaIECT5AtWSooGv73MozMXK9u71s98Hk4xn1FbzmlUwhPOlconPOex5iIhIi
 F5eEMG/QwtGZYKTZZKyg9PjljtbEt6jI/k9R7fB+EtwUnYs3UH2blHwTUqblx76MqfLumBKHx
 MpXM7WNq6iyBqksE
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 12:57:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161648

As discussion in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
file to configure the toolchain correctly in cross-compile build for recipes
using cmake. The variable CMAKE_LDFLAGS_FLAGS is spelled incorrectly, cmake expects
CMAKE_SHARED_LINKER_FLAGS, CMAKE_STATIC_LINKER_FLAGS, CMAKE_EXE_LINKER_FLAGS and
CMAKE_MODULE_LINKER_FLAGS to be set instead. As cmake already correctly initializes
these from environment there is no need to specify the linker flags in the toolchain
file at all. So this just removes the variable, as its value was also set wrong.

Signed-off-by: Martin Beeger <martin.beeger@online.de>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 8f6f3a272d..86446c3ace 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -2,7 +2,6 @@ set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
 set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-- 
2.20.1


