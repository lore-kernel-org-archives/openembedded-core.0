Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5Da-000497-LH
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 10:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564244"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:41 -0800
Message-Id: <5aa11ec2b6b5e04608c63c14490373af32cbb8ed.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/15] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Fri, 09 Dec 2011 18:30:46 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

time_t is 64bit and long int is 32bit on x32.  But gnulib used in
findutils assumes time_t values fit into long int.  Such assumption is
invalid for x32 and should be removed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
---
 .../findutils-4.4.2_fix_for_x32.patch              |   36 ++++++++++++++++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    5 ++-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils-4.4.2_fix_for_x32.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils-4.4.2_fix_for_x32.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils-4.4.2_fix_for_x32.patch
new file mode 100644
index 0000000..484f8a4
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils-4.4.2_fix_for_x32.patch
@@ -0,0 +1,36 @@
+UpstreamStatus: Pending
+
+Author: H.J. Lu <hjl.tools@gmail.com>
+
+time_t is 64bit and long int is 32bit on x32.  But gnulib used in
+findutils assumes time_t values fit into long int.  Such assumption is
+invalid for x32 and should be removed.
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
index cfc6546..af9649e 100644
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
+            file://findutils-4.4.2_fix_for_x32.patch "
 
 SRC_URI[md5sum] = "351cc4adb07d54877fa15f75fb77d39f"
 SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a"
-- 
1.7.6.4



