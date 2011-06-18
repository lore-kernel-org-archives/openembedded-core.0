Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QXuvP-0002dV-8e
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 14:46:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5IChORT015699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 05:43:25 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 18 Jun 2011 05:43:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jun 2011 20:41:35 +0800
Message-ID: <42574f1bebc1fdf79c9662a22ca0a86d12a8f221.1308391365.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308391365.git.liezhi.yang@windriver.com>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6 V3] gcc-crosssdk: share work directories
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
X-List-Received-Date: Sat, 18 Jun 2011 12:46:55 -0000
Content-Type: text/plain

The gcc-crosssdk.inc edited the files of config/*/linux*.h in ${S},
which made the source incompatible. Copy config to config-sdk, and edit
the files in config-sdk, configure will read the files in it when build
gcc-crosssdk.

The sed command for configure is more complicated than for configure.ac,
this is because there is such a line /boot/home/config/ in it, we should
not substitute it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-crosssdk.inc |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 6e7d5a7..fdba6df 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -9,8 +9,17 @@ GCCMULTILIB = "--disable-multilib"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc-nativesdk gettext-native"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
 
+export BUILD_GCC_SDK = "-sdk"
 do_configure_prepend () {
 	# Change the default dynamic linker path to the one in the SDK
-	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
-	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
+	[ ! -d ${S}/gcc/config-sdk ] && cp -r ${S}/gcc/config ${S}/gcc/config-sdk/
+	sed -i ${S}/gcc/configure.ac -e 's#config/#config\$BUILD_GCC_SDK/#'
+	sed -i ${S}/gcc/configure -e 's# config/# config\$BUILD_GCC_SDK/#' \
+		-e 's#\${srcdir}/config/#\${srcdir}/config\$BUILD_GCC_SDK/#' \
+		-e 's#\$srcdir/config/#\$srcdir/config\$BUILD_GCC_SDK/#' \
+		-e 's#\$(srcdir)/config/#\$(srcdir)/config\$BUILD_GCC_SDK/#' \
+		-e "s#\$(srcdir)'/config/#\$(srcdir)'/config\$BUILD_GCC_SDK/#"
+
+	sed -i ${S}/gcc/config-sdk/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
+	sed -i ${S}/gcc/config-sdk/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
 }
-- 
1.7.1



