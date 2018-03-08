Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE35F7886F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053624"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:25 +0200
Message-Id: <20180308181804.31261-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/42] shared-mime-info: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:46 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../shared-mime-info/install-data-hook.patch               | 14 ++++++++------
 .../shared-mime-info/shared-mime-info/parallelmake.patch   | 12 ++++++------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
index 3c9f1ea438c..262ff7562ce 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
@@ -8,16 +8,18 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -44,7 +44,9 @@ $(pkgconfig_DATA): config.status
- @INTLTOOL_XML_RULE@
- @INTLTOOL_DESKTOP_RULE@
+Index: shared-mime-info-1.9/Makefile.am
+===================================================================
+--- shared-mime-info-1.9.orig/Makefile.am
++++ shared-mime-info-1.9/Makefile.am
+@@ -50,7 +50,9 @@ else
+   update_mime_database="$(top_builddir)/update-mime-database$(EXEEXT)"
+ endif
  
 -install-data-hook: install-binPROGRAMS
 +# do NOT make this dependent on anything!
 +#
 +install-data-hook:
  if ENABLE_UPDATE_MIMEDB
- 	$(DESTDIR)"$(bindir)/update-mime-database" -V "$(DESTDIR)$(datadir)/mime"
+ 	$(update_mime_database) -V "$(DESTDIR)$(datadir)/mime"
  endif
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
index 84c4d03731b..fea34a55a25 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
@@ -11,17 +11,17 @@ RP 10/10/2011
 Upstream-Status: Pending
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: shared-mime-info-1.0/Makefile.am
+Index: shared-mime-info-1.9/Makefile.am
 ===================================================================
---- shared-mime-info-1.0.orig/Makefile.am
-+++ shared-mime-info-1.0/Makefile.am
+--- shared-mime-info-1.9.orig/Makefile.am
++++ shared-mime-info-1.9/Makefile.am
 @@ -1,5 +1,3 @@
 -SUBDIRS=. po
 -
  AM_CPPFLAGS = $(ALL_CFLAGS)
  
  packagesdir = $(datadir)/mime/packages
-@@ -72,8 +70,7 @@ uninstall-hook:
+@@ -81,8 +79,7 @@ endif
  
  all: $(defaultmakedeps)
  
@@ -29,5 +29,5 @@ Index: shared-mime-info-1.0/Makefile.am
 -	$(AM_V_GEN) $(MAKE) -C po shared-mime-info.pot
 +create-pot: po
  
- check: create-pot freedesktop.org.xml update-mime-database check-translations
- 	if test -e $(top_builddir)/freedesktop.org.xml; then \
+ local-test: create-pot freedesktop.org.xml update-mime-database$(EXEEXT)
+ if CROSS_COMPILING
-- 
2.16.1


