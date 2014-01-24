Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB6D36E8CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 18:26:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jan 2014 10:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,714,1384329600"; d="scan'208";a="471993317"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2014 10:26:08 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 20:28:52 +0200
Message-Id: <647489eccaabb173061bb6b9c7aea93116ed2f7d.1390588074.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1390588074.git.cristian.iorga@intel.com>
References: <cover.1390588074.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1390588074.git.cristian.iorga@intel.com>
References: <cover.1390588074.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/1] rpcbind: fixes crash during start
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 18:26:37 -0000

This fix integrates a patch released
after rpcbind 0.2.1 distribution.
0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
fixes the issue of rpcuser not being set in Makefile.am,
which causes rpcbind to immediately exit.

Fixes [YOCTO #5733].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...bind-rpcuser-not-being-set-in-Makefile.am.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
new file mode 100644
index 0000000..b556a46
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
@@ -0,0 +1,34 @@
+From 914507aa6980129fefb4decaabea1a4f60c7182b Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Wed, 21 Aug 2013 14:40:22 -0400
+Subject: [PATCH 1/1] rpcbind: rpcuser not being set in Makefile.am
+
+Upstream-Status: backport
+
+Commit 8d7a0708 cause a regression where the rpcuser id was not
+being set, which in turn cause rpcbind to immediately exit.
+This patch removes the extra ',' that was in the AC_ARG_WITH
+statement in the configure.ac file.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2b67720..1cf42d3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,7 @@ AC_ARG_WITH([statedir],
+ AC_SUBST([statedir], [$with_statedir])
+ 
+ AC_ARG_WITH([rpcuser],
+-  AS_HELP_STRING([--with-rpcuser=ARG], [use ARG for RPC @<:@default=root@:>@]),
++  AS_HELP_STRING([--with-rpcuser=ARG], [use ARG for RPC @<:@default=root@:>@])
+   ,, [with_rpcuser=root])
+ AC_SUBST([rpcuser], [$with_rpcuser])
+  
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index c1c3403..d829f74 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
                     file://src/rpcinfo.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
+           file://0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch \
            file://init.d \
            ${UCLIBCPATCHES} \
            file://rpcbind.conf \
-- 
1.8.3.2


