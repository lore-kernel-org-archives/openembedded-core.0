Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4E870588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 18:40:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6GIeEJx007290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 11:40:15 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 11:40:14 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 11:40:14 -0700
Message-ID: <1405536014-16921-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: (resending) [PATCH 1/1] rpm: compile rpmqv.c instead of rpmqv.cc
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
X-List-Received-Date: Wed, 16 Jul 2014 18:40:22 -0000
Content-Type: text/plain

Some versions of gcc will put a reference to __gxx_personality_v0
into rpm.o and rpmbuild.o.  This means we must link using g++,
and Makefile does not.

Go back to using rpmqv.c (which is currently identical to rpmqv.cc).

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   25 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
new file mode 100644
index 0000000..0996448
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
@@ -0,0 +1,25 @@
+
+Some versions of gcc, 4.4.5 for example, will put a reference to __gxx_personality_v0
+into rpm.o and rpmbuild.o.  This means we must link with g++, and the Makefile we
+generate does not.
+
+So, go back to using rpmqv.c (which is currently identical to rpmqv.cc).
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -127,13 +127,13 @@ rpm_SOURCES =		build.c
+ rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
+ rpm_LDADD =		rpm.o $(myLDADD)
+ rpm.o:	$(top_srcdir)/rpmqv.c
+-	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $(top_srcdir)/rpmqv.cc
++	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $(top_srcdir)/rpmqv.c
+ 
+ rpmbuild_SOURCES =	build.c
+ rpmbuild_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
+ rpmbuild_LDADD =	rpmbuild.o $(myLDADD)
+ rpmbuild.o: $(top_srcdir)/rpmqv.c
+-	$(COMPILE) -DIAM_RPMBT -o $@ -c $(top_srcdir)/rpmqv.cc
++	$(COMPILE) -DIAM_RPMBT -o $@ -c $(top_srcdir)/rpmqv.c
+ 
+ .PHONY:	splint
+ splint:
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 15c1738..8fec656 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -92,6 +92,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-fix-logio-cp.patch \
 	   file://rpm-db5-or-db6.patch \
 	   file://rpm-disable-Wno-override-init.patch \
+	   file://rpmqv_cc_b_gone.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.3.4


