Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIK-0003re-7D
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:54:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045457"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:47:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:42 -0800
Message-Id: <5df4c71d64345df9e6015656167fe4a4988fef13.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/26] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Sun, 11 Dec 2011 22:54:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Work around gnulib time_t assumption in findutils for x32

time_t is 64bit and long int is 32bit on x32.  But gnulib used in
findutils assumes time_t values fit into long int.  Such assumption is
invalid for x32 and should be removed.

This patch is a workaround to compile gnulib for x32.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
---
 .../findutils-4.4.2/findutils_fix_for_x32.patch    |   40 ++++++++++++++++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    5 +-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
new file mode 100644
index 0000000..dd2ab0e
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
@@ -0,0 +1,40 @@
+UpstreamStatus: Pending
+
+Author: H.J. Lu <hjl.tools@gmail.com>
+
+Work around gnulib time_t assumption in findutils for x32
+
+time_t is 64bit and long int is 32bit on x32.  But gnulib used in
+findutils assumes time_t values fit into long int.  Such assumption is
+invalid for x32 and should be removed.
+
+This patch is a workaround to compile gnulib for x32.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
+
+
+Index: findutils-4.4.2/gnulib/lib/getdate.y
+===================================================================
+--- findutils-4.4.2.orig/gnulib/lib/getdate.y
++++ findutils-4.4.2/gnulib/lib/getdate.y
+@@ -114,7 +114,6 @@
+    wraps around, but there's no portable way to check for that at
+    compile-time.  */
+ verify (TYPE_IS_INTEGER (time_t));
+-verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
+ 
+ /* An integer value, and the number of digits in its textual
+    representation.  */
+Index: findutils-4.4.2/gnulib/lib/mktime.c
+===================================================================
+--- findutils-4.4.2.orig/gnulib/lib/mktime.c
++++ findutils-4.4.2/gnulib/lib/mktime.c
+@@ -166,7 +166,7 @@ ydhms_diff (long int year1, long int yda
+ {
+   verify (C99_integer_division, -1 / 2 == 0);
+   verify (long_int_year_and_yday_are_wide_enough,
+-	  INT_MAX <= LONG_MAX / 2 || TIME_T_MAX <= UINT_MAX);
++	  INT_MAX <= TIME_T_MAX / 2 || TIME_T_MAX <= UINT_MAX);
+ 
+   /* Compute intervening leap days correctly even if year is negative.
+      Take care to avoid integer overflow here.  */
diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index cfc6546..c25ba4c 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -1,10 +1,11 @@
 require findutils.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://01-27017.patch \
             file://02-28824.patch \
-            file://03-28872.patch"
+            file://03-28872.patch \
+            file://findutils_fix_for_x32.patch "
 
 SRC_URI[md5sum] = "351cc4adb07d54877fa15f75fb77d39f"
 SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a"
-- 
1.7.6.4



