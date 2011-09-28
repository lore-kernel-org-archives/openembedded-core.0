Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIs-00041w-An
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360939"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:41 -0700
Message-Id: <ca36a3edf9cede9fa0d73ba1a9538ab467cb5e3c.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/29] gcc: Fix two QA issues
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

a) There is a QA warning from a .so being present in a main package.
   In the case of the plugin library for gcc, this is allowed.
b) Remove the unwanted libiberty.a file with the strange path. We
   don't need/want this and this removes an unpackaged file warning.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-package-sdk.inc    |    4 ++++
 meta/recipes-devtools/gcc/gcc-package-target.inc |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index 8dd4ef7..e2095e3 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -19,6 +19,8 @@ FILES_${PN} = "\
     ${prefix}/${TARGET_SYS}/lib/* \
     ${prefix}/${TARGET_SYS}/usr/include/* \
     "
+INSANE_SKIP_${PN} += "dev-so"
+
 FILES_${PN}-doc = "\
     ${infodir} \
     ${mandir} \
@@ -40,6 +42,8 @@ do_install () {
 
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
+	# Not sure where the strange paths come from
+	rm -f ${D}${libdir}/../lib/libiberty.a
 	rm -f ${D}${libdir}/libiberty.a
 
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index a0e5da4..f0f1a04 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -24,6 +24,8 @@ FILES_${PN} = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
+INSANE_SKIP_${PN} += "dev-so"
+
 FILES_${PN}-dbg += "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
 "
-- 
1.7.6



