Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOcx-0001K5-OB
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283887"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:21 -0700
Message-Id: <d458e779e829b31f8d5f7de2ada6685af1458e4c.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/51] gettext_0.18.1.1.bb: Fix build on uclibc
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:36 -0000

From: Khem Raj <raj.khem@gmail.com>

Use libc-uclibc override to seprate out uclibc bits
instead of using TARGET_OS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnulib-uclibc-sched_param-def.patch            |   21 ++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    7 +++--
 2 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..d8d10db
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
@@ -0,0 +1,21 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+Upstream-Status: Pending
+
+Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/spawn.in.h
+===================================================================
+--- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/spawn.in.h
++++ gettext-0.18.1.1/gettext-tools/gnulib-lib/spawn.in.h
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 5f5f164..f54c111 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -12,11 +12,12 @@ PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = ""
 CONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
-           file://wchar-uclibc.patch \
           "
 
-SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
-SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
+SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
+                               file://gettext-error_print_progname.patch \
+                               file://gnulib-uclibc-sched_param-def.patch \
+                             "
 
 SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
 SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
-- 
1.7.3.4



