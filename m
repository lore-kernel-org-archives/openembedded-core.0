Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: d9NpbEGuJW2FcQdh/Twn8hXrvitxHHXUO14MVDTTLdcHx2Dz5joDPYid4hDgrFDvu+GeK9Yv6l
 /AOudAksZ40w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917811"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917811"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:14 -0700
IronPort-SDR: G3/NAjuHNKElmWOe9bn/lFkueEigzQPJbpYQmhCB4yhnCnui+EVB5GgJ6qUd3Zd9nhTn3ZHHl+
 gtC+LCSwxf/g==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645791"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/15] libcap: Configure Make variables correctly without a horrible hack
Date: Wed, 12 May 2021 16:35:41 +0800
Message-Id: <44900610bea76ab8983a899599f78790f6c5f659.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Occasionally, the build would fail with:

  make[2]: execvp: mkdir: Argument list too long

This turned out to be due to a hacky solution used in the recipe to
modify the Makefile, which resulted in one more $(BUILD_CFLAGS) being
added to the immediately expanded BUILD_CFLAGS Make variable each time
do_configure was executed. After a couple of times, this lead to an
environment with a 140 kB BUILD_CFLAGS when mkdir should execute, which
resulted in the E2BIG.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 116e6b61c585c6f0f7ae6f010bd490bb39914348)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libcap/libcap_2.48.bb | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.48.bb b/meta/recipes-support/libcap/libcap_2.48.bb
index a12738d63a..2f83acf966 100644
--- a/meta/recipes-support/libcap/libcap_2.48.bb
+++ b/meta/recipes-support/libcap/libcap_2.48.bb
@@ -20,15 +20,6 @@ UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs
 
 inherit lib_package
 
-# do NOT pass target cflags to host compilations
-#
-do_configure() {
-	# libcap uses := for compilers, fortunately, it gives us a hint
-	# on what should be replaced with ?=
-	sed -e 's,:=,?=,g' -i Make.Rules
-	sed -e 's,^BUILD_CFLAGS ?= ,BUILD_CFLAGS := $(BUILD_CFLAGS) ,' -i Make.Rules
-}
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG_class-native ??= ""
 
@@ -44,11 +35,15 @@ EXTRA_OEMAKE = " \
 
 EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
 
-# these are present in the libcap defaults, so include in our CFLAGS too
-CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-
 do_compile() {
-	oe_runmake ${PACKAGECONFIG_CONFARGS}
+	unset CFLAGS BUILD_CFLAGS
+	oe_runmake \
+		${PACKAGECONFIG_CONFARGS} \
+		AR="${AR}" \
+		CC="${CC}" \
+		RANLIB="${RANLIB}" \
+		COPTS="${CFLAGS}" \
+		BUILD_COPTS="${BUILD_CFLAGS}"
 }
 
 do_install() {
-- 
2.31.1

