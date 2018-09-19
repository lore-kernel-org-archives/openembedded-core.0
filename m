Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B297754E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:27:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8J8QwVD001233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 01:27:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 19 Sep 2018 01:26:47 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Sep 2018 16:26:46 +0800
Message-ID: <1537345606-127913-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssl10: fix compile error for debian-mips64
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
X-List-Received-Date: Wed, 19 Sep 2018 08:27:17 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Current configuration for debian-mips64 is not correct,
'SIXTY_FOUR_BIT_LONG' need to be specified. otherwise,
it will cause other recipe like crda compile failed since
use default THIRTY_TWO_BIT mode.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../openssl/openssl10/debian/debian-targets.patch                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
index 35d92be..24709f4 100644
--- a/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
@@ -42,8 +42,8 @@ Index: openssl-1.0.2n/Configure
 +"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"debian-mipsn32",   "mips64-linux-gnuabin32-gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"debian-mipsn32el",   "mips64el-linux-gnuabin32-gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mips64",   "mips64-linux-gnuabi64-gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mips64el",   "mips64el-linux-gnuabi64-gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-mips64",   "mips64-linux-gnuabi64-gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-mips64el",   "mips64el-linux-gnuabi64-gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS ${debian_cflags} -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS ${debian_cflags}::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS ${debian_cflags} -mv8::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-- 
2.7.4


