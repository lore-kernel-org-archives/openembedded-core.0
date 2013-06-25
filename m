Return-Path: <Adrian.Dudau@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D7D95605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 14:14:28 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 25 Jun 2013 16:14:24 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4451)	id 30C4E28838E;
	Tue, 25 Jun 2013 16:14:24 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2013 16:14:17 +0200
Message-ID: <1372169657-58393-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] dbus-ptest: Install missing files
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
X-List-Received-Date: Tue, 25 Jun 2013 14:14:29 -0000
Content-Type: text/plain

Install files from EXTRA_DIST needed for some tests.
Add configure parameter with-dbus-test-dir to specify where the test
tools are located.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta/recipes-core/dbus/dbus-1.6.8/ptest.patch |   20 +++++++++++++++-----
 meta/recipes-core/dbus/dbus-ptest_1.6.8.bb    |    1 +
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-1.6.8/ptest.patch b/meta/recipes-core/dbus/dbus-1.6.8/ptest.patch
index 106bfb4..263d17e 100644
--- a/meta/recipes-core/dbus/dbus-1.6.8/ptest.patch
+++ b/meta/recipes-core/dbus/dbus-1.6.8/ptest.patch
@@ -76,7 +76,7 @@ diff -ur a/test/Makefile.am b/test/Makefile.am
  	$(NULL)
  
  test_corrupt_SOURCES = corrupt.c
-@@ -325,3 +326,18 @@
+@@ -325,3 +325,25 @@
  data/valid-config-files/system.conf: $(top_builddir)/bus/system.conf
  	$(AM_V_at)$(MKDIR_P) data/valid-config-files
  	$(AM_V_GEN)cp $< $@
@@ -91,26 +91,36 @@ diff -ur a/test/Makefile.am b/test/Makefile.am
 +
 +install-ptest-nonrecursive:
 +	@$(MKDIR_P) $(DESTDIR)/data/valid-config-files/session.d
-+	@for file in Makefile $(installable_tests) $(EXTRA_DIST) $(noinst_DATA); do \
-+		install -D $${file%.in} $(DESTDIR)/$${file%.in}; \
++	@for file in Makefile $(installable_tests) $(noinst_PROGRAMS) $(noinst_DATA) ; do \
++		if [ -f .libs/$$file ]; then \
++			install .libs/$$file $(DESTDIR); \
++		else \
++			install -D $${file%.in} $(DESTDIR)/$${file%.in}; \
++		fi; \
++	done;
++	@for file in $(EXTRA_DIST); do \
++		install -D ${srcdir}/$${file%.in} $(DESTDIR)/$${file%.in}; \
 +	done;
 +endif
 diff -ur a/test/name-test/Makefile.am b/test/name-test/Makefile.am
 --- a/test/name-test/Makefile.am	2012-12-06 14:34:01.169413931 +0100
 +++ b/test/name-test/Makefile.am	2012-12-06 15:21:14.459112518 +0100
-@@ -36,4 +36,13 @@
+@@ -36,4 +36,16 @@
  test_privserver_client_LDADD=../libdbus-testutils.la
  test_autolaunch_LDADD=../libdbus-testutils.la
  
 +install-ptest:
 +	@$(MKDIR_P) $(DESTDIR)
-+	@for file in Makefile $(noinst_PROGRAMS) $(EXTRA_DIST); do \
++	@for file in Makefile $(noinst_PROGRAMS); do \
 +		if [ -f .libs/$$file ]; then \
 +			install .libs/$$file $(DESTDIR); \
 +		else \
 +			install $$file $(DESTDIR); \
 +		fi \
 +	done;
++	@for file in $(EXTRA_DIST); do \
++		cp $(srcdir)/$$file $(DESTDIR); \
++	done;
  endif
 diff -ur a/tools/Makefile.am b/tools/Makefile.am
 --- a/tools/Makefile.am	2012-12-06 14:34:01.161414276 +0100
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
index d00819a..8d21666 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-libaudit \
                 --with-xml=expat \
                 --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
+                --with-dbus-test-dir=${PTEST_PATH} \
                 ${EXTRA_OECONF_X}"
 
 do_install() {
-- 
1.7.10.4


