Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD53360107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 15:26:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 20 Nov 2015 07:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="825284990"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2015 07:26:46 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A01496A4005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 07:25:38 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 17:27:32 +0200
Message-Id: <1448033252-17257-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] iw: upgrade to version 4.3
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
X-List-Received-Date: Fri, 20 Nov 2015 15:26:48 -0000

Refreshed the following patches to work with this release:
 1) 0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 2) separate-objdir.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ....sh-don-t-use-git-describe-for-versioning.patch | 20 ++++--------
 .../iw/iw/separate-objdir.patch                    | 36 +++++-----------------
 .../iw/{iw_4.1.bb => iw_4.3.bb}                    |  4 +--
 3 files changed, 15 insertions(+), 45 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_4.1.bb => iw_4.3.bb} (86%)

diff --git a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
index a0a77b2..2e52c80 100644
--- a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -1,6 +1,3 @@
-From 5310abba864cfe3a8b65af130729447604190b29 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 29 Nov 2011 17:03:27 +0100
 Subject: [PATCH] iw: version.sh: don't use git describe for versioning
 
 It will detect top-level git repositories like the Angstrom setup-scripts and break.
@@ -8,21 +5,18 @@ It will detect top-level git repositories like the Angstrom setup-scripts and br
 Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- version.sh | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/version.sh b/version.sh
-index 11d124b..5d423c4 100755
---- a/version.sh
-+++ b/version.sh
+diff -Naur iw-4.3-origin/version.sh iw-4.3/version.sh
+--- iw-4.3-origin/version.sh	2015-11-20 16:37:58.762077162 +0200
++++ iw-4.3/version.sh	2015-11-20 16:52:05.526491150 +0200
 @@ -3,21 +3,7 @@
- VERSION="3.15"
+ VERSION="4.3"
  OUT="$1"
  
 -if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
 -	git update-index --refresh --unmerged > /dev/null
--	descr=$(git describe)
+-	descr=$(git describe --match=v*)
 -
 -	# on git builds check that the version number above
 -	# is correct...
@@ -39,5 +33,3 @@ index 11d124b..5d423c4 100755
  
  echo '#include "iw.h"' > "$OUT"
  echo "const char iw_version[] = \"$v\";" >> "$OUT"
--- 
-1.7.7.3
diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
index 883f8b2..0ea6a52 100644
--- a/meta/recipes-connectivity/iw/iw/separate-objdir.patch
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
@@ -1,6 +1,3 @@
-From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Wed, 26 Aug 2015 17:23:48 -0700
 Subject: [PATCH] Support separation of SRCDIR and OBJDIR
 
 Typical use of VPATH to locate the sources.
@@ -8,26 +5,21 @@ Typical use of VPATH to locate the sources.
 Upstream-Status: Pending
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- Makefile   | 7 +++++--
- version.sh | 2 +-
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 548591a..da8d33a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,8 @@
+diff -Naur iw-4.3-origin/Makefile iw-4.3/Makefile
+--- iw-4.3-origin/Makefile	2015-11-20 16:37:58.752077287 +0200
++++ iw-4.3/Makefile	2015-11-20 16:57:15.510615815 +0200
+@@ -1,5 +1,7 @@
  MAKEFLAGS += --no-print-directory
- 
+-
 +SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
 +OBJDIR ?= $(PWD)
 +VPATH = $(SRCDIR)
  PREFIX ?= /usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
-@@ -95,11 +98,11 @@ VERSION_OBJS := $(filter-out version.o, $(OBJS))
+@@ -95,11 +97,11 @@
  version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h Makefile \
  		$(wildcard .git/index .git/refs/tags)
  	@$(NQ) ' GEN ' $@
@@ -41,17 +33,3 @@ index 548591a..da8d33a 100644
  
  ifeq ($(IW_ANDROID_BUILD),)
  iw:	$(OBJS)
-diff --git a/version.sh b/version.sh
-index 5354383..fa954cf 100755
---- a/version.sh
-+++ b/version.sh
-@@ -5,5 +5,5 @@ OUT="$1"
- 
- v="$VERSION"
- 
--echo '#include "iw.h"' > "$OUT"
-+echo '#include <iw.h>' > "$OUT"
- echo "const char iw_version[] = \"$v\";" >> "$OUT"
--- 
-2.2.1
-
diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.3.bb
similarity index 86%
rename from meta/recipes-connectivity/iw/iw_4.1.bb
rename to meta/recipes-connectivity/iw/iw_4.3.bb
index fafb0e3..6865e7a 100644
--- a/meta/recipes-connectivity/iw/iw_4.1.bb
+++ b/meta/recipes-connectivity/iw/iw_4.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
-SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9c8f33d"
+SRC_URI[md5sum] = "5ca622a270687d6862c9024fab266871"
+SRC_URI[sha256sum] = "2a853d95ffbd2b06c058b40ef4e6fa76a52c2709b05fb1976761fe13e9d9e39f"
 
 inherit pkgconfig
 
-- 
2.4.0


