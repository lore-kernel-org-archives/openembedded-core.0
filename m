Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.6606.1624355462485042172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Tws7vlDTbx2v5xw3ws6plFLVcZYOpnY5OepR2e1GSLzDwc22WT2FThsu+cfD35Z1bP9daka++p
 E88JUI/270qA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014079"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014079"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:02 -0700
IronPort-SDR: 4VB8DkRzFfcbbW3WKtbTzrAmsef7te4HKTuCMKN5fP1Mu7S2QelceOAqqX3hNPlODy5rP289Wj
 +ZooYV7Hx6/g==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260047"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:00 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/13] lttng-tools: upgrade 2.12.3 -> 2.12.4
Date: Tue, 22 Jun 2021 17:50:25 +0800
Message-Id: <379d198a4e11eae2cf5c2adb334a5dd4b9e8958a.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a new lttng file to one of the tests to avoid test failures.

Also add a dependency on grep since standalone testing revealed test
failures without this. Normally this was added by other dependencies
in the ptest images so we didn't see this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5799a807eed44d380e142913e50308589b9412ed)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
index 6132daf1a1..133d7561b8 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
@@ -15,7 +15,7 @@ include lttng-platforms.inc
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
 RRECOMMENDS_${PN} += "${LTTNGMODULES}"
-RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://determinism.patch \
            "
 
-SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
+SRC_URI[sha256sum] = "d729f8c2373a41194f171aeb0da0a9bb35ac181f31afa7e260786d19a500dea1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -69,7 +69,10 @@ do_install_append () {
 }
 
 do_install_ptest () {
-    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
+    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng \
+            tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh \
+            tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh \
+            tests/regression/tools/base-path/*.lttng; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-- 
2.31.1

