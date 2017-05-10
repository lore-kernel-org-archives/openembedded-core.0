Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3385571ADE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649693"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:23 +0300
Message-Id: <20170510093529.6651-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/11] gdbm: update to 1.13
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
X-List-Received-Date: Wed, 10 May 2017 09:35:28 -0000

Rebase ptest.patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gdbm/files/ptest.patch        | 40 +++++++++++++++-------
 .../gdbm/{gdbm_1.12.bb => gdbm_1.13.bb}            |  4 +--
 2 files changed, 29 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.12.bb => gdbm_1.13.bb} (88%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 65236fb48b1..b9461bec6b3 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,30 +1,41 @@
-Add install-ptest rules.
+From 4e4b70a4a3dcf1fdbee9e68bed3b62f42b197a3a Mon Sep 17 00:00:00 2001
+From: Josep Puigdemont <josep.puigdemont@enea.com>
+Date: Sun, 4 May 2014 16:02:07 +0200
+Subject: [PATCH] Add install-ptest rules.
 
 Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
 
-diff -ur a/Makefile.am b/Makefile.am
---- a/Makefile.am	2011-08-16 10:13:10.000000000 +0200
-+++ b/Makefile.am	2013-04-12 18:02:16.473715873 +0200
-@@ -31,3 +31,8 @@
- 	d=`date '+%d/%m/%Y'`; \
- 	sed 's|/\*@DIST_DATE@\*/|"'"$$d"'"|' $(srcdir)/src/version.c > \
- 		$(distdir)/src/version.c
+---
+ Makefile.am       |  5 +++++
+ tests/Makefile.am | 12 +++++++++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4cdc734..24b99f0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -45,3 +45,8 @@ ChangeLog:
+                 awk -f $(top_srcdir)/git2chg.awk                            \
+                     -v append=$(top_srcdir)/$(prev_change_log) > ChangeLog; \
+         fi
 +
 +install-ptest:
 +	@for subdir in $(SUBDIRS); do \
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
-diff -ur a/tests/Makefile.am b/tests/Makefile.am
---- a/tests/Makefile.am	2011-11-11 19:39:42.000000000 +0100
-+++ b/tests/Makefile.am	2013-04-12 18:30:57.066301037 +0200
-@@ -132,4 +132,14 @@
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 3dbb580..22ffc44 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -130,4 +130,14 @@ dtfetch_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  dtdel_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  
+-
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
- 
++
 +install-ptest: $(check_PROGRAMS) $(TESTSUITE)
 +	@$(INSTALL) -d $(DESTDIR)
 +	@for file in $^; do \
@@ -34,3 +45,6 @@ diff -ur a/tests/Makefile.am b/tests/Makefile.am
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gdbm/gdbm_1.12.bb b/meta/recipes-support/gdbm/gdbm_1.13.bb
similarity index 88%
rename from meta/recipes-support/gdbm/gdbm_1.12.bb
rename to meta/recipes-support/gdbm/gdbm_1.13.bb
index c380073c359..4bbe147df5c 100644
--- a/meta/recipes-support/gdbm/gdbm_1.12.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.13.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "9ce96ff4c99e74295ea19040931c8fb9"
-SRC_URI[sha256sum] = "d97b2166ee867fd6ca5c022efee80702d6f30dd66af0e03ed092285c3af9bcea"
+SRC_URI[md5sum] = "8929dcda2a8de3fd2367bdbf66769376"
+SRC_URI[sha256sum] = "9d252cbd7d793f7b12bcceaddda98d257c14f4d1890d851c386c37207000a253"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.11.0


