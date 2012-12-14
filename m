Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjTuC-0003Ak-OG
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 12:58:20 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1547586bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NBG3zq9bslQfpqgFv/Vh0qETeo5Fw+/tjmjpg1KnBmY=;
	b=rlHSNthLWAqnOuOuDec0x62HYB2yo/Js5+cr47hxRFUOrlVRWz+BQ6unrhkD7q6kGZ
	SfZcqfpEFQiMVkVTHc/i/0xobK+sCwlB1OQ9INd5cPd27O7G++Gm/BPyKEZZGBDjyYLu
	h9I8XiPPvyn1aEYYFL8ircWLCAi73d7oDws6JVUgqH7L0S26D+O4yh9lo8m0pplJmxmB
	TK/cSsoBkgPp7K67mngbNUv3h4+qXGOle0tSkfo3Xfl/rD7vpvWRpmC+w6LX7ZGa26Ob
	e2pGlbLWN1FOYJ9UOcAZv5s6qEdoLn1cZ6vuBdMWFJBYfnsNHgI2T6ZxDiTCleCALFvi
	kcIw==
Received: by 10.204.151.7 with SMTP id a7mr2669760bkw.8.1355485420604;
	Fri, 14 Dec 2012 03:43:40 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id f24sm4105255bkv.7.2012.12.14.03.43.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 03:43:39 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjTg1-0008MM-Au; Fri, 14 Dec 2012 13:43:37 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:43:36 +0200
Message-Id: <1355485416-32086-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] guile: update to upstream version 2.0.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 11:58:20 -0000

change-install-data-hook-to-install-exec-hook-in-gui.patch is now
part of upstream.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 ...all-data-hook-to-install-exec-hook-in-gui.patch |   36 --------------------
 .../guile/{guile_2.0.6.bb => guile_2.0.7.bb}       |    9 +++--
 2 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
 rename meta/recipes-devtools/guile/{guile_2.0.6.bb => guile_2.0.7.bb} (93%)

diff --git a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
deleted file mode 100644
index df61e5d..0000000
--- a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 687e5a6598f89b97c89afb94d6ac3ec024dc08e2 Mon Sep 17 00:00:00 2001
-From: "Song.Li" <Song.Li@windriver.com>
-Date: Thu, 26 Jul 2012 14:19:46 +0800
-Subject: [PATCH] guile:meta/Makefile change install-data-hook to install-exec-hook
-
-In guile meta/Makefile, what install-data-hook do
-must be run after install-binSCRIPTS.so it's a exec hook, not a data hook.
-If keep these exec-hook in data-hook,when we run make with multi-jobbing ,
-install-data-hook and install-binSCRIPTS will be separately
-processed in different thread, no any dependence.
-that will cause error sometimes.
-
-[YOCTO #2796]
-
-Upstream-Status:Submitted
-Upstream Bugid :12015 email:12015@debbugs.gnu.org
-guile bug maillist: bug-guile@gnu.org
-
-Signed-off-by: Song.Li <Song.Li@windriver.com>
----
- meta/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meta/Makefile.am b/meta/Makefile.am
-index a05730d..bd20784 100644
---- a/meta/Makefile.am
-+++ b/meta/Makefile.am
-@@ -28,7 +28,7 @@ EXTRA_DIST= \
-   guild.in guile-config.in
- 
- # What we now call `guild' used to be known as `guile-tools'.
--install-data-hook:
-+install-exec-hook:
- 	guild="`echo $(ECHO_N) guild				\
- 	   | $(SED) -e '$(program_transform_name)'`$(EXEEXT)" ;	\
- 	guile_tools="`echo $(ECHO_N) guile-tools		\
diff --git a/meta/recipes-devtools/guile/guile_2.0.6.bb b/meta/recipes-devtools/guile/guile_2.0.7.bb
similarity index 93%
rename from meta/recipes-devtools/guile/guile_2.0.6.bb
rename to meta/recipes-devtools/guile/guile_2.0.7.bb
index 45603e6..7f3316a 100644
--- a/meta/recipes-devtools/guile/guile_2.0.6.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.7.bb
@@ -13,22 +13,21 @@ SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
 
-SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
            file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
-           file://change-install-data-hook-to-install-exec-hook-in-gui.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
 #           file://opensuse/guile-turn-off-gc-test.patch 
 
-SRC_URI[md5sum] = "3438cd4415c0c43ca93a20e845eba7e2"
-SRC_URI[sha256sum] = "3ece055145a5020dd36b84f5fbccd4b3846a671960dd5ee55931555f03200950"
+SRC_URI[md5sum] = "30ff9e94663a2e2098b52f8ce9d050b9"
+SRC_URI[sha256sum] = "6f278fa699685382ae51ba8bfad5840959e0af6414f3ad803d61131567bfa338"
 
-PR = "r2"
+PR = "r0"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
-- 
1.7.10.4



