Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1535478980
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053779"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:36 +0200
Message-Id: <20180308181804.31261-14-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/42] dtc: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:03 -0000

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
 meta/recipes-kernel/dtc/dtc/make_install.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc/make_install.patch b/meta/recipes-kernel/dtc/dtc/make_install.patch
index 1120617e7be..ccf17b38fdb 100644
--- a/meta/recipes-kernel/dtc/dtc/make_install.patch
+++ b/meta/recipes-kernel/dtc/dtc/make_install.patch
@@ -2,11 +2,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Index: git/Makefile
 ===================================================================
---- git.orig/Makefile	2011-11-02 14:52:17.243104779 -0700
-+++ git/Makefile	2011-11-02 15:06:01.555104982 -0700
-@@ -161,8 +161,8 @@
- 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
- 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
+--- git.orig/Makefile
++++ git/Makefile
+@@ -168,8 +168,8 @@ install-bin: all $(SCRIPTS)
+ install-lib: all
+ 	@$(VECHO) INSTALL-LIB
  	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
 -	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
 -	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
@@ -14,4 +14,4 @@ Index: git/Makefile
 +	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/$(notdir $(LIBFDT_lib))
  	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
  	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
- 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
+ 
-- 
2.16.1


