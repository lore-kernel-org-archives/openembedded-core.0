Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E614A77D7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:11:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 02:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="1155289635"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2017 02:11:10 -0700
From: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 17:11:18 +0800
Message-Id: <1492074678-128188-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ghostscript: separate objarch.h based on architecture
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
X-List-Received-Date: Thu, 13 Apr 2017 09:11:10 -0000

From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>

The following warning occurs when building with meta-zephyr
with MACHINE set to arduino-101-sss:

WARNING: /srv/sdc/builds/11319/meta/recipes-extended/ghostscript/ghostscript_9.20.bb: Unable to get checksum for ghostscript SRC_URI entry objarch.h: file could not be found

This is due to the the TUNE_FEATURES for meta-zephyr is not available
and cause bitbake unable to locate the correct config file during
recipe parse.

This will introduce a new variable ${ARCHFILE} to segregate objarch.h
based on architecture. For the architecture that are not listed, recipe
shall not parsed with objarch.h and shall not introduce warnings.

[YOCTO #11344]

Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../ghostscript/ghostscript_9.20.bb                | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index e8fc5df..163f06a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -29,9 +29,9 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
 SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-prevent_recompiling.patch \
            file://ghostscript-9.02-genarch.patch \
-           file://objarch.h \
            file://cups-no-gcrypt.patch \
            file://CVE-2017-7207.patch \
+           ${ARCHFILE} \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
@@ -42,6 +42,42 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
 SRC_URI[md5sum] = "93c5987cd3ab341108be1ebbaadc24fe"
 SRC_URI[sha256sum] = "949b64b46ecf8906db54a94ecf83ab97534ebf946f770d3c3f283cb469cb6e14"
 
+ARCHFILE ?= ""
+
+ARCHFILE_aarch64 = "file://objarch.h"
+
+ARCHFILE_arm = "file://objarch.h"
+
+ARCHFILE_armeb = "file://objarch.h"
+
+ARCHFILE_i586 = "file://objarch.h"
+
+ARCHFILE_i686 = "file://objarch.h"
+
+ARCHFILE_microblazeeb = "file://objarch.h"
+
+ARCHFILE_microblazeel = "file://objarch.h"
+
+ARCHFILE_mipsarchn32eb = "file://objarch.h"
+
+ARCHFILE_mipsarchn32el = "file://objarch.h"
+
+ARCHFILE_mipsarchn64eb = "file://objarch.h"
+
+ARCHFILE_mipsarchn64el = "file://objarch.h"
+
+ARCHFILE_mipsarcho32eb = "file://objarch.h"
+
+ARCHFILE_mipsarcho32el = "file://objarch.h"
+
+ARCHFILE_nios2 = "file://objarch.h"
+
+ARCHFILE_powerpc = "file://objarch.h"
+
+ARCHFILE_powerpc64 = "file://objarch.h"
+
+ARCHFILE_x86-64 = "file://objarch.h"
+
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
-- 
2.7.4


