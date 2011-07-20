Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDJ-0001aO-NF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753300"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:15 -0700
Message-Id: <a34e79e061406ec30a7a9bbb7e8e2bb49e83b2dd.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 28/50] gcc_4.5.1: add pr45052.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:12 -0000

From: Ilya Yanok <yanok@emcraft.com>

Add fix for PR45052 as proposed in
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45052

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc           |    1 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch |   30 +++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 2473775..03dca08 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -62,6 +62,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://pr44290.patch \
 	   file://pr44606.patch \
 	   file://pr45094.patch \
+	   file://pr45052.patch \
 	  "
 	
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch
new file mode 100644
index 0000000..855a823
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/pr45052.patch
@@ -0,0 +1,30 @@
+From 138f1af2d77d56762a2c2af4759efd53c275b67e Mon Sep 17 00:00:00 2001
+From: Ilya Yanok <yanok@emcraft.com>
+Date: Mon, 21 Mar 2011 00:49:43 +0100
+Subject: [PATCH 5/6] PR45052
+
+---
+ gcc/ipa-pure-const.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/gcc/ipa-pure-const.c b/gcc/ipa-pure-const.c
+index 166dabb..da9d5d6 100644
+--- a/gcc/ipa-pure-const.c
++++ b/gcc/ipa-pure-const.c
+@@ -416,6 +416,13 @@ check_stmt (gimple_stmt_iterator *gsip, funct_state local, bool ipa)
+       print_gimple_stmt (dump_file, stmt, 0, 0);
+     }
+ 
++  if (gimple_has_volatile_ops (stmt))
++    {
++      local->pure_const_state = IPA_NEITHER;
++      if (dump_file)
++	fprintf (dump_file, "    Volatile stmt is not const/pure\n");
++    }
++
+   /* Look for loads and stores.  */
+   walk_stmt_load_store_ops (stmt, local, check_load, check_store);
+ 
+-- 
+1.7.4
+
-- 
1.7.3.4



