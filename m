Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UBU7L-00050U-UQ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:51:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Mar 2013 09:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="297825786"
Received: from unknown (HELO localhost) ([10.255.12.240])
	by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2013 09:34:34 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 11:34:55 -0600
Message-Id: <4e9a2c972a0e3254965fe12cdc8ede1f2acd6faa.1362158882.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1362158882.git.tom.zanussi@linux.intel.com>
References: <cover.1362158882.git.tom.zanussi@linux.intel.com>
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/3] sysprof: upgrade to 1.2.0
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
X-List-Received-Date: Fri, 01 Mar 2013 17:51:37 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 ...PowerPC-checks-for-__NR_perf_counter_open.patch | 35 ----------------------
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch

diff --git a/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch b/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch
deleted file mode 100644
index 041054e..0000000
--- a/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-
-From 4708a509aa9d65ae93e9824e42ddbc6e8d42d90c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
-Date: Sat, 27 Aug 2011 20:04:44 +0200
-Subject: [PATCH] Fix PowerPC checks for __NR_perf_counter_open.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-__ppc__ isn't defined here on Debian powerpc. Grepping through the headers
-installed in /usr/include, there are a few references to __ppc__ and
-__ppc64__, but I suspect they're for other OSs.
-
-Signed-off-by: Michel Dänzer <michel@daenzer.net>
----
- collector.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/collector.c b/collector.c
-index b28964f..fe16967 100644
---- a/collector.c
-+++ b/collector.c
-@@ -175,7 +175,7 @@ sysprof_perf_counter_open (struct perf_counter_attr *attr,
- #define __NR_perf_counter_open 337
- #elif defined(__hppa__)
- #define __NR_perf_counter_open 318
--#elif defined(__ppc__) || defined(__ppc64__)
-+#elif defined(__powerpc__) || defined(__powerpc64__)
- #define __NR_perf_counter_open 319
- #elif defined(__s390__)
- #define __NR_perf_counter_open 331
--- 
-1.7.6.1
-
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 64414c0..c7506fe 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -4,13 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ libglade"
 
-SRCREV = "4692f85f625f4fd969cef4ab5dc47cc4655c87f9"
-PR = "r2"
-PV = "1.1.8+git${SRCPV}"
+SRCREV = "cd44ee6644c3641507fb53b8a2a69137f2971219"
+PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
            file://define-NT_GNU_BUILD_ID.patch \
-	   file://0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch \
           "
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
-- 
1.7.11.4



