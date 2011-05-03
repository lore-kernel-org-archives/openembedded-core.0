Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJg-0001zm-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 May 2011 16:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="429934677"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2011 16:44:54 -0700
Message-Id: <ea6f96c94b5101fb4963be9ff5ae437d55b4b1e2.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Sat, 30 Apr 2011 11:19:59 -0700
Date: Tue, 03 May 2011 16:44:54 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 26/33] alsa-utils_1.0.24.2.bb: Fix build for uclibc targets
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
X-List-Received-Date: Tue, 03 May 2011 23:47:44 -0000

From: Khem Raj <raj.khem@gmail.com>

uclibc does not have exp10() implemented so we obtain
same behaviour using pow()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc-exp10-replacement.patch                 |   21 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 ++-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
new file mode 100644
index 0000000..038c90d
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
@@ -0,0 +1,21 @@
+uclibc does not have exp10 function which is glibc extension.
+Bur we can get the same behavior by using pow()
+
+Upstream-status: Pending
+
+Khem Raj <raj.khem@gmail.com>
+
+Index: alsa-utils-1.0.24.2/alsamixer/volume_mapping.c
+===================================================================
+--- alsa-utils-1.0.24.2.orig/alsamixer/volume_mapping.c
++++ alsa-utils-1.0.24.2/alsamixer/volume_mapping.c
+@@ -36,6 +36,9 @@
+ #include <math.h>
+ #include <stdbool.h>
+ #include "volume_mapping.h"
++#ifdef __UCLIBC__
++#define exp10(x) (pow(10, (x)))
++#endif /* __UCLIBC__ */
+ 
+ #define MAX_LINEAR_DB_SCALE	24
+ 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index c882bfd..4cb31a9 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -9,7 +9,9 @@ DEPENDS = "alsa-lib ncurses"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://ncursesfix.patch"
+           file://ncursesfix.patch \
+           file://uclibc-exp10-replacement.patch \
+          "
 
 SRC_URI[md5sum] = "8238cd57cb301d1c36bcf0ecb59ce6b2"
 SRC_URI[sha256sum] = "95127f740291086486c06c28118cabca0814bde48fd14dac041a9812a5ac1be2"
-- 
1.7.4.1



