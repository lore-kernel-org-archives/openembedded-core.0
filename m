Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1Qiykp-0003QU-U7
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 03:05:49 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 9077A1C1D9FB;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
X-Auth-Info: QwU0fjf/rkYacHihTLM0kEyjs2aTpbkvJUWW4MeFoGE=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 7B3941C000AC;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id 38457340049;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id E3DD44BFD; Tue, 19 Jul 2011 03:01:38 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 03:00:52 +0200
Message-Id: <1311037258-11777-2-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
References: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH 1/7] gcc_4.5.1: fix arm_bswapsi2.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 01:05:53 -0000

Acoording to http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44392
correct fix should be
TARGET_EITHER && (arm_arch6 || !optimize_size)
not
TARGET_EITHER && (arm_arch6 && !optimize_size)

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
index 9b9f874..a7a6684 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
@@ -9,7 +9,7 @@ Index: gcc-4.5/gcc/config/arm/arm.md
    [(set (match_operand:SI 0 "s_register_operand" "=r")
    	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
 -"TARGET_EITHER"
-+"TARGET_EITHER && (arm_arch6 && !optimize_size)"
++"TARGET_EITHER && (arm_arch6 || !optimize_size)"
  "
    if (!arm_arch6)
      {
-- 
1.7.6



