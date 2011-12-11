Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIO-0003rc-Em
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045462"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:47 -0800
Message-Id: <c2296b934defa32dcb1a7fab0228429bfff76437.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/26] openssl-1.0.0e: Update x32 Configure
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
X-List-Received-Date: Sun, 11 Dec 2011 22:55:02 -0000

From: "H.J. Lu" <hjl.tools@gmail.com>

Make linux-x32 as close to linux-x86_64 as possible:

1. Add -mx32 -DMD32_REG_T=int.
2. Changed to -O3.
3. Remove -pipe -g -feliminate-unused-debug-types.
4. Remove -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS.
5. Add :::x32 for multilib.

Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
---
 .../openssl-1.0.0e/openssl_fix_for_x32.patch       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
index 10de986..2dbcd01 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
@@ -14,7 +14,7 @@ Index: openssl-1.0.0e/Configure
  "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
-+"linux-x32",	"gcc:-DL_ENDIAN 	-DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-x32", "gcc:-mx32 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::x32",
  "linux-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
  #### SPARC Linux setups
  # Ray Miller <ray.miller@computing-services.oxford.ac.uk> has patiently
-- 
1.7.6.4



