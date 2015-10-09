Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8016D7703A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 16:59:31 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so78925894wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 09:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oJ+Rk0x0NYXM3MTkfNucT9hOav6udvgzuIgI/B86PSI=;
	b=CJtCayoo6VfFY3tOpfKZMC0b7Qy2Y51i1k0wd8FmZbz9ufjPFaLpKrJ7Tdxzh+Fkjr
	Y3FpdG1I9UupmSMV3l1A7KASu+8F2o9Y5N9H+XGdhDPt/SuRnID3SGYRZBG0kvCDLnLr
	EZ7kh+jbXFy8exNJrfHqT/6bEz8/bjNDfGBUscc/oB7shD7+6b8yD1ofkSbaRomOWPFH
	rwxgKXzRsnBfBUn7PuHh+J0fnkrrMZRmr+mqgUOOdfR+1fvTOi1CmhUTodfYM/rPTY4a
	JfWargnG41SluS5lAyIWf/G8JdutMKKs2qxfPw8c9PQZeDxUGlFtXBepVjXkoTw6EHRG
	fPBA==
X-Gm-Message-State: ALoCoQn2QCIu9hfJzBzNpWSkDV4Ibvb+eYfZGvXt7mUxqP+upZ/JofOrrJmkNS5puVFfk6Q4oPPr
X-Received: by 10.194.93.35 with SMTP id cr3mr15583136wjb.46.1444409970724;
	Fri, 09 Oct 2015 09:59:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ld5sm3139120wjc.18.2015.10.09.09.59.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Oct 2015 09:59:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Oct 2015 17:52:06 +0100
Message-Id: <1444409526-31948-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] icu: fix install race
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
X-List-Received-Date: Fri, 09 Oct 2015 16:59:33 -0000

ICU was invoking install-local twice in parallel which can lead to install
failures as one install deletes files the other is attempting to chown.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-support/icu/icu/fix-install-manx.patch | 48 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_55.1.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/fix-install-manx.patch

diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
new file mode 100644
index 0000000..ec63f50
--- /dev/null
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -0,0 +1,48 @@
+The generic recursive target calls target-local so also adding it to the
+dependency list results in races due to install-local being executed twice in
+parallel.  For example, install-manx can fail if the two install processes race
+and one process tries to chown a file that the other process has just deleted.
+
+Also install-manx should be a phony target, and for clarity use $^ instead of $?
+in the install command.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+diff --git a/Makefile.in b/Makefile.in
+index 9db6c52..3441afa 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -71,7 +71,7 @@ EXTRA_DATA =
+ 
+ ## List of phony targets
+ .PHONY : all all-local all-recursive install install-local install-udata install-udata-files install-udata-dlls		\
+-install-recursive clean clean-local clean-recursive distclean		\
++install-recursive install-manx clean clean-local clean-recursive distclean		\
+ distclean-local distclean-recursive doc dist dist-local dist-recursive	\
+ check check-local check-recursive clean-recursive-with-twist install-icu \
+ doc install-doc tests icu4j-data icu4j-data-install update-windows-makefiles xcheck-local xcheck-recursive xperf xcheck xperf-recursive \
+@@ -82,10 +82,10 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
+ 
+ ## List of standard targets
+ all: all-local all-recursive
+-install: install-recursive install-local
++install: install-recursive
+ clean: clean-recursive-with-twist clean-local
+-distclean : distclean-recursive distclean-local
+-dist: dist-recursive dist-local
++distclean : distclean-recursive
++dist: dist-recursive
+ check: all check-recursive
+ check-recursive: all
+ xcheck: all xcheck-recursive
+@@ -352,7 +352,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
+ 
+ install-manx: $(MANX_FILES)
+ 	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
+-	$(INSTALL_DATA) $? $(DESTDIR)$(mandir)/man$(SECTION)
++	$(INSTALL_DATA) $^ $(DESTDIR)$(mandir)/man$(SECTION)
+ 
+ config/%.$(SECTION): $(srcdir)/config/%.$(SECTION).in
+ 	cd $(top_builddir) \
diff --git a/meta/recipes-support/icu/icu_55.1.bb b/meta/recipes-support/icu/icu_55.1.bb
index f63a9bd..2661fd30 100644
--- a/meta/recipes-support/icu/icu_55.1.bb
+++ b/meta/recipes-support/icu/icu_55.1.bb
@@ -11,6 +11,7 @@ ICU_PV = "${@icu_download_version(d)}"
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
+           file://fix-install-manx.patch \
           "
 
 SRC_URI_append_class-target = "\
-- 
2.1.4


