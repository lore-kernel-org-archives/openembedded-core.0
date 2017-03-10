Return-Path: <ismo.puustinen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C69FD7769A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:16:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 10 Mar 2017 02:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="942802137"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 10 Mar 2017 02:16:30 -0800
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 12:10:25 +0200
Message-Id: <20170310101025.28634-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <CAMKF1sqL-AY9gnZsEJEg-zE7Mm-aZEBu5dv=Qp2mK0_WHyZOyA@mail.gmail.com>
References: <CAMKF1sqL-AY9gnZsEJEg-zE7Mm-aZEBu5dv=Qp2mK0_WHyZOyA@mail.gmail.com>
Subject: [PATCH v2] gcc: move cc1 binary file to package cpp.
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
X-List-Received-Date: Fri, 10 Mar 2017 10:16:31 -0000

The file /usr/libexec/gcc/.../cc1 has been installed in package gcc
instead of package cpp, because FILES statements for both packages match
the cc1 binary. Move the file to package cpp and add cpp to RDEPENDS_gcc
to fix the dependency.

Having the cc1 binary in cpp fixes errors such as: "cpp: error trying to
exec 'cc1': execvp: No such file or directory".

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index f436fa2..b245bdd 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -31,7 +31,7 @@ PACKAGES = "\
 FILES_${PN} = "\
     ${bindir}/${TARGET_PREFIX}gcc* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2* \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
@@ -46,6 +46,7 @@ RRECOMMENDS_${PN} += "\
     libssp \
     libssp-dev \
 "
+RDEPENDS_${PN} += "cpp"
 
 FILES_${PN}-dev = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
-- 
2.9.3


