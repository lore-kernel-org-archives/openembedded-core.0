Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtRk-0002no-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 09:58:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 May 2011 00:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="688482125"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2011 00:55:12 -0700
Message-Id: <3dd451937aa975c52d303229d4960066d3765281.1304581769.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Sat, 30 Apr 2011 14:49:03 -0700
Date: Thu, 05 May 2011  0:55:12 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 08/26] gcc-4.6.0: Add missing recipes for gcc-cross-canadian and gcc-crosssdk
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
X-List-Received-Date: Thu, 05 May 2011 07:58:05 -0000

From: Khem Raj <raj.khem@gmail.com>

Reset PR in gcc-crosssdk-initial_4.6.0.bb and
gcc-crosssdk-intermediate_4.6.0.bb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-cross-canadian_4.6.0.bb                |   23 ++++++++++++++++++++
 .../gcc/gcc-crosssdk-initial_4.6.0.bb              |    2 -
 .../gcc/gcc-crosssdk-intermediate_4.6.0.bb         |    2 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb    |    2 +
 4 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bb
new file mode 100644
index 0000000..da3210f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bb
@@ -0,0 +1,23 @@
+inherit cross-canadian
+
+require gcc-${PV}.inc
+require gcc-cross-canadian.inc
+require gcc-configure-sdk.inc
+require gcc-package-sdk.inc
+
+DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
+RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
+
+SYSTEMHEADERS = "/usr/include"
+SYSTEMLIBS = "/lib/"
+SYSTEMLIBS1 = "/usr/lib/"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
+		--disable-libgomp --disable-libmudflap \
+		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
+		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+# to find libmpfr
+# export LD_LIBRARY_PATH = "{STAGING_DIR_HOST}${layout_exec_prefix}"
+
+PARALLEL_MAKE = ""
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
index 9708248..0c9fdd3 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
@@ -1,4 +1,2 @@
 require gcc-cross-initial_${PV}.bb
 require gcc-crosssdk-initial.inc
-
-PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
index d235969..1aa588a 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
@@ -1,4 +1,2 @@
 require gcc-cross-intermediate_${PV}.bb
 require gcc-crosssdk-intermediate.inc
-
-PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb
new file mode 100644
index 0000000..7430888
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-crosssdk.inc
-- 
1.7.1.1



