Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1Qiyl1-0003Qq-8p
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 03:05:57 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id D59B61C01DF9;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
X-Auth-Info: QwU0fjf/rkYacHihTLM0kEyjs2aTpbkvJUWW4MeFoGE=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id C82611C000AC;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id 9C52434003F;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id 786684BFF; Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 03:00:57 +0200
Message-Id: <1311037258-11777-7-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
References: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH 6/7] gcc_4.5.1: add pr45052.patch
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
X-List-Received-Date: Tue, 19 Jul 2011 01:05:58 -0000

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
1.7.6



