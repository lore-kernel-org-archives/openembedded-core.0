Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAD76FE5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:03:41 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so2608703wib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 10:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iANbuIPLjvh059eXm492tN5JGQLG8LkxB0x1aS4eLYI=;
	b=N3ZPqS3i8i+dWOSjCohMD1s9iAJfgYsUqyO8KXt8x8+IyTFWqxvTVldEVXc0YRC/Mv
	yG4qpaCMXLfPxqcezNsAYLJyGXzB1zkHqhQJ8nZp8Km7wF8XQdmm7+rR3aHbngzX/xTc
	3yLFdU6kkbq8ttifWHAH52orCzRtLwguIytdPrh4HfbqwY2FvWTHWAfw8rwFswBoueEx
	HoXD6c8qPsEt2DXp5Ave1hjCZulymka0xCBAEbrMzejAD9cdDqmZcWU16islqbMduohY
	kamjV2hbgRApN59qMXuOEm6WPqdKrkff0Uy82CQ/c7OWUvRcVUhrlb/3Hy9EV6eUTIfi
	PW7g==
X-Gm-Message-State: ALoCoQkfxP7dCEiG97RwQTcA3U6PITKKcnTI7tBnvdgZYCgGWZB7LK1kx7dBzawVU3A+z0QGz1P6
X-Received: by 10.194.84.101 with SMTP id x5mr6179490wjy.52.1402679022537;
	Fri, 13 Jun 2014 10:03:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bq7sm3481115wib.7.2014.06.13.10.03.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jun 2014 10:03:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 18:03:32 +0100
Message-Id: <1402679012-15451-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] neard: fix more parallel build issues
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
X-List-Received-Date: Fri, 13 Jun 2014 17:03:47 -0000

One fix, another appears...  root-cause to a magic dependency hiding at the
bottom of the Makefile, and add all binaries to it.

[ YOCTO #6416 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../neard/neard/Fix-snep-send-parallel-build.patch |   31 ---------------
 .../neard/neard/parallel-build.patch               |   40 ++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb      |    2 +-
 3 files changed, 41 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch
 create mode 100644 meta/recipes-connectivity/neard/neard/parallel-build.patch

diff --git a/meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch b/meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch
deleted file mode 100644
index f302992..0000000
--- a/meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fbbf600df474865172b47212d94e3dc5013cc2df Mon Sep 17 00:00:00 2001
-From: Cristian Iorga <cristian.iorga@intel.com>
-Date: Wed, 4 Jun 2014 16:40:18 +0300
-Subject: [PATCH] tools: Fix snep-send parallel build
-
-tools/snep-send object might cause a
-parallel build failure,due to undetected
-dependency on dbus.h header file.
-
-Upstream-Status: Pending
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 26f49e7..0e4a5b5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -169,6 +169,8 @@ tools_snep_send_SOURCES = $(gdbus_sources) src/log.c src/dbus.c \
- 					src/agent.c
- tools_snep_send_LDADD = ${GLIB_LIBS} ${DBUS_LIBS}
- 
-+tools/snep-send.$(OBJEXT): include/near/dbus.h
-+
- tools_nfctool_nfctool_SOURCES = tools/nfctool/main.c \
- 					tools/nfctool/nfctool.h \
- 					tools/nfctool/adapter.h \
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/neard/neard/parallel-build.patch b/meta/recipes-connectivity/neard/neard/parallel-build.patch
new file mode 100644
index 0000000..1837ad0
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/parallel-build.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 488e898300f7a4ab9ba73307967ae9e02b7a6511 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 13 Jun 2014 17:49:45 +0100
+Subject: [PATCH] Makefile: add missing binaries to dependency on
+ local_headers
+
+seeld and snap_send were missing from the rule that generates the header symlink
+farm, resulting in headers not being available in highly parallel builds.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile.am |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c51351f..8e58ac1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -254,7 +254,14 @@ se/plugin.$(OBJEXT): se/builtin.h
+ se/builtin.h: src/genbuiltin $(builtin_se_sources)
+ 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_se_modules) > $@
+ 
+-$(src_neard_OBJECTS) $(tools_nfctool_nfctool_OBJECTS) $(plugin_objects): $(local_headers)
++$(src_neard_OBJECTS) \
++$(tools_nfctool_nfctool_OBJECTS) \
++$(plugin_objects) \
++$(se_seeld_OBJECTS) \
++$(unit_test_ndef_parse_OBJECTS) \
++$(unit_test_ndef_build_OBJECTS) \
++$(unit_test_snep-read_OBJECTS) \
++$(tools_snep_send_OBJECTS): $(local_headers)
+ 
+ include/near/version.h: include/version.h
+ 	$(AM_V_at)$(MKDIR_P) include/near
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
index 663d7ea..daf3a4b 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -1,7 +1,7 @@
 require neard.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
-           file://Fix-snep-send-parallel-build.patch \
+           file://parallel-build.patch \
            file://neard.in \
            file://neard.service.in \
           "
-- 
1.7.10.4


