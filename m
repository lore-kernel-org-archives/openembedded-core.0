Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYWx7-00031R-PW
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 06:55:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Dec 2011 21:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83495552"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2011 21:48:35 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	hjl.tools@gmail.com
Date: Wed,  7 Dec 2011 21:48:27 -0800
Message-Id: <7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
References: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
Subject: [PATCH 05/11] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Thu, 08 Dec 2011 05:55:30 -0000

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



