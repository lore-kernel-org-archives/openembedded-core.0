Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 90E02787ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 03:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 821CE20B35;
	Thu, 11 Jan 2018 03:15:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Jbw9mHthjQAU; Thu, 11 Jan 2018 03:15:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60CF820481;
	Thu, 11 Jan 2018 03:15:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CA2C11631FD;
	Wed, 10 Jan 2018 22:15:57 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 22:15:52 -0500
Message-Id: <1515640552-54778-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] gcc: add flex-native explicit dependency
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
X-List-Received-Date: Thu, 11 Jan 2018 03:15:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

It seems flex is required to build gcc:

| .../work-shared/gcc-7.2.0-r0/gcc-7.2.0/missing: line 81: flex: command not found
| WARNING: 'flex' is missing on your system.
|          You should only need it if you modified a '.l' file.
|          You may want to install the Fast Lexical Analyzer package:
|          <http://flex.sourceforge.net/>
| Makefile:2799: recipe for target 'gengtype-lex.c' failed
| make[1]: [gengtype-lex.c] Error 127 (ignored)

Normally this is handled indirectly throught binutils-cross dependency
pulling in flex-native implicitly. For deterministic builds, this should
be specified explicitly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 1d40cba..d1fb6de 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -10,7 +10,7 @@ BINV = "7.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
 
-DEPENDS =+ "mpfr gmp libmpc zlib"
+DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-- 
2.7.4


