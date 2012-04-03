Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q7-0001mM-LY
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlHS8029709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:06 -0500
Message-ID: <225993394954568c1dcd040de4b0e3ca36fadb5f.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 6/7] conf/machine/include: Update SH tunings to match README
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:28 -0000
Content-Type: text/plain

Update the experimental SH tunings to match the tunings README.

These tunings have not been tested, and are experimental!

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/sh/README      |   11 ++++++++++
 meta/conf/machine/include/sh/arch-sh.inc |    9 ++++++++
 meta/conf/machine/include/tune-sh3.inc   |   19 +++++++++++++++--
 meta/conf/machine/include/tune-sh4.inc   |   32 +++++++++++++++++++++++++++--
 4 files changed, 65 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/machine/include/sh/README
 create mode 100644 meta/conf/machine/include/sh/arch-sh.inc

diff --git a/meta/conf/machine/include/sh/README b/meta/conf/machine/include/sh/README
new file mode 100644
index 0000000..b351acd
--- /dev/null
+++ b/meta/conf/machine/include/sh/README
@@ -0,0 +1,11 @@
+2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
+ - Initial Revision
+
+Both big endian and little endian are defined for SH.
+
+Experimental -- SH tunings have not been validated.
+
+The TUNE_ARCH is defined as ${TUNE_ARCH_tune-${DEFAULTTUNE}}.
+
+The TUNE_PKGARCH is defind as ${TUNE_PKGARCH_tune-${DEFAULTTUNE}}.
+
diff --git a/meta/conf/machine/include/sh/arch-sh.inc b/meta/conf/machine/include/sh/arch-sh.inc
new file mode 100644
index 0000000..cde59fe
--- /dev/null
+++ b/meta/conf/machine/include/sh/arch-sh.inc
@@ -0,0 +1,9 @@
+# SH Architecture definition
+
+DEFAULTTUNE ?= "sh"
+
+TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
+TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
+
+TUNEVALID[bigendian] = "Enabled big-endian mode."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-mb", "-ml", d)}"
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
index dd12cd4..816c9c4 100644
--- a/meta/conf/machine/include/tune-sh3.inc
+++ b/meta/conf/machine/include/tune-sh3.inc
@@ -1,4 +1,17 @@
-TUNE_ARCH = "sh3"
+DEFAULTTUNE ?= "sh3"
 
-TUNE_CCARGS = "-ml -m3"
-TUNE_PKGARCH = "sh3"
+require conf/machine/include/sh/arch-sh.inc
+
+TUNEVALID[sh3] = "Enable SH3 optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "sh3", "-m3", "", d)}"
+
+AVAILTUNES += "sh3 sh3eb"
+TUNE_FEATURES_tune-sh3 = "sh3"
+TUNE_ARCH_tune-sh3 = "sh3"
+TUNE_PKGARCH_tune-sh3 = "sh3"
+PACKAGE_EXTRA_ARCHS_tune-sh3 = "sh sh3"
+
+TUNE_FEATURES_tune-sh3eb = "sh3eb"
+TUNE_ARCH_tune-sh3eb = "sh3eb"
+TUNE_PKGARCH_tune-sh3eb = "sh3eb"
+PACKAGE_EXTRA_ARCHS_tune-sh3eb = "sheb sh3eb"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
index 473122c..f971f23 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/tune-sh4.inc
@@ -1,8 +1,34 @@
-TUNE_ARCH = "sh4"
+DEFAULTTUNE ?= "sh4"
+
+# Pull in sh4 for compatibility...
+require conf/machine/include/sh/arch-sh.inc
+
+TUNEVALID[sh4] = "Enable SH4 optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "sh4", "-m4", "", d)}"
 
 # NOTE: If you want to optimize to sh4a, conf/machine/include/tune-sh4a.inc.
 # But it is not compatible for sh4.
 # The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
+TUNEVALID[sh4a] = "Enable SH4a optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "sh4a", "-m4a", "", d)}"
+
+AVAILTUNES += "sh4 sh4eb sh4a sh4aeb"
+TUNE_FEATURES_tune-sh4 = "sh4"
+TUNE_ARCH_tune-sh4 = "sh4"
+TUNE_PKGARCH_tune-sh4 = "sh4"
+PACKAGE_EXTRA_ARCHS_tune-sh4 = "sh sh4"
+
+TUNE_FEATURES_tune-sh4eb = "sh4eb"
+TUNE_ARCH_tune-sh4eb = "sh4eb"
+TUNE_PKGARCH_tune-sh4eb = "sh4eb"
+PACKAGE_EXTRA_ARCHS_tune-sh4eb = "sheb sh4eb"
+
+TUNE_FEATURES_tune-sh4a = "sh4a"
+TUNE_ARCH_tune-sh4a = "sh4"
+TUNE_PKGARCH_tune-sh4a = "sh4a"
+PACKAGE_EXTRA_ARCHS_tune-sh4a = "sh sh4 sh4a"
 
-TUNE_CCARGS = "-ml -m4"
-TUNE_PKGARCH = "sh4"
+TUNE_FEATURES_tune-sh4aeb = "sh4aeb"
+TUNE_ARCH_tune-sh4aeb = "sh4eb"
+TUNE_PKGARCH_tune-sh4aeb = "sh4aeb"
+PACKAGE_EXTRA_ARCHS_tune-sh4aeb = "sheb sh4eb sh4aeb"
-- 
1.7.1



