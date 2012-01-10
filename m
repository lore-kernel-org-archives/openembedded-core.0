Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmh-00042N-At
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535263"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:11 -0800
Message-Id: <98b25f7f4e8141bfbadded14db44b947fed68fab.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/22] util-linux: Enable fallocate and use CACHED_CONFIGUREVARS
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
X-List-Received-Date: Tue, 10 Jan 2012 06:04:36 -0000

From: Khem Raj <raj.khem@gmail.com>

fallocate is implemented in eglibc 2.11 and all eglibc
we use are greater than 2.11 so drop disabling it.

Use CACHED_CONFIGUREVARS to specify scanf_cv_type_modifier=as

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.20.1.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.20.1.bb b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
index aa2c6ff..ed445d7 100644
--- a/meta/recipes-core/util-linux/util-linux_2.20.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.20"
-PR = "r1"
+PR = "r2"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -39,9 +39,7 @@ do_remove_lscpu() {
 
 addtask remove_lscpu before do_configure after do_patch
 
-# fallocate is glibc 2.10, fallocate64 is glibc 2.11
-# we need to disable it for older versions
-EXTRA_OECONF += "ac_cv_func_fallocate=no scanf_cv_type_modifier=as"
+CACHED_CONFIGUREVARS += "scanf_cv_type_modifier=as"
 EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
 
 do_install_append () {
-- 
1.7.6.5



