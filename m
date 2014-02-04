Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6031B6C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 16:22:30 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so13159008wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 08:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/e4KOQqea3yIC6Bh07+ekFfxReuxbw4+6842TXbQfDU=;
	b=kxMr88qeMC8B1JpscgeV36GiG/mDtdwniXpXEQb5g4KRqFbzdnHhjX9hkZojZHHP+D
	x4e8CgAdosSUVlVJ2kG2orJPf6OT5RE9D0MJ7c1xpwcJ5dblRFtO9OukobMh2KsRg/JK
	H6IPWEFfa++rk/dAchxqHuH5OehDL6pMrIDii1Yg0rKkRWy8Ot2DASvL9yZV3mzYiiwH
	VlBq+Wk9FLeT7U4CQ+cYR30AXB9fVsoM+1tzFTp6wJ3sGJ0sYskIwtpsqiXBdVcWg0cm
	Zx75HK6mYZ3luXodDBXhkM1ut9z0TXsYvVmdhGdgeeYgry1RgiM6O0CTb+6UT6a9Pf2t
	Gb3w==
X-Gm-Message-State: ALoCoQm7niPmgpCgvomuxMZwgyj5it7HB9UMhvmSSK8JaKvcB+OVXyBcsIeqjXogYHTlInBbw6/A
X-Received: by 10.180.198.52 with SMTP id iz20mr13175019wic.59.1391530950486; 
	Tue, 04 Feb 2014 08:22:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	q15sm53909812wjw.18.2014.02.04.08.22.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Feb 2014 08:22:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 16:16:29 +0000
Message-Id: <1391530589-1800-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: fix race in parallel builds
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
X-List-Received-Date: Tue, 04 Feb 2014 16:22:31 -0000

There is a race condition in the makefile that can result in build failures like
this in parallel builds:

| ./gdbus-test-codegen-generated.h:7:0: error: unterminated #ifndef
|  #ifndef __GDBUS_TEST_CODEGEN_GENERATED_H__

Fix the rules to stop this happening.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/gio-test-race.patch          |   54 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |    1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch b/meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch
new file mode 100644
index 0000000..720ea6c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/gio-test-race.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From a047a0270ee5faf1d9d6080cbc613defdf52baea Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 4 Feb 2014 13:15:08 +0000
+Subject: [PATCH] gio/tests: fix race when generating code
+
+There is a race condition in the makefile that can result in build failures like this in parallel builds:
+
+| ./gdbus-test-codegen-generated.h:7:0: error: unterminated #ifndef
+|  #ifndef __GDBUS_TEST_CODEGEN_GENERATED_H__
+
+This is because a rule like this:
+
+x.c x.h: prerequisites
+	@commands
+
+doesn't consider x.c and x.h together. Instead, it expands to two rules, one to
+generate x.c and one to generate x.h, which happen to run the same commands.  In
+the worst case they execute in parallel, overwriting each other's output.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+https://bugzilla.gnome.org/show_bug.cgi?id=723616
+---
+ gio/tests/Makefile.am |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
+index 0beb239..270faf6 100644
+--- a/gio/tests/Makefile.am
++++ b/gio/tests/Makefile.am
+@@ -436,7 +436,7 @@ gmenumodel_SOURCES                       = $(gdbus_sessionbus_sources) gmenumode
+ gnotification_SOURCES                    = $(gdbus_sessionbus_sources) gnotification.c gnotification-server.h gnotification-server.c
+ 
+ gdbus-test-codegen.o: gdbus-test-codegen-generated.h
+-gdbus-test-codegen-generated.h gdbus-test-codegen-generated.c: test-codegen.xml Makefile $(top_builddir)/gio/gdbus-2.0/codegen/gdbus-codegen
++gdbus-test-codegen-generated.h: test-codegen.xml Makefile $(top_builddir)/gio/gdbus-2.0/codegen/gdbus-codegen
+ 	$(AM_V_GEN) UNINSTALLED_GLIB_SRCDIR=$(top_srcdir) \
+ 		UNINSTALLED_GLIB_BUILDDIR=$(top_builddir) \
+ 		$(PYTHON) $(top_builddir)/gio/gdbus-2.0/codegen/gdbus-codegen \
+@@ -455,6 +455,8 @@ gdbus-test-codegen-generated.h gdbus-test-codegen-generated.c: test-codegen.xml
+ 		--annotate "org.project.Bar::TestSignal[array_of_strings]" Key8 Value8 \
+ 		$(srcdir)/test-codegen.xml \
+ 		$(NULL)
++gdbus-test-codegen-generated.c: gdbus-test-codegen-generated.h
++	@: # Generated as side-effect of .h
+ 
+ EXTRA_DIST += test-codegen.xml
+ CLEANFILES += gdbus-test-codegen-generated.[ch] gdbus-test-codegen-generated-doc-*.xml
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index 161f7da..6c336f7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://ptest-dbus.patch \
            file://ptest-paths.patch \
            file://gtest-skip-fixes.patch \
+           file://gio-test-race.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.7.10.4


