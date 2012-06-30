Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sl57p-0003zT-1k
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 23:22:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jun 2012 14:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="165195282"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.207])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2012 14:11:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2012 22:11:25 +0100
Message-Id: <dc734f13bf30361489f49ccec6262f463b54430c.1341090544.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341090544.git.paul.eggleton@linux.intel.com>
References: <cover.1341090544.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1341090544.git.paul.eggleton@linux.intel.com>
References: <cover.1341090544.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] site/common-linux: fix incorrect size of pid_t for apr
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
X-List-Received-Date: Sat, 30 Jun 2012 21:22:41 -0000

If cross-compiling, apr's configure script assumes that pid_t is
64-bit which is wrong - it appears that 32-bit is a safe assumption
for Linux no matter what the architecture, so use that instead by
default.

This fixes Apache writing garbage to its pid file when built using apr
produced from this recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    2 +-
 meta/site/common-linux                |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 54c47fe..896f79f 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
diff --git a/meta/site/common-linux b/meta/site/common-linux
index f441abb..8a9146e 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -1,5 +1,6 @@
 # apr
 ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
+ac_cv_sizeof_pid_t=${ac_cv_sizeof_pid_t=4}
 
 # samba
 samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
-- 
1.7.9.5



