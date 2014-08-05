Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57BF6609B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 08:37:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s758bHls004513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Aug 2014 01:37:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 5 Aug 2014 01:37:16 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Aug 2014 16:33:47 +0800
Message-ID: <74981f17a6e413de376a24ca45126e7f8c16482b.1407227521.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407227521.git.Chong.Lu@windriver.com>
References: <cover.1407227521.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] strace: fix ptest execution failure
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
X-List-Received-Date: Tue, 05 Aug 2014 08:37:22 -0000
Content-Type: text/plain

ptest needs runtest-TESTS target.
serial-tests is required to generate this target.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../strace/strace-4.8/Makefile-ptest.patch              | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
index f5556b2..3a0eb39 100644
--- a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
@@ -1,11 +1,13 @@
 strace: Add ptest
 
+Upstream-Status: Inappropriate
+
 Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
-Upstream-Status: Pending
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 
 --- old/tests/Makefile.am	2013-07-23 13:44:24.660481381 +0200
 +++ new/tests/Makefile.am	2013-07-23 16:22:42.937654391 +0200
-@@ -9,3 +9,20 @@
+@@ -9,3 +9,21 @@
  EXTRA_DIST = init.sh $(TESTS)
  
  CLEANFILES = check.log
@@ -18,6 +20,7 @@ Upstream-Status: Pending
 +	install -d $(DESTDIR)/$(TESTDIR)
 +	cp $(BUILDDIR)/$(TESTDIR)/Makefile $(DESTDIR)/$(TESTDIR)
 +	sed -i -e 's/^Makefile:/_Makefile:/' $(DESTDIR)/$(TESTDIR)/Makefile
++	sed -i -e 's/bash/sh/' $(DESTDIR)/$(TESTDIR)/Makefile
 +	for file in $(check_PROGRAMS); do \
 +		install $(BUILDDIR)/$(TESTDIR)/$$file $(DESTDIR)/$(TESTDIR); \
 +	done
@@ -26,3 +29,13 @@ Upstream-Status: Pending
 +		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
 +	sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/net
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,7 +6,7 @@ AC_INIT([strace],
+ AC_CONFIG_SRCDIR([strace.c])
+ AC_CONFIG_AUX_DIR([.])
+ AC_CONFIG_HEADERS([config.h])
+-AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules])
++AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules serial-tests])
+ AM_MAINTAINER_MODE
+ AC_CANONICAL_HOST
-- 
1.9.1


