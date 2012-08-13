Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12Ap-00059a-G6
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:27:43 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C3AC73042C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:42 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:14:50 -0700
Message-Id: <aa010039a38188f1b1b38a978287d1597138b8b9.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C3AC73042C.A965D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 09/32] gcc: gcc-cross-canadian: use correct location for libraries for powerpc64
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
X-List-Received-Date: Mon, 13 Aug 2012 21:27:44 -0000

From: Matthew McClintock <msm@freescale.com>

This fixes the issue where gcc invokes the linker with an incorrect -L
library location and gives up because it can't find libraries. It was
looking in a /lib folder instead of /lib64

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 32545eb..c71312e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r26"
+PR = "r27"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
index da3210f..74f983d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
@@ -9,8 +9,8 @@ DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 
 SYSTEMHEADERS = "/usr/include"
-SYSTEMLIBS = "/lib/"
-SYSTEMLIBS1 = "/usr/lib/"
+SYSTEMLIBS = "${target_base_libdir}/"
+SYSTEMLIBS1 = "${target_libdir}/"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
 		--disable-libgomp --disable-libmudflap \
-- 
1.7.9.5



