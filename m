Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TylGm-0003N1-Ch
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:32:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2013 07:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,538,1355126400"; d="scan'208";a="278402425"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.155])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2013 07:17:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 15:17:06 +0000
Message-Id: <1359127026-8657-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] valgrind: explicitly disable MPI2 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 15:32:56 -0000

We don't have support for this in OE-Core, so ensure we don't pick this
up from the build host if e.g. openmpi development files happen to be
installed there.

Fixes [YOCTO #3726].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 0bf6ef4..690652a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -32,8 +32,8 @@ COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-tls"
-EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi"
+EXTRA_OECONF = "--enable-tls --without-mpicc"
+EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
 EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
-- 
1.7.10.4



