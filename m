Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5BEA7866A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:45:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 06:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,382,1498546800"; d="scan'208";a="140339613"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2017 06:45:35 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E24365806DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:45:34 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 16:47:10 +0300
Message-Id: <1502891231-2284-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1502891231-2284-1-git-send-email-maxin.john@intel.com>
References: <1502891231-2284-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/2] screen: upgrade to 4.6.1
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
X-List-Received-Date: Wed, 16 Aug 2017 13:45:35 -0000

Removed following patch as the parallel make issue was fixed upstream:
 * fix-parallel-make.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../screen/screen/fix-parallel-make.patch             | 19 -------------------
 .../screen/{screen_4.6.0.bb => screen_4.6.1.bb}       |  5 ++---
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/fix-parallel-make.patch
 rename meta/recipes-extended/screen/{screen_4.6.0.bb => screen_4.6.1.bb} (91%)

diff --git a/meta/recipes-extended/screen/screen/fix-parallel-make.patch b/meta/recipes-extended/screen/screen/fix-parallel-make.patch
deleted file mode 100644
index e0caf5d..0000000
--- a/meta/recipes-extended/screen/screen/fix-parallel-make.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-This fixes the parallel make install failure
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: screen-4.0.3/Makefile.in
-===================================================================
---- screen-4.0.3.orig/Makefile.in
-+++ screen-4.0.3/Makefile.in
-@@ -70,7 +70,7 @@ screen: $(OFILES)
- .c.o:
- 	$(CC) -c -I. -I$(srcdir) $(M_CFLAGS) $(DEFS) $(OPTIONS) $(CFLAGS) $<
- 
--install_bin: .version screen
-+install_bin: .version screen installdirs
- 	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
- 		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
- 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
diff --git a/meta/recipes-extended/screen/screen_4.6.0.bb b/meta/recipes-extended/screen/screen_4.6.1.bb
similarity index 91%
rename from meta/recipes-extended/screen/screen_4.6.0.bb
rename to meta/recipes-extended/screen/screen_4.6.1.bb
index a41efe9..84baae9 100644
--- a/meta/recipes-extended/screen/screen_4.6.0.bb
+++ b/meta/recipes-extended/screen/screen_4.6.1.bb
@@ -16,7 +16,6 @@ DEPENDS = "ncurses \
 RDEPENDS_${PN} = "base-files"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
-           file://fix-parallel-make.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            file://Remove-redundant-compiler-sanity-checks.patch \
            file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
@@ -26,8 +25,8 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
           "
 
-SRC_URI[md5sum] = "af60f716c4ec134712b923ef6cd93848"
-SRC_URI[sha256sum] = "9433706b653e941cc4c745f28e252e57be2a141eded923e61cc2c4a09768fed4"
+SRC_URI[md5sum] = "132c893aabfaf2020074790215c8cacd"
+SRC_URI[sha256sum] = "aba9af66cb626155d6abce4703f45cce0e30a5114a368bd6387c966cbbbb7c64"
 
 inherit autotools texinfo
 
-- 
2.4.0


