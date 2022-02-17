Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587F0C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:57:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by mx.groups.io with SMTP id smtpd.web11.1612.1645113459187215184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 07:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: online.de, ip: 217.72.192.75, mailfrom: martin.beeger@online.de)
Received: from perlenbacher.bvd.indurad.x ([194.8.217.178]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mz9d7-1oFhh40rKd-00wFk3; Thu, 17 Feb 2022 16:57:37 +0100
From: Martin Beeger <martin.beeger@online.de>
To: openembedded-core@lists.openembedded.org
Cc: Martin Beeger <martin.beeger@online.de>
Subject: [PATCHv2] cmake: remove CMAKE_ASM_FLAGS variable in toolchain file
Date: Thu, 17 Feb 2022 16:57:29 +0100
Message-Id: <20220217155729.20280-1-martin.beeger@online.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EPrg18G/NaL4Nhol7rtA/fLiyAYVyfdE4RwcG2EmHTWW7FhSBbA
 vAYFsg5MQSBiTd8s5yJWg/hRinblaQwr3SMsxI59Wrkwh9ESLcgNNdxNleAIlN4n83tEkmK
 W6Hex4KSXOmdFIF1jCGolhEtYN4yt8bhk3gvM5NCi84IKFplsyKLG5/2VlVgRnH3ijKsUxc
 FoPi3dxxKzeXL2c+zrlQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VZ3fdYxiYKA=:ORvTCwaZYVLKGvn8RKN0EH
 GoeTTuOoSpusrqSMqiZ/FuJR4QctKhs0RnmDcCzNA7d0zUc4glRzwzFeQW7lyd3RwRPdtKtBg
 45YhBLWnItM2mOcZyf4eH3C38/UHl7E2UlMFahVMZuBk6t98kkFmbVP9d7lDxikdxJmiQ47VX
 3EHIPMExq3daNfiFUYos1S06wIz/7GCzwZ75C4Iob0WAZMrSxvnVXE6yQj2kIMwcaVEMrDneg
 rQFs7qb3JSAke2lhoNRj0GcLabnRintaiXx0sx+ppom9Wjns83trUfGuIp045Qz9hysC1R6UV
 +XqSY0qdi5ejhQspCkRDbp9JwZjl5rbi3gY+L4YpKi57Q8egfmlZw5i39rbCsAFLwQ9FxRZVE
 7mvogQO+o5hbOgtsD+6uEyK7/WpTTYEdQCf1j4b0M4xu2GhltknLdb+JEvK19rRVbF1lckXGA
 nqZlEwh/9mstvCotOnEKzvWBkYS+wyTyP/0VxR3wQB0W3TksMpNlq+Kh2mYDS3yy2Mwol7nu5
 F+uKxtOgEUlFVew+4DQIRheb3WmdXjWuUIVf9qM2hn48nn3R4Ioih/xzhS0QuYNSLV2jECRbv
 lqXLCKX7Kun/m6o2xlOCOxDNPlYAvwT2rBbBIaS2Xf5IS6TvhmMPYHVpdlM9tXtcOYWVjs/n0
 i9VW/QFa7GZ2HDtjkl5/AuJGgb8xbTLyZpDBlcGzzQl6X9aMV6Cr5ry55Eiw+48Qm7SEE9tHY
 +AvOIp+PskmNiHCt
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 15:57:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161817

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
2.20.1


