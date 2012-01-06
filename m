Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RizxN-0004jl-Fl
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 03:55:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2012 18:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="95035376"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2012 18:47:33 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 18:47:31 -0800
Message-Id: <87b36a8c64f96232ffbcef6b6de086ad9779067a.1325817957.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325817957.git.nitin.a.kamble@intel.com>
References: <cover.1325817957.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] autoconf: fix nativesdk rdepends
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
X-List-Received-Date: Fri, 06 Jan 2012 02:55:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes this build error:

| error: Failed dependencies:
| 	m4 is needed by autoconf-nativesdk-2.68-r4.x86_64
| 	gnu-config is needed by autoconf-nativesdk-2.68-r4.x86_64
NOTE: package meta-toolchain-1.0-r6: task do_populate_sdk: Failed
ERROR: Task 8 (.../meta/recipes-core/meta/meta-toolchain.bb,
do_populate_sdk) failed with exit code '1'

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |    2 ++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 1d0cf90..e7ae339 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -9,6 +9,8 @@ DEPENDS += "m4-native"
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
 DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 RDEPENDS_${PN} = "m4 gnu-config"
+RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
+RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
 	   file://program_prefix.patch"
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 84eb182..63db7d1 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r4"
+PR = "r5"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.6.4



