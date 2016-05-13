Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3508073174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 19:49:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2016 12:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,615,1455004800"; d="scan'208";a="980017466"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2016 12:49:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 14:49:26 -0500
Message-Id: <1463168968-29526-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
References: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com, edwin.plauchu.camacho@intel.com
Subject: [PATCH 2/4] libuser: Fix security string formatting issues.
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
X-List-Received-Date: Fri, 13 May 2016 19:49:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[YOCTO #9547]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ...es.c-parse_field-fix-string-formating-in-.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/libuser/libuser_0.62.bb      |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch

diff --git a/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch b/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
new file mode 100644
index 0000000..074491b
--- /dev/null
+++ b/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
@@ -0,0 +1,34 @@
+From a4857911ece5ebfcdef42aee4c070eb216f39597 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Fri, 13 May 2016 11:40:13 -0500
+Subject: [PATCH] modules/files.c: parse_field fix string formating in
+ g_warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[YOCTO #9547]
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Upstream-status: Pending
+---
+ modules/files.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/files.c b/modules/files.c
+index 4ef0a57..35eafc9 100644
+--- a/modules/files.c
++++ b/modules/files.c
+@@ -534,7 +534,7 @@ parse_field(const struct format_specifier *format, GValue *value,
+ 						 string, &err);
+ 	if (ret == FALSE) {
+ 		g_assert(err != NULL);
+-		g_warning(lu_strerror(err));
++		g_warning(lu_strerror(err), NULL);
+ 		lu_error_free(&err);
+ 	}
+ 	return ret;
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index 1369ae8..7a64efe 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -14,7 +14,8 @@ SECTION = "base"
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
            file://0001-Check-for-issetugid.patch \
            file://0002-remove-unused-execinfo.h.patch \
-          "
+           file://0001-modules-files.c-parse_field-fix-string-formating-in-.patch \
+           "
 
 SRC_URI[md5sum] = "63e5e5c551e99dc5302b40b80bd6d4f2"
 SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b"
-- 
2.1.4


