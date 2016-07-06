Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 705FB6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 20:56:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2016 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,321,1464678000"; d="scan'208";a="730561629"
Received: from chiulunr-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.210])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2016 13:55:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 08:55:27 +1200
Message-Id: <b999c120aa54bd09eb2bd6d5acd362d01b19a7da.1467838464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467838464.git.paul.eggleton@linux.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467838464.git.paul.eggleton@linux.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] gcc: add runtime packages to RRECOMMENDS
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
X-List-Received-Date: Wed, 06 Jul 2016 20:56:06 -0000

In order to use certain features of gcc, you need the corresponding
runtime library. It seems to me that these ought to be installed by
default when installing the compiler since they are required if certain
command line options are used, so add them to RRECOMMENDS. I used
RRECOMMENDS since some of these packages may or may not exist depending
on architecture and build options; additionally it makes it possible to
use BAD_RECOMMENDATIONS if you really want to exclude them.

The impact of this isn't too bad in the context of an image providing
on-target compilation - about a 30MB increase in size for an image
containing gcc and g++.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 37c5c62..2eac2bc 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -42,6 +42,16 @@ FILES_${PN} = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
 INSANE_SKIP_${PN} += "dev-so"
+RRECOMMENDS_${PN} += "\
+    libssp \
+    libssp-dev \
+    libquadmath \
+    libquadmath-dev \
+    libgomp \
+    libgomp-dev \
+    libitm \
+    libitm-dev \
+"
 
 FILES_${PN}-dev = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
@@ -69,6 +79,11 @@ FILES_g77-symlinks = "\
     ${bindir}/g77 \
     ${bindir}/f77 \
 "
+RRECOMMENDS_g77 = "\
+    libg2c \
+    libg2c-dev \
+"
+
 FILES_gfortran = "\
     ${bindir}/${TARGET_PREFIX}gfortran \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
@@ -98,6 +113,12 @@ FILES_g++-symlinks = "\
     ${bindir}/c++ \
     ${bindir}/g++ \
 "
+RRECOMMENDS_g++ = "\
+    libstdc++ \
+    libstdc++-dev \
+    libatomic \
+    libatomic-dev \
+"
 
 FILES_${PN}-doc = "\
     ${infodir} \
-- 
2.5.5


