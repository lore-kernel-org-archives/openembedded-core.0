Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnZs-0003oZ-P6
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 06:28:31 +0100
Received: by yenq1 with SMTP id q1so1491752yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HwD7rcUID5P3M8rJGSPCYb10nmqwkHl/EOG5mJBSLLg=;
	b=Bsnr0KeaQRAeUzCvaNWIT4Y31z+Kh3S9Qhaxfhgj4lfchtRCITNsFe5/rdKBVW1jLJ
	cRi3xLPwMOG03NU+zVRovgnm93QAJmVEJ44F8yttpIvphbrg9bmc2GCgE2sRHNCb2woU
	tDW3vLUACKjYAw59604LsvNuXFhdwsbRcosn0=
Received: by 10.236.186.10 with SMTP id v10mr16593098yhm.54.1323148899210;
	Mon, 05 Dec 2011 21:21:39 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l19sm57929084anc.14.2011.12.05.21.21.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:21:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:21:18 -0800
Message-Id: <e5ce46588b46dfc85f307e4113faaef1543b7e43.1323148566.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
References: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] gcc-4.6: Enable PPL and ClooG support
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
X-List-Received-Date: Tue, 06 Dec 2011 05:28:31 -0000

This will enable graphite framework in gcc
For more information
http://gcc.gnu.org/wiki/Graphite

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |   13 ++++++++-----
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |    4 ++--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 7cd0850..bc655fe 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r18"
+PR = "r19"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -22,8 +22,8 @@ SRCREV = 181430
 BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
-DEPENDS =+ "mpfr gmp libmpc"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
+DEPENDS =+ "mpfr gmp libmpc ppl cloog-ppl"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native ppl-native cloog-ppl-native"
 
 LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
 
@@ -89,13 +89,16 @@ JAVA = ""
 #			--disable-bootstrap \
 #			--disable-libgomp \
 #			--disable-libmudflap"
-EXTRA_OECONF_BASE = " --enable-lto \
+EXTRA_OECONF_BASE = "   --enable-lto \
 			--enable-libssp \
 			--disable-bootstrap \
 			--disable-libgomp \
 			--disable-libmudflap \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
-			--enable-cheaders=c_global "
+			--enable-cheaders=c_global \
+			--with-ppl \
+			--with-cloog \
+			"
 
 EXTRA_OECONF_INITIAL = "--disable-libmudflap \
 			--disable-libgomp \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
index da3210f..600d58f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
@@ -5,8 +5,8 @@ require gcc-cross-canadian.inc
 require gcc-configure-sdk.inc
 require gcc-package-sdk.inc
 
-DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
-RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
+DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk ppl-nativesdk cloog-ppl-nativesdk"
+RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk ppl-nativesdk cloog-ppl-nativesdk"
 
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "/lib/"
-- 
1.7.5.4



