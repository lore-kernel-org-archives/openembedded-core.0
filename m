Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 59F6A789A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053890"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:40 +0200
Message-Id: <20180308181804.31261-18-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/42] xset: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:09 -0000

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

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/xorg-app/xset/disable-xkb.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
index 97d13a30df8..a97c7b72fac 100644
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
@@ -4,11 +4,11 @@ Upstream-Status: Pending
 
 Rebase for 1.2.1 by: Yu Ke <ke.yu@intel.com>
 
-diff --git a/configure.ac b/configure.ac
-index 81c3ae4..26601bf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,11 +52,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
+Index: xset-1.2.3/configure.ac
+===================================================================
+--- xset-1.2.3.orig/configure.ac
++++ xset-1.2.3/configure.ac
+@@ -53,11 +53,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
  	AC_CHECK_HEADERS([X11/extensions/dpms.h X11/extensions/MITMisc.h],,,[#include <X11/Xlib.h>])
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
  
@@ -22,5 +22,5 @@ index 81c3ae4..26601bf 100644
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
 +fi
  
- AC_ARG_WITH(xf86misc, AC_HELP_STRING([--without-xf86misc],[Disable xf86misc support.]),
+ AC_ARG_WITH(xf86misc, AS_HELP_STRING([--without-xf86misc],[Disable xf86misc support.]),
                  [USE_XF86MISC="$withval"], [USE_XF86MISC="yes"])
-- 
2.16.1


