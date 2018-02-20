Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E10D7844B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:25:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1KGPJ5B006956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Feb 2018 08:25:19 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 20 Feb 2018 08:25:00 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 20 Feb 2018 11:25:17 -0500
Message-ID: <1519143917-11799-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1519143917-11799-1-git-send-email-bruce.ashfield@windriver.com>
References: <1519143917-11799-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v3] make-mod-scripts: add build requirements for external modules
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
X-List-Received-Date: Tue, 20 Feb 2018 16:25:19 -0000
Content-Type: text/plain

Newer kernels (4.14/v4.15+) have dependencies for the build of
modules (and hence external modules). Without these dependencies
explicitly in the build chain, you can end up with build failures like:

  work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25: fatal
  error: openssl/bio.h: No such file or directory
  |  #include <openssl/bio.h>
  |                          ^
  | compilation terminated.
  | make[2]: *** [scripts/extract-cert] Error 1
  | make[1]: *** [scripts] Error 2

To ensure that these headers are in place, and that the scripts use
our build environment flags, we add a dependency on openssl-native
and use oe_make to invoke the build.

Older kernels have no issues with the extra dependency, so there's no
need to make this conditional.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v3: added bc-native to DEPENDS

 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 6e47d09f798f..889878ddc003 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -9,15 +9,19 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}"
 
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
+DEPENDS += "bc-native"
+
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
 #
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
 	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
 }
 
-- 
2.5.0


