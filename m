Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C45A77016E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 03:27:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18892531"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 May 2017 11:27:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 76FAE47C613D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:27:38 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 16 May 2017 11:27:38 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 May 2017 11:27:20 +0800
Message-ID: <1494905240-41304-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 76FAE47C613D.A91DB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gdbm: 1.12 -> 1.13
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
X-List-Received-Date: Tue, 16 May 2017 03:27:53 -0000
Content-Type: text/plain

1) Upgrade gdbm from 1.12 to 1.13.
2) Modify one patch "ptest.patch", since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/gdbm/files/ptest.patch        | 42 +++++++++++++++-------
 .../gdbm/{gdbm_1.12.bb => gdbm_1.13.bb}            |  4 +--
 2 files changed, 31 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.12.bb => gdbm_1.13.bb} (88%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 65236fb..101169c 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -1,30 +1,42 @@
-Add install-ptest rules.
+From f8b8f64183f924e172f8e19f96ff2eed163e6c41 Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Tue, 16 May 2017 00:23:00 +0900
+Subject: [PATCH] Add install-ptest rules.
 
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
-Upstream-Status: Pending
+---
+ Makefile.am       |  5 +++++
+ tests/Makefile.am | 11 +++++++++++
+ 2 files changed, 16 insertions(+)
 
-diff -ur a/Makefile.am b/Makefile.am
---- a/Makefile.am	2011-08-16 10:13:10.000000000 +0200
-+++ b/Makefile.am	2013-04-12 18:02:16.473715873 +0200
-@@ -31,3 +31,8 @@
- 	d=`date '+%d/%m/%Y'`; \
+diff --git a/Makefile.am b/Makefile.am
+index 4cdc734..41052a4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -34,6 +34,11 @@ dist-hook:
  	sed 's|/\*@DIST_DATE@\*/|"'"$$d"'"|' $(srcdir)/src/version.c > \
  		$(distdir)/src/version.c
-+
+ 
 +install-ptest:
 +	@for subdir in $(SUBDIRS); do \
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
-diff -ur a/tests/Makefile.am b/tests/Makefile.am
---- a/tests/Makefile.am	2011-11-11 19:39:42.000000000 +0100
-+++ b/tests/Makefile.am	2013-04-12 18:30:57.066301037 +0200
-@@ -132,4 +132,14 @@
++
+ gen_start_date = 2016-07-08
+ prev_change_log = ChangeLog.cvs
+ 
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 3dbb580..af80652 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -130,4 +130,15 @@ dtfetch_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  dtdel_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
  
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
- 
++
 +install-ptest: $(check_PROGRAMS) $(TESTSUITE)
 +	@$(INSTALL) -d $(DESTDIR)
 +	@for file in $^; do \
@@ -34,3 +46,7 @@ diff -ur a/tests/Makefile.am b/tests/Makefile.am
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/gdbm/gdbm_1.12.bb b/meta/recipes-support/gdbm/gdbm_1.13.bb
similarity index 88%
rename from meta/recipes-support/gdbm/gdbm_1.12.bb
rename to meta/recipes-support/gdbm/gdbm_1.13.bb
index c380073..4bbe147 100644
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
2.7.4




