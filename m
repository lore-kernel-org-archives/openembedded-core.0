Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QepLk-0006n6-TX
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:14:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2011 07:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24486680"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 07:10:50 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  7 Jul 2011 22:10:10 +0800
Message-Id: <997e3b4b171cae48b81a47536a27cc81f4d620a6.1310047266.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
Subject: [PATCH 6/8] perl: fix for non /usr/lib libdir case
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
X-List-Received-Date: Thu, 07 Jul 2011 14:14:41 -0000

the config.sh is hardcoded to be /usr/lib, which does not work in non
/usr/lib libdir case.

This patch replace the hard code /usr/lib with ${libdir} to fix this issue

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-devtools/perl/perl_5.12.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index b053482..88dcfdd 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -8,7 +8,7 @@ PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r1"
+PR = "r2"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -150,6 +150,7 @@ do_configure() {
                -e 's,@ARCH@-thread-multi,,g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                -e "s%/usr/include%${STAGING_INCDIR}%g" \
+	       -e 's,/usr/lib/,${libdir}/,g' \
 	       -e 's,/usr/,${exec_prefix}/,g' \
 	       -e 's,/perl5,/perl,g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
-- 
1.7.0.4



